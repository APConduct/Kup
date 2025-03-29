//
// Created by ajost1 on 2/2/2025.
//

module;
#include <optional>
#include <raylib.h>
#include <string>
#include <variant>


export module plastic.events;
import plastic.point;
import plastic.size;
export import plastic.window_events;

export namespace plastic::events
{

    /// @brief Get the current timestamp in seconds
    /// @return The current timestamp in seconds
    /// @note This is a wrapper around GetTime() from raylib
    /// @note This function is not thread-safe
    inline double get_current_timestamp() {
        return GetTime();
    }

    /// @brief Mouse move event
    struct MouseMoveEvent {
        Point<float> position;
        Point<float> delta;
        double timestamp{};
    };

    /// @brief Mouse button event
    struct MouseButtonEvent {
        Size<float> position;
        MouseButton button{};
        bool pressed{};
        bool shift{};
        bool ctrl{};
        bool alt{};
        double timestamp{};
    };

    /// @brief Mouse scroll event
    struct MouseScrollEvent {
        Size<float> position;
        Size<float> delta;
        double timestamp{};
        std::optional<bool> shift{};
        std::optional<bool> ctrl{};
        std::optional<bool> alt{};
    };

    struct MouseDragEvent {
        Size<float> start;
        Size<float> current;
        Size<float> delta;
        MouseButton button{};
        double timestamp{};
        std::optional<bool> shift{};
    };

    struct MouseWheelEvent {
        float wheel{};
        Point<float> delta;
        double timestamp{};
    };

    struct KeyPressEvent {
        KeyboardKey key{};
        bool pressed{};
        bool repeat{};
        int scancode{};
        double timestamp{};
        std::optional<bool> shift{};
        std::optional<bool> caps_lock{};
        std::optional<bool> num_lock{};
        std::optional<bool> ctrl{};
        std::optional<bool> super{};
        std::optional<bool> alt{};
    };

    struct KeyReleaseEvent {
        KeyboardKey key{};
        double timestamp{};
    };

    struct TextInputEvent {
        std::string text;
        double timestamp{};
    };

    struct ResizeEvent {
        Size<float> size;
        double timestamp{};
    };

    struct WindowResizeEvent {
        Size<float>& size;
        double timestamp{};
    };

    struct FocusEvent {
        bool gained{};
        double timestamp{};
    };

    struct WindowCloseEvent {
        int window_id{};
        double timestamp{};
    };

    template<typename T>
    struct CustomEvent {
        T data;
        double timestamp;
    };


    using Event = std::variant<
        MouseMoveEvent,
        MouseButtonEvent,
        MouseScrollEvent,
        MouseDragEvent,
        KeyPressEvent,
        KeyReleaseEvent,
        TextInputEvent,
        ResizeEvent,
        FocusEvent,
        WindowCloseEvent,
        WindowStateEvent,
        WindowMovedEvent,
        ContentChangeEvent,
        LayoutRequestEvent,
        ThemeChangeEvent,
        WindowCreatedEvent,
        WindowActivationEvent,
        MouseWheelEvent,
        WindowFullscreenEvent,
        WindowTransparentEvent,
        WindowDecorationsEvent,
        WindowRestoreEvent,
        WindowMaximizeEvent,
        WindowResizeEvent
        >;

    using KeyboardKey = ::KeyboardKey;
    using MouseButton = ::MouseButton;
}
