//
// Created by ajost1 on 1/30/2025.
//
module;


#include <memory>
#include <vector>
#include <functional>
#include <unordered_map>
export module plastic.app_context;
import plastic.window_base;
import plastic.event_dispatcher;

export namespace plastic::context
{
    struct AppContext {

    private:
        std::unordered_map<int, std::shared_ptr<WindowBase>> windows_;
        std::shared_ptr<WindowBase> focused_window_{};
        EventDispatcher event_dispatcher_;
        int next_window_id_{0};

    public:
        void add_window(const std::shared_ptr<WindowBase>& window) {
            windows_.insert({window->id(), window});;
        }



        void set_focused_window(const std::shared_ptr<WindowBase>& window) {
            focused_window_ = window;
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



        std::shared_ptr<WindowBase> get_window(const int id) {
            const auto it = windows_.find(id);
            return it != windows_.end() ? it->second : nullptr;
        }


        // Context passing pattern
        template<typename F>
        auto with_context(F&& f) -> decltype(f(*this)) {
            return f(*this);
        }

        template<typename F>
        auto run(F&& f) -> decltype(f(*this)) {
            return with_context(std::forward<F>(f));
        }

        [[nodiscard]] std::shared_ptr<WindowBase> focused_window() const {
            return focused_window_;
        }

        EventDispatcher& events() {
            return event_dispatcher_;
        }

        [[nodiscard]] int next_window_id() const {
            return next_window_id_;
        }

        void increment_window_id() {
            next_window_id_++;
        }

        template<typename F>
        void for_each_window(F&& f) {
            for (auto& [id, window] : windows_) {
                f(*window);
            }
        }






    };
}
