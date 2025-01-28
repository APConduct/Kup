//
// Created by ajost1 on 1/13/2025.
//

#ifndef POINT_HPP
#define POINT_HPP

#include <cmath>
#include <cstddef>
#include <raylib.h>
#include <string>
namespace plastic
{
    template <typename T>
    struct Point {
        static_assert(std::is_arithmetic_v<T>, "Point must be of an arithmetic type");
        T x, y;
        explicit Point(const T x=0, const T y=0) : x(x), y(y) {}

        Point operator+(const Point& other) const {
            return Point(x + other.x, y + other.y);
        }

        Point& operator+=(const Point& other) {
            x += other.x;
            y += other.y;
            return *this;
        }

        Point operator-(const Point& other) const {
            return Point(x - other.x, y - other.y);
        }

        Point operator-(const Point other) const {
            return Point(x - other.x, y - other.y);
        }

        Point operator*(const T scalar) {
            return Point(x * scalar, y * scalar);
        }

        Point operator/(const T scalar) {
            return Point(x / scalar, y / scalar);
        }

        // Comparison
        bool operator==(const Point& other) const {
            return x == other.x && y == other.y;
        }

        bool operator!=(const Point& other) const {
            return !(*this == other);
        }

        [[nodiscard]] T distance_to(const Point& other) const {
            T dx = other.x;
            T dy = other.y;
            return static_cast<T>(sqrt(dx * dx + dy * dy));
        }

        [[nodiscard]] T length() const {
            return static_cast<T>(std::sqrt(x*x + y*y));
        }
    };

    template <>
    struct Point<float> {
        float x, y;
        explicit Point(const float x=0, const float y=0) : x(x), y(y) {}
        explicit Point(const Vector2 vec) : x(vec.x), y(vec.y) {}
        [[nodiscard]] Vector2 to_raylib() const { return {x, y}; }

        static Point from_rl(const Vector2 vec) {
            return Point(vec.x, vec.y);
        }
        static Point from_mouse_pos() {
            return from_rl(GetMousePosition());
        }

        // Interpolation
        static Point lerp(const Point& a, const Point& b, const float t) {
            return Point(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t);
        }

        // Screen space utilities
        [[nodiscard]] bool is_on_screen() const {
            return x >= 0 && x <= static_cast<float>(GetScreenWidth()) && y >= 0 && y <= static_cast<float>(GetScreenHeight());
        }
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

        [[nodiscard]] size_t line_offset(const std::string& text) const {
            size_t offset = 0;
            size_t current_line = 0;
            while (current_line < y && offset < text.length()) {
                if (text[offset] == '\n') current_line++;
                offset++;
            }
            return offset + x;
        }

        [[nodiscard]] bool is_valid_position(const std::string& text) const {
            return total <= text.length();
        }
    };

    inline Point<float> get_mouse_position() {
        return Point<float>(GetMousePosition());
    }

    inline Point<float> get_mouse_delta() {
        return Point<float>(GetMouseDelta());
    }

    inline Point<float> get_mouse_wheel() {
        return Point<float>(GetMouseWheelMove());
    }

    inline Point<float> get_window_position() {
        return Point<float>(GetWindowPosition());
    }
} // namespace plastic

#endif //POINT_HPP
