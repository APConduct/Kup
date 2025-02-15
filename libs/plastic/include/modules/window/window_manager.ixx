//
// Created by Aidan Jost on 2/15/25.
//
module;
#include <memory>
#include <unordered_map>
#include <any>
#include <memory>
#include <memory>
#include <memory>
#include <memory>
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

    public:
        explicit WindowManager(std::shared_ptr<context::AppContext> app_context)
            : app_context_(std::move(app_context)) {}

        std::shared_ptr<WindowBase> create_window(const WindowOptions& options = WindowOptions{}) {
            auto context = std::make_shared<context::WindowContext>(app_context_);
            auto window = WindowBuilder::create(context, next_window_id_, options);
            next_window_id_++;

            windows_.insert(std::pair<int, decltype(window)>{window->id(), window});
            return window;

        }

    };
}
