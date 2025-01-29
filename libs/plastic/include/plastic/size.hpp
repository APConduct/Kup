//
// Created by ajost1 on 1/28/2025.
//

#ifndef SIZE_HPP
#define SIZE_HPP
#include <type_traits>

namespace plastic
{
    template <typename T>
    struct Size {
        static_assert(std::is_arithmetic_v<T>, "Size must be of an arithmetic type");

        T width;
        T height;

        explicit Size(const float width=0, const float height=0) : width(width), height(height) {}
    };

}

#endif //SIZE_HPP
