//
// Created by ajost1 on 2/2/2025.
//
module;
#include <memory>
export module plastic.layout_container;

import plastic.layout;
import plastic.layout_properties;
import plastic.element;
import plastic.rect;
import plastic.size;
import plastic.style;
import plastic.point;
import plastic.context;

export namespace plastic
{
    struct LayoutContainer : public Element {
    protected:
        std::unique_ptr<Layout> layout_;
    public:
        explicit LayoutContainer(std::unique_ptr<Layout> l) : layout_(std::move(l)) {}

        void set_layout(std::unique_ptr<Layout> l) {
            layout_ = std::move(l);
            invalidate();
        }

        void layout(Context* cx) override {
            if (layout_) {
                layout_->arrange(*this, get_bounds());
            }
        }

        [[nodiscard]] Size<float> get_preferred_size() const override {
            if (layout_) {
                return layout_->measure(*this);
            }
            return Element::get_preferred_size();
        }
    };
}
