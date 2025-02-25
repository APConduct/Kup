//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
export module plastic.app;
import plastic.application;
import plastic.platform;
import plastic.window_context;
import plastic.events;

export namespace plastic
{
    struct App : std::enable_shared_from_this<App> {
    private:
        Application app_;
        std::shared_ptr<Platform> platform_{};

    public:
        virtual ~App() = default;
        template<typename F>
        auto run(F&& f) -> decltype(f(*app_.app_context_)) {
            return with_context(std::forward<F>(f));
        }

        // virtual void init() = 0;
        // virtual void run() = 0;
        // virtual void on_start() = 0;
        // virtual void on_stop() = 0;
        // virtual void on_update() = 0;
        // virtual void on_render() = 0;
        // virtual void on_event(const events::Event& event) = 0;
        // virtual void on_window_close() = 0;

    };
}
