//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
export module plastic.window_context;
import plastic.view;

import plastic.app_context;
import plastic.element;


export namespace plastic::context
{
    struct WindowContext {
    private:
        std::shared_ptr<AppContext> app_context_;

    public:
        explicit WindowContext(const std::shared_ptr<AppContext>& app_context) : app_context_(app_context) {}

        [[nodiscard]] AppContext& app_context() const {
            return *app_context_;
        }

        void request_layout(){}
        template <typename T>
        void focus(View* view){}
        void focus(Element* view){}


    };
}
