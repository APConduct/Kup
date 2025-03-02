//
// Created by ajost1 on 2/2/2025.
//
module;
#include <any>

export module plastic.event_visitor;
import plastic.events;

export namespace plastic
{
    struct EventVisitor {
        // Visitor pattern for event handling
        template <typename T>
        bool operator()(const T& event) {
            return false; // Default case, no event handled
        }

        // Specialization for specific event types
        bool operator()(const plastic::events::MouseButtonEvent event) {
            // Handle mouse button event
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::MouseMoveEvent event) {
            // Handle key event
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::KeyPressEvent event) {
            // Handle key event
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::KeyReleaseEvent event) {
            // Handle key event
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::WindowCloseEvent event) {
            // Handle window close event
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::MouseScrollEvent event) {
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::MouseDragEvent event) {
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::TextInputEvent event) {
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::WindowResizeEvent event) {
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::ResizeEvent event) {
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::FocusEvent event) {
            return true; // Return true if event handled
        }

        bool operator()(const plastic::events::CustomEvent<std::any> event) {
            return true; // Return true if event handled
        }
    };
}
