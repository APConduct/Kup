//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <string>
#include <functional>
#if defined(_WIN32)
#include <optional>
#endif
export module plastic.app_helpers;
import plastic.app;



import plastic.size;
import plastic.point;
import plastic.window_options;

export namespace plastic
{
    using Bounds = window::Bounds;
    using WindowBoundsType = window::WindowBoundsType;
    using WindowBounds = window::WindowBounds;
    using WindowOptions = window::WindowOptions;

    // Helper functions for creating window bounds and options
    inline WindowBounds Windowed(const Bounds& bounds) {
        return WindowBounds::Windowed(bounds);
    }

    inline WindowBounds Maximized() {
        return WindowBounds::Maximized();
    }

    inline WindowBounds Fullscreen() {
        return WindowBounds::Fullscreen();
    }

    // Helper for centering windows
    inline Bounds centered_bounds(const Size<float>& size) {
        return Bounds::centered(std::nullopt, size);
    }

    inline WindowBounds centered_window(const Size<float>& size) {
        return Windowed(centered_bounds(size));
    }

    // Convenient window options factories
    inline WindowOptions default_window(const std::string& title = "Plastic Window", const Size<float>& size = Size<float>{800, 600}) {
        return WindowOptions()
            .with_title(title)
            .with_size(size)
            .with_bounds(centered_window(size));
    }

    inline WindowOptions fullscreen_window(const std::string& title = "Plastic Window") {
        return WindowOptions()
            .with_title(title)
            .with_bounds(Fullscreen());
    }

    template<typename F>
    int run_app(const std::string& name, F&& setup_fn) {
        auto app = create_app(name);
        return app->run_with(std::forward<F>(setup_fn));
    }

    template<typename F>
    int run(F&& setup_fn) {
        return run_app("Plastic App", std::forward<F>(setup_fn));
    }

    template<typename F>
    int run(const std::string& app_name, F&& setup_fn) {
        return run_app(app_name, std::forward<F>(setup_fn));
    }
}