//
// Created by ajost1 on 2/2/2025.
//

module;
#include <algorithm>
#include <vector>
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
            const auto& children = element.get_children();
            if (children.empty()) return;

            // First pass: measure children and calculate total flex
            float total_flex = 0;
            float total_fixed_height = 0;
            std::vector<Size<float>> sizes;
            sizes.reserve(children.size());

            for (const auto& child : children) {
                const auto& params = child->get_layout_properties();
                auto size = measure(*child);

                if (params.flex_grow > 0) {
                    total_flex += params.flex_grow;
                } else {
                    total_fixed_height += size.height() + params.get_total_vertical_space();
                }
                sizes.push_back(size);
            }

            float total_spacing = 0;
            if (!children.empty()) {
                total_spacing = element.get_layout_properties().spacing * (static_cast<float>(children.size()) - 1);
            }
            float remaining_height = bounds.height() - total_fixed_height - total_spacing;


        // Second pass: arrange children
        float y = bounds.y();

        for (size_t i = 0; i < children.size(); ++i) {
            const auto& child = children[i];
            const auto& params = child->get_layout_properties();
            const auto& size = sizes[i];

            float height = size.height();
            if (params.flex_grow > 0) {
                height = (remaining_height * params.flex_grow) / total_flex;
            }

            // Apply constraints
            height = params.constrain_size(Size<float>{size.width(), height}).height();

            // Calculate horizontal alignment
            float x = bounds.x() + params.margin;
            float width = bounds.width() - params.get_total_horizontal_space();

            switch (params.align_self) {
                case LayoutProperties::Alignment::Center:
                    x += (width - size.width()) / 2;
                    width = size.width();
                    break;
                case LayoutProperties::Alignment::Start:
                    width = size.width();
                    break;
                case LayoutProperties::Alignment::End:
                    x += width - size.width();
                    width = size.width();
                    break;
                case LayoutProperties::Alignment::Stretch:
                    // Use full width
                    break;
            }

            // Position the child
            child->set_bounds(Rect<float>{
                x,
                y + params.margin,
                width,
                height
            });

            y += height + params.get_total_vertical_space() + element.get_layout_properties().spacing;
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
