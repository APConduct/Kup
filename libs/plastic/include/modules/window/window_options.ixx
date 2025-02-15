//
// Created by Aidan Jost on 2/14/25.
//
module;
#include <string>
export module plastic.window_options;
import plastic.size;
import plastic.point;

export namespace plastic
{
    struct WindowOptions {

        plastic::Size<float> size{800,600};

        std::string title = "Untitled";
        Point<float> position{100, 100};
        bool resizable = true;
        bool decorations = true;
        bool transparent = false;
        bool always_on_top = false;
        bool fullscreen = false;
        int min_width = 200;
        int min_height = 200;
        float opacity = 1.0f;

        // Builder pattern
        WindowOptions& with_title(const std::string& title) {
            this->title = title;
            return *this;
        }

        WindowOptions& with_size(const Size<float>& size) {
            this->size = size;
            return *this;
        }

        WindowOptions& with_position(const Point<float>& position) {
            this->position = position;
            return *this;
        }

        WindowOptions& set_resizable(const bool resizable) {
            this->resizable = resizable;
            return *this;
        }

        WindowOptions& set_decorations(const bool decorations) {
            this->decorations = decorations;
            return *this;
        }

        WindowOptions& set_transparent(const bool transparent) {
            this->transparent = transparent;
            return *this;
        }

        WindowOptions& set_always_on_top(const bool always_on_top) {
            this->always_on_top = always_on_top;
            return *this;
        }

        WindowOptions& set_fullscreen(const bool fullscreen) {
            this->fullscreen = fullscreen;
            return *this;
        }

        WindowOptions& with_min_size(const int width, const int height) {
            this->min_width = width;
            this->min_height = height;
            return *this;
        }

        WindowOptions& with_opacity(const float opacity) {
            this->opacity = opacity;
            return *this;
        }
    };
}
