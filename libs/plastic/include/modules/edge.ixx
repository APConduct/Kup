//
// Created by ajost1 on 1/28/2025.
//

export module plastic.edge;
import plastic.point;
import plastic.size;
import plastic.rect;

export namespace plastic
{
    template<typename T>
    struct Edge {
        T top, right, bottom, left;

        [[nodiscard]] Rect<T> bounds() const {
            return Rect{left, top, right - left, bottom - top};
        }

        [[nodiscard]] Size<T> size() const {
            return Size<T>{right - left, bottom - top};
        }
    };

    template<>
    struct Edge<float> {
        float top, right, bottom, left;

        [[nodiscard]] Rect<float> bounds() const {
            return Rect{left, top, right - left, bottom - top};
        }

        [[nodiscard]] Size<float> size() const {
            return Size<float>{right - left, bottom - top};
        }


    };
}