//
// Created by ajost1 on 1/29/2025.
//
module;

#include <raylib.h>


export module plastic.div;

import plastic.element;
import plastic.style;
import plastic.context;

export namespace plastic
{
    struct Div : Element {
        void layout(Context* cx) const override {
            float y = style.padding.top;

            for (const auto& child : children) {
                child->layout(cx);
                y += style.padding.bottom;
            }
        }

        void paint(Context* cx) const override {

            if (style.background_color_normal) {
                // Draw background
                DrawRectangleRec(
                    {
                        style.origin().x,
                        style.origin().y,
                        current_size.width(),
                        current_size.height()
                    },
                    style.background_color_normal.value().rl()
                    );
            }

            for (const auto& child : children) {
                child->paint(cx);
            }
        }
    };
}
