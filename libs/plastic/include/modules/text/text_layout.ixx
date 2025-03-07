//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <string>
#include <vector>
#include <raylib.h>
export module plastic.text.layout;

import plastic.text.fmt;
import plastic.color;
import plastic.font;
import plastic.size;
import plastic.rect;

export namespace plastic
{
    namespace text
    {
        struct GlyphInfo {
            int codepoint;
            float x;
            float y;
            float width;
            float height;
            float advance_x;
            float is_whitespace;
        };
    }

    struct Word {
        std::string text;
        float width{};
        std::vector<GlyphInfo> glyphs;
    };

    namespace text
    {
        struct Line {
            std::vector<Word> words;
            float width{};
            float height{};
            float baseline{};
            float spacing_before{};
            float space_width{};

            mutable float total_extra_space{0};
            mutable int space_count{0};
        };
    }

    struct TextLayout {
    private:
        std::vector<text::Line> lines_;
        Rect<float> bounds_;
        TextStyle style_{};
        std::string text_;
        float total_height_{0};
        float max_width_{0};

    public:
        TextLayout(std::string  text, const TextStyle& style, float max_width)
            : style_(style), text_(std::move(text)), max_width_(max_width) {
            layout_text();
        };

        void set_text(const std::string& text) {
            if (text_ != text) {
                layout_text();
            }
        }

        void set_style(const TextStyle& style) {
            style_ = style;
            layout_text();
        }

        void set_max_width(float width) {
            if (max_width_ != width) {
                max_width_ = width;
                layout_text();
            }
        }

        void layout_text() {
            lines_.clear();
            total_height_ = 0;

            if (text_.empty()) return;

            Font font = style_.font.value_or(Font::from(GetFontDefault()));

            std::string processed_text = style_.apply_transforms(text_);

            std::vector<std::string> paragraphs;
            split_into_paragraphs(processed_text, paragraphs);

            float y_offset = 0;
            for (const auto& paragraph : paragraphs) {
                if (!paragraph.empty()) {
                    layout_paragraph(paragraph, y_offset);
                    y_offset += style_.paragraph_spacing;
                }
            }

            apply_text_alignment();

            total_height_ += y_offset;
        }

        void draw(const Rect<float> rect) const {
            if (lines_.empty()) return;

            float y = rect.y();
            float available_height = rect.height();

            if (total_height_ < available_height) {
                switch (style_.vertical_alignment) {
                    case VerticalAlign::Center:
                        y += (available_height - total_height_) / 2;
                        break;
                    case VerticalAlign::Bottom:
                        y += available_height - total_height_;
                        break;
                    case VerticalAlign::Top:
                        default:
                        break;
                }
            }

            Font font = style_.font.value_or(Font::from(GetFontDefault()));

            for (const auto& line : lines_) {
                float x = rect.x();
                float line_y = y + line.baseline;

                switch (style_.alignment) {
                    case TextAlign::Center:
                        x += (rect.width() - line.width) / 2;
                        break;
                    case TextAlign::Right:
                        x += rect.width() - line.width;
                        break;
                    case TextAlign::Justify:
                        // Words are already positioned for justified text
                            break;
                    case TextAlign::Left:
                        default:
                    // No adjustment needed
                    break;
                }

                for (const auto& word : line.words) {
                    Vector2 position {x, line_y - line.baseline * 0.8f}; // Adjust for baseline

                    // Draw shadow if configured
                    if (style_.selection_color) {
                        Vector2 shadow_pos{position.x + style_.shadow_offset_x, position.y + style_.shadow_offset_y};
                        DrawTextEx(font.rl(), word.text.c_str(), shadow_pos, style_.font_size, style_.letter_spacing, style_.shadow_color->rl());
                    }

                    if (style_.outline_color && style_.outline_thickness > 0) {
                        Color outline = style_.outline_color.value();
                        float thickness = style_.outline_thickness;

                        for (float dx = -thickness; dx <= thickness; dx += thickness) {
                            for (float dy = -thickness; dy <= thickness; dy += thickness) {
                                if (dx != 0 || dy != 0) {
                                    Vector2 outline_pos{position.x + dx, position.y + dy};
                                    DrawTextEx(font.rl(), word.text.c_str(), outline_pos, style_.font_size, style_.letter_spacing, outline.rl());
                                }
                            }
                        }
                    }

                    DrawTextEx(font.rl(), word.text.c_str(), position, style_.font_size, style_.letter_spacing, style_.color.rl());
                    draw_text_decorations(word, x, line_y);

                    x += word.width;

                    if (style_.alignment == TextAlign::Justify && line.space_count > 0) {
                        x += line.total_extra_space / static_cast<float>(line.space_count);
                    } else {
                        x += line.space_width;
                    }

                }
                y += line.height + line.spacing_before;
            }
        }

        [[nodiscard]] Size<float> get_size() const {
            return Size<float>{max_width_, total_height_};
        }

    private:
        static void split_into_paragraphs(const std::string& text, std::vector<std::string>& paragraphs) {
            size_t start = 0;
            size_t end;

            while ((end = text.find('\n', start)) != std::string::npos) {
                paragraphs.push_back(text.substr(start, end - start));
                start = end + 1;
            }

            if (start < text.length()) {
                paragraphs.push_back(text.substr(start));
            }
        }

        void layout_paragraph(const std::string& paragraph, float& y_offset) {
            std::vector<Word> words;
            split_into_words(paragraph, words);

            if (words.empty()) return;

            Font font = style_.font.value_or(Font::from(GetFontDefault()));
            float font_size = style_.font_size;
            float line_height = font_size * style_.line_height;
            float space_width = MeasureTextEx(font.rl(), " ", font_size, style_.letter_spacing).x + style_.word_spacing;

            text::Line current_line;
            current_line.height = line_height;
            current_line.baseline = line_height * 0.8f; // Approximate baseline
            current_line.width = style_.indent_first_line;
            current_line.spacing_before = (lines_.empty() ? 0.0f : style_.paragraph_spacing);
            current_line.space_width = space_width;

            float available_width = max_width_ - style_.left_indent - style_.right_indent;
            float current_width = style_.indent_first_line;


            for (const auto& word : words) {
                float word_width = word.width;

                if (current_width + word_width > available_width && !current_line.words.empty()) {
                    lines_.push_back(current_line);

                    current_line = text::Line{};

                    current_line.height = line_height;
                    current_line.baseline = line_height * 0.8f;
                    current_line.width = 0;
                    current_line.spacing_before = 0;
                    current_line.space_width = space_width;

                    current_width = style_.left_indent;
                }

                current_line.words.push_back(word);
                current_width += word_width + space_width;
                current_line.width += word_width;

                if (style_.alignment == TextAlign::Justify) {
                    current_line.space_count++;
                }
            }

            if (!current_line.words.empty()) {
                lines_.push_back(current_line);
            }

            for (const auto& line : lines_) {
                y_offset += line.height + line.spacing_before;
            }
        }

        void split_into_words(const std::string& paragraph, std::vector<Word>& words) const {
            Font font = this->style_.font.value_or(Font::from(GetFontDefault()));
            float font_size = style_.font_size;

            // This is a simple word splitter that doesn't handle all cases

            std::string current_word;
            float current_word_width = 0;

            for (size_t i = 0; i < paragraph.length(); ++i) {
                char c = paragraph[i];

                if (std::isspace(c)) {
                    if (!current_word.empty()) {
                        Word word;
                        word.text = current_word;
                        word.width = current_word_width;
                        words.push_back(word);

                        current_word.clear();
                        current_word_width = 0;
                    }

                    if (c == '\t') {
                        float tab_width = style_.tab_width + MeasureTextEx(font.rl(), " ", font_size, style_.letter_spacing).x;
                        Word tab;
                        tab.text = "\t";
                        tab.width = tab_width;
                        words.push_back(tab);
                    }
                } else {
                    std::string char_str(1, c);
                    current_word += c;
                    current_word_width += MeasureTextEx(font.rl(), char_str.c_str(), font_size, style_.letter_spacing).x;
                }
            }

            if (!current_word.empty()) {
                Word word;
                word.text = current_word;
                word.width = current_word_width;
                words.push_back(word);
            }
        }

        void apply_text_alignment() const {
            Font font = style_.font.value_or(Font::from(GetFontDefault()));

            if (style_.alignment == TextAlign::Left) {
                return;
            }
            for (const auto& line : lines_) {
                float available_width = max_width_ - style_.left_indent + style_.right_indent;
                float extra_space = available_width - line.width;

                if (extra_space <= 0) {
                    continue;
                }

                switch (style_.alignment) {
                    case TextAlign::Center:
                        case TextAlign::Right:
                        break;
                    case TextAlign::Justify:
                        if (&line != &lines_.back()) {
                            int space_count = static_cast<int>(line.words.size()) - 1;
                            if (space_count > 0) {
                                line.total_extra_space = extra_space;
                                line.space_count = space_count;
                            }
                        }
                    break;
                    default:
                        break;
                }
            }
        }

        void draw_text_decorations(const Word& word, float x, float baseline_y) const {
            if (style_.decoration == TextDecoration::None) return;

            Font font = this->style_.font.value_or(Font::from(GetFontDefault()));
            float font_size = style_.font_size;
            float thick = std::max(1.0f, font_size / 20.0f);
            Color color = style_.color;

            if ((style_.decoration & TextDecoration::Underline) == TextDecoration::Underline) {
                float y = baseline_y + thick * 2;
                DrawLineEx({x, y}, {x + word.width, y}, thick, color.rl());
            }

            if ((style_.decoration & TextDecoration::LineThrough) == TextDecoration::LineThrough) {float y = baseline_y - font_size * 0.3f;
                DrawLineEx({x, y}, {x + word.width, y}, thick, color.rl());
            }

            if ((style_.decoration & TextDecoration::Overline) == TextDecoration::Overline) {
                float y = baseline_y - font_size + thick;
                DrawLineEx({x, y}, {x + word.width, y}, thick, color.rl());
            }
        }
    };
}

