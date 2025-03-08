//
// Created by Aidan Jost on 2/14/25.
//
module;

#if defined(__APPLE__)
#define PLASTIC_PLATFORM_MACOS (TARGET_OS_MAC && !TARGET_OS_IOS && !TARGET_OS_TV && !TARGET_OS_WATCH)
#define PLASTIC_OS_NAME "macOS"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME "command"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME_TERSE "cmd"
#elif defined(__linux__)
#define PLASTIC_PLATFORM_LINUX 1
#define PLASTIC_OS_NAME "Linux"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME "control"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME_TERSE "ctrl"
#elif defined(_WIN32) || defined(_WIN64)
#define PLASTIC_PLATFORM_WINDOWS 1
#define PLASTIC_OS_NAME "Windows"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME "control"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME_ALT "control"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME_TERSE "ctrl"
#else
#define PLASTIC_PLATFORM_UNKNOWN 1
#define PLASTIC_OS_NAME "Unknown"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME "unknown"
#define PLASTIC_DEFAULT_COMMAND_KEY_NAME_TERSE "unknown"
#endif

#include <memory>
export module plastic.platform;

import plastic.window_base;
import plastic.app_context;
import plastic.event_dispatcher;
import plastic.events;
import plastic.size;
import plastic.window_context;
import plastic.entity_map;
import plastic.platform_interface;

export namespace plastic
{
    struct Platform : public std::enable_shared_from_this<plastic::Platform>,
                     public plastic::PlatformInterface {
    public:
        decltype(PLASTIC_OS_NAME) os_name_ {PLASTIC_OS_NAME};
        decltype(PLASTIC_DEFAULT_COMMAND_KEY_NAME) default_command_key_name_ {PLASTIC_DEFAULT_COMMAND_KEY_NAME};
        decltype(PLASTIC_DEFAULT_COMMAND_KEY_NAME_TERSE) default_command_key_name_terse_ {PLASTIC_DEFAULT_COMMAND_KEY_NAME_TERSE};

        decltype(PLASTIC_OS_NAME) os_name() const {
            return os_name_;
        }

        decltype(PLASTIC_DEFAULT_COMMAND_KEY_NAME) default_command_key_name() const {
            return default_command_key_name_;
        }
    protected:
        std::shared_ptr<plastic::context::AppContext> app_context_{};
        EventDispatcher event_dispatcher_;
        bool initialized_{false};

        World world_{}; // Entity Component System

    public:
        explicit Platform(std::shared_ptr<context::AppContext> app_context)
            : app_context_(std::move(app_context)) {}

        virtual ~Platform() = default;

        // Platform Capabilities
        [[nodiscard]] virtual bool supports_multiple_windows() const = 0;
        [[nodiscard]] virtual bool supports_native_decorations() const = 0;

        [[nodiscard]] virtual bool supports_resizing() const = 0;
        [[nodiscard]] virtual bool supports_fullscreen() const = 0;
        [[nodiscard]] virtual bool supports_minimizing() const = 0;
        [[nodiscard]] virtual bool supports_maximizing() const = 0;
        [[nodiscard]] virtual bool supports_vsync() const = 0;

        // Context passing pattern
        template <typename F>
        auto with_platform(F&& f) -> decltype(*this) {
            return f(*this);
        }


        template <typename F>
        void handle_events(F&& f) {
            f(event_dispatcher_);
        }

        template <typename E>
        void dispatch_event(E&& event) {
            event_dispatcher_.emit(std::forward<E>(event));
        }

        virtual bool initialize() = 0;
        virtual void shutdown() = 0;
        virtual void update() = 0;

        [[nodiscard]] context::AppContext& app_context() const {
            return *app_context_;
        }
        [[nodiscard]] EventDispatcher& event_dispatcher() {
            return event_dispatcher_;
        }

        virtual std::shared_ptr<context::WindowContext> create_window_context() = 0;
        virtual void set_vsync(bool vsync) = 0;
        virtual void set_target_fps(int fps) = 0;

        virtual float get_primary_display_width() const = 0;
        virtual float get_primary_display_height() const = 0;
        virtual void dispatch_event(const events::Event& event) = 0;
    };
}
