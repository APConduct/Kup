//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <raylib.h>
#include <any>
#include <string>
export module plastic.window_events;



export namespace plastic
{
    inline double get_current_timestamp() {
        return GetTime();
    }
}

export namespace plastic::events
{

    struct WindowFullscreenEvent {
        int window_id;           // ID of the window that changed state
        bool is_fullscreen;      // true if window is now fullscreen, false otherwise
        double timestamp;

        WindowFullscreenEvent(int window_id, bool is_fullscreen, double timestamp)
            : window_id(window_id), is_fullscreen(is_fullscreen), timestamp(timestamp) {}

        explicit WindowFullscreenEvent(int window_id)
            : window_id(window_id), is_fullscreen(true), timestamp(get_current_timestamp()) {}
    };

    struct WindowRestoreEvent {
        int window_id;
        double timestamp;
        WindowRestoreEvent(int window_id, double timestamp)
            : window_id(window_id), timestamp(timestamp) {}

        explicit WindowRestoreEvent(int window_id)
            : window_id(window_id), timestamp(get_current_timestamp()) {}
    };
    // Window state change event
    struct WindowStateEvent {
        int window_id;            // ID of the window that changed state
        int previous_state;       // Previous window state (using values from WindowState enum)
        int new_state;            // New window state
        double timestamp;

        // Constructor with typical signature matching other events
        WindowStateEvent(int window_id, int previous_state, int new_state, double timestamp)
            : window_id(window_id), previous_state(previous_state), new_state(new_state), timestamp(timestamp) {}
    };

    // Window moved event
    struct WindowMovedEvent {
        int window_id;
        float x;                  // New x position
        float y;                  // New y position
        float delta_x;            // Change in x position
        float delta_y;            // Change in y position
        double timestamp;

        WindowMovedEvent(int window_id, float x, float y, float delta_x, float delta_y, double timestamp)
            : window_id(window_id), x(x), y(y), delta_x(delta_x), delta_y(delta_y), timestamp(timestamp) {}
    };

    // Content change event for window synchronization
    struct ContentChangeEvent {
        int window_id;           // Window where content changed
        std::string content_id;  // Identifier for the content that changed
        std::any data;           // Optional data related to the change
        double timestamp;

        ContentChangeEvent(int window_id, std::string content_id, std::any data, double timestamp)
            : window_id(window_id), content_id(std::move(content_id)), data(std::move(data)), timestamp(timestamp) {}

        template<typename T>
        T get_data() const {
            return std::any_cast<T>(data);
        }
    };

    // Layout change event
    struct LayoutRequestEvent {
        int window_id;
        std::string reason;     // Optional reason for the layout request
        double timestamp;

        LayoutRequestEvent(int window_id, std::string reason, double timestamp)
            : window_id(window_id), reason(std::move(reason)), timestamp(timestamp) {}
    };

    // Theme change event
    struct ThemeChangeEvent {
        int theme_id;           // ID of the new theme
        double timestamp;

        ThemeChangeEvent(int theme_id, double timestamp)
            : theme_id(theme_id), timestamp(timestamp) {}
    };

    // Window created event
    struct WindowCreatedEvent {
        int window_id;
        double timestamp;

        WindowCreatedEvent(int window_id, double timestamp)
            : window_id(window_id), timestamp(timestamp) {}
    };

    // Window activation event
    struct WindowActivationEvent {
        int window_id;
        bool is_active;        // true if window gained focus, false if lost focus
        double timestamp;

        WindowActivationEvent(int window_id, bool is_active, double timestamp)
            : window_id(window_id), is_active(is_active), timestamp(timestamp) {}
    };

    struct WindowDecorationsEvent {
        int window_id;
        bool decorations;      // true if decorations are enabled, false if disabled
        double timestamp;

        WindowDecorationsEvent(int window_id, bool decorations, double timestamp)
            : window_id(window_id), decorations(decorations), timestamp(timestamp) {}

        WindowDecorationsEvent(int window_id, bool decorations)
            : window_id(window_id), decorations(decorations), timestamp(get_current_timestamp()) {}
    };

    struct WindowTransparentEvent {
        int window_id;
        bool transparent;      // true if window is transparent, false if opaque
        double timestamp;

        WindowTransparentEvent(int window_id, bool transparent, double timestamp)
            : window_id(window_id), transparent(transparent), timestamp(timestamp) {}

        WindowTransparentEvent(int window_id, bool transparent)
            : window_id(window_id), transparent(transparent), timestamp(get_current_timestamp()) {}
    };

    struct WindowMaximizeEvent {
        int window_id;
        double timestamp;
        WindowMaximizeEvent(int window_id, double timestamp)
            : window_id(window_id), timestamp(timestamp) {}
        explicit WindowMaximizeEvent(int window_id)
            : window_id(window_id), timestamp(get_current_timestamp()) {}

    };
}

