//
// Created by ajost1 on 1/28/2025.
//

module;
#include <optional>


export module plastic.style;

import plastic.point;
import plastic.size;
import plastic.rect;
import plastic.edge;
import plastic.color;

export namespace plastic::style
{

    struct BasicStyle {
        std::optional<Color> background_color;
        std::optional<Color> background_hover;
        std::optional<Color> background_active;
        std::optional<Color> text_color;
        std::optional<Color> text_hover;
        std::optional<Color> text_active;
        std::optional<Color> border;
        std::optional<Color> border_active;
        std::optional<Color> border_hover;

        Edge<float> padding{0,0,0,0};
        Edge<float> margin{0,0,0,0};
        std::optional<Size<float>> preferred_size;
    };
    struct Style {
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

        Edge<float> padding{0,0,0,0};
        Edge<float> margin{0,0,0,0};
        std::optional<Size<float>> preferred_size;

        void set_preferred_size(Size<float> size) {
            preferred_size = size;
        }

        Size<float> get_preferred_size() const {
            return preferred_size.value_or(Size<float>{0,0});
        }

        [[nodiscard]] Point<float> origin() const {
            return Point<float>(padding.left, padding.top);

        }
    };

    struct StyleSet {
        Style normal;
        Style hover;
        Style active;
        Style disabled;
    };

    struct MuchHueStyle {
        std::optional<Color> background;
        std::optional<Color> background_hover;
        std::optional<Color> background_active;
        std::optional<Color> background_disabled;
        std::optional<Color> text;
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

        Edge<float> padding{0,0,0,0};
        Edge<float> margin{0,0,0,0};
        std::optional<Size<float>> preferred_size;
    };




}



