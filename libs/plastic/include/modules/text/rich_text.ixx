//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <string>
#include <vector>
export module plastic.text.rich;
import plastic.text.fmt;
import plastic.text.layout;
import plastic.color;
import plastic.rect;

export namespace plastic
{
    struct TextSpan {
        std::string text;
        TextStyle style{};

        TextSpan(std::string text, TextStyle style) : text(std::move(text)), style(std::move(style)) {}
    };

    class RichText {
    protected:
        std::vector<TextSpan> spans_;
        TextStyle default_style_{};

    public:
        explicit  RichText(TextStyle default_style = {}) : default_style_(std::move(default_style)) {}

        void add_span(const std::string& text, const TextStyle& style) {
            spans_.emplace_back(text, style);
        }

        void add_text(const std::string& text) {
            spans_.emplace_back(text, default_style_);
        }

        void set_default_style(const TextStyle& style) {
            default_style_ = style;
        }

        void clear() {
            spans_.clear();
        }

        [[nodiscard]] std::string get_plain_text() const {
            std::string result;
            for (const auto& span : spans_) {
                result += span.text;
            }
            return result;
        }

        void draw(const Rect<float>& rect) const {
            // TODO: make implementation create combined layout

            float x = rect.x();
            float y = rect.y();
            float max_width = rect.width();

            for (const auto& span : spans_) {
                TextLayout layout(span.text, span.style, max_width);
                layout.draw(Rect{x, y, max_width, layout.get_size().height()});

                auto size = layout.get_size();
                y += size.height();

                if (y >= rect.y() + rect.height()) {
                    break;
                }
            };
        }
    };

    class RichTextParser {
    public:
        static RichText parse(const std::string& markup, const TextStyle& default_style) {
            RichText result(default_style);

            // This is a placeholder for a more complex markup parser
            // A real implementation would handle tags like <b>, <i>, <color>, etc.

            // Simple example parser for format like: "Regular text [b]bold text[/b] [color=red]colored text[/color]"

            std::string current_text;
            TextStyle current_style = default_style;
            std::vector<TextStyle> style_stack = {default_style};

            for (size_t i = 0; i < markup.length(); ++i) {
                if (markup[i] == '[') {
                    size_t tag_end = markup.find(']', i + 1);
                    if (tag_end != std::string::npos) {
                        if (!current_text.empty()) {
                            result.add_span(current_text, current_style);
                            current_text.clear();
                        }

                        std::string tag = markup.substr(i + 1, tag_end - i - 1);

                        if (tag == "b") {
                            TextStyle new_style = current_style;
                            // Assume there's a way to set bold in your font system
                            style_stack.push_back(new_style);
                            current_style = new_style;
                        } else if (tag == "/b") {
                            if (style_stack.size() > 1) {
                                style_stack.pop_back();
                                current_style = style_stack.back();
                            }
                        } else if (tag.starts_with("color=")) {
                            std::string color_name = tag.substr(6);
                            TextStyle new_style = current_style;

                            if (color_name == "red") {
                                new_style.color = Color::rgb(255, 0, 0);
                            } else if (color_name == "green") {
                                new_style.color = Color::rgb(0, 255, 0);
                            } else if (color_name == "blue") {
                                new_style.color = Color::rgb(0, 0, 255);
                            }

                            style_stack.push_back(new_style);
                            current_style = new_style;
                        } else if (tag == "/color") {
                            if (style_stack.size() > 1) {
                                style_stack.pop_back();
                                current_style = style_stack.back();
                            }
                        }
                        i = tag_end;
                    } else {
                        current_text += markup[i];
                    }
                } else {
                    current_text += markup[i];
                }
            }

            if (!current_text.empty()) {
                result.add_span(current_text, current_style);
            }
            return result;
        }
    };
}
