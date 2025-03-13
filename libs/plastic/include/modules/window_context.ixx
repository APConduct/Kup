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
import plastic.point;
import plastic.size;
import plastic.color;


export namespace plastic::context
{
    struct WindowContext
        : public std::enable_shared_from_this<plastic::context::WindowContext>,
        public plastic::Context {
    private:
        std::weak_ptr<WindowBase> window_{};
        bool layout_requested_{false};

    public:
        std::weak_ptr<AppContext> app_context_;

        explicit WindowContext(const std::shared_ptr<AppContext>& app_context) : app_context_(app_context) {}

        [[nodiscard]] const std::shared_ptr<AppContext> app_context() const {
            return app_context_.lock();
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

        static void show_error(const std::string& message); // implement error handling


        std::shared_ptr<AppContext> app_context() {
            return app_context_.lock();
        }

        std::shared_ptr<WindowBase> window() const {
            return window_.lock();
        }

        static void focus(View* view);
        static void focus(Element* view);

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

        virtual void make_current() = 0;
        virtual void process_events() = 0;
        virtual bool should_close() const = 0;
        virtual void request_close() = 0;
        virtual void set_title(const std::string& title) = 0;
        virtual void set_position(const Point<float>& position) = 0;
        virtual void set_size(const Size<float>& size) = 0;
        virtual Point<float> get_position() const = 0;
        virtual Size<float> get_size() const = 0;
        virtual void set_fullscreen(bool fullscreen) = 0;
        virtual void set_vsync(bool vsync) = 0;
        virtual void set_target_fps(int fps) = 0;
        virtual void set_icon(const std::string& icon_path) {};
        virtual void maximize() = 0;
        virtual void minimize() = 0;
        virtual void restore() = 0;
        virtual void set_always_on_top(bool always_on_top) {};
        virtual void set_opacity(float opacity) {};
        virtual void set_visible(bool visible) = 0;
        virtual void set_decorations(bool decorations) = 0;
        virtual void set_transparent(bool transparent) = 0;
        virtual void begin_render() = 0;
        virtual void end_render() = 0;
        virtual void clear_background(const Color& color) = 0;
        virtual float get_frame_time() const = 0;








    };
}
