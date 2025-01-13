//
// Created by ajost1 on 1/13/2025.
//

#ifndef PLASTIC_HPP
#define PLASTIC_HPP

#include <string>
#include <utility>
#include <raylib.h>


namespace plastic
{
    // Forward declarations
    struct Context;
    struct Component;
    struct View;

    // Experimental function pointer type for event handlers
    struct ColorScheme {
        Color primary;
        Color secondary;
        Color tertiary;
    };

    struct Color {
        int r;
        int g;
        int b;
        int a;
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
        explicit Context(Rectangle bounds, Style style = Style{}) : bounds(bounds), style(std::move(style)) {}

        void set_bounds(Rectangle bounds) {
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
        void set_hovered(bool hovered) {
            is_hovered = hovered;
        }
        [[nodiscard]] bool get_active() const {
            return is_active;
        }
        void set_active(bool active) {
            is_active = active;
        }
        [[nodiscard]] bool get_enabled() const {
            return is_enabled;
        }
        void set_enabled(bool enabled) {
            is_enabled = enabled;
        }
        [[nodiscard]] bool get_visible() const {
            return is_visible;
        }
        void set_visible(bool visible) {
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

    struct Component {
        protected:
        Context ctx;
        // std::string id;

    public:
        // Component(Rectangle bounds, Style style = Style{}) : ctx(bounds, style) {}
        explicit Component(Context ctx) : ctx(std::move(ctx)) {}

        virtual ~Component() = default;

        virtual void render() = 0;
        virtual void update() {
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
}

#endif //PLASTIC_HPP
