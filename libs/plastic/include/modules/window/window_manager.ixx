//
// Created by Aidan Jost on 2/15/25.
//
module;
#include <memory>
#include <unordered_map>
#include <any>
export module plastic.window_manager;

import plastic.window_base;
import plastic.window_options;
import plastic.window_builder;
import plastic.window_context;
import plastic.app_context;
import plastic.raylib_platform;
import plastic.window_manager_interface;
import plastic.window;
import plastic.window_options;

export namespace plastic
{
    class WindowManager : public WindowManagerInterface {
    private:
        std::shared_ptr<context::AppContext> app_context_{}; // Context passing pattern
        std::unordered_map<int, std::shared_ptr<WindowBase>> windows_;
        int next_window_id_{0};
        std::shared_ptr<WindowBase> focused_window_{};
        std::weak_ptr<WindowBase> modal_window_;



    public:

        WindowManager() = default;

        [[nodiscard]] std::shared_ptr<WindowBase> focused_window() const {
            return focused_window_;
        }

        void set_focused_window(const std::shared_ptr<WindowBase>& window) {
            focused_window_ = window;
        }
        explicit WindowManager(std::shared_ptr<context::AppContext> app_context)
            : app_context_(std::move(app_context)) {}

        std::shared_ptr<WindowBase> create_window(const window::WindowOptions& options = window::WindowOptions{}) {
            auto context = std::make_shared<RaylibWindowContext>(next_window_id_, app_context_);
            auto window = WindowBuilder::create(context, next_window_id_, options);
            next_window_id_++;

            windows_.insert(std::pair{window->id(), window});
            return window;

        }

        void remove_window(int window_id) override {
            windows_.erase(window_id);
        }

        std::shared_ptr<WindowBase> get_window(const int window_id) {
            const auto it = windows_.find(window_id);
            return it != windows_.end() ? it->second : nullptr;
        }

        [[nodiscard]] std::unordered_map<int, std::shared_ptr<WindowBase>> windows() const {
            return windows_;
        }

        [[nodiscard]] bool has_windows() const override {
            return !windows_.empty();
        }

        [[nodiscard]] size_t window_count() const {
            return windows_.size();
        }

        void add_window(const std::shared_ptr<WindowBase>& window) override {
            windows_.insert({window->id(), window});;
        }

        template<typename F>
        void for_each_window(F&& f) {
            for (auto& [id, window] : windows_) {
                f(*window);
            }
        }

        [[nodiscard]] int next_window_id() const {
            return next_window_id_;
        }

        void increment_window_id() {
            next_window_id_++;
        }



        std::shared_ptr<WindowBase> create_modal_window(const window::WindowOptions& options) {
            auto window = create_window(options);
            modal_window_ = window;

            // Disable input for other windows
            for (auto& [_, other_window] : windows_) {
                if (other_window != window) {
                    other_window->set_input_enabled(false);
                }
            }

            return window;
        }



        void handle_window_close(int window_id) {
            auto it = windows_.find(window_id);
            if (it != windows_.end()) {
                // If closing modal window, re-enable input for other windows
                if (auto modal = modal_window_.lock()) {
                    if (modal == it->second) {
                        for (auto& [_, window] : windows_) {
                            window->set_input_enabled(true);
                        }
                        modal_window_.reset();
                    }
                }

                windows_.erase(it);
            }
        }

        void focus_window(std::shared_ptr<Window> window) {
            if (focused_window_) {
                focused_window_->set_focused(false);
            }
            focused_window_ = window;
            window->set_focused(true);
        }

    };
}
