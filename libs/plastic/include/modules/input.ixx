//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <functional>
export module plastic.input;

import plastic.point;
import plastic.events;

export namespace plastic::input
{
    // Key and mouse codes abstracted away from Raylib
    enum class Key {
        Space, Apostrophe, Comma, Minus, Period, Slash,
        D0, D1, D2, D3, D4, D5, D6, D7, D8, D9,
        Semicolon, Equal,
        A, B, C, D, E, F, G, H, I, J, K, L, M,
        N, O, P, Q, R, S, T, U, V, W, X, Y, Z,
        LeftBracket, Backslash, RightBracket, GraveAccent,
        Escape, Enter, Tab, Backspace, Insert, Delete,
        Right, Left, Down, Up,
        PageUp, PageDown, Home, End,
        CapsLock, ScrollLock, NumLock,
        PrintScreen, Pause,
        F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12,
        LeftShift, LeftControl, LeftAlt, LeftSuper,
        RightShift, RightControl, RightAlt, RightSuper,
        // Add more as needed
    };

    enum class MouseButton {
        Left, Right, Middle, Side, Extra, Forward, Back
    };

    // Input state queries
    bool is_key_down(Key key);
    bool is_key_pressed(Key key);
    bool is_key_released(Key key);

    bool is_mouse_button_down(MouseButton button);
    bool is_mouse_button_pressed(MouseButton button);
    bool is_mouse_button_released(MouseButton button);

    Point<float> get_mouse_position();
    Point<float> get_mouse_delta();
    float get_mouse_wheel_move();

    // Input event registration
    using KeyCallback = std::function<void(Key, bool)>;
    using TextInputCallback = std::function<void(const std::string&)>;
    using MouseButtonCallback = std::function<void(MouseButton, bool, Point<float>)>;
    using MouseMoveCallback = std::function<void(Point<float>, Point<float>)>;

    void register_key_callback(KeyCallback callback);
    void register_text_input_callback(TextInputCallback callback);
    void register_mouse_button_callback(MouseButtonCallback callback);
    void register_mouse_move_callback(MouseMoveCallback callback);
}
