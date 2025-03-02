#pragma once

#include "buffer.hpp"
#include <cmath>
#include <memory>
#include <variant>
import plastic;
import plastic.element;
import plastic.style;
import plastic.layout_properties;
import plastic.style;
import plastic.layout;
import plastic.layout.flex_direction;

namespace kup {
    struct TextView : plastic::View {
        struct State {
            std::shared_ptr<Buffer> buffer;
            BufferPosition cursor{};
            float scroll_x{0};
            float scroll_y{0};
            bool has_focus{false};
            plastic::style::Style style{};
            Font font{};
            float font_size{};
            float line_spacing{};
            State() = default;
            State(std::shared_ptr<Buffer> buffer, Font font, float font_size, float line_spacing)
                : buffer(std::move(buffer)), font(font), font_size(font_size), line_spacing(line_spacing) {}
        };
    private:

        // View state
        State state;

    public:
        // fluent interface
        class Builder : public plastic::View::Builder<Builder> {
            State state;
        public:
            Builder& with_buffer(const std::shared_ptr<Buffer>& buffer) {
                state.buffer = buffer;
                return *this;
            }

            Builder& with_font(const Font& font, float font_size, float line_spacing) {
                state.font = font;
                state.font_size = font_size;
                state.line_spacing = line_spacing;
                return *this;
            }

            std::shared_ptr<TextView> build() {
                return std::make_shared<TextView>(std::move(state));
            }
        };

        static Builder create() { return {}; }

        explicit TextView(const State&  initial_state) : state(std::move(initial_state)) {}

        explicit TextView(const std::shared_ptr<Buffer>& buffer, Font font, float font_size, float line_spacing)
            : state(std::move(buffer), font, font_size, line_spacing) {}

        std::shared_ptr<plastic::Element> render(plastic::Context* cx) const override {
            auto element = std::make_shared<TextElement>(state);

            auto style = plastic::style::Style()
                .with_text_color_normal(plastic::Color::from_rl(WHITE))
                .bg(plastic::Color::rgb(20,20,20));

            element->set_style(style);

            auto layout = plastic::LayoutProperties()
                .with_flex_grow(1)
                .with_fill_height(true);

            element->set_layout_properties(layout);

            return element;
        };

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

        template<typename EventT>
            void handle_event_impl(const EventT& event) {
            // Default implementation - silently ignore unhandled event types
            (void)event; // Prevent unused parameter warning
        }

        class TextElement : public plastic::Element {
        private:
            State state;

        public:
            struct ViewMetrics {
                mutable float line_height;
                mutable float char_width;
                mutable size_t visible_lines;
                mutable size_t visible_columns;
            } metrics{};

            void update_metrics() const {
                metrics.line_height = state.font_size + state.line_spacing;
                metrics.char_width = MeasureTextEx(state.font, "W", state.font_size, 0).x;

                const auto& bounds = get_style().padding.bounds();
                metrics.visible_lines = static_cast<size_t>(bounds.height() / metrics.line_height);
                metrics.visible_columns = static_cast<size_t>(bounds.width() / metrics.char_width);
            }

            explicit TextElement(const State& state) : state(std::move(state)) {}

            void render_text(const plastic::Rect<float>& bounds) const {
                const auto start_line = static_cast<size_t>(state.scroll_y / metrics.line_height);
                const size_t end_line = std::min(
                    start_line + metrics.visible_lines + 1,
                    state.buffer->line_count()
                );

                float y = (bounds.y()) - std::fmod(state.scroll_y, metrics.line_height);

                for (size_t i = start_line; i < end_line; ++i) {
                    const std::string& line = state.buffer->get_line(i);
                    DrawTextEx(
                        state.font,
                        line.c_str(),
                        {bounds.x() - state.scroll_x, y},
                        state.font_size,
                        state.line_spacing,
                        get_style().text_color_normal.value_or(plastic::Color::white()).rl()
                    );
                    y += metrics.line_height;
                }
            }

            void render_cursor(const plastic::Rect<float>& bounds) const {
                if (!state.has_focus) return;

                const float x = bounds.x() + static_cast<float>(state.cursor.column) * metrics.char_width - state.scroll_x;
                const float y = bounds.y() + static_cast<float>(state.cursor.row) * metrics.line_height - state.scroll_y;

                DrawRectangle(
                    static_cast<int>(x),
                    static_cast<int>(y),
                    static_cast<int>(metrics.char_width),
                    static_cast<int>(metrics.line_height),
                    get_style().text_color_normal.value_or(plastic::Color::white()).rl()
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
                if (state.has_focus) {
                    render_cursor(bounds);
                }

                EndScissorMode();
            }

            void layout(plastic::Context* cx) override {
                // update metrics based on current size
                update_metrics();
            }
        };
    };
}
