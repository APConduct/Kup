//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <memory>
#include <string>
#include <vector>
#include <unordered_map>
#include <functional>
export module plastic.router;

import plastic.view;
import plastic.context;

export namespace plastic {
    struct Route {
        std::string path;
        std::function<std::shared_ptr<View>(Context*)> view_factory;
        std::unordered_map<std::string, std::string> params;

        Route(std::string path, std::function<std::shared_ptr<View>(Context*)> factory)
            : path(std::move(path)), view_factory(std::move(factory)) {}
    };

    class Router {
    private:
        std::vector<Route> routes_;
        std::string current_path_;
        std::shared_ptr<View> current_view_;
        std::vector<std::string> history_;
        Context* context_{nullptr};

    public:
        explicit Router(Context* context) : context_(context) {}

        void add_route(Route route) {
            routes_.push_back(std::move(route));
        }

        void navigate_to(const std::string& path) {
            if (path == current_path_) return;

            for (const auto& route : routes_) {
                if (matches_route(path, route)) {
                    // Store current path in history
                    if (!current_path_.empty()) {
                        history_.push_back(current_path_);
                    }

                    // Update current path
                    current_path_ = path;

                    // Create new view
                    auto route_params = extract_params(path, route);
                    Route route_with_params = route;
                    route_with_params.params = route_params;

                    auto new_view = route.view_factory(context_);

                    // Unmount current view if exists
                    if (current_view_) {
                        current_view_->unmount(context_);
                    }

                    // Set and mount new view
                    current_view_ = new_view;
                    if (current_view_) {
                        current_view_->mount(context_);
                    }

                    return;
                }
            }
        }

        void go_back() {
            if (!history_.empty()) {
                auto previous = history_.back();
                history_.pop_back();
                navigate_to(previous);
            }
        }

        std::shared_ptr<View> current_view() const {
            return current_view_;
        }

    private:
        bool matches_route(const std::string& path, const Route& route) {
            // Simple path matching - could be enhanced with regex for path parameters
            return path == route.path;
        }

        std::unordered_map<std::string, std::string> extract_params(
            const std::string& path, const Route& route) {
            // Extract parameters from path
            return {};
        }
    };
}

