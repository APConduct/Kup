//
// Created by ajost1 on 1/30/2025.
//



export module plastic.layout;

import plastic.rect;
import plastic.size;
import plastic.layout_properties;
import plastic.element;

export namespace plastic
{

    struct Layout {
        using Properties = LayoutProperties;
        virtual ~Layout() = default;
        virtual void arrange(Element& element, const Rect<float>& bounds) = 0;
        [[nodiscard]] virtual Size<float> measure(const Element& element) = 0;

    };
}
