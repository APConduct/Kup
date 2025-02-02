//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>

export module plastic.view_context;


import plastic.window_context;

export namespace plastic::context
{
    struct ViewContext {
    private:
        std::shared_ptr<WindowContext> app_context_;
    };
}
