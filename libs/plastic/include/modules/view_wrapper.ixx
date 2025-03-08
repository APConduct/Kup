//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <memory>
export module plastic.view_wrapper;

import plastic.view;
import plastic.element;
import plastic.context;
import plastic.elements.containers;

export namespace plastic
{
    class ViewWrapper : public View {
    private:
        std::shared_ptr<View> inner_view_;

    public:
        explicit ViewWrapper(std::shared_ptr<View> view = nullptr) : inner_view_(std::move(view)) {}

        std::shared_ptr<Element> render(Context* cx) const override {
            if (inner_view_) {
                return inner_view_->render(cx);
            }
            return std::make_shared<FlexBox>(); // Return empty container if no view
        }
    };
}
