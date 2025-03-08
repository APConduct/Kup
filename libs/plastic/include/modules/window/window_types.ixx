//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <string>
#include <optional>
export module plastic.window_types;

import plastic.point;
import plastic.size;
import plastic.rect;

export namespace plastic::window
{
    // Basic window structures - shared across the application
    struct Bounds {
        float x, y, width, height;

        static Bounds centered(std::optional<Point<float>> position, const Size<float>& size);

        // Convert to Rect
        [[nodiscard]] Rect<float> to_rect() const {
            return Rect<float>{x, y, width, height};
        }
    };

    enum class WindowBoundsType {
        Windowed,
        Maximized,
        Fullscreen
    };

    struct WindowBounds {
        WindowBoundsType type;
        Bounds bounds;

        static WindowBounds Windowed(const Bounds& bounds) {
            return {WindowBoundsType::Windowed, bounds};
        }

        static WindowBounds Maximized() {
            return {WindowBoundsType::Maximized, {}};
        }

        static WindowBounds Fullscreen() {
            return {WindowBoundsType::Fullscreen, {}};
        }
    };

    // Standard window options
    struct WindowOptions {
        std::string title;
        std::optional<WindowBounds> window_bounds;
        Size<float> size{800, 600};
        Point<float> position{100, 100};
        bool resizable{true};
        bool decorations{true};
        bool transparent{false};
        bool always_on_top{false};
        bool fullscreen{false};
        int min_width{200};
        int min_height{200};
        float opacity{1.0f};

        // Static factory method
        static WindowOptions Default() {
            return WindowOptions{};
        }

        // Builder pattern methods
        WindowOptions& with_title(std::string title_) {
            title = std::move(title_);
            return *this;
        }

        WindowOptions& with_size(const Size<float>& size_) {
            size = size_;
            return *this;
        }

        WindowOptions& with_position(const Point<float>& position_) {
            position = position_;
            return *this;
        }

        WindowOptions& with_bounds(const WindowBounds& bounds) {
            window_bounds = bounds;
            return *this;
        }

        WindowOptions& set_resizable(bool value) {
            resizable = value;
            return *this;
        }

        WindowOptions& set_decorations(bool value) {
            decorations = value;
            return *this;
        }

        WindowOptions& set_transparent(bool value) {
            transparent = value;
            return *this;
        }

        WindowOptions& set_always_on_top(bool value) {
            always_on_top = value;
            return *this;
        }

        WindowOptions& set_fullscreen(bool value) {
            fullscreen = value;
            return *this;
        }

        // Add other builder methods...
    };
}
