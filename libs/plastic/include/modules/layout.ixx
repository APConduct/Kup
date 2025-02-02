//
// Created by ajost1 on 1/30/2025.
//



export module plastic.layout;

import plastic.rect;
import plastic.size;
import plastic.layout_properties;

export namespace plastic
{

    struct Layout {
        using Properties = LayoutProperties;
        virtual ~Layout() = default;

    };
}
