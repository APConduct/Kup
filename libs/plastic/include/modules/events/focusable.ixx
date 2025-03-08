//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <memory>
#include <vector>
#include <raylib.h>
export module plastic.focusable;

import plastic.events;
import plastic.context;
import plastic.element;
import plastic.color;
import plastic.scrollable_base;

export namespace plastic {


    class Focusable {
    public:
        virtual ~Focusable() = default;

        // Core focus methods
        virtual void focus() = 0;
        virtual void blur() = 0;
        [[nodiscard]] virtual bool is_focused() const = 0;

        // Whether the element can currently receive focus
        [[nodiscard]] virtual bool can_focus() const = 0;

        // Override to change the visual appearance when focused
        virtual void on_focus_changed() = 0;

        // Handle focus-specific events like keyboard navigation
        virtual bool handle_focus_event(const events::Event& event, Context* cx) = 0;

        // Optional: Tab index for determining focus order
        [[nodiscard]] virtual int tab_index() const { return 0; }

        // Optional: Scroll element into view when focused
        virtual void ensure_visible() {}
    };

    // Mixin implementation for easy addition to elements
    template<typename BaseElement>
    class FocusableMixin : public BaseElement, public Focusable {
    private:
        bool focused_{false};
        bool focusable_{true};
        int tab_index_{0};

    public:
        template<typename... Args>
        explicit FocusableMixin(Args&&... args) : BaseElement(std::forward<Args>(args)...) {}

        // Implement Focusable interface
        void focus() override {
            if (!focusable_ || focused_) return;

            focused_ = true;
            on_focus_changed();

            // Dispatch focus event
            events::FocusEvent event{true, get_current_timestamp()};
            this->handle_event(event, nullptr);
        }

        void blur() override {
            if (!focused_) return;

            focused_ = false;
            on_focus_changed();

            // Dispatch blur event
            events::FocusEvent event{false, get_current_timestamp()};
            this->handle_event(event, nullptr);
        }

        [[nodiscard]] bool is_focused() const override {
            return focused_;
        }

        [[nodiscard]] bool can_focus() const override {
            return focusable_ && this->is_visible() && this->is_enabled();
        }

        void on_focus_changed() override {
            this->invalidate();
        }

        bool handle_focus_event(const events::Event& event, Context* cx) override {
            if (auto* key_event = std::get_if<events::KeyPressEvent>(&event)) {
                if (focused_ && key_event->pressed) {
                    // Handle keyboard events when focused
                    return handle_keyboard_event(*key_event, cx);
                }
            }
            return false;
        }

        [[nodiscard]] int tab_index() const override {
            return tab_index_;
        }

        void ensure_visible() override {
            // Find scrollable parent and ensure this element is visible
            auto current = this->shared_from_this();

            while (auto parent = current->parent.lock()) {
                // Check if parent is scrollable
                if (auto scrollable = std::dynamic_pointer_cast<ScrollableBase>(parent)) {
                    scrollable->scroll_to_element(this->shared_from_this());
                    break;
                }
                current = parent;
            }
        }

        // Handle keyboard navigation
        virtual bool handle_keyboard_event(const events::KeyPressEvent& event, Context* cx) {
            // Default implementation handles basic keyboard navigation
            switch (event.key) {
                case KeyboardKey::KEY_ESCAPE:
                    blur();
                    return true;
                default:
                    break;
            }
            return false;
        }

        // Additional methods for controlling focusability
        void set_focusable(bool focusable) {
            if (focusable_ == focusable) return;

            focusable_ = focusable;
            if (!focusable_ && focused_) {
                blur();
            }
        }

        void set_tab_index(int index) {
            tab_index_ = index;
        }

        // Override BaseElement's event handling to include focus events
        bool process_event(const events::Event& event, Context* cx) override {
            // Handle focus-specific events first
            if (handle_focus_event(event, cx)) {
                return true;
            }

            // Then delegate to the base class
            return BaseElement::process_event(event, cx);
        }

        // Override paint to include focus indicator
        void paint(Context* cx) const override {
            // Call base class paint first
            BaseElement::paint(cx);

            // Draw focus indicator if focused
            if (focused_) {
                draw_focus_indicator(cx);
            }
        }

    protected:
        // Draw focus indicator - can be overridden by derived classes
        virtual void draw_focus_indicator(Context* cx) const {
            // Default implementation: draw a focus ring
            auto bounds = this->get_bounds();
            float thickness = 2.0f;

            DrawRectangleLinesEx(
                {bounds.x() - thickness/2, bounds.y() - thickness/2,
                 bounds.width() + thickness, bounds.height() + thickness},
                thickness,
                Color::rgb(66, 133, 244).rl()  // Blue focus ring
            );
        }
    };

    // Example of a base class for scrollable elements
}
