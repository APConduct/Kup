//
// Created by ajost1 on 1/13/2025.
//

#ifndef POINT_HPP
#define POINT_HPP

#include <raylib.h>

namespace plastic
{
    template <typename T>
    struct Point {
        T x, y;
        explicit Point(const T x=0, const T y=0) : x(x), y(y) {}
    };

    struct Point<float> {
        float x, y;
        explicit Point(const float x=0, const float y=0) : x(x), y(y) {}
        explicit Point(const Vector2& vec) : x(vec.x), y(vec.y) {}
        explicit Point(const Vector2&& vec) : x(vec.x), y(vec.y) {}
        [[nodiscard]] Vector2 to_raylib() const { return {x, y}; }
    };
}

#endif //POINT_HPP
