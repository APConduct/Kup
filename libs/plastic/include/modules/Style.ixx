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
        Color background;
        Color text;
        Color border;
        Color hover;
        Color active;
        Color disabled;
        Color outline;
        Color outline_hover;
        Color outline_active;
        Color outline_disabled;
        Color text_hover;
        Color text_active;
        Color text_disabled;
        Color text_outline;
        Color text_outline_hover;
        Color text_outline_active;
        Color text_outline_disabled;
        Color text_background;
        Color text_background_hover;
        Color text_background_active;
        Color text_background_disabled;
        Color text_background_outline;
        Color text_background_outline_hover;
        Color text_background_outline_active;
        Color text_background_outline_disabled;
        Color text_background_hover_outline;
        Color text_background_active_outline;
        Color text_background_disabled_outline;
        Color text_background_hover_outline_active;
        Color text_background_hover_outline_disabled;
        Color text_background_active_outline_disabled;

        Edge padding;
        Edge margin;
        std::optional<Size<float>> size;
    };
}



