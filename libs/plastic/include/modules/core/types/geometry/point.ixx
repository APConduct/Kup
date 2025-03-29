//
// Created by ajost1 on 1/28/2025.
//

module;

#include <raylib.h>
#include <cmath>
#include <cstddef>
#include <string>

export module plastic.point;

export namespace plastic
{

    /// @brief Point struct. Represents a 2D point in space.
    template <typename T>
    struct Point {
        static_assert(std::is_arithmetic_v<T>, "Point must be of an arithmetic type");
        T x, y;

        /// @brief Default constructor
        /// @param x The x coordinate (from the left)
        /// @param y The y coordinate (from the top)
        explicit Point(const T x=0, const T y=0) : x(x), y(y) {}

        /// @brief adds two points together
        /// @param other The other point to add,adds bot adding both the x and y coordinates
        Point operator+(const Point& other) const {
            return Point(x + other.x, y + other.y);
        }

        /// @brief adds a point to a subjective point
        /// @param other The other point whose value to add
        /// @return The current point with the other point added to it
        Point& operator+=(const Point& other) {
            x += other.x;
            y += other.y;
            return *this;
        }

        /// @brief subtracts two points
        /// @param other The other point to subtract, subtracts both the x and y coordinates
        /// @return The current point with the other point subtracted from it
        Point operator-(const Point& other) const {
            return Point(x - other.x, y - other.y);
        }

        /// @brief subtracts two points
        /// @param other The other point to subtract, subtracts both the x and y coordinates
        /// @return The current point with the other point subtracted from it
        Point operator-(const Point other) const {
            return Point(x - other.x, y - other.y);
        }

        /// @brief multiplies a point by a scalar
        /// @param scalar The scalar to multiply by
        /// @return The current point with the scalar multiplied to it
        Point operator*(const T scalar) {
            return Point(x * scalar, y * scalar);
        }

        /// @brief divides a point by a scalar
        /// @param scalar The scalar to divide by
        /// @return The current point with the scalar divided to it
        Point operator/(const T scalar) {
            return Point(x / scalar, y / scalar);
        }

        /// @brief compares two points
        bool operator==(const Point& other) const {
            return x == other.x && y == other.y;
        }

        /// @brief compares two points (not equal)
        bool operator!=(const Point& other) const {
            return !(*this == other);
        }

        /// @brief measures the distance between two points
        /// @param other The other point to measure the distance to
        /// @return The distance between the two points
        [[nodiscard]] T distance_to(const Point& other) const {
            T dx = other.x;
            T dy = other.y;
            return static_cast<T>(sqrt(dx * dx + dy * dy));
        }
    };

    /// @brief Point specialization for float
    /// @note This specialization is used for raylib functions that require a float point
    template <>
    struct Point<float> {
        float x, y;
        explicit Point(const float x=0, const float y=0) : x(x), y(y) {}

        static Point from_rl(const Vector2 vec) {
            return Point(vec.x, vec.y);
        }

        [[nodiscard]] Vector2 to_rl() const { return {x, y}; }

        /// @brief converts a point to a raylib Vector2
        /// @return a point relative to the mouse position
        static Point from_mouse_pos() {
            return from_rl(GetMousePosition());
        }

        /// @brief lerps between two points
        /// @param a The first point
        /// @param b The second point
        /// @param t The amount to lerp (0.0 to 1.0)
        static Point lerp(const Point& a, const Point& b, const float t) {
            return Point(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t);
        }

        /// @brief checks if the point is on the screen
        /// @return true if the point is on the screen, false otherwise
        [[nodiscard]] bool is_on_screen() const {
            return x >= 0 && x <= static_cast<float>(GetScreenWidth()) && y >= 0 && y <= static_cast<float>(GetScreenHeight());
        }
    };

    /// @brief Point specialization for size_t
    /// @note This specialization is used for text-related functions
    template<>
    struct Point<size_t> {
        size_t x, y, total;
        explicit Point(const size_t x, const size_t y, const size_t total) : x(x), y(y), total(total) {}
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

        /// @brief constructs a point from a string and a cursor position
        /// @param x The x coordinate
        /// @param y The y coordinate
        /// @param text The text to measure
        explicit Point(const size_t x, const size_t y, const std::string& text) : x(x), y(y), total(0) {
            for (size_t i = 0; i < y; i++) {
                total += text.find('\n', total);
            }
            total += x;
        }

        /// @brief measures the number of lines in a string
        /// @param text The text to measure
        /// @return The number of lines in the text
        [[nodiscard]] size_t line_offset(const std::string& text) const {
            size_t offset = 0;
            size_t current_line = 0;
            while (current_line < y && offset < text.length()) {
                if (text[offset] == '\n') current_line++;
                offset++;
            }
            return offset + x;
        }

        /// @brief checks if the point is valid
        /// @param text The text to measure
        /// @return true if the point is valid, false otherwise
        [[nodiscard]] bool is_valid_position(const std::string& text) const {
            return total <= text.length();
        }
    };

    /// @brief returns the mouse position
    /// @return The position of the mouse relative to the window's origin
    inline Point<float> get_mouse_position() {
        return Point<float>::from_mouse_pos();
    }

    /// @brief measures the mouse difference in position of the mouse since the last frame
    /// @return The difference in position of the mouse since the last frame
    /// @note This function is not thread-safe
    inline Point<float> get_mouse_delta() {
        return Point<float>::from_rl(GetMouseDelta());
    }

    /// @brief measures the mouse wheel movement
    /// @return The difference in position of the mouse wheel since the last frame
    /// @note This function is not thread-safe
    inline Point<float> get_mouse_wheel() {
        return Point<float>::from_rl(GetMouseWheelMoveV());
    }

    /// @brief measures the position of the App's Window's origin relative to the screen's origin
    /// @return The position of the App's Window's origin relative to the screen's origin
    /// @note This function is not thread-safe
    inline Point<float> get_window_position() {
        return Point<float>::from_rl(GetWindowPosition());
    }
}
