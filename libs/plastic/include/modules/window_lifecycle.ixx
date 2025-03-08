//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <raylib.h>
#include <memory>

export module plastic.window_lifecycle;
import plastic.window;
import plastic.context;
import plastic.events;
import plastic.rect;

export namespace plastic {
    enum class WindowState {
        Normal,
        Minimized,
        Maximized,
        Fullscreen,
        Hidden
    };

    class WindowLifecycle : public std::enable_shared_from_this<WindowLifecycle> {
    private:
        std::shared_ptr<Window> window_;
        WindowState current_state_ = WindowState::Normal;
        bool is_active_ = false;
        bool was_closed_ = false;

        // Store previous window state and bounds for restoring from fullscreen
        WindowState previous_state_ = WindowState::Normal;
        Rect<float> previous_bounds_;

    public:
        explicit WindowLifecycle(std::shared_ptr<Window> window)
            : window_(std::move(window)), previous_bounds_(window_->bounds()) {}

        void set_state(WindowState state) {
            if (state == current_state_) return;

            // Store previous state for restoration
            if (state == WindowState::Fullscreen || state == WindowState::Maximized) {
                if (current_state_ != WindowState::Fullscreen &&
                    current_state_ != WindowState::Maximized) {
                    previous_state_ = current_state_;
                    previous_bounds_ = window_->bounds();
                }
            }

            WindowState old_state = current_state_;
            current_state_ = state;

            // Apply the state to the window
            apply_state_change(old_state, state);

            // Emit state change event
            if (auto context = window_->get_context()) {
                events::WindowStateEvent event{
                    window_->id(),
                    static_cast<int>(old_state),
                    static_cast<int>(state),
                    GetTime()
                };
                context->dispatch_event(event);
            }
        }

        WindowState get_state() const {
            return current_state_;
        }



        void restore() {
            set_state(previous_state_);
            if (window_) {
                window_->set_bounds(previous_bounds_);
            }
        }

        void maximize() {
            set_state(WindowState::Maximized);
        }

        void minimize() {
            set_state(WindowState::Minimized);
        }

        void enter_fullscreen() {
            set_state(WindowState::Fullscreen);
        }

        void exit_fullscreen() {
            restore();
        }

        void show() {
            if (current_state_ == WindowState::Hidden) {
                set_state(previous_state_ != WindowState::Hidden ? previous_state_ : WindowState::Normal);
            }
        }

        void hide() {
            set_state(WindowState::Hidden);
        }

        void set_active(bool active) {
            if (is_active_ == active) return;

            is_active_ = active;

            // Emit focus event
            if (auto context = window_->get_context()) {
                events::FocusEvent event{active, GetTime()};
                context->dispatch_event(event);
            }
        }

        void activate() {
            set_active(true);
        }

        bool is_active() const {
            return is_active_;
        }

        void close() {
            if (was_closed_) return;

            was_closed_ = true;
            window_->request_close();
        }

    private:
        void apply_state_change(WindowState old_state, WindowState new_state) {
            // Implementation would depend on your platform-specific window handling
            // Here I'll provide a pseudo-implementation

            switch (new_state) {
                case WindowState::Normal:
                    // Restore window to normal state
                    ClearWindowState(FLAG_WINDOW_MINIMIZED);
                    ClearWindowState(FLAG_WINDOW_MAXIMIZED);
                    ClearWindowState(FLAG_FULLSCREEN_MODE);
                    ClearWindowState(FLAG_WINDOW_HIDDEN);
                    break;

                case WindowState::Minimized:
                    // Minimize window
                        SetWindowState(FLAG_WINDOW_MINIMIZED);
                    break;

                case WindowState::Maximized:
                    // Maximize window
                        SetWindowState(FLAG_WINDOW_MAXIMIZED);
                    break;

                case WindowState::Fullscreen:
                    // Enter fullscreen mode
                        SetWindowState(FLAG_FULLSCREEN_MODE);
                    break;

                case WindowState::Hidden:
                    // Hide window
                        SetWindowState(FLAG_WINDOW_HIDDEN);
                    break;
            }
        }
    };
}

