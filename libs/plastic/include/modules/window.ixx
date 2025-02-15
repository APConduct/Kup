//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <string>
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


export namespace plastic
{
    struct Window {
        std::vector<std::function<void()>> renderers_;
        std::vector<std::function<void()>> updaters_;

    private:
        std::shared_ptr<View> root_{};
        std::shared_ptr<plastic::context::WindowContext> context_{};
        Size<float> size{0,0};

        std::string title_;

        int window_id_{};
        std::weak_ptr<Platform> platform_{};
        bool should_close_{false};
        Rect<float> bounds_{};


        // concurrency
        // std::thread thread_;
        // std::atomic<bool> running_;
        // std::mutex render_mutex_;




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
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const Size<float>& size, const std::string& title) : context_(context), size(size), title_(title) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const std::shared_ptr<View>& root, const Size<float>& size) : root_(root), context_(context), size(size) {}
        explicit Window(const std::shared_ptr<context::WindowContext>& context, const std::shared_ptr<View>& root, const Size<float>& size, const std::string& title) : root_(root), context_(context), size(size), title_(title) {}
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

        void set_root(const std::shared_ptr<View>& root) {
            if (this->root_) {
                this->root_->unmount(context_.get());
            }
            this->root_ = std::move(root);
            if (root_)
            {
                root_->mount(context_.get());
            }
        }

        void request_close() {
            should_close_ = true;
            if (auto platform = platform_.lock()) {
                platform->event_dispatcher().emit(events::WindowCloseEvent{window_id_});
            }
        }

        void center_on_screen() {
            // TODO - implement

        }

        int id() const { return window_id_; }
        bool should_close() const { return should_close_; }
        const Rect<float>& bounds() const { return bounds_; }
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

        // TODO - add event handling
    };
}
