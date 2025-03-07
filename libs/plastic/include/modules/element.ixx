//
// Created by ajost1 on 1/29/2025.
//
module;

#include <memory>
#include <ranges>
#include <vector>

export module plastic.element;

import plastic.style;
import plastic.context;
import plastic.size;
import plastic.layout_properties;
import plastic.rect;
import plastic.events;
import plastic.point;
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

        [[nodiscard]] virtual Size<float> get_preferred_size() const {
            return style.get_preferred_size();
        }

        // Add to Element class in element.ixx
        virtual bool handle_event(const events::Event& event, Context* cx) {
             // Check if event is within bounds for mouse events
             if (auto* mouse_event = std::get_if<events::MouseButtonEvent>(&event)) {
                 if (!bounds.contains(plastic::Point{mouse_event->position.width(), mouse_event->position.height()})) {
                     return false; // Not in bounds
                 }
             }

             // Process children in reverse order (front to back)
             for (auto & it : std::ranges::reverse_view(children)) {
                 if (it->handle_event(event, cx)) {
                     return true; // Event was handled by a child
                 }
             }

             // Default implementations for common events
             return process_event(event, cx);
         }

        // Protected method for specific element implementations to override
        virtual bool process_event(const events::Event& event, Context* cx) {
             return false; // Not handled by default
         }

        void rm(const std::shared_ptr<Element>& child) {
             // Find and remove the child
             std::erase_if(children,
                           [&child](const std::shared_ptr<Element>& e) {
                               return e == child;
                           });

             // Notify the element it's been detached if needed
             if (context) {
                 child->unmount(context);
             }

             // Invalidate layout
             invalidate();
         }

        void add(const std::shared_ptr<Element>& child) {
             child->parent = shared_from_this();
             children.push_back(child);

             // If we're already mounted, mount the child too
             if (context) {
                 child->mount(context);
             }

             invalidate();
         }

        void remove_child(const std::shared_ptr<Element>& child) {
             auto it = std::ranges::find(children, child);
             if (it != children.end()) {
                 // If mounted, unmount first
                 if (context) {
                     (*it)->unmount(context);
                 }

                 // Break parent relationship
                 (*it)->parent.reset();

                 // Remove from children vector
                 children.erase(it);

                 invalidate();
             }
         }

        void clear_children() {
             // Unmount all children if mounted
             if (context) {
                 for (auto& child : children) {
                     child->unmount(context);
                     child->parent.reset();
                 }
             }

             children.clear();
             invalidate();
         }

        bool is_visible(const Rect<float>& viewport) const {
             return bounds.intersects(viewport);
         }

    };
}
