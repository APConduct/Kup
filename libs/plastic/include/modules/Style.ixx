//
// Created by ajost1 on 1/28/2025.
//

module;
#include <optional>

#include "raylib.h"

export module Style;

import plastic.point;
import plastic.size;
import plastic.rect;
import plastic.edge;

export namespace plastic::style
{
    struct Style {
        std::optional<Color>  background;
        std::optional<Color> text;
        std::optional<Color> border;
        std::optional<Color> hover;
        std::optional<Color> active;
        std::optional<Color> disabled;
        std::optional<Color> outline;
        std::optional<Color> outline_hover;
        std::optional<Color> outline_active;
        std::optional<Color> outline_disabled;
        std::optional<Color> text_hover;
        std::optional<Color> text_active;
        std::optional<Color> text_disabled;
        std::optional<Color> text_outline;
        std::optional<Color> text_outline_hover;
        std::optional<Color> text_outline_active;
        std::optional<Color> text_outline_disabled;
        std::optional<Color> text_background;
        std::optional<Color> text_background_hover;
        std::optional<Color> text_background_active;
        std::optional<Color> text_background_disabled;
        std::optional<Color> text_background_outline;
        std::optional<Color> text_background_outline_hover;
        std::optional<Color> text_background_outline_active;
        std::optional<Color> text_background_outline_disabled;
        std::optional<Color> text_background_hover_outline;
        std::optional<Color> text_background_active_outline;
        std::optional<Color> text_background_disabled_outline;
        std::optional<Color> text_background_hover_outline_active;
        std::optional<Color> text_background_hover_outline_disabled;
        std::optional<Color> text_background_active_outline_disabled;

        Edge padding{0,0,0,0};
        Edge margin{0,0,0,0};
        std::optional<Size<float>> preferred_size;
    };
}



