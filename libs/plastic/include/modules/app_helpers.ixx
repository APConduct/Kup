//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <string>
#include <functional>
export module plastic.app_helpers;


import plastic.app;
import plastic.window;
import plastic.point;
import plastic.size;

export namespace plastic
{
    // Bounds and WindowOptions structs (as defined earlier)
    struct Bounds {
        float x, y, width, height;

        static Bounds centered(const std::optional<Point<float>> position,
                              const Size<float>& size,
                              const App* app) {
            // Calculate centered position
            // ... implementation ...
            // Center the window

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

    namespace window
    {
        struct WindowOptions {
            std::string title;
            std::optional<WindowBounds> window_bounds;
            bool decorations{true};
            bool transparent{false};

            static WindowOptions Default() {
                return WindowOptions{};
            }
        };
    }

    // Run an app with a setup function
    template<typename F>
    int run_app(const std::string& name, F&& setup_fn) {
        auto app = create_app(name);
        return app->run_with(std::forward<F>(setup_fn));
    }
}