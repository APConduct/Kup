//
// Created by ajost1 on 1/13/2025.
//

#ifndef PLASTIC_HPP
#define PLASTIC_HPP

#include <algorithm>
#include <cfloat>
#include <cmath>
#include <cstdlib>
#include <functional>
#include <memory>
#include <string>
#include <utility>
#include <raylib.h>
#include <variant>

#include "plastic/events/event_system.hpp"
#include "rect.hpp"
#include "point.hpp"
#include "context.hpp"
#include "element.hpp"


namespace plastic
{
    // Forward declarations
    struct Style;
    struct Context;
    struct Element;
    struct Component;

    struct Container;
    struct Layout;
    struct View;

    struct App;
    template <typename T> struct Model;
    // template <typename T> struct View;


    struct AppContext;
    struct WindowContext;
    template <typename T> struct ModelContext;
    // template <typename T> struct ViewContext;

    struct Button;
    struct Window;





    struct Component  : Element {

    protected:
        // Context ctx;
        // std::string id;
        bool resizing{false};
        Point<float> resize_start;
        Rect original_bounds;

        // Min and max size constraints
        Size min_size{50,50};
        Size max_size{FLT_MAX, FLT_MAX};

        struct EventVisitor {
            Component* component;
            explicit EventVisitor(Component* comp) : component(comp) {}

            // void operator()(const events::KeyReleaseEvent& e) {
            //     component->process_event(e);
            // }
            void operator()(const events::MouseButtonEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::MouseMoveEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::MouseScrollEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::KeyPressEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::TextInputEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::ResizeEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::FocusEvent& e) {
                component->process_event(e);
            }
            void operator()(const events::MouseDragEvent& e) {
                component->process_event(e);
            }

        };

    public:
        // Component(Rectangle bounds, Style style = Style{}) : ctx(bounds, style) {}
        explicit Component(std::shared_ptr<Context> ctx) : Element(std::move(ctx)) {}

        ~Component() override = default;

        // maybe change to smart pointer ctx instead
        Rect measure(const Rect& constraints) override {
            return ctx->get_bounds();
        };

        virtual void render() = 0;
        virtual void layout() = 0;

        virtual void update(float delta_time) {
            if (!ctx->get_enabled()) return;

            const Vector2 mouse_pos = GetMousePosition();
            const Rect bounds = ctx->get_bounds();
            const bool is_hovered = CheckCollisionPointRec(mouse_pos, bounds.to_raylib());
            ctx->set_hovered(is_hovered);
            ctx->set_active(is_hovered && IsMouseButtonPressed(MOUSE_LEFT_BUTTON));
        }

        std::shared_ptr<Context>& get_context() {
                    return ctx;
                }
        [[nodiscard]] const std::shared_ptr<Context>& get_context() const { return ctx; }

        // TODO - MOVE LOGIC TO EXTERNAL EVENT VISITOR
        void handle_event(const events::Event& event) {
        // std::visit([this](const auto& e) {this->process_event(e);}, event);
        std::visit(EventVisitor(this), event); // new way
        }

    protected:
        // Event handling
        virtual void process_event(const events::MouseButtonEvent& e) {
            const auto bounds = ctx->get_bounds();
            const Point<float> mouse(e.position);
            if (e.pressed) {
                // Check if clicking near edges for resize
                if (is_near_edge(mouse)) {
                    resizing = true;
                    resize_start = mouse;
                    original_bounds = bounds;
                }
            } else {
                resizing = false;
            }
        }

        // Default implementation for event types
        //

        virtual void process_event(const events::MouseMoveEvent& e) {
            handle_resize(plastic::Point<float>(e.position));
        }

        virtual void process_event(const events::MouseScrollEvent& e) {
            // Handle mouse scroll event
        }

        virtual void process_event(const events::KeyPressEvent& e) {
            // Handle key press event
        }

        // virtual void process_event(const events::KeyReleaseEvent& e) {
            // Handle key release event
        // }

         virtual void process_event(const events::TextInputEvent& e) {}

        virtual void process_event(const events::ResizeEvent& e) {}
                // Handle window resize event

        virtual void process_event(const events::FocusEvent& e) {}

        virtual void process_event(const events::MouseDragEvent& e) {}

        // END OF TODO_MOVE LOGIC TO EXTERNAL EVENT VISITOR


        [[nodiscard]] bool is_near_edge(const Point<float>& point) const {
            const auto bounds = ctx->get_bounds();
            constexpr float edge_threshold = 5.0f;

            return (
                std::abs(point.x - bounds.right()) < edge_threshold ||
                std::abs(point.x - bounds.x) < edge_threshold ||
                std::abs(point.y - bounds.bottom()) < edge_threshold ||
                std::abs(point.y - bounds.y) < edge_threshold);
        }

        void handle_resize(const Point<float>& current_pos) const {
                    auto new_bounds = original_bounds;
                    const auto delta = Point(current_pos.x - resize_start.x, current_pos.y - resize_start.y);

                    // Update bounds based on which edge is being dragged
                    if (std::abs(current_pos.x - original_bounds.right()) < 5.0f) {
                        new_bounds.width = std::clamp(
                            original_bounds.width + delta.x,
                            min_size.width,
                            max_size.width
                        );
                    }
                }
    };

    struct Button : Component {
        private:
        std::string text;
        std::function<void()> on_click;
        bool was_pressed = false;
        Font font{};

        public:
        Button(std::shared_ptr<Context> ctx, std::string text, std::function<void()> on_click)
                    : Component(std::move(ctx)), text(std::move(text)), on_click(std::move(on_click)) {}

        Button(std::shared_ptr<Context> ctx, std::string text, std::function<void()> on_click, const Font& font)
            : Component(std::move(ctx)), text(std::move(text)), on_click(std::move(on_click)), font(font) {}

        void update(const float delta_time) override {
            Component::update(delta_time);
            if (!ctx->get_enabled()) return;

            const bool is_pressed = ctx->get_hovered() && IsMouseButtonPressed(MOUSE_LEFT_BUTTON);
            if (was_pressed && !is_pressed) {
                on_click();
            }
            was_pressed = is_pressed;
        }

        void render() override {
            const auto& style = ctx->get_style();
            const Rect bounds = ctx->get_bounds();

            // Draw the button background
            DrawRectangleRec(bounds.to_raylib(), ctx->get_background_color());

            // Draw the button border
            if (style.border_width > 0) {
                DrawRectangleLinesEx(bounds.to_raylib(), style.border_width, ctx.get_border_color());
            }

            // Draw the button text
            if (style.center_text) {
                auto [x, y] = MeasureTextEx(
                    font, text.c_str(),
                    static_cast<float>(style.font_size), style.font_spacing);
                const Vector2 text_pos = {
                    bounds.x + bounds.width/2 - x * 0.5f,
                    bounds.y + bounds.height/2 - y * 0.5f
                };
                DrawTextEx(
                    font, text.c_str(), text_pos,
                    static_cast<float>(style.font_size),
                    style.font_spacing, style.text_color);
            }else {
                DrawTextEx(
                    font, text.c_str(),
                    {bounds.x + style.padding, bounds.y + style.padding},
                    static_cast<float>(style.font_size), style.font_spacing, style.text_color);
            }
        }
    };
}

#endif //PLASTIC_HPP
