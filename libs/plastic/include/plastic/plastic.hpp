//
// Created by ajost1 on 1/13/2025.
//

#ifndef PLASTIC_HPP
#define PLASTIC_HPP

#include <functional>
#include <string>
#include <utility>
#include <raylib.h>

#include "rect.hpp"
#include "point.hpp"
#include "layout.hpp"
#include "container.hpp"


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

    // Experimental function pointer type for event handlers



    struct ColorScheme {
        Color primary;
        Color secondary;
        Color tertiary;
    };

    // Style struct
    struct Style {
        Color background_color;
        Color text_color;
        Color border_color;

        Color hover_background_color;
        Color hover_text_color;
        Color hover_border_color;

        Color active_background_color;
        Color active_text_color;
        Color active_border_color;

        Color disabled_background_color;
        Color disabled_text_color;
        Color disabled_border_color;

        float border_width = 1.0f;
        float border_radius = 0.0f;
        float padding = 5.0f;
        float margin = 5.0f;
        float font_spacing = 1.0f;

        int font_size = 20;
        bool center_text = true;

        bool is_bold;
        bool is_italic;
        bool is_underlined;
        std::string font_name;
    };

    struct Context {
    private:
        Rectangle bounds;
        Style style;
        bool is_hovered = false;
        bool is_active = false;
        bool is_enabled = true;
        bool is_visible = true;

        public:
        explicit Context(const Rectangle bounds, Style style = Style{}) : bounds(bounds), style(std::move(style)) {}

        void set_bounds(const Rectangle bounds) {
            this->bounds = bounds;
        }

        [[nodiscard]] Rectangle get_bounds() const {
            return bounds;
        }
        Style& get_style() {
            return style;
        }
        [[nodiscard]] const Style& get_style() const {
            return style;
        }
        [[nodiscard]] bool get_hovered() const {
            return is_hovered;
        }
        void set_hovered(const bool hovered) {
            is_hovered = hovered;
        }
        [[nodiscard]] bool get_active() const {
            return is_active;
        }
        void set_active(const bool active) {
            is_active = active;
        }
        [[nodiscard]] bool get_enabled() const {
            return is_enabled;
        }
        void set_enabled(const bool enabled) {
            is_enabled = enabled;
        }
        [[nodiscard]] bool get_visible() const {
            return is_visible;
        }
        void set_visible(const bool visible) {
            is_visible = visible;
        }

        // Get the text color based on the current state
        [[nodiscard]] Color get_text_color() const {
            if (!is_enabled) {
                return style.disabled_text_color;
            }
            if (is_active) {
                return style.active_text_color;
            }
            if (is_hovered) {
                return style.hover_text_color;
            }
            return style.text_color;
        }
        // Get the border color based on the current state
        [[nodiscard]] Color get_border_color() const {
            if (!is_enabled) {
                return style.disabled_border_color;
            }
            if (is_active) {
                return style.active_border_color;
            }
            if (is_hovered) {
                return style.hover_border_color;
            }
            return style.border_color;
        }

        // Get the background color based on the current state
        [[nodiscard]] Color get_background_color() const {
            if (!is_enabled) {
                return style.disabled_background_color;
            }
            if (is_active) {
                return style.active_background_color;
            }
            if (is_hovered) {
                return style.hover_background_color;
            }
            return style.background_color;
        }
    };

    struct Element {
        virtual ~Element() = default;
        virtual Rect measure(const Rect& constraints) = 0;
        std::shared_ptr<Context> context;
    };


    struct Component  : Element {
        protected:
        Context ctx;
        // std::string id;

    public:
        // Component(Rectangle bounds, Style style = Style{}) : ctx(bounds, style) {}
        explicit Component(Context ctx) : ctx(std::move(ctx)) {}

        ~Component() override = default;


        virtual void render() = 0;
        virtual void layout() = 0;
        Rect measure(const Rect& constraints) override = 0;

        virtual void update(float delta_time) {
            if (!ctx.get_enabled()) return;

            const Vector2 mouse_pos = GetMousePosition();
            const Rectangle bounds = ctx.get_bounds();
            const bool is_hovered = CheckCollisionPointRec(mouse_pos, bounds);
            ctx.set_hovered(is_hovered);
            ctx.set_active(is_hovered && IsMouseButtonPressed(MOUSE_LEFT_BUTTON));
        }

        Context& get_context() {
            return ctx;
        }
        [[nodiscard]] const Context& get_context() const { return ctx; }
    };

    struct Button : Component {
        private:
        std::string text;
        std::function<void()> on_click;
        bool was_pressed = false;
        Font font{};

        public:
        Button(Context ctx, std::string text, std::function<void()> on_click)
            : Component(std::move(ctx)), text(std::move(text)), on_click(std::move(on_click)) {}

        Button(Context ctx, std::string text, std::function<void()> on_click, const Font& font)
            : Component(std::move(ctx)), text(std::move(text)), on_click(std::move(on_click)), font(font) {}

        void update(const float delta_time) override {
            Component::update(delta_time);
            if (!ctx.get_enabled()) return;

            const bool is_pressed = ctx.get_hovered() && IsMouseButtonPressed(MOUSE_LEFT_BUTTON);
            if (was_pressed && !is_pressed) {
                on_click();
            }
            was_pressed = is_pressed;
        }

        void render() override {
            const auto& style = ctx.get_style();
            Rectangle bounds = ctx.get_bounds();

            // Draw the button background
            DrawRectangleRec(bounds, ctx.get_background_color());

            // Draw the button border
            if (style.border_width > 0) {
                DrawRectangleLinesEx(bounds, style.border_width, ctx.get_border_color());
            }

            // Draw the button text
            if (style.center_text) {
                Vector2 text_size = MeasureTextEx(
                    font, text.c_str(),
                    static_cast<float>(style.font_size), style.font_spacing);
                Vector2 text_pos = {
                    bounds.x + bounds.width/2 - text_size.x * 0.5f,
                    bounds.y + bounds.height/2 - text_size.y * 0.5f
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
