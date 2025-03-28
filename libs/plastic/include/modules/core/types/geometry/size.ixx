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
    private:

        T width_;
        T height_;
    public:

        Size& width(const T width) {
            this->width_ = width;
            return *this;
        }

        Size& height(const T height) {
            this->height_ = height;
            return *this;
        }

        T width() const {
            return width_;
        }

        T height() const {
            return height_;
        }

        explicit Size(const float width=0, const float height=0) : width_(width), height_(height) {}

        bool operator==(const Size& rhs) const {
            return width_ == rhs.width_ && height_ == rhs.height_;
        }
    };

}
