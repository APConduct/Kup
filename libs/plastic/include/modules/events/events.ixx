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
    using KeyType = KeyboardKey;


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

    /// @brief Window Wheel Event
    struct MouseWheelEvent {

        /// @brief The position of the mouse wheel
        float wheel{};

        /// @brief the change in position of the mouse wheel
        Point<float> delta;

        /// @brief the timestamp of the event when it occurred
        double timestamp{};
    };

    /// @brief Event for keyboard key press
    struct KeyPressEvent {

        /// @brief The key that was pressed
        KeyType key{};

        /// @brief The state of the key (pressed or released)
        bool pressed{};

        /// @brief whether the key was pressed again within a feasible time
        bool repeat{};

        /// @brief The scancode of the key
        int scancode{};

        /// @brief The timestamp of the event when it occurred
        double timestamp{};

        /// @ whether shift was active when the key was pressed
        std::optional<bool> shift{};

        /// @brief whether caps lock was on when the key was pressed
        std::optional<bool> caps_lock{};

        /// @brief whether num lock was on when the key was pressed
        std::optional<bool> num_lock{};

        /// @brief whether the key was pressed with the control key
        std::optional<bool> ctrl{};

        /// @brief whether the key was pressed with the super key
        std::optional<bool> super{};

        /// @brief whether the key was pressed with the alt key
        std::optional<bool> alt{};
    };


    /// @brief Event for keyboard key release
    struct KeyReleaseEvent {

        /// @brief The key that was released
        KeyboardKey key{};

        /// @brief The timestamp of the event when it occurred
        double timestamp{};
    };

    /// @brief Event for text input
    struct TextInputEvent {

        /// @brief The text that was inputted
        std::string text;

        /// @brief The timestamp of the event when it occurred
        double timestamp{};
    };

    /// @brief Event for when something is resized
    struct ResizeEvent {

        /// @brief The new size of the window
        Size<float> size;

        /// @brief The timestamp of the event when it occurred
        double timestamp{};
    };

    /// @brief Event for window is resized
    struct WindowResizeEvent {

        /// @brief The new size of the window
        Size<float>& size;

        /// @brief The timestamp of the event when it occurred
        double timestamp{};
    };

    /// @brief Event for when something gains or loses focus
    struct FocusEvent {

        /// @brief Whether the window gained or lost focus
        bool gained{};

        /// @brief The timestamp of the event when it occurred
        double timestamp{};
    };


    /// @brief Event for when the window is closed
    struct WindowCloseEvent {

        /// @brief The ID of the window that was closed
        int window_id{};

        /// @brief The timestamp of the event when it occurred
        double timestamp{};
    };


    /// @brief Generic event for coder-configurable events
    template<typename T>
    struct CustomEvent {
        T data;
        double timestamp;
    };


    /// @brief Variant/Sum type for all events
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

    /// @brief explicit aliasing of raylib KeyboardKey enum
    using KeyboardKey = ::KeyboardKey;

    /// @brief explicit aliasing of raylib MouseButton enum
    using MouseButton = ::MouseButton;
}
