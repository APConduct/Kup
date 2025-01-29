//
// Created by ajost1 on 1/28/2025.
//

module;

#include <raylib.h>
#include <type_traits>

export module plastic.rect;

import plastic.point;
import plastic.size;

export namespace plastic
{
    template <typename T>
    struct Rect {
        static_assert(std::is_arithmetic_v<T>, "Rect must be of an arithmetic type");

        T x;
        T y;
        T width;
        T height;

        explicit Rect(const T x=0, const T y=0, const T width=0, const T height=0)
            : x(x), y(y), width(width), height(height) {}

        bool contains(const Point<T>& point) const {
            return point.x >= x && point.x <= x + width && point.y >= y && point.y <= y + height;
        }
    };

    template <>
    struct Rect<float> {
        float x, y, width, height;
        explicit Rect(const float x=0, const float y=0, const float width=0, const float height=0)
            : x(x), y(y), width(width), height(height) {}

        static Rect from_rl(const Rectangle& rect) {
            return Rect(rect.x, rect.y, rect.width, rect.height);
        }

        [[nodiscard]] Rectangle to_rl() const {
            return {x, y, width, height};
        }

        [[nodiscard]] bool contains(const Point<float>& point) const {
            return point.x >= x && point.x <= x + width && point.y >= y && point.y <= y + height;
        }

        [[nodiscard]] bool contains(const float px, const float py) const {
            return px >= x && px <= x + width && py >= y && py <= y + height;
        }

        void draw_lines(const float thickness, const Color color) const {
            DrawRectangleLinesEx({x, y, width, height}, thickness, color);
        }

        void fill(const Color color) const {
            DrawRectangleRec(to_rl(), color);
        }

        void apply_scissor() const {
            BeginScissorMode(
                static_cast<int>(x),
                static_cast<int>(y),
                static_cast<int>(width),
                static_cast<int>(height));
        }

        // MAYBE REMOVE THESE FUNCTIONS
        static void stop_scissor() {
            EndScissorMode();
        }

        [[nodiscard]] float right() const { return x + width; };
        [[nodiscard]] float bottom() const { return y + height;}
    };
}
