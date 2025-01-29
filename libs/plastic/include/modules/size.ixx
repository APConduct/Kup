//
// Created by ajost1 on 1/28/2025.
//
module;

#include <type_traits>

export module plastic.size;

export namespace plastic
{
    template <typename T>
    struct Size {
        static_assert(std::is_arithmetic_v<T>, "Size must be of an arithmetic type");

        T width_;
        T height;

        Size& width(const T width) {
            this->width_ = width;
            return *this;
        }

        explicit Size(const float width=0, const float height=0) : width_(width), height(height) {}
    };

}
