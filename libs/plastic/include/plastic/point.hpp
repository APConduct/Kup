//
// Created by ajost1 on 1/13/2025.
//

#ifndef POINT_HPP
#define POINT_HPP

#include <raylib.h>
#include <string>

namespace plastic
{
    template <typename T>
    struct Point {
        static_assert(std::is_arithmetic_v<T>, "Point must be of an arithmetic type");
        T x, y;
        explicit Point(const T x=0, const T y=0) : x(x), y(y) {}
    };

    template <>
    struct Point<float> {
        float x, y;
        explicit Point(const float x=0, const float y=0) : x(x), y(y) {}
        explicit Point(const Vector2 vec) : x(vec.x), y(vec.y) {}
        [[nodiscard]] Vector2 to_raylib() const { return {x, y}; }
    };

    // Specialization for cursor position within text
    template<>
    struct Point<size_t> {
        size_t x, y, total;
        explicit Point(const size_t x, const size_t y, const size_t total) : x(x), y(y), total(total) {}
        // Construct a Point from a string and a cursor position in the string
        explicit Point(const std::string& text, const size_t cursor) : x(0), y(0), total(0) {
            for (size_t i = 0; i < cursor; i++) {
                if (text[i] == '\n') {
                    y++;
                    x = 0;
                }else {
                    x++;
                }
            }
            total = cursor;
        }
        // Construct a Point from a string and a position x and y
        explicit Point(const size_t x, const size_t y, const std::string& text) : x(x), y(y), total(0) {
            for (size_t i = 0; i < y; i++) {
                total += text.find('\n', total);
            }
            total += x;
        }
    };
}

#endif //POINT_HPP
