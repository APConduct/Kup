//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>

export module plastic.window;
import plastic.element;
import plastic.context;
import plastic.size;

export namespace plastic
{
    struct Window {
    private:
        std::shared_ptr<Element> root;
        std::shared_ptr<Context> context;
        Size<float> size{0,0};

        // thread_local static std::shared_ptr<Window> current_window;

    public:
        void set_root(const std::shared_ptr<Element>& root) {
            if (this->root) {
                this->root->unmount(context.get());
            }
            this->root = root;
            root->mount(context.get());
        }

        void handle_resize(const Size<float>& new_size) {
            size = new_size;
            if (root) {
                root->layout(context.get());
                root->paint(context.get());
            }
        }

        // TODO - add event handling
    };
}
