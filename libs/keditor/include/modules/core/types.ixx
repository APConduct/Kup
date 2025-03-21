//
// Created by Aidan Jost on 3/21/25.
//

export module keditor.core.types;

export namespace keditor
{
    using Index = size_t;
    using Line = size_t;
    using Column = size_t;

    struct Position
    {
        Index index_{0};
        Line line_{0};
        Column col_{0};
    };

    struct Range {
        Index start_{0};
        Index end_{0};

        [[nodiscard]] bool is_empty() const
        {
            return start_ == end_;
        }

        [[nodiscard]] Index length() const
        {
            return end_ - start_;
        }
    };
}
