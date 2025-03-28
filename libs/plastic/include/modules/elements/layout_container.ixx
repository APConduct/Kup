//
// Created by ajost1 on 2/2/2025.
//
module;
#include <memory>
#include <raylib.h>
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
        std::unique_ptr<Layout> layout_{};
    public:
        explicit LayoutContainer(std::unique_ptr<Layout> l) : Element(), layout_(std::move(l)) {
        }

        void set_layout(std::unique_ptr<Layout> l) {
            layout_ = std::move(l);
            invalidate();
        }

        void layout(Context* cx) override {
            if (layout_) {

                // First measure our size
                current_size = layout_->measure(*this);

                // Call the layout engine
                layout_->arrange(*this, bounds);

                // Layout children
                for (const auto& child : children) {
                    child->layout(cx);
                }
            }
        }

        [[nodiscard]] Size<float> get_preferred_size() const override {
            if (layout_) {
                return layout_->measure(*this);
            }
            return Element::get_preferred_size();
        }

        void paint(Context* cx) const override {
            // Paint container background if specified
            const auto& bounds = get_bounds();

            // Draw background if color is specified
            if (auto bg_color = get_style().background_color_normal) {
                DrawRectangleRec(
                    {bounds.x(), bounds.y(), bounds.width(), bounds.height()},
                    bg_color->rl()
                );
            }

            // Draw border if specified
            if (auto border_color = get_style().border) {
                DrawRectangleLinesEx(
                    {bounds.x(), bounds.y(), bounds.width(), bounds.height()},
                    1.0f,  // Border width
                    border_color->rl()
                );
            }

            // Paint all children
            for (const auto& child : get_children()) {
                child->paint(cx);
            }

        };
    };
}
