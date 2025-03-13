//
// Created by ajost1 on 1/29/2025.
//
module;

#include <memory>
#include <ranges>
#include <vector>
#include <any>
#if defined(_WIN32)
#include <unordered_map>
#include <variant>
#endif
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
        std::unordered_map<std::string, std::any> properties_;


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

        [[nodiscard]] style::Style get_style() const {
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

        // Capture phase event handling (parent to child)
        virtual bool handle_capture_event(const events::Event& event, Context* cx) {
             // Default implementation - elements may override this for custom capture behavior
             return false;
         }

        // Bubble phase event handling (child to parent)
        virtual bool handle_bubble_event(const events::Event& event, Context* cx) {
             // Default implementation - elements may override this for custom bubble behavior
             return false;
         }

        bool propagate_event(const events::Event& event, Context* cx) {
             std::vector<std::shared_ptr<Element>> path;

             // Find the path from root to target element that contains the point
             if (auto* mouse_event = std::get_if<events::MouseButtonEvent>(&event)) {
                 Point<float> point{mouse_event->position.width(), mouse_event->position.height()};
                 find_event_path(shared_from_this(), point, path);
             } else {
                 // For non-mouse events, just use this element
                 path.push_back(shared_from_this());
             }

             // Capturing phase (root to target)
             for (size_t i = 0; i < path.size(); ++i) {
                 if (path[i]->handle_capture_event(event, cx)) {
                     return true;
                 }
             }

             // Target phase
             if (!path.empty() && path.back()->handle_event(event, cx)) {
                 return true;
             }

             // Bubbling phase (target to root)
             for (size_t i = path.size(); i-- > 0;) {
                 if (path[i]->handle_bubble_event(event, cx)) {
                     return true;
                 }
             }

             return false;
         }

            static void find_event_path(
                const std::shared_ptr<Element>& element,
                const Point<float>& point,
                std::vector<std::shared_ptr<Element>>& path
            ) {
                // Add this element to the path
                path.push_back(element);

                // If point is outside bounds, don't check children
                if (!element->get_bounds().contains(point)) {
                    return;
                }

                // Check children in reverse (front to back) order
                const auto& children = element->get_children();
                for (auto it = children.rbegin(); it != children.rend(); ++it) {
                    if ((*it)->get_bounds().contains(point)) {
                        find_event_path(*it, point, path);
                        break;
                    }
                }
            }
        void set_property(const std::string& key, std::any value) {
             properties_[key] = std::move(value);
         }

        std::any get_property(const std::string& key) const {
             auto it = properties_.find(key);
             if (it != properties_.end()) {
                 return it->second;
             }
             return {};
         }

        bool has_property(const std::string& key) const {
             return properties_.find(key) != properties_.end();
         }

        const std::unordered_map<std::string, std::any>* get_properties() const {
             return &properties_;
         }

        // Helper for focusability
        void set_focusable(bool focusable) {
             set_property("focusable", focusable);
         }

        bool is_focusable() const {
             if (has_property("focusable")) {
                 try {
                     return std::any_cast<bool>(get_property("focusable"));
                 } catch (const std::bad_any_cast&) {
                     return false;
                 }
             }
             return false;
         }

        void set_focused(bool focused) {
             set_property("focused", focused);
             invalidate(); // Redraw the component when focus changes

             // Notify parent of focus change
             if (auto parent_ptr = parent.lock()) {
                 // This could trigger focus tracking in parent containers
                 parent_ptr->child_focus_changed(shared_from_this(), focused);
             }
         }

        bool is_focused() const {
             if (has_property("focused")) {
                 try {
                     return std::any_cast<bool>(get_property("focused"));
                 } catch (const std::bad_any_cast&) {
                     return false;
                 }
             }
             return false;
         }

        // Method for parent containers to handle when a child's focus changes
        virtual void child_focus_changed(const std::shared_ptr<Element>& child, bool focused) {
             // Default implementation does nothing
             // Container elements may override this to update their state or appearance
         }



    };
}
