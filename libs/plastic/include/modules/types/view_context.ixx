//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>

export module plastic.view_context;


import plastic.window_context;
import plastic.context;
import plastic.view;

export namespace plastic::context
{
    struct ViewContext : public Context {
    private:
        std::shared_ptr<WindowContext> app_context_;

    public:
        virtual void mount_view(std::shared_ptr<View> view) = 0;
        virtual void unmount_view(std::shared_ptr<View> view) = 0;
    };
}
