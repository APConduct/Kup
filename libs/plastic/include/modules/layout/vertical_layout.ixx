//
// Created by ajost1 on 2/2/2025.
//

module;
#include <algorithm>
#include <vector>
#include <iostream>
export module plastic.vertical_layout;
import plastic.layout;
import plastic.layout_properties;
import plastic.element;
import plastic.rect;
import plastic.size;
export namespace plastic
{
    struct VerticalLayout : public Layout {
        void arrange(Element& element, const Rect<float>& bounds) override {
            std::cout << "VerticalLayout arranging within bounds: "
              << bounds.width() << "x" << bounds.height() << "\n";
            const auto& children = element.get_children();
            if (children.empty()) return;

            const auto& props = element.get_layout_properties();
            float y = bounds.y() + props.padding.top;
            float content_width = bounds.width() - (props.padding.left + props.padding.right);

            // Distribute elements vertically
            for (size_t i = 0; i < children.size(); ++i) {
                auto& child = children[i];
                auto child_size = child->get_preferred_size();

                // Position child
                child->set_bounds(Rect<float>{
                    bounds.x() + props.padding.left,
                    y,
                    content_width,
                    child_size.height()
                });

                y += child_size.height();
                if (i < children.size() - 1) {
                    y += props.spacing;
                }
            }
        }

    Size<float> measure(const Element& element) override {
        const auto& children = element.get_children();
        if (children.empty()) return Size<float>{0, 0};

        float total_height = 0;
        float max_width = 0;
        const float spacing = element.get_layout_properties().spacing;

        for (size_t i = 0; i < children.size(); ++i) {
            const auto& child = children[i];
            const auto& params = child->get_layout_properties();
            auto size = child->get_preferred_size();

            total_height += size.height() + params.get_total_vertical_space();
            max_width = std::max(max_width,
                size.width() + params.get_total_horizontal_space());

            // add spacing between elements (except for the last one)
            if (i < children.size() - 1) {
                total_height += spacing;
            }
        }

        return Size<float>{max_width, total_height};
    }
    };

}
