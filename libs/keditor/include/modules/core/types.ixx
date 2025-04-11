//
// Created by Aidan Jost on 3/21/25.
//
module;
#include <algorithm>
export module keditor.core.types;

export namespace keditor
{
    using Index = std::size_t;
    using Line = std::size_t;
    using Column = std::size_t;

    struct Position
    {
    private:
        Index index_{0};
        Line line_{0};
        Column col_{0};
    public:
        Position() = default;
        Position(Index index_, Line&& line_, Column&& col_)
            : index_(index_), line_(line_), col_(col_) {}
        [[nodiscard]] Index index() const { return index_; }
        [[nodiscard]] Line line() const { return line_; }
        [[nodiscard]] Column col() const { return col_; }
        void set_index(const Index& index) { index_ = index; }
        void set_line(const Line& line) { line_ = line; }
        void set_col(const Column& col) { col_ = col; }
        Position& index(const Index& index) {
            index_ = index;
            return *this;
        }
        Position& line(const Line& line) {
            line_ = line;
            return *this;
        }
        Position& col(const Column& col) {
            col_ = col;
            return *this;
        }

        bool operator==(const Position& other) const = default;
    };

    struct Range {
    private:
        Index start_{0};
        Index end_{0};
    public:
        Range() = default;

        Range(const Index& start, const Index& end)
            : start_(start), end_(end) {}


        [[nodiscard]] Index start() const { return start_; }
        [[nodiscard]] Index end() const { return end_; }
        void set_start(const Index& start) { start_ = start; }
        void set_end(const Index& end) { end_ = end; }
        Range& start(const Index& start)
        {
            start_ = start;
            return *this;
        }

        Range & end(const Index& end)
        {
            end_ = end;
            return *this;
        }
        [[nodiscard]] bool is_empty() const { return start_ == end_; }
        [[nodiscard]] Index length() const { return end_ - start_; }
        bool operator==(const Range& other) const = default;
    };

    struct Selection {
        Selection() = default;
        Position anchor_;
        Position cursor_;
        bool is_active_{};

        [[nodiscard]] Range to_range() const {
            return {
            std::min(anchor_.index(), cursor_.index()),
            std::max(anchor_.index(), cursor_.index())};
        }

        [[nodiscard]] bool is_empty() const {
            return anchor_.index() == cursor_.index();
        }
    };
}
