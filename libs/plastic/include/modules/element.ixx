//
// Created by ajost1 on 1/29/2025.
//
module;

#include <memory>
#include <vector>

export module plastic.element;

import plastic.style;
import plastic.context;
import plastic.size;


export namespace plastic
{
    struct Element : std::enable_shared_from_this<Element>
    {
    protected:
        style::Style style;
        Size<float> current_size{0,0};
        std::weak_ptr<Element> parent;

        std::vector<std::shared_ptr<Element>> children;

    public:
        virtual ~Element() = default;
        virtual void mount(Context* cx) {};
        virtual void unmount(Context* cx) {};
        virtual void layout(Context* cx) const = 0;
        virtual void paint(Context* cx) const = 0;
        // virtual void handle_event(Event& event, Context* cx) {};
         void add_child(const std::shared_ptr<Element>& child) {
            child->parent = shared_from_this();
            this->children.push_back(child);
        }

        void set_style(const style::Style& style) {
            this->style = style;
        }

        [[nodiscard]] const style::Style& get_style() const {
            return style;
        }

        [[nodiscard]] const std::vector<std::shared_ptr<Element>>& get_children() const {
            return children;
        }

        [[nodiscard]] const Size<float>& get_current_size() const {
            return current_size;
        }
    };
}
