//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <functional>
export module plastic.window_context;
import plastic.view;

import plastic.app_context;
import plastic.element;
import plastic.context;
import plastic.window_base;
import plastic.events;


export namespace plastic::context
{
    struct WindowContext
        : public std::enable_shared_from_this<plastic::context::WindowContext>,
        public plastic::Context {
    private:
        std::shared_ptr<AppContext> app_context_;
        std::weak_ptr<WindowBase> window_{};
        bool layout_requested_{false};

    public:
        explicit WindowContext(const std::shared_ptr<AppContext>& app_context) : app_context_(app_context) {}

        [[nodiscard]] AppContext& app_context() const {
            return *app_context_;
        }

        template <typename T>
        auto with_context(T&& f) -> decltype(f(*this)) {
            return f(*this);
        }

        template <typename F>
        auto run(F&& f) -> decltype(f(*this)) {
            return with_context(std::forward<F>(f));
        }

        template <typename F>
        auto with_layout(F&& f) -> decltype(f(*this)) {
            request_layout();
            auto result = with_context(std::forward<F>(f));
            return result;
        }

        void request_layout() override{ layout_requested_ = true; }

        void process_layout() {
            if (layout_requested_) {
                if (auto window = window_.lock()) {
                    layout_requested_ = false;
                }
            }
        }

        auto with_error_handler(const std::function<void(const std::exception&)>& handler) -> decltype(*this) {
            return *this;
        }


        template <typename F>
        auto with_error_handling(F&& f) -> decltype(f(*this)) {
            try {
                return with_context(std::forward<F>(f));
            } catch (const std::exception& e) {
                show_error(e.what());
                throw;
            }
        }

        void show_error(const std::string& message) {
            // implement error handling

        }

        AppContext& app_context() {
            return *app_context_;
        }

        std::shared_ptr<WindowBase> window() const {
            return window_.lock();
        }

        void focus(View* view){}
        void focus(Element* view){}

        void request_paint() override {
            // implement paint request
            if (const auto window = window_.lock()) {
                window->context().request_paint();
            }
        }

        void dispatch_event(const events::Event& event) override {
            // implement event dispatch
            if (const auto window = window_.lock()) {
                window->context().dispatch_event(event);
            }
        }





    };
}
