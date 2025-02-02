#pragma once

#include "buffer.hpp"
#include <cmath>
#include <memory>
#include <raylib.h>
import plastic;

namespace kup {
    struct LineNumberView : plastic::Element {
    private:
        std::shared_ptr<Buffer> buffer;
       Font font;
       float font_size;
       float line_spacing;
       float scroll_y{0};

    public:
        LineNumberView(std::shared_ptr<Buffer> buf, Font font, float font_size, float spacing)
            : buffer(std::move(buf)), font(font), font_size(font_size), line_spacing(spacing) {}

        void layout(plastic::Context* cx) const override {
            // update preferred width based on the number of digits
            const size_t max_lines = buffer->line_count();
            const size_t digits = std::to_string(max_lines).length();
            const float char_width = MeasureTextEx(font, "0", font_size, 0).x;

            auto style = get_style();
            style.preffered_size = plastic::Size<float>{
                char_width * (digits + 1), // +1 for padding
                style.preffered_size ? style.preffered_size->height : 0
            };
            set_style(style);
        }

        void paint(plastic::Context* cx) const override {
            const auto& bounds = get_style().padding.bounds();
            const float line_height = font_size + line_spacing;

            BeginScissorMode(bounds.x, bounds.y, bounds.width, bounds.height);

            const size_t start_line = static_cast<size_t>(scroll_y / line_height);
            const size_t visible_lines = static_cast<size_t>(bounds.height() / line_height) + 1;
            const size_t end_line = std::min(start_line + visible_lines, buffer->line_count());

            float y = bounds.y() - std::fmod(scroll_y, line_height);
            const Color text_color = get_style().text_color_normal.value_or(GRAY);

            for (size_t i = start_line; i < end_line; ++i) {
                const std::string line_num = std::to_string(i + 1);
                const float x = bounds.right() - MeasureTextEx(font, line_num.c_str(), font_size, 0).x - 5;

                DrawTextEx(font, line_num.c_str(), {x, y}, font_size, line_spacing, text_color);
                y += line_height;
            }
            EndScissorMode();
        }

        void set_scroll_y(float y) {
            scroll_y = y;
        }
    };
}
