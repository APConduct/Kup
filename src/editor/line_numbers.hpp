#pragma once

#include "buffer.hpp"
#include <cmath>
#include <memory>
#include <raylib.h>
import plastic;
import plastic.style;

namespace kup {
    struct LineNumberView : plastic::Element, public plastic::View {
    private:

        struct State {
            std::shared_ptr<Buffer> buffer;
            float scroll_y{0};
            Font font;
            float font_size;
            float line_spacing;
            plastic::Color color{plastic::Color::from_rl(GRAY)};
            plastic::style::Style style;
        } state;

        struct LineNumberElement : plastic::Element {
        protected:
            State state;
        public:
            explicit LineNumberElement(State initial_state) : state(std::move(initial_state)) {}
            explicit LineNumberElement(const State& initial_state) : state(initial_state) {}

            void paint(plastic::Context* cx) const override {
                const auto& bounds = get_bounds();
                const float line_height = state.font_size + state.line_spacing;

                BeginScissorMode(
                    static_cast<int>(bounds.x()),
                    static_cast<int>(bounds.y()),
                    static_cast<int>(bounds.width()),
                    static_cast<int>(bounds.height())
                );

                const size_t start_line = static_cast<size_t>(state.scroll_y / line_height);
                const size_t visible_lines = static_cast<size_t>(bounds.height() / line_height) + 1;
                const size_t end_line = std::min(start_line + visible_lines, state.buffer->line_count());

                float y = bounds.y() - std::fmod(state.scroll_y, line_height);

                for (size_t i = start_line; i < end_line; ++i) {
                    const std::string line_num = std::to_string(i + 1);
                    const float x = bounds.right() -
                        MeasureTextEx(state.font, line_num.c_str(), state.font_size, 0).x - 5;

                    DrawTextEx(state.font, line_num.c_str(),
                        {x, y}, state.font_size, state.line_spacing, state.color.rl());
                    y += line_height;
                }

                EndScissorMode();
            }

            void layout(plastic::Context* cx)  override {
                // update preferred width based on the number of digits
                const size_t max_lines = state.buffer->line_count();
                const size_t digits = std::to_string(max_lines).length();
                const float char_width = MeasureTextEx(state.font, "0", state.font_size, 0).x;

                auto style = get_style();
                style.set_preferred_size( plastic::Size<float>{
                    char_width * static_cast<float>(digits + 1), // +1 for padding
                    style.preferred_size ? style.preferred_size->height() : 0
                });
                set_style(style);
            }


        };

    public:
        LineNumberView(std::shared_ptr<Buffer>, const Font&, float, float)
            :   state() {
        }

        explicit LineNumberView(State initial_state)
            :   state(std::move(initial_state)) {
        }




        void set_scroll_y(float y) {
            state.scroll_y = y;
        }

        static plastic::style::Style create_default_style() {
            plastic::style::Style style;
            style.background_color_normal.emplace(plastic::Color::rgb(30,30,30));
            style.text_color_normal.emplace(plastic::Color::rgb(128,128,128));

            // Set default layout properties
            auto& layout_props = style.layout_properties;
            layout_props.preferred_size = plastic::Size<float>{50, 0}; // fixed width
            layout_props.fill_height = true;
            style.margin = plastic::Edge<float>{2, 2, 2, 2};
            return style;
        }
    };


}
