//
// Created by ajost1 on 1/15/2025.
//

#ifndef VERTICAL_LAYOUT_HPP
#define VERTICAL_LAYOUT_HPP
#include "layout.hpp"

namespace plastic
{
    struct VerticalLayout : Layout {
    private:
        float spacing;

    public:
        explicit VerticalLayout(const float spacing = 0) : spacing(spacing) {};

        void arrange(const Rect& bounds, const std::vector<Component*>& children) override;
        Size measure(const std::vector<Component*>& children) override;
    };
}

#endif //VERTICAL_LAYOUT_HPP
