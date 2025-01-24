//
// Created by ajost1 on 1/15/2025.
//

#ifndef VERTICAL_LAYOUT_HPP
#define VERTICAL_LAYOUT_HPP
#include "layout.hpp"
#include "plastic/element.hpp"
#include "plastic/layout_properties.hpp"
#include "plastic/rect.hpp"
#include <memory>

namespace plastic
{
    struct VerticalLayout : Layout {
    private:
        float spacing;

    public:
        explicit VerticalLayout(const float spacing = 0) : spacing(spacing) {};

        void arrange( Rect& bounds, const std::vector<std::shared_ptr<Element>>& children) override {
            if (children.empty()) return;

            // First pass: calculate flexible space
            float total_fixed_height = 0;
            float total_flex_grow = 0;

            for (const auto& child : children) {
                const auto& props = child->get_layout_properties();
                if (props.flex_grow > 0) {
                    total_flex_grow += props.flex_grow;
                } else {
                    total_fixed_height += get_context_size(*child).height;
                }
                total_fixed_height += spacing;
            }

            // Remove extra spacing
            total_fixed_height -= spacing;

            // Calculate flexible space
            float flexible_space = bounds.height - total_fixed_height;
            float y = bounds.y;

            // Second pass: position children/elements
            for (const auto& child : children) {
                const auto& props = child->get_layout_properties();
                float child_height;

                if (props.flex_grow > 0) {
                    child_height = flexible_space * (props.flex_grow / total_flex_grow);
                } else {
                    child_height = get_context_size(*child).height;
                }

                // Apply horizontal alignment
                float x = bounds.x;
                float width = bounds.width;

                switch (props.align_self) {
                    case LayoutProperties::Alignment::Center: {
                        float child_width = get_context_size(*child).width;
                        x = bounds.x + (bounds.width - child_width) / 2;
                        width = child_width;
                        break;
                    }
                    case LayoutProperties::Alignment::Start: {
                        width = get_context_size(*child).width;
                        break;
                    }
                    case LayoutProperties::Alignment::End: {
                        float child_width = get_context_size(*child).width;
                        x = bounds.x + bounds.width - child_width;
                        width = child_width;
                        break;
                    }
                    case plastic::LayoutProperties::Alignment::Stretch:
                        // Use full width
                        break;

                }

                Rect child_bounds(x, y, width, child_height);
                child_bounds = apply_margin(child_bounds, props.margin);
                child->layout(child_bounds);
                y += child_height + spacing;

            }
        };
        Size measure(const std::vector<std::shared_ptr<Element>>& children, const Size& available_size) override {
            Size result{0,0};

            for (const auto& child : children) {
                Size child_size = get_context_size(*child);
                result.width = std::max(result.width, child_size.width);
                result.height += child_size.height + spacing;
            }

            // Remove extra spacing
            if (!children.empty()) {
                result.height -= spacing;
            }

            return result;
        };
    };
}

#endif //VERTICAL_LAYOUT_HPP
