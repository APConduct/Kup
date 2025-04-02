module;
#include <vector>
#include <iostream>
export module plastic.horizontal_layout;

import plastic.layout;
import plastic.layout_properties;
import plastic.element;
import plastic.rect;
import plastic.size;

export namespace plastic
{
    struct HorizontalLayout : public Layout {
    public:
        void arrange(Element& element, const Rect<float>& bounds) override {

            std::cout << "HorizontalLayout arranging within bounds: "
                << bounds.width() << "x" << bounds.height() << "\n";



            const auto& children = element.get_children();
            if (children.empty()) return;

            const auto& props = element.get_layout_properties();
            float x = bounds.x() + props.padding.left;
            float content_height = bounds.height() - (props.padding.top + props.padding.bottom);

            // Distribute elements horizontally
            for (size_t i = 0; i < children.size(); ++i) {
                auto& child = children[i];
                auto child_size = child->get_preferred_size();

                // Position child
                child->set_bounds(Rect<float>{
                    x,
                    bounds.y() + props.padding.top,
                    child_size.width(),
                    content_height
                });

                x += child_size.width();
                if (i < children.size() - 1) {
                    x += props.spacing;
                }
            }
        }

        Size<float> measure(const Element& element) override {
            const auto& children = element.get_children();
            if (children.empty()) return Size<float>{0, 0};

            float total_width = 0;
            float max_height = 0;
            const float spacing = element.get_layout_properties().spacing;

            for (size_t i = 0; i < children.size(); ++i) {
                const auto& child = children[i];
                const auto& params = child->get_layout_properties();
                auto size = child->get_preferred_size();

                total_width += size.width() + params.get_total_horizontal_space();
                max_height = std::max(max_height,
                    size.height() + params.get_total_vertical_space());

                if (i<children.size()-1) {
                    total_width += spacing;
                }
            }
            return Size<float>{total_width, max_height};
        }


    };
}
