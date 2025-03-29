//
// Created by ajost1 on 1/28/2025.
//

export module plastic.edge;
import plastic.point;
import plastic.size;
import plastic.rect;

export namespace plastic
{

    /// @brief Edge struct. Represents the edges of a rectangle.
    /// @tparam T The type of the edge (int, float, etc.)
    /// @note This struct is used to define the edges of a rectangle in 2D space.
    template<typename T>
    struct Edge {
        T top, right, bottom, left;

        /// @brief get as a rectangle (bounds)
        /// @return The edge as a rectangle
        [[nodiscard]] Rect<T> bounds() const {
            return Rect{left, top, right - left, bottom - top};
        }

        /// @brief get the size of the edge as a rectangle
        /// @return The size of the edge as a rectangle
        [[nodiscard]] Size<T> size() const {
            return Size<T>{right - left, bottom - top};
        }

        /// @brief compare two edges
        /// @param rhs The other edge to compare
        /// @return true if the edges are equal, false otherwise
        bool operator==(const Edge& rhs) const {
            return top == rhs.top && right == rhs.right && bottom == rhs.bottom && left == rhs.left;
        }

        /// @brief compare two edges (not equal)
        /// @param rhs The other edge to compare
        /// @return true if the edges are not equal, false otherwise
        bool operator!=(const Edge& rhs) const {
            return !(rhs == *this);
        }
    };

    /// @brief Edge specialization for float
    /// @note This specialization is used for raylib functions that require a float edge
    template<>
    struct Edge<float> {
        float top, right, bottom, left;

        /// @brief get as a rectangle (bounds)
        /// @return The edge as a rectangle
        [[nodiscard]] Rect<float> bounds() const {
            return Rect{left, top, right - left, bottom - top};
        }

        /// @brief get the size of the edge as a rectangle
        /// @return The size of the edge as a rectangle
        [[nodiscard]] Size<float> size() const {
            return Size<float>{right - left, bottom - top};
        }

        /// @brief compare two edges
        /// @param rhs The other edge to compare
        /// @return true if the edges are equal, false otherwise
        bool operator==(const Edge& rhs) const {
            return top == rhs.top && right == rhs.right && bottom == rhs.bottom && left == rhs.left;
        }

        /// @brief compare two edges (not equal)
        /// @param rhs The other edge to compare
        /// @return true if the edges are not equal, false otherwise
        bool operator!=(const Edge& rhs) const {
            return !(rhs == *this);
        }


    };
}