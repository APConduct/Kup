//
// Created by Aidan Jost on 2/14/25.
//
module;
#include <memory>
#include <string>
export module plastic.platform;

import plastic.window_base;
import plastic.app_context;
import plastic.event_dispatcher;
import plastic.events;
import plastic.size;

export namespace plastic
{
    struct Platform : public std::enable_shared_from_this<plastic::Platform> {
    private:
        std::shared_ptr<plastic::context::AppContext> app_context_{};
        EventDispatcher event_dispatcher_;
        bool initialized_{false};

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
    };
}
