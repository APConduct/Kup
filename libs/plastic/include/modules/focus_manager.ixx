//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <memory>
#include <vector>
#include <raylib.h>
export module plastic.focus_manager;

import plastic.element;
import plastic.events;
import plastic.context;
import plastic.point;
import plastic.scrollable;

export namespace plastic
{

    void find_event_path(const std::shared_ptr<Element>& element,
                    const events::Event& event,
                    std::vector<std::shared_ptr<Element>>& path) {
        path.push_back(element);

        // For mouse events, check if children contain the point
        if (auto* mouse_event = std::get_if<events::MouseButtonEvent>(&event)) {
            Point<float> point{mouse_event->position.width(), mouse_event->position.height()};

            // Check children in reverse (front to back) order
            for (auto it = element->get_children().rbegin(); it != element->get_children().rend(); ++it) {
                if ((*it)->get_bounds().contains(point)) {
                    find_event_path(*it, event, path);
                    break;
                }
            }
        }
    }

    // Helper to find the focused child of an element
    std::shared_ptr<Element> find_focused_child(const std::shared_ptr<Element>& parent) {
        // In a real implementation, you would maintain a focus state
        // or query the focus manager directly

        // TODO : implement focus state management

        return nullptr;
    }

    class FocusManager {
    private:
        std::weak_ptr<Element> focused_element_;
        std::vector<std::weak_ptr<Element>> focus_history_;
        std::weak_ptr<Element> root_element_;

    public:
        void set_focus(const std::shared_ptr<Element>& element) {
            auto old_focus = focused_element_.lock();

            // Don't do anything if focus isn't changing
            if (old_focus == element) return;

            // Remove focus from previous element
            if (old_focus) {
                // Trigger blur event
                events::FocusEvent blur_event{false, events::get_current_timestamp()};
                old_focus->handle_event(blur_event, nullptr);
            }

            // Set new focus
            focused_element_ = element;

            // Add to focus history
            if (element) {
                focus_history_.push_back(element);
                if (focus_history_.size() > 10) {
                    focus_history_.erase(focus_history_.begin());
                }

                // Trigger focus event
                events::FocusEvent focus_event{true, get_current_timestamp()};
                element->handle_event(focus_event, nullptr);
            }
        }

        void clear_focus() {
            set_focus(nullptr);
        }

        [[nodiscard]] std::shared_ptr<Element> get_focused_element() const {
            return focused_element_.lock();
        }

        bool handle_tab_navigation(const events::KeyPressEvent& event, Context* cx) {
            if (event.key == KeyboardKey::KEY_TAB && event.pressed) {
                // Navigate to next focusable element
                if (bool shift = event.shift.value_or(false)) {
                    focus_previous();
                } else {
                    focus_next();
                }
                return true;
            }
            return false;
        }

    private:
        void focus_next() {
            auto root = root_element_.lock();
            if (!root) return;

            // Find all focusable elements in order
            std::vector<std::shared_ptr<Element>> focusable_elements;
            collect_focusable_elements(root, focusable_elements);

            if (focusable_elements.empty()) return;

            // Find current focus in list
            auto current_focus = focused_element_.lock();
            size_t current_index = 0;

            if (current_focus) {
                for (size_t i = 0; i < focusable_elements.size(); ++i) {
                    if (focusable_elements[i] == current_focus) {
                        current_index = i;
                        break;
                    }
                }

                // Move to next focusable element
                current_index = (current_index + 1) % focusable_elements.size();
            }

            // Set focus to next element
            set_focus(focusable_elements[current_index]);
        }

        void focus_previous() {
            auto root = root_element_.lock();
            if (!root) return;

            // Find all focusable elements in order
            std::vector<std::shared_ptr<Element>> focusable_elements;
            collect_focusable_elements(root, focusable_elements);

            if (focusable_elements.empty()) return;

            // Find current focus in list
            auto current_focus = focused_element_.lock();
            size_t current_index = 0;

            if (current_focus) {
                for (size_t i = 0; i < focusable_elements.size(); ++i) {
                    if (focusable_elements[i] == current_focus) {
                        current_index = i;
                        break;
                    }
                }

                // Move to previous focusable element
                if (current_index == 0) {
                    current_index = focusable_elements.size() - 1;
                } else {
                    current_index--;
                }
            }

            // Set focus to previous element
            set_focus(focusable_elements[current_index]);
        }

        // Find all focusable elements in the hierarchy
        std::vector<std::shared_ptr<Element>> find_focusable_elements(const std::shared_ptr<Element>& root) {
            std::vector<std::shared_ptr<Element>> result;
            collect_focusable_elements(root, result);
            return result;
        }

        void collect_focusable_elements(const std::shared_ptr<Element>& element,
                                      std::vector<std::shared_ptr<Element>>& result) {
            // TODO: implement focusable element collection
        }

        static void scroll_to_element(const std::shared_ptr<Element>& container,
                              const std::shared_ptr<Element>& element) {
            // In a real implementation, you would call the container's
            // scroll methods to bring the element into view

            // For example:
            if (auto* scrollable = dynamic_cast<Scrollable*>(container.get())) {
                scrollable->scroll_to_element(element);
            }
        }
    };

    bool propagate_event(const std::shared_ptr<Element>& root,
                    const events::Event& event,
                    Context* cx) {
        std::vector<std::shared_ptr<Element>> path;

        // Find the path from root to target
        find_event_path(root, event, path);

        // Capturing phase (root to target)
        for (const auto & i : path) {
            if (i->handle_capture_event(event, cx)) {
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
}