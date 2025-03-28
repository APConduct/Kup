//
// Created by Aidan Jost on 3/28/25.
//

export module plastic.constraint;
import plastic.element;
import plastic.rect;

export namespace plastic
{
    class Constraint {
    public:
        virtual ~Constraint() = default;
        [[nodiscard]] virtual float resolve(const Element& element, const Rect<float>& parent_bounds) const = 0;
    };
}
