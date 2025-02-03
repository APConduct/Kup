#pragma once

#include "buffer.hpp"
#include <cmath>
#include <memory>
#include <raylib.h>
#include <variant>
import plastic;
import plastic.element;
import plastic.style;
import plastic.layout_properties;
import plastic.style;

namespace kup {
    struct TextView : plastic::View {
    private:

        struct State {
            std::shared_ptr<Buffer> buffer;
            BufferPosition cursor{};
            float scroll_x{0};
            float scroll_y{0};
            bool has_focus{false};
            plastic::style::Style style;
        };
        std::shared_ptr<Buffer> buffer;


        // View state
        float scroll_x{0};
        float scroll_y{0};
        BufferPosition cursor{};
        bool has_focus{false};

        State state;
        Font font;
        float font_size;
        float line_spacing;




    public:
        TextView(std::shared_ptr<Buffer> buffer, const Font& font, float font_size, float spacing)
            : font(font), font_size(font_size), line_spacing(spacing) {
            state.buffer = std::move(buffer);
            // update_metrics();
        }

        void handle_event(plastic::events::Event& event, plastic::Context* cx) override {
            std::visit([this](const auto& e) {handle_event_impl(e);}, event);
        }

        void set_style(const plastic::style::Style& style) {
            state.style = style;
        }





        void handle_event(const plastic::events::Event& event) {
            std::visit([this](const auto& e) {handle_event_impl(e);}, event);
        }

    private:

        class TextElement : public plastic::Element {
        private:
            std::shared_ptr<Buffer> buffer;
            Font font;
            float font_size;
            float line_spacing;
            float scroll_x{0};
            float scroll_y{0};
            bool has_focus{false};
            BufferPosition cursor{};


        public:



            struct ViewMetrics {
                mutable float line_height;
                mutable float char_width;
                mutable size_t visible_lines;
                mutable size_t visible_columns;
            } metrics{};

            void update_metrics() const {
                metrics.line_height = font_size + line_spacing;
                metrics.char_width = MeasureTextEx(font, "W", font_size, 0).x;

                const auto& bounds = get_style().padding.bounds();
                metrics.visible_lines = static_cast<size_t>(bounds.height() / metrics.line_height);
                metrics.visible_columns = static_cast<size_t>(bounds.width() / metrics.char_width);
            }
            TextElement(
                std::shared_ptr<Buffer> buffer,
                const Font& font,
                float font_size,
                float line_spacing
            ) : buffer(std::move(buffer)), font(font), font_size(font_size), line_spacing(line_spacing) {}

            void render_text(const plastic::Rect<float>& bounds) const {
                const auto start_line = static_cast<size_t>(scroll_y / metrics.line_height);
                const size_t end_line = std::min(
                    start_line + metrics.visible_lines + 1,
                    buffer->line_count()
                );

                float y = (bounds.y()) - std::fmod(scroll_y, metrics.line_height);

                for (size_t i = start_line; i < end_line; ++i) {
                    const std::string& line = buffer->get_line(i);
                    DrawTextEx(
                        font,
                        line.c_str(),
                        {bounds.x() - scroll_x, y},
                        font_size,
                        line_spacing,
                        get_style().text_color_normal.value_or(WHITE).rl()
                    );
                    y += metrics.line_height;
                }
            }

            void render_cursor(const plastic::Rect<float>& bounds) const {
                if (!has_focus) return;

                const float x = bounds.x() + static_cast<float>(cursor.column) * metrics.char_width - scroll_x;
                const float y = bounds.y() + static_cast<float>(cursor.row) * metrics.line_height - scroll_y;

                DrawRectangle(
                    static_cast<int>(x),
                    static_cast<int>(y),
                    static_cast<int>(metrics.char_width),
                    static_cast<int>(metrics.line_height),
                    get_style().text_color_normal.value_or(WHITE).rl()
                );
            }



            void paint(plastic::Context* cx) const override {
                const auto& bounds = get_style().padding.bounds();

                BeginScissorMode(
                    static_cast<int>(bounds.x()),
                    static_cast<int>(bounds.y()),
                    static_cast<int>(bounds.width()),
                    static_cast<int>(bounds.height())
                );

                render_text(bounds);

                EndScissorMode();
            }

            void layout(plastic::Context* cx) override {
                // update metrics based on current size
                update_metrics();
            }
        };
    };
}
