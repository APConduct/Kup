//
// Created by ajost1 on 1/13/2025.
//

#ifndef RECT_HPP
#define RECT_HPP

#include <raylib.h>
#include <type_traits>

namespace plastic {
    template <typename T>
    struct Size {
        static_assert(std::is_arithmetic_v<T>, "Size must be of an arithmetic type");

        T width;
        T height;

        explicit Size(const float width=0, const float height=0) : width(width), height(height) {}
    };
    template <typename T>
    struct Rect {
        T x;
        T y;
        T width;
        T height;

        explicit Rect(const float x=0, const float y=0, const float width=0, const float height=0)
            : x(x), y(y), width(width), height(height) {}

        explicit Rect(const Rectangle& rect)
            : x(rect.x), y(rect.y), width(rect.width), height(rect.height) {}

        [[nodiscard]] float right() const { return x + width; };
        [[nodiscard]] float bottom() const { return y + height; };

        [[nodiscard]] bool contains(const Vector2& point) const {
            return point.x >= x && point.x <= right() && point.y >= y && point.y <= bottom();
        }
        [[nodiscard]] bool contains(const float px, const float py) const {
            return px >= x && px <= right() && py >= y && py <= bottom();
        }

        [[nodiscard]] Rectangle to_raylib() const {
            return {x, y, width, height};
        }

        void apply_scissor() const {
            BeginScissorMode(
                static_cast<int>(x),
                static_cast<int>(y),
                static_cast<int>(width),
                static_cast<int>(height));
        }

        void stop_scissor() const {
            EndScissorMode();
        }

        void draw_lines(float thickness, Color color) const {
            DrawRectangleLinesEx(to_raylib(), thickness, color);
        }

        void fill(Color color) const {
            DrawRectangleRec(to_raylib(), color);
        }
    };
}

#endif //RECT_HPP
