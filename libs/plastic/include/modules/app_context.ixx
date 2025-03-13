//
// Created by ajost1 on 1/30/2025.
//
module;


#include <memory>
#include <vector>
export module plastic.app_context;
import plastic.window_base;
import plastic.event_dispatcher;
import plastic.context;
import plastic.events;
import plastic.platform_interface;
import plastic.window_manager_interface;






export namespace plastic::context
{
    struct AppContext  : Context,  std::enable_shared_from_this<AppContext> {

    private:
        EventDispatcher event_dispatcher_;
        std::weak_ptr<PlatformInterface> platform_{};
        std::weak_ptr<WindowManagerInterface> window_manager_{};
        bool layout_requested_{false};
        bool paint_requested_{false};



    public:

        void set_platform(const std::shared_ptr<PlatformInterface>& platform) {
            platform_ = platform;
        }

        std::shared_ptr<PlatformInterface> platform() {
            return platform_.lock();
        }

        void request_layout() override {
            layout_requested_ = true;
        }

        bool process_layout() {
            if (layout_requested_) {
                layout_requested_ = false;
                return true;
            }
            return false;
        }

        // Context passing pattern
        template<typename F>
        auto with_context(F&& f) -> decltype(f(*this)) {
            return f(*this);
        }

        template<typename F>
        auto run(F&& f) -> decltype(f(*this)) {
            return with_context(std::forward<F>(f));
        }

        void set_window_manager(const std::shared_ptr<WindowManagerInterface>& window_manager) {
            window_manager_ = window_manager;
        }

        std::shared_ptr<WindowManagerInterface> window_manager() {
            return window_manager_.lock();
        }



        EventDispatcher& events() {
            return event_dispatcher_;
        }

        void request_paint() override {
            paint_requested_ = true;
        }
        void dispatch_event(const events::Event& event) override {
            event_dispatcher_.emit(event);

            // Forward to platform if needed
            if (auto p = platform_.lock()) {
                p->dispatch_event(event);
            }
        }
    };
}
