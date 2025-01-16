//
// Created by ajost1 on 1/13/2025.
//

#ifndef LAYOUT_HPP
#define LAYOUT_HPP
#include "rect.hpp"

namespace plastic
{

    struct Layout {
        virtual ~Layout() = default;

        // Arrange the components in a container's bounds
        virtual void arrange(Rect& space) = 0;

        // Calculate the desired size of the layout based on its children
        virtual Size measure(Rect& space) = 0;
    };
}

#endif //LAYOUT_HPP
