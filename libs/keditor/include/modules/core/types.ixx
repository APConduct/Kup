/// @file types.ixx
/// @brief Core types for the keditor module

module;
#include <algorithm>

///  @brief Core types module for keditor
export module keditor.core.types;

export namespace keditor
{
    /// @brief Type aliases for buffer indices
    using Index = std::size_t;

    /// @brief Type aliases for line numbers
    using Line = std::size_t;

    /// @brief Type aliases for column numbers
    using Column = std::size_t;

    /// @brief Represents a position in a buffer
    struct Position
    {
    private:
        /// @brief Index of the character in the buffer
        Index index_{0};
        /// @brief Line number in the buffer
        Line line_{0};
        /// @brief Column number in the buffer
        Column col_{0};
    public:
        /// @brief Default constructor
        Position() = default;
        /// @brief Constructor with index, line, and column
        Position(Index idx, Line line, Column col)
            : index_(idx), line_(line), col_(col) {}

        /// @brief Constructor with index, line, and column using rvalue references
        Position(Index idx, Line&& line, Column&& col)
            : index_(idx), line_(line), col_(col) {}


        /// @brief Getter for index
        [[nodiscard]] Index index() const { return index_; }

        /// @brief Getter for line
        [[nodiscard]] Line line() const { return line_; }
        /// @brief Getter for column
        [[nodiscard]] Column col() const { return col_; }

        /// @brief Fluent setter for index
        /// @param index New index
        /// @return Reference to the current Position object
        Position& index(const Index& index) {
            index_ = index;
            return *this;
        }

        /// @brief Fluent setter for line
        /// @param line New line
        /// @return Reference to the current Position object
        Position& line(const Line& line) {
            line_ = line;
            return *this;
        }

        /// @brief Fluent setter for column
        /// @param col New column
        /// @return Reference to the current Position object
        Position& col(const Column& col) {
            col_ = col;
            return *this;
        }

        bool operator==(const Position& other) const = default;
    };

    /// @brief Represents a range of indices in a buffer
    struct Range {
    private:
        /// @brief Start index of the range
        Index start_{0};

        /// @brief End index of the range
        Index end_{0};

    public:
        /// @brief Default constructor
        Range() = default;

        /// @brief Constructor with start and end indices
        Range(const Index& start, const Index& end)
            : start_(start), end_(end) {}

        /// @brief Getter for start index
        [[nodiscard]] Index start() const { return start_; }

        /// @brief Getter for end index
        [[nodiscard]] Index end() const { return end_; }

        /// @brief Fluent setter for start index
        /// @param start New start index
        /// @return Reference to the current Range object
        Range& start(const Index& start)
        {
            start_ = start;
            return *this;
        }

        /// @brief Fluent setter for end index
        /// @param end New end index
        /// @return Reference to the current Range object
        Range & end(const Index& end)
        {
            end_ = std::max(end, start_);
            return *this;
        }

        /// @brief Checks if the range is empty
        [[nodiscard]] bool is_empty() const { return start_ == end_; }

        /// @brief Gets the length of the range
        /// @return Length of the range
        [[nodiscard]] Index length() const { return end_ - start_; }

        bool operator==(const Range& other) const = default;
    };

    /// @brief Represents a selection in a buffer
    struct Selection {
    protected:
        /// @brief Anchor position of the selection
        Position anchor_;

        /// @brief Cursor position of the selection
        Position cursor_;

        /// @brief Active state of the selection
        bool is_active_{};

    public:
        /// @brief Default constructor
        Selection() = default;

        /// @brief Constructor with anchor and cursor positions
        Selection(const Position& anchor, const Position& cursor)
            : anchor_(anchor), cursor_(cursor), is_active_(true) {}

        /// @brief Getter for cursor position
        [[nodiscard]] Position cursor() const { return cursor_; }

        /// @brief Getter for anchor position
        [[nodiscard]] Position anchor() const { return anchor_; }

        /// @brief Getter for active state
        [[nodiscard]] bool is_active() const { return is_active_; }

        Selection& is_active(bool active) {
            is_active_ = active;
            return *this;
        }


        /// @brief Fluent setter for anchor position
        /// @param anchor New anchor position
        /// @return Reference to the current Selection object
        Selection& anchor(const Position& anchor) {
            anchor_ = anchor;
            return *this;
        }

        /// @brief Fluent setter for cursor position
        /// @param cursor New cursor position
        /// @return Reference to the current Selection object
        Selection& cursor(const Position& cursor) {
            cursor_ = cursor;
            return *this;
        }

        /// @brief Fluent setter for active state
        /// @return Reference to the current Selection object
        /// @note There is also an "inactive()" method for deactivating the selection.
        Selection& active() {
            is_active_ = true;
            return *this;
        }

        /// @brief Fluent setter for inactive state
        /// @return Reference to the current Selection object
        /// @note There is also an "active()" method for activating the selection.
        Selection& inactive() {
            is_active_ = false;
            return *this;
        }

        /// @brief Gets the range of the selection
        /// @return Range object representing the selection range
        /// @note If the selection is empty, the range will have the same start and end index.
        [[nodiscard]] Range range() const {
            return {
            std::min(anchor_.index(), cursor_.index()),
            std::max(anchor_.index(), cursor_.index())};
        }

        /// @brief Checks if the selection is empty
        /// @return True if the selection is empty, false otherwise
        [[nodiscard]] bool is_empty() const {
            return anchor_.index() == cursor_.index();
        }
    };
}
