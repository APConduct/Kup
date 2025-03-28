//
// Created by Aidan Jost on 3/28/25.
//

export module plastic.constrain_anchor;

export namespace plastic
{
    enum class ConstraintAnchor {
        Left,
        Right,
        Top,
        Bottom,
        CenterX,
        CenterY,
        Width,
        Height
    };
}