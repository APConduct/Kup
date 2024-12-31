#ifndef PLASTIC_HPP
#define PLASTIC_HPP

#include <chrono>
#include <type_traits>
#include <utility>
#include <vector>
#include <functional>
#include "raylib.h"
#include <string>
#include <memory>
#include <raygui.h>
#include <raymath.h>
namespace plastic {

    struct Window;
    struct Platform;
    struct EventLoop;

    template<typename T>
    concept can_draw = requires(T t) {
        { t.handle_input() }-> std::convertible_to<void>;
    };

    // Events using rl types
    struct mouse_move {
        Vector2 position{};
        Vector2 offset{};
        std::chrono::system_clock::time_point timestamp;
    };

    struct mouse_down {
        Vector2 position;
        MouseButton button;
        int clicks;
        bool shift;
        bool ctrl;
        bool alt;
        bool meta;
    };

    struct mouse_up {
        Vector2 position;
        MouseButton button;
    };

    struct mouse_drag {
        Vector2 position;
        Vector2 offset;
        MouseButton button;
    };

    struct key_down {
        KeyboardKey key;
        bool repeat;
        bool shift;
        bool ctrl;
        bool alt;
        bool meta;
        std::optional<int> character;
    };

    struct key_up {
        KeyboardKey key;
    };

    struct window_resize {
        Rectangle bounds;
        float scale_factor;
    };

    struct focus_in{};
    struct focus_out{};


    using mouse_event = std::variant<
        mouse_move,
        mouse_down,
        mouse_up,
        mouse_drag>;

    using key_event = std::variant<
        key_down,
        key_up>;

    using window_event = std::variant<
        window_resize,
        focus_in,
        focus_out>;

    using event = std::variant<
        mouse_move,
        mouse_down,
        mouse_up,
        mouse_drag,
        key_down,
        key_up,
        window_resize,
        focus_in,
        focus_out,

        mouse_event,
        key_event,
        window_event>;


    template<typename T>
    concept event_handler = requires(T t, const event& e) {
       { t.handle_event(e) } -> std::convertible_to<void>;
    };

    struct window {
    private:
        Rectangle bounds;
        std::string title;
        bool is_focused;

    public:
        window(std::string  title, Rectangle bounds)
            : bounds(bounds), title(std::move(title)), is_focused(false){}

    };

    struct Window {
    protected:
        int width, height;
        std::string title;
        bool is_focused;
    public:
        Window(int width, int height, std::string title)
        : width(width), height(height),
            title(std::move(title)), is_focused(false){}

        void init() const {
            InitWindow(width,height,title.c_str());
        }

        Rectangle bounds() {
            auto [x, y] = GetWindowPosition();
            return Rectangle{
                x, y,
                static_cast<float>(GetScreenWidth()),
                static_cast<float>(GetScreenHeight())};
        }
    };

    template<typename T>
    struct Point {
        T x, y;
    };

}

#endif //PLASTIC_HPP
