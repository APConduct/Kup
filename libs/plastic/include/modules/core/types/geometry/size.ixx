//
// Created by ajost1 on 1/28/2025.
//
module;

#include <type_traits>

export module plastic.size;

export namespace plastic
{
    /// @brief Size struct. Represents a 2D size in space.
    /// @tparam T The type of the size (int, float, etc.)
    template <typename T>
    struct Size {
        static_assert(std::is_arithmetic_v<T>, "Size must be of an arithmetic type");
    private:

        /// @brief The width of the size
        T width_;

        /// @brief The height of the size
        T height_;
    public:

        /// @brief chainable setter for the width
        /// @param width The width of the size
        /// @return A reference to the current instance of the size
        Size& width(const T width) {
            this->width_ = width;
            return *this;
        }

        /// @brief chainable setter for the height
        /// @param height The height of the size
        /// @return A reference to the current instance of the size
        Size& height(const T height) {
            this->height_ = height;
            return *this;
        }

        /// @brief pretty getter for the width
        /// @return The width of the size
        T width() const {
            return width_;
        }

        /// @brief pretty getter for the height
        /// @return The height of the size
        T height() const {
            return height_;
        }

        /// @brief Default constructor
        /// @param width The width of the size
        /// @param height The height of the size
        explicit Size(const float width=0, const float height=0) : width_(width), height_(height) {}

        /// @brief equality operator
        /// @param rhs The other size to compare
        /// @return true if the sizes are equal, false otherwise
        bool operator==(const Size& rhs) const {
            return width_ == rhs.width_ && height_ == rhs.height_;
        }

        /// @brief inequality operator
        /// @param rhs The other size to compare
        /// @return true if the sizes are not equal, false otherwise
        bool operator!=(const Size& rhs) const {
            return !(*this == rhs);
        }
    };

}
