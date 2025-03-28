//
// Created by Aidan Jost on 3/28/25.
//
module;
#include <string>
#include <unordered_map>
#include <functional>
export module plastic.route;
import plastic.view;
import plastic.context;

export namespace plastic
{
    struct Route {
        std::string path;
        std::function<std::shared_ptr<View>(Context*)> view_factory;
        std::unordered_map<std::string, std::string> params;

        Route(std::string path, std::function<std::shared_ptr<View>(Context*)> factory)
            : path(std::move(path)), view_factory(std::move(factory)) {}
    };

}