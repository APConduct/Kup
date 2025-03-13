//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <string>
#if defined(_WIN32)
#include <variant>
#endif
// #include <thread>

#include <functional>
export module plastic.window;
import plastic.element;
import plastic.window_context;
import plastic.size;
import plastic.view;
import plastic.window_options;
import plastic.platform;
import plastic.events;
import plastic.rect;
import plastic.window_base;
import plastic.context;
import plastic.events;
import plastic.color;


export namespace plastic
{
    struct Window : WindowBase {
        std::vector<std::function<void()>> renderers_;
        std::vector<std::function<void()>> updaters_;

    private:
        std::shared_ptr<View> root_{};
        std::shared_ptr<plastic::context::WindowContext> context_{};
        Size<float> size{0,0};
        window::WindowOptions options_;

        std::string title_;

        int window_id_{};
        std::weak_ptr<Platform> platform_{};
        bool should_close_{false};
        Rect<float> bounds_{};



    public:

        explicit Window(std::shared_ptr<context::WindowContext> context) : context_(std::move(context)) {}

        [[nodiscard]] std::shared_ptr<context::WindowContext> get_context() const {
            return context_;
        }

        [[nodiscard]] const Size<float>& get_size() const {
            return size;
        }

        [[nodiscard]] const std::string& get_title() const {
            return title_;
        }

        explicit Window(const std::shared_ptr<View>& root) : root_(root) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const std::shared_ptr<View>& root) : root_(root), context_(context) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const std::shared_ptr<View>& root, const Size<float> size) : root_(root), context_(context), size(size) {}
        explicit Window( const Size<float>& size) : size(size){}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const Size<float>& size) : context_(context), size(size) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const Size<float>& size, std::string  title) : context_(context), size(size), title_(std::move(title)) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const std::shared_ptr<View>& root, const Size<float>& size) : root_(root), context_(context), size(size) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const std::shared_ptr<View>& root, const Size<float>& size, std::string  title) : root_(root), context_(context), size(size), title_(std::move(title)) {}
        explicit Window(const int window_id, const std::weak_ptr<Platform>& platform) : window_id_(window_id), platform_(platform) {}



        template <typename F>
        auto run(F&& f) -> decltype(f(context_)) {
            return context_->run(std::forward<F>(f));
        }

        // View management with context
        template <typename ViewType, typename... Args>
        void set_root_view(Args&&... args) {
            run ([&](context::WindowContext& cx) {
                auto new_view = std::make_shared<ViewType>(std::forward<Args>(args)...);
                set_root(new_view);
                new_view->mount(&cx);
            });
        }

        // Add a renderer that draws the view's content
        void set_root(const std::shared_ptr<View>& root) {
            if (this->root_) {
                this->root_->unmount(context_.get());
            }
            this->root_ = root;
            if (root_)
            {
                root_->mount(context_.get());
            }

            // Add a renderer that draws the view's content
            renderers_.clear();
            renderers_.push_back([this]() {
                if (context_ && root_) {
                    context_->begin_render();
                    context_->clear_background(Color::rgb(30, 30, 30)); // Default background

                    auto element = root_->render(context_.get());
                    if (element) {
                        element->layout(context_.get());
                        element->paint(context_.get());
                    }

                    context_->end_render();
                }
            });

        }

        void request_close() override {
            should_close_ = true;
            if (auto platform = platform_.lock()) {
                platform->event_dispatcher().emit(events::WindowCloseEvent{window_id_});
            }
        }

        static void center_on_screen() {
            // TODO - implement

        }

        [[nodiscard]] int id() const override { return window_id_; }
        [[nodiscard]] bool should_close() const override {
            return should_close_ || (context_ && context_->should_close());
        }
        [[nodiscard]] const Rect<float>& bounds() const { return bounds_; }
        [[nodiscard]] context::WindowContext& context() const { return *context_; }
        [[nodiscard]] std::shared_ptr<plastic::View> root() const { return root_; }

        void handle_resize(const Size<float>& new_size) {
            size = new_size;
            if (root_) {
                root_->render(context_.get())->layout(context_.get());
                root_->render(context_.get())->paint(context_.get());
            }
        }

        void set_title(const std::string& title) {
            title_ = title;
        }

        void set_bounds(const Rect<float>& bounds) {
            if (bounds_ != bounds) {
                bounds_ = bounds;
                context_->request_layout();
            }
        }

        Context& context() override {
            return *context_;
        }

        [[nodiscard]] const window::WindowOptions& options() const override {
            return options_;
        }

        void update() override {


            // Update animations
            if (context_ && root_) {
                if (auto app_context = context_->app_context()) {
                    if (auto animation_manager = app_context->get_animation_manager()) {
                        animation_manager->update(context_->get_frame_time());
                    }
                }
            }

            for (auto& updater : updaters_) {
                updater();
            }
        }

        void render() override {
            for (auto& renderer : renderers_) {
                renderer();
            }
        }

        void dispatch_event(const events::Event& event) {

            // First, check if this is a window close event
            if (auto* close_event = std::get_if<events::WindowCloseEvent>(&event)) {
                if (close_event->window_id == window_id_ || close_event->window_id == 0) {
                    should_close_ = true;
                    return;  // No need to process further
                }
            }

            if (root_) {
                auto element = root_->render(context_.get());
                if (element) {
                    element->handle_event(event, context_.get());
                }
            }
        }

        // TODO - add event handling

        void set_fullscreen(bool fullscreen) {
            if (auto platform = platform_.lock()) {
                if (fullscreen) {
                    platform->event_dispatcher().emit(events::WindowFullscreenEvent(window_id_));
                } else {
                    platform->event_dispatcher().emit(events::WindowRestoreEvent(window_id_));
                }
            }
        }

        void set_size(const Size<float>& size) {
            this->size = size;
        }

        void set_decorations(bool decorations) {
            if (auto platform = platform_.lock()) {
                platform->event_dispatcher().emit(events::WindowDecorationsEvent(window_id_, decorations));
            }
        }

        void set_transparent(bool transparent) {
            if (auto platform = platform_.lock()) {
                platform->event_dispatcher().emit(events::WindowTransparentEvent(window_id_, transparent));
            }
        }

        void maximize() {
            if (auto platform = platform_.lock()) {
                platform->event_dispatcher().emit(events::WindowMaximizeEvent(window_id_));
            }
        }
    };
}
