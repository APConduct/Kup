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

export namespace plastic
{
    class WindowManager {
    private:
        std::shared_ptr<context::AppContext> app_context_{}; // Context passing pattern
        std::unordered_map<int, std::shared_ptr<WindowBase>> windows_;
        int next_window_id_{0};
        std::shared_ptr<WindowBase> focused_window_{};


    public:

        [[nodiscard]] std::shared_ptr<WindowBase> focused_window() const {
            return focused_window_;
        }

        void set_focused_window(const std::shared_ptr<WindowBase>& window) {
            focused_window_ = window;
        }
        explicit WindowManager(std::shared_ptr<context::AppContext> app_context)
            : app_context_(std::move(app_context)) {}

        std::shared_ptr<WindowBase> create_window(const WindowOptions& options = WindowOptions{}) {
            auto context = std::make_shared<context::WindowContext>(app_context_);
            auto window = WindowBuilder::create(context, next_window_id_, options);
            next_window_id_++;

            windows_.insert(std::pair{window->id(), window});
            return window;

        }

        void remove_window(int window_id) {
            windows_.erase(window_id);
        }

        std::shared_ptr<WindowBase> get_window(const int window_id) {
            const auto it = windows_.find(window_id);
            return it != windows_.end() ? it->second : nullptr;
        }

        [[nodiscard]] std::unordered_map<int, std::shared_ptr<WindowBase>> windows() const {
            return windows_;
        }

        [[nodiscard]] bool has_windows() const {
            return !windows_.empty();
        }

        [[nodiscard]] size_t window_count() const {
            return windows_.size();
        }

        void add_window(const std::shared_ptr<WindowBase>& window) {
            windows_.insert({window->id(), window});;
        }

        template<typename F>
        void for_each_window(F&& f) {
            for (auto& [id, window] : windows_) {
                f(*window);
            }
        }




    };
}
