//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <string>
#include <vector>
#include <functional>

#if defined(_WIN32)
#include <optional>
#include <cstdint>
#endif
export module plastic.text.fmt;

import plastic.color;
import plastic.font;
import plastic.point;
import plastic.rect;

export namespace plastic
{

    enum class TextAlign {
        Left,
        Center,
        Right,
        Justify
    };

    enum class VerticalAlign {
        Top,
        Center,
        Bottom,
        Baseline
    };

    enum class TextDecoration {
        None = 0,
        Underline = 1 << 0,
        LineThrough = 1 << 1,
        Overline = 1 << 2
    };

    enum class TextTransform {
        None,
        Uppercase,
        Lowercase,
        Capitalize
    };

    enum class TextOverflow {
        Clip,
        Ellipsis,
        Fade,
        Wrap
    };

    struct TextStyle {
        std::optional<Font> font;
        float font_size{16.0f};
        Color color = Color::white();

        TextAlign alignment{TextAlign::Left};
        VerticalAlign vertical_alignment{VerticalAlign::Top};
        float line_height{1.2f}; // line height multiple
        float letter_spacing{0.0f};
        float paragraph_spacing{0.0f};
        float word_spacing{0.0f};
        int decorations_flags{0};
        Color decoration_color{Color::white()};
        TextTransform transform{TextTransform::None};
        TextOverflow overflow{TextOverflow::Wrap};
        bool word_wrap{true};
        float tab_size{4.0f};
        std::optional<Color> highlight_color;
        std::optional<Color> selection_color;
        std::optional<Color> background_color;
        std::optional<Color> outline_color;
        float outline_thickness{0.0f};

        // Shadow
        std::optional<Color> shadow_color;
        float shadow_offset_x = 1.0f;
        float shadow_offset_y = 1.0f;
        float shadow_blur = 0.0f;

        // Alignment and spacing
        float tab_width = 4.0f;  // In spaces
        float indent_first_line = 0.0f;
        float right_indent = 0.0f;
        float left_indent = 0.0f;

        // Effects and transformations
        TextDecoration decoration = TextDecoration::None;



        // Builder methods
        TextStyle& with_font(Font font) {
            this->font = std::move(font);
            return *this;
        }

        TextStyle& with_size(float size) {
            font_size = size;
            return *this;
        }

        TextStyle& with_color(Color color) {
            this->color = color;
            return *this;
        }

        TextStyle& with_alignment(TextAlign align) {
            alignment = align;
            return *this;
        }

        TextStyle& with_vertical_alignment(VerticalAlign align) {
            vertical_alignment = align;
            return *this;
        }

        TextStyle& with_line_height(float line_height) {
            this->line_height = line_height;
            return *this;
        }

        TextStyle& with_letter_spacing(float letter_spacing) {
            this->letter_spacing = letter_spacing;
            return *this;
        }

        TextStyle& with_outline_color(Color color) {
            this->outline_color = color;
            return *this;
        }

        TextStyle& with_outline_thickness(float thickness) {
            this->outline_thickness = thickness;
            return *this;
        }

        TextStyle& with_tab_size(float tab_size) {
            this->tab_size = tab_size;
            return *this;
        }

        TextStyle& with_decoration(TextDecoration decoration) {
            decorations_flags |= static_cast<int>(decoration);
            return *this;
        }

        TextStyle& with_decoration_color(Color color) {
            decoration_color = color;
            return *this;
        }

        TextStyle& with_transform(TextTransform transform) {
            this->transform = transform;
            return *this;
        }

        TextStyle& with_overflow(TextOverflow overflow) {
            this->overflow = overflow;
            return *this;
        }

        TextStyle& enable_word_wrap(bool enable) {
            word_wrap = enable;
            return *this;
        }

        TextStyle& with_paragraph_spacing(float spacing) {
            paragraph_spacing = spacing;
            return *this;
        }

        TextStyle& with_highlight(Color color) {
            highlight_color = color;
            return *this;
        }

        TextStyle& with_selection(Color color) {
            selection_color = color;
            return *this;
        }

        TextStyle& with_outline(Color color, float thickness = 1.0f) {
            outline_color = color;
            outline_thickness = thickness;
            return *this;
        }

        std::string apply_transforms(const std::string& text) const {
            std::string result = text;

            switch (transform) {
                case TextTransform::Uppercase:
                    for (auto& c : result) c = static_cast<char>(std::toupper(c));
                    break;
                case TextTransform::Lowercase:
                    for (auto& c : result) c = static_cast<char>(std::tolower(c));
                    break;

                case TextTransform::Capitalize:
                    bool new_word = true;
                    for (auto& c : result) {
                        if (std::isspace(c)) new_word = true;
                        else if (new_word) c = static_cast<char>(std::toupper(c));
                        new_word = false;
                    }
                    break;
            }
            return  result;
        };
    };

    // Character metrics
    struct CharMetrics {
        size_t index{}; // Index in the text string
        uint32_t codepoint{}; // Unicode codepoint
        Rect<float> bounds; // Character bounds
        float advance{}; // Horizontal advance to next character
        float kerning{}; // Kerning adjustment with previous character
    };

    struct WordMetrics {
        std::vector<CharMetrics> chars;
        float width;
        float height;
        bool is_whitespace;
        bool is_break;

        float left_bearing;
        float right_bearing;
    };

    struct TextLine {
        std::vector<WordMetrics> words;
        float width;
        float height;
        float baseline;
        float spacing;
        float start_index;
        float end_index;

        // For justified text
        float total_adjustable_space;
        int adjustable_space_count;
    };

    inline TextDecoration operator|(TextDecoration a, TextDecoration b) {
        return static_cast<TextDecoration>(
            static_cast<int>(a) | static_cast<int>(b)
        );
    }

    inline TextDecoration operator&(TextDecoration a, TextDecoration b) {
        return static_cast<TextDecoration>(
            static_cast<int>(a) & static_cast<int>(b)
        );
    }



}
