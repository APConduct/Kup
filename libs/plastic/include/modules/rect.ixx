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

        T x_;
        T y_;
        T width_;
        T height_;

        explicit Rect(const T x=0, const T y=0, const T width=0, const T height=0)
            : x_(x), y_(y), width_(width), height_(height) {}

        Rect& x(const T x) {
            x_ = x;
            return *this;
        }

        Rect& y(const T y) {
            y_ = y;
            return *this;
        }

        Rect& width(const T width) {
            width_ = width;
            return *this;
        }

        Rect& height(const T height) {
            height_ = height;
            return *this;
        }

        [[nodiscard]] T x() const { return x_; }

        [[nodiscard]] T y() const { return y_; }

        [[nodiscard]] T width() const { return width_; }

        [[nodiscard]] T height() const { return height_; }

        [[nodiscard]] bool contains(const Point<T>& point) const {
            return point.x_ >= x_ && point.x_ <= x_ + width_ && point.y_ >= y_ && point.y_ <= y_ + height_;
        }
    };

    template <>
    struct Rect<float> {
        float x_, y_, width_, height_;
        explicit Rect(const float x=0, const float y=0, const float width=0, const float height=0)
            : x_(x), y_(y), width_(width), height_(height) {}

        Rect& x(const float x) {
            x_ = x;
            return *this;
        }

        Rect& y(const float y) {
            y_ = y;
            return *this;
        }

        Rect& width(const float width) {
            width_ = width;
            return *this;
        }

        Rect& height(const float height) {
            height_ = height;
            return *this;
        }

        [[nodiscard]] float x() const { return x_; }

        [[nodiscard]] float y() const { return y_; }

        [[nodiscard]] float width() const { return width_; }

        [[nodiscard]] float height() const { return height_; }

        static Rect from_rl(const Rectangle& rect) {
            return Rect(rect.x, rect.y, rect.width, rect.height);
        }

        [[nodiscard]] Rectangle to_rl() const {
            return {x_, y_, width_, height_};
        }

        [[nodiscard]] bool contains(const Point<float>& point) const {
            return point.x >= x_ && point.x <= x_ + width_ && point.y >= y_ && point.y <= y_ + height_;
        }

        [[nodiscard]] bool contains(const float px, const float py) const {
            return px >= x_ && px <= x_ + width_ && py >= y_ && py <= y_ + height_;
        }

        void draw_lines(const float thickness, const Color color) const {
            DrawRectangleLinesEx({x_, y_, width_, height_}, thickness, color);
        }

        void fill(const Color color) const {
            DrawRectangleRec(to_rl(), color);
        }

        // MAYBE REMOVE THESE FUNCTIONS
        void apply_scissor() const {
            BeginScissorMode(
                static_cast<int>(x_),
                static_cast<int>(y_),
                static_cast<int>(width_),
                static_cast<int>(height_));
        }

        static void stop_scissor() {
            EndScissorMode();
        }

        [[nodiscard]] float right() const { return x_ + width_; };
        [[nodiscard]] float bottom() const { return y_ + height_;}

        bool operator==(const Rect& other) const {
            return x_ == other.x_ && y_ == other.y_ && width_ == other.width_ && height_ == other.height_;
        }
    };

    template <typename T>
    Rect<T> make_rect(const T x, const T y, const T width, const T height) {
        return Rect<T>(x, y, width, height);
    }

    template <typename T, typename U>
    Rect<U> cast_rect(const Rect<T>& rect) {
        return rect.template cast<U>();
    }

    template <>
    Rect<int> cast_rect(const Rect<float>& rect) {
        return Rect(
            static_cast<int>(rect.x()),
            static_cast<int>(rect.y()),
            static_cast<int>(rect.width()),
            static_cast<int>(rect.height()));
    }

}
