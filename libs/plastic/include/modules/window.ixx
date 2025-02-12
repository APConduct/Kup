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
import plastic.context;
import plastic.size;
import plastic.view;

export namespace plastic
{
    struct Window {
        std::vector<std::function<void()>> renderers_;
        std::vector<std::function<void()>> updaters_;

    private:
        std::shared_ptr<View> root;
        std::shared_ptr<Context> context;
        Size<float> size{0,0};

        std::string title_;

        // concurrency
        // std::thread thread_;
        // std::atomic<bool> running_;
        // std::mutex render_mutex_;




    public:

        explicit Window(std::shared_ptr<Context> context) : context(std::move(context)) {}

        [[nodiscard]] std::shared_ptr<Context> get_context() const {
            return context;
        }

        [[nodiscard]] const Size<float>& get_size() const {
            return size;
        }

        [[nodiscard]] const std::string& get_title() const {
            return title_;
        }

        explicit Window(const std::shared_ptr<View>& root) : root(root) {}
        explicit Window(const std::shared_ptr<Context>& context, const std::shared_ptr<View>& root) : root(root), context(context) {}
        explicit Window(const std::shared_ptr<Context>& context, const std::shared_ptr<View>& root, const Size<float> size) : root(root), context(context), size(size) {}
        explicit Window( const Size<float>& size) : size(size){}

        void set_root(const std::shared_ptr<View>& root) {
            if (this->root) {
                this->root->render(context.get())->unmount(context.get());
            }
            this->root = root;
            if (root)
            {
                root->render(context.get())->mount(context.get());
            }
        }

        void handle_resize(const Size<float>& new_size) {
            size = new_size;
            if (root) {
                root->render(context.get())->layout(context.get());
                root->render(context.get())->paint(context.get());
            }
        }

        void set_title(const std::string& title) {
            title_ = title;
        }

        // TODO - add event handling
    };
}
