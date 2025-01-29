//
// Created by ajost1 on 1/23/2025.
//

#ifndef CONTEXT_HPP
#define CONTEXT_HPP
#include <raylib.h>
#include <string>

#include "rect.hpp"

namespace plastic::proto
{
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

        // Color for if there is a header
        Color header_color;

        // Color for if Element has/is button (most likely to be refactored)
        Color button_color;


        float border_width = 1.0f;
        float border_radius = 0.0f;
        float padding = 5.0f;
        float margin = 5.0f;
        float font_spacing = 1.0f;

        Font font;
        int font_size = 20;
        bool center_text = true;

        bool is_bold;
        bool is_italic;
        bool is_underlined;
        std::string font_name;
    };

    struct Context {
    private:
        Rect bounds;
        Style style;
        bool is_hovered = false;
        bool is_active = false;
        bool is_enabled = true;
        bool is_visible = true;

        public:
        explicit Context(const Rect& bounds, Style style = Style{}) : bounds(bounds), style(std::move(style)) {}

        void set_bounds(const Rect& bounds) {
            this->bounds = bounds;
        }

        [[nodiscard]] Rect get_bounds() const {
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
}


#endif //CONTEXT_HPP
