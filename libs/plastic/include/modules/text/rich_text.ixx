//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <string>
#include <vector>
#include <raylib.h>
export module plastic.rich_text;

import plastic.element;
import plastic.color;
import plastic.font;
import plastic.context;

export namespace plastic
{
    struct RichText : public Element {
        struct TextSpan {
            std::string text;
            Color color;
            bool bold{false};
            bool italic{false};
            bool underline{false};
        };

        std::vector<TextSpan> spans;
        Font font;
        Font bold_font;
        float font_size;
        float spacing;

        void paint(::plastic::Context* cx) const override {
            float x = bounds.x();
            float y = bounds.y();

            for (const auto& span : spans) {
                Font used_font = span.bold ? bold_font : font;

                DrawTextEx(used_font.rl(), span.text.c_str(), {x, y}, font_size, spacing, span.color.rl());

                x += MeasureTextEx(used_font.rl(), span.text.c_str(), font_size, spacing).x;

                if (span.underline) {
                    DrawLineEx({bounds.x(), y + font_size}, {bounds.x() + x, y + font_size}, 1.0f, span.color.rl());
                }
            }
        };


    };
}
