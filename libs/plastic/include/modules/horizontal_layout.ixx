module;
#include <vector>
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
            const auto& children = element.get_children();
            if (children.empty()) return;

            // First pass: measure children and calculate total flex
            float total_flex = 0;
            float total_fixed_width = 0;
            std::vector<Size<float>> sizes;
            sizes.reserve(children.size());

            for (const auto& child : children) {
                const auto& params = child->get_layout_properties();
                auto size = measure(*child);

                if (params.flex_grow > 0) {
                    total_flex += params.flex_grow;
                } else {
                    total_fixed_width += size.width() + params.get_total_horizontal_space();
                }
                sizes.push_back(size);
            }

                    // Second pass: arrange children
            float remaining_width = bounds.width() - total_fixed_width;
            float x = bounds.x();

            for (size_t i = 0; i < children.size(); ++i) {
                const auto& child = children[i];
                const auto& params = child->get_layout_properties();
                const auto& size = sizes[i];

                float width = size.width();
                if (params.flex_grow > 0) {
                    width = (remaining_width * params.flex_grow) / total_flex;
                }

                // Apply constraints
                width = params.constrain_size(Size<float>{width, size.height()}).width();

                // Calculate vertical alignment
                float y = bounds.y() + params.margin;
                float height = bounds.height() - params.get_total_vertical_space();

                switch (params.align_self) {
                    case LayoutProperties::Alignment::Center:
                        y += (height - size.height()) / 2;
                    height = size.height();
                    break;
                    case LayoutProperties::Alignment::Start:
                        height = size.height();
                    break;
                    case LayoutProperties::Alignment::End:
                        y += height - size.height();
                    height = size.height();
                    break;
                    case LayoutProperties::Alignment::Stretch:
                        // Use full height
                            break;
                }

                        // Position the child
                child->set_bounds(Rect{
                    x + params.margin,
                    y,
                    width,
                    height
                });

                x += width + params.get_total_horizontal_space();
            }
        }

        Size<float> measure(const Element& element) override {
            const auto& children = element.get_children();
            if (children.empty()) return Size<float>{0, 0};

            float total_width = 0;
            float max_height = 0;

            for (const auto& child : children) {
                const auto& params = child->get_layout_properties();
                auto size = child->get_style().get_preferred_size();

                total_width += size.width() + params.get_total_horizontal_space();
                max_height = std::max(max_height,
                    size.height() + params.get_total_vertical_space());
            }

            return Size<float>{total_width, max_height};
        }


    };
}
