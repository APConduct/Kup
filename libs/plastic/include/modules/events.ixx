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

export namespace plastic::events
{

    struct MouseMoveEvent {
        Size<float> position;
        Size<float> delta;
        double timestamp{};
    };

    struct MouseButtonEvent {
        Size<float> position;
        MouseButton button{};
        bool pressed{};
        bool shift{};
        bool ctrl{};
        bool alt{};
        double timestamp{};
    };

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

    struct FocusEvent {
        bool gained{};
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
        FocusEvent
        >;
}
