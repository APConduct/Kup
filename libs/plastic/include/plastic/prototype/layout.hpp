//
// Created by ajost1 on 1/13/2025.
//

#ifndef LAYOUT_HPP
#define LAYOUT_HPP
#include "element.hpp"
#include "rect.hpp"
#include <memory>
#include <vector>
#include "../layout_properties.hpp"


namespace plastic
{




    struct Layout {
        virtual ~Layout() = default;

        // Arrange the components in a container's bounds
        virtual void arrange(
            Rect& bounds,
            const std::vector<std::shared_ptr<element::Element>>& children
        ) = 0;

        // Calculate the desired size of the layout based on its children
        virtual Size measure(
            const std::vector<std::shared_ptr<element::Element>>& children,
            const Size& available_space
        ) = 0;

    protected:
        // Utility methods for layouts
        static Size get_context_size(const element::Element& element) {
            const auto& props = element.get_layout_properties();
            Size size = props.preferred_size;
            return props.constraints.constrain(size);
        }

        static Rect apply_margin(const Rect& bounds, float margin) {
            return Rect(
                bounds.x + margin,
                bounds.y + margin,
                bounds.width - (2 * margin),
                bounds.height - (2 * margin)
            );
        }
    };
}

#endif //LAYOUT_HPP
