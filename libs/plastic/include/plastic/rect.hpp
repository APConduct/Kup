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
        T x_;
        T y_;
        T width_;
        T height_;

        explicit Rect(const float x=0, const float y=0, const float width=0, const float height=0)
            : x_(x), y_(y), width_(width), height_(height) {}

        explicit Rect(const Rectangle& rect)
            : x_(rect.x), y_(rect.y), width_(rect.width), height_(rect.height) {}

        [[nodiscard]] float right() const { return x_ + width_; };
        [[nodiscard]] float bottom() const { return y_ + height_; };

        [[nodiscard]] bool contains(const Vector2& point) const {
            return point.x >= x_ && point.x <= right() && point.y >= y_ && point.y <= bottom();
        }
        [[nodiscard]] bool contains(const float px, const float py) const {
            return px >= x_ && px <= right() && py >= y_ && py <= bottom();
        }

        [[nodiscard]] Rectangle to_raylib() const {
            return {x_, y_, width_, height_};
        }

        void apply_scissor() const {
            BeginScissorMode(
                static_cast<int>(x_),
                static_cast<int>(y_),
                static_cast<int>(width_),
                static_cast<int>(height_));
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
