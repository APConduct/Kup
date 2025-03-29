//
// Created by ajost1 on 1/28/2025.
//

module;

#include <raylib.h>
#include <type_traits>

export module plastic.rect;

import plastic.point;
import plastic.size;
import plastic.color;

export namespace plastic
{
    /// @brief Rectangle struct. Represents a rectangle in 2D space.
    /// @tparam T The type of the rectangle (int, float, etc.)
    template <typename T>
    struct Rect {
        static_assert(std::is_arithmetic_v<T>, "Rect must be of an arithmetic type");

        /// @brief The x coordinate of the rectangle (from the left)
        T x_;

        /// @brief The y coordinate of the rectangle (from the top)
        T y_;

        /// @brief The width of the rectangle
        T width_;

        /// @brief The height of the rectangle
        T height_;


        /// @brief Default constructor
        /// @param x The x coordinate (from the left)
        /// @param y The y coordinate (from the top)
        explicit Rect(const T x=0, const T y=0, const T width=0, const T height=0)
            : x_(x), y_(y), width_(width), height_(height) {}

        /// @brief chainable setter for the x coordinate
        /// @param x The x coordinate (from the left)
        /// @return A reference to the current instance of the rectangle
        Rect& x(const T x) {
            x_ = x;
            return *this;
        }

        /// @brief chainable setter for the y coordinate
        /// @param y The y coordinate (from the top)
        /// @return A reference to the current instance of the rectangle
        Rect& y(const T y) {
            y_ = y;
            return *this;
        }

        /// @brief chainable setter for the width
        /// @param width The width of the rectangle
        /// @return A reference to the current instance of the rectangle
        Rect& width(const T width) {
            width_ = width;
            return *this;
        }

        /// @brief chainable setter for the height
        /// @param height The height of the rectangle
        /// @return A reference to the current instance of the rectangle
        Rect& height(const T height) {
            height_ = height;
            return *this;
        }

        /// @brief pretty getter for the x coordinate
        /// @return The x coordinate (from the left)
        [[nodiscard]] T x() const { return x_; }

        /// @brief pretty getter for the y coordinate
        /// @return The y coordinate (from the top)
        [[nodiscard]] T y() const { return y_; }

        /// @brief pretty getter for the width
        /// @return The width of the rectangle
        [[nodiscard]] T width() const { return width_; }

        /// @brief pretty getter for the height
        /// @return The height of the rectangle
        [[nodiscard]] T height() const { return height_; }

        /// @brief checks if a point is inside the rectangle
        /// @param point The point to check
        /// @return true if the point is inside the rectangle, false otherwise
        [[nodiscard]] bool contains(const Point<T>& point) const {
            return point.x_ >= x_ && point.x_ <= x_ + width_ && point.y_ >= y_ && point.y_ <= y_ + height_;
        }

        /// @brief checks if a point is inside the rectangle (templated)
        template <typename O>
        bool contains(const Point<O>& point) const {
            return point.x >= x() && point.x <= x() + width()
            && point.y >= y() && point.y <= y() + height();
        }
    };

    /// @brief Rectangle specialization for float
    /// @note This specialization is used for rendering and other operations that require float precision
    template <>
    struct Rect<float> {
        float x_, y_, width_, height_;
        explicit Rect(const float x=0, const float y=0, const float width=0, const float height=0)
            : x_(x), y_(y), width_(width), height_(height) {}

        /// @brief chainable setter for the x coordinate
        /// @param x The x coordinate (from the left)
        /// @return A reference to the current instance of the rectangle
        Rect& x(const float x) {
            x_ = x;
            return *this;
        }

        /// @brief chainable setter for the y coordinate
        /// @param y The y coordinate (from the top)
        /// @return A reference to the current instance of the rectangle
        Rect& y(const float y) {
            y_ = y;
            return *this;
        }

        /// @brief chainable setter for the width
        /// @param width The width of the rectangle
        /// @return A reference to the current instance of the rectangle
        Rect& width(const float width) {
            width_ = width;
            return *this;
        }

        /// @brief chainable setter for the height
        /// @param height The height of the rectangle
        /// @return A reference to the current instance of the rectangle
        Rect& height(const float height) {
            height_ = height;
            return *this;
        }

        /// @brief pretty getter for the x coordinate
        /// @return The x coordinate (from the left)
        [[nodiscard]] float x() const { return x_; }

        /// @brief pretty getter for the y coordinate
        /// @return The y coordinate (from the top)
        [[nodiscard]] float y() const { return y_; }

        /// @brief pretty getter for the width
        /// @return The width of the rectangle
        [[nodiscard]] float width() const { return width_; }

        /// @brief pretty getter for the height
        /// @return The height of the rectangle
        [[nodiscard]] float height() const { return height_; }

        /// @brief creates a rectangle from a raylib Rectangle
        /// @param rect The raylib Rectangle to convert
        /// @return A plastic Rect(angle) from the raylib Rectangle
        static Rect from_rl(const Rectangle& rect) {
            return Rect(rect.x, rect.y, rect.width, rect.height);
        }

        /// @brief converts a plastic Rect(angle) to a raylib Rectangle
        /// @return A raylib Rectangle from the plastic Rect(angle)
        [[nodiscard]] Rectangle to_rl() const {
            return {x_, y_, width_, height_};
        }

        /// @brief checks if a point is inside the rectangle
        /// @param point The point to check
        /// @return true if the point is inside the rectangle, false otherwise
        [[nodiscard]] bool contains(const Point<float>& point) const {
            return point.x >= x_ && point.x <= x_ + width_ && point.y >= y_ && point.y <= y_ + height_;
        }

        /// @brief checks if a point is inside the rectangle (destructed point)
        /// @param px The x coordinate of the point
        /// @param py The y coordinate of the point
        /// @return true if the point is inside the rectangle, false otherwise
        [[nodiscard]] bool contains(const float px, const float py) const {
            return px >= x_ && px <= x_ + width_ && py >= y_ && py <= y_ + height_;
        }

        /// @brief renders the rectangle as lines
        /// @param thickness The thickness of the lines
        /// @param color The color of the lines
        void draw_lines(const float thickness, const Color color) const {
            DrawRectangleLinesEx({x_, y_, width_, height_}, thickness, color.rl());
        }

        /// @brief renders the rectangle as a filled shape
        /// @param color The color of the filled shape
        /// @note This function is not chainable
        void fill(const Color color) const {
            DrawRectangleRec(to_rl(), color.rl());
        }

        // MAYBE REMOVE THESE FUNCTIONS
        /// @brief constrains the area that can be rendered on to be this rectangle until 'stop_scissor' is called by anything
        void apply_scissor() const {
            BeginScissorMode(
                static_cast<int>(x_),
                static_cast<int>(y_),
                static_cast<int>(width_),
                static_cast<int>(height_));
        }

        /// @brief stops the scissor mode
        /// @note This function should be called after 'apply_scissor' to stop the scissor mode
        static void stop_scissor() {
            EndScissorMode();
        }

        /// @brief the rightmost x coordinate of the rectangle, assuming the rectangle is not rotated
        /// @return The rightmost x coordinate of the rectangle
        [[nodiscard]] float right() const { return x_ + width_; };

        /// @brief the bottommost y coordinate of the rectangle, assuming the rectangle is not rotated
        /// @return The bottommost y coordinate of the rectangle
        [[nodiscard]] float bottom() const { return y_ + height_;}

        /// @brief compares two rectangles
        /// @param other The other rectangle to compare
        /// @return true if the rectangles are equal, false otherwise
        bool operator==(const Rect& other) const {
            return x_ == other.x_ && y_ == other.y_ && width_ == other.width_ && height_ == other.height_;
        }

        /// @brief checks if the rectangle intersects with another rectangle
        /// @param bound The rectangle to check
        /// @return true if the rectangles intersect, false otherwise
        [[nodiscard]] bool intersects (const Rect& bound) const {
            return CheckCollisionRecs(bound.to_rl(), to_rl());
        }
    };

    /// @brief creates a rectangle from the given parameters
    /// @param x The x coordinate (from the left)
    /// @param y The y coordinate (from the top)
    /// @param width The width of the rectangle
    /// @param height The height of the rectangle
    /// @return A rectangle from the given parameters
    template <typename T>
    Rect<T> make_rect(const T x, const T y, const T width, const T height) {
        return Rect<T>(x, y, width, height);
    }

    /// @brief casts a rectangle from one type to another
    /// @param rect The rectangle to cast
    /// @return A rectangle of the new type
    /// @note This function is used to convert between different types of rectangles (e.g. int to float)
    template <typename T, typename U>
    Rect<U> cast_rect(const Rect<T>& rect) {
        return rect.template cast<U>();
    }

    /// @brief casts a rectangle from a float to an int
    /// @param rect The rectangle to cast
    /// @return A rectangle of the new type
    /// @note This function is used to convert between different types of rectangles (e.g. float to int)
    template <>
    Rect<int> cast_rect(const Rect<float>& rect) {
        return Rect(
            static_cast<int>(rect.x()),
            static_cast<int>(rect.y()),
            static_cast<int>(rect.width()),
            static_cast<int>(rect.height()));
    }

    /// @brief checks if two rectangles intersect
    /// @param a The first rectangle
    /// @param b The second rectangle
    /// @return true if the rectangles intersect, false otherwise
    bool intersects(const Rect<float>& a, const Rect<float>& b) {
        return a.x() < b.right() && a.right() > b.x() && a.y() < b.bottom() && a.bottom() > b.y();
    }


}
