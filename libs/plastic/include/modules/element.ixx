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
import plastic.layout_properties;
import plastic.rect;

export namespace plastic
{
    struct Element : std::enable_shared_from_this<Element>
    {
    protected:
        style::Style style;
        Size<float> current_size{0,0};
        std::weak_ptr<Element> parent;
        Rect<float> bounds;
        LayoutProperties layout_properties;

        std::vector<std::shared_ptr<Element>> children;

        Context* context{nullptr};

    public:
        virtual ~Element() = default;
        virtual void mount(Context* cx) {
            context = cx;
            for (const auto& child : children) {
                child->mount(cx);
            }
        };
        virtual void unmount(Context* cx) {
            for (const auto& child : children) {
                child->unmount(cx);
            }
            context = nullptr;
        };
        virtual void layout(Context* cx) = 0;
        virtual void paint(Context* cx) const = 0;
        // virtual void handle_event(Event& event, Context* cx) {};
         void add_child(const std::shared_ptr<Element>& child) {
            child->parent = shared_from_this();
            this->children.push_back(child);
        }

        void invalidate() const {
             if (context) {
                 context->request_layout();
             }
         }



        LayoutProperties get_layout_properties() const {
            return layout_properties;
        }

        Rect<float> get_bounds() const {
            return bounds;
        }

        void set_bounds(const Rect<float>& new_bounds) {
             if (bounds == new_bounds) return;
             bounds = new_bounds;
             invalidate();
        }

        void set_layout_properties(const LayoutProperties& properties) {
             if (layout_properties == properties) return;
             layout_properties = properties;
             invalidate();
        }

        void set_style(const style::Style& style) {
             if (this->style == style) return;
             this->style = style;
             invalidate();
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

        virtual [[nodiscard]] Size<float> get_preferred_size() const {
            return style.get_preferred_size();
        }
    };
}
