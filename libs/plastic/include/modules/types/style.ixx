//
// Created by ajost1 on 1/28/2025.
//

module;
#include <optional>
#include <string>
#include <functional>
export module plastic.style;

import plastic.point;
import plastic.size;
import plastic.rect;
import plastic.edge;
import plastic.color;
import plastic.layout_properties;

export namespace plastic::style
{

    struct Style {
        Style() = default;
        LayoutProperties layout_properties;
        std::optional<Color> background_color_normal;
        std::optional<Color> text_color_normal;
        std::optional<Color> text_hover;
        std::optional<Color> text_active;
        std::optional<Color> border;
        std::optional<Color> border_hover;
        std::optional<Color> border_active;
        std::optional<Color> border_disabled;
        std::optional<Color> hover;
        std::optional<Color> active;
        std::optional<Color> disabled;
        std::optional<Color> outline;
        std::optional<Color> outline_hover;
        std::optional<Color> outline_active;
        std::optional<Color> outline_disabled;
        std::optional<Color> text_disabled;
        std::optional<Color> text_outline;
        std::optional<Color> text_outline_hover;
        std::optional<Color> text_outline_active;
        std::optional<Color> text_outline_disabled;
        std::optional<float> corner_radius;
        std::optional<float> shadow_radius;
        std::optional<Point<float>> shadow_offset;
        std::optional<Color> shadow_color;

        std::optional<float> border_width;
        std::optional<float> border_height;

        Edge<float> padding{0,0,0,0};
        Edge<float> margin{0,0,0,0};
        std::optional<Size<float>> preferred_size;

        void set_preferred_size(Size<float> size) {
            preferred_size = size;
        }

        [[nodiscard]] Size<float> get_preferred_size() const {
            return preferred_size.value_or(Size<float>{0,0});
        }

        [[nodiscard]] Point<float> origin() const {
            return Point<float>(padding.left, padding.top);

        }

        bool operator==(const Style& rhs) const {
            return background_color_normal == rhs.background_color_normal &&
                   text_color_normal == rhs.text_color_normal &&
                   text_hover == rhs.text_hover &&
                   text_active == rhs.text_active &&
                   border == rhs.border &&
                   border_hover == rhs.border_hover &&
                   border_active == rhs.border_active &&
                   border_disabled == rhs.border_disabled &&
                   hover == rhs.hover &&
                   active == rhs.active &&
                   disabled == rhs.disabled &&
                   outline == rhs.outline &&
                   outline_hover == rhs.outline_hover &&
                   outline_active == rhs.outline_active &&
                   outline_disabled == rhs.outline_disabled &&
                   text_disabled == rhs.text_disabled &&
                   text_outline == rhs.text_outline &&
                   text_outline_hover == rhs.text_outline_hover &&
                   text_outline_active == rhs.text_outline_active &&
                   text_outline_disabled == rhs.text_outline_disabled &&
                   padding == rhs.padding &&
                   margin == rhs.margin &&
                   preferred_size == rhs.preferred_size;
        }

        bool operator!=(const Style& rhs) const {
            return !(*this == rhs);
        }

        Style& with_text_color_normal(const Color& color) {
            text_color_normal = color;
            return *this;
        }

        Style& with_text_hover(const Color& color) {
            text_hover = color;
            return *this;
        }

        Style& with_corner_radius(float radius) {
            corner_radius = radius;
            return *this;
        }

        Style& with_border(const Color& color) {
            border = color;
            return *this;
        }

        Style& bg(const Color& color) {
            background_color_normal = color;
            return *this;
        }

        Style& with_preferred_size(const Size<float>& size) {
            preferred_size = size;
            return *this;
        }

        Style& with_padding(float padding) {
            this->padding = Edge{padding, padding, padding, padding};
            return *this;
        }

        Style& with_padding(Edge<float> padding) {
            this->padding = padding;
            return *this;
        }



    protected:
        std::optional<std::reference_wrapper<const Style>> parent;
    public:
        Style& inherit_from(const Style& parent) {
            this->parent = std::cref(parent);
            return *this;
        }

        [[nodiscard]] Style get() const {
            return (parent.has_value() ? parent.value() : Style{});
        }

        [[nodiscard]] Style get_inherited_style() {
            if (parent) {
                return parent->get();
            }
            return *this;
        }


        [[nodiscard]] Style get_inherited_style() const {
            if (parent) {
                return parent->get();
            }
            return *this;
        };

    };
}



