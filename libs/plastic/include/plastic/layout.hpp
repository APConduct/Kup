//
// Created by ajost1 on 1/13/2025.
//

#ifndef LAYOUT_HPP
#define LAYOUT_HPP
#include "plastic.hpp"
#include "rect.hpp"
#include "container.hpp"

namespace plastic
{
    struct Layout {
        virtual ~Layout() = default;

        // Arrange the components in a container's bounds
        virtual void arrange(Container& container) = 0;

        // Calculate the desired size of the layout based on its children
        virtual Size measure(Container& container) = 0;
    };
}

#endif //LAYOUT_HPP
