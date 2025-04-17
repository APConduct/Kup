/// @file piece_table.ixx
/// @brief Piece Table implementation for keditor

module;
#include <stack>
#include <string>
#include <vector>
export module keditor.buffer.piece_table;
import keditor.core.types;
import keditor.buffer.traits;
import plastic.command;

export namespace keditor::piece
{
    /**
     * @brief Represents a piece table for managing text buffers efficiently.
     *
     * The piece table is a data structure used for text editing. It maintains
     * references to the original text and any added text, allowing efficient
     * insertions, deletions, and modifications without copying large amounts
     * of data.
     *
     * @tparam CharT The character type used in the text buffer.
     */
    template<typename CharT>
    struct Table {
        using Traits = buffer::Traits<CharT>;
        using char_type = typename Traits::char_type;
        using string_type = typename Traits::string_type;

    protected:
        /**
         * @brief Represents a single piece in the piece table.
         *
         * A piece is a reference to a segment of text, either from the original
         * buffer or the added buffer.
         */
        struct Piece {
        protected:
            bool is_original_{}; ///< Indicates if the piece is from the original buffer.
            Index start_{};      ///< The starting index of the piece in the buffer.
            Index length_{};     ///< The length of the piece.

        public:
            /// @return True if the piece is from the original buffer, false otherwise.
            [[nodiscard]] bool is_original() const { return is_original_; }

            /// @return The starting index of the piece in the buffer.
            [[nodiscard]] Index start() const { return start_; }

            /// @return The length of the piece.
            [[nodiscard]] Index length() const { return length_; }

            /// @brief Sets whether the piece is from the original buffer.
            /// @param is_original True if the piece is from the original buffer.
            /// @return Reference to the current Piece object.
            Piece& is_original(bool is_original) {
                is_original_ = is_original;
                return *this;
            }

            /// @brief Sets the starting index of the piece.
            /// @param start The starting index.
            /// @return Reference to the current Piece object.
            Piece& start(Index start) {
                start_ = start;
                return *this;
            }

            /// @brief Sets the length of the piece.
            /// @param length The length of the piece.
            /// @return Reference to the current Piece object.
            Piece& length(Index length) {
                length_ = length;
                return *this;
            }

            /// @brief Default constructor.
            Piece() = default;

            /**
             * @brief Constructs a Piece object.
             * @param is_original True if the piece is from the original buffer.
             * @param start The starting index of the piece.
             * @param length The length of the piece.
             */
            Piece(bool is_original, Index start, Index length)
                : is_original_(is_original), start_(start), length_(length) {}

            /**
             * @brief Retrieves the text represented by the piece.
             * @param original The original buffer.
             * @param add The added buffer.
             * @return The text represented by the piece.
             */
            [[nodiscard]] string_type text(
                const string_type& original,
                const string_type& add
                ) const {
                const auto& source = is_original_ ? original : add;
                return source.substr(start_, length_);
            }
        };

        string_type original_buffer_{}; ///< The original text buffer.
        string_type add_buffer_{};      ///< The added text buffer.
        std::vector<Piece> pieces_{};  ///< The list of pieces in the piece table.
        plastic::CommandManager command_manager_{}; ///< Manages undo/redo commands.

    public:
        /**
         * @brief Represents a cache for line information.
         *
         * The line cache stores the starting indices of lines in the text
         * and provides efficient access to line-related information.
         */
        struct LineCache {
        protected:
            std::vector<Index> line_starts_{}; ///< The starting indices of lines.
            bool is_dirty_{true};              ///< Indicates if the cache is dirty.

        public:
            /// @return The starting indices of lines.
            [[nodiscard]] std::vector<Index> line_starts() const { return line_starts_; }

            /// @return True if the cache is dirty, false otherwise.
            [[nodiscard]] bool is_dirty() const { return is_dirty_; }

            /// @brief Sets the starting indices of lines.
            /// @param starts The starting indices.
            /// @return Reference to the current LineCache object.
            LineCache& line_starts(const std::vector<Index>& starts) {
                line_starts_ = starts;
                return *this;
            }

            /// @brief Sets the dirty state of the cache.
            /// @param dirty True if the cache is dirty.
            /// @return Reference to the current LineCache object.
            LineCache& is_dirty(bool dirty) {
                is_dirty_ = dirty;
                return *this;
            }

            /// @brief Invalidates the cache, marking it as dirty.
            void invalidate() {
                is_dirty_ = true;
            }

            /**
             * @brief Updates the line cache based on the given text.
             * @param text The text to analyze for line starts.
             */
            void update(const string_type& text) {
                if (!is_dirty_) {
                    return;
                }

                line_starts_.clear();
                line_starts_.push_back(0); // First line always starts at 0

                for (Index i = 0; i < text.length(); ++i) {
                    if (Traits::is_newline(text[i])) {
                        line_starts_.push_back(i+1);
                    }
                }

                is_dirty_ = false;
            }

            /// @return The number of lines in the text.
            [[nodiscard]] Index line_count() const {
                return line_starts_.size();
            }

            /**
             * @brief Retrieves the starting index of a specific line.
             * @param line The line number.
             * @return The starting index of the line.
             */
            [[nodiscard]] Index line_start(Index line) const {
                return line < line_starts_.size()
                    ? line_starts_[line]
                    : line_starts_.empty() ? 0 : line_starts_.back();
            }

            /**
             * @brief Converts a character index to a line and column position.
             * @param index The character index.
             * @param text The text buffer.
             * @return The position (line and column) corresponding to the index.
             */
            [[nodiscard]] Position index_to_position(Index index, const string_type& text) const {
                // Binary search to find line containing the index
                auto it = std::upper_bound(line_starts_.begin(), line_starts_.end(), index);
                Line line = std::distance(line_starts_.begin(), it) - 1;

                // Column is offset from the start of the line
                Column column = index - line_starts_[line];

                return Position(index, line, column);
            }
        };

    protected:
        LineCache line_cache_; ///< Cache for line-related information.

    public:
        /// @return The original text buffer.
        [[nodiscard]] string_type original_buffer() const { return original_buffer_; }

        /// @return The added text buffer.
        [[nodiscard]] string_type add_buffer() const { return add_buffer_; }

        /// @return The list of pieces in the piece table.
        const std::vector<Piece>& pieces() { return pieces_; }

        void update_pieces(const std::function<void(std::vector<Piece>&)>& updater) {
            updater(pieces_);
            line_cache_.invalidate();
        }

        /// @return The command manager for undo/redo operations.
        plastic::CommandManager& command_manager() { return command_manager_; }

        /// @brief Sets the original text buffer.
        /// @param buffer The original text buffer.
        /// @return Reference to the current Table object.
        Table& original_buffer(const string_type& buffer) {
            original_buffer_ = buffer;
            return *this;
        }

        /// @brief Sets the added text buffer.
        /// @param buffer The added text buffer.
        /// @return Reference to the current Table object.
        Table& add_buffer(const string_type& buffer) {
            add_buffer_ = buffer;
            return *this;
        }

        /// @brief Sets the list of pieces in the piece table.
        /// @param pieces The list of pieces.
        /// @return Reference to the current Table object.
        Table& pieces(const std::vector<Piece>& pieces) {
            pieces_ = pieces;
            return *this;
        }

        /// @brief Sets the command manager for undo/redo operations.
        /// @param manager The command manager.
        /// @return Reference to the current Table object.
        Table& command_manager(plastic::CommandManager& manager) {
            command_manager_ = std::move(manager);
            return *this;
        }

    protected:
    /**
     * @brief Command to insert text into the piece table.
     *
     * This command encapsulates the logic for inserting text at a specific position
     * in the piece table, supporting undo and redo operations.
     */
    struct InsertCommand : plastic::Command {
    private:
        Table& table_; ///< Reference to the piece table.

        Index pos_{}; ///< Position where the text will be inserted.

        string_type text_{}; ///< The text to be inserted.

        std::vector<Piece> old_pieces_; ///< Backup of the original pieces before insertion.

        size_t old_add_buffer_size_{}; ///< Backup of the size of the added buffer before insertion.

    public:
        /// @brief Default constructor.
        InsertCommand() = default;

        /**
         * @brief Constructs an InsertCommand.
         * @param table Reference to the piece table.
         * @param pos Position where the text will be inserted.
         * @param text The text to be inserted.
         */
        InsertCommand(Table& table, Index pos, const string_type& text)
            : table_(table), pos_(pos), text_(text), old_pieces_(table.pieces()), old_add_buffer_size_(table.add_buffer().length()) {}

        /// @return Reference to the piece table.
        Table& table() { return table_; }

        /// @return The position where the text will be inserted.
        [[nodiscard]] Index pos() const { return pos_; }

        /// @return The text to be inserted.
        [[nodiscard]] const string_type& text() const { return text_; }

        /// @return Backup of the original pieces before insertion.
        std::vector<Piece>& old_pieces() { return old_pieces_; }

        /// @return Backup of the size of the added buffer before insertion.
        size_t& old_add_buffer_size() { return old_add_buffer_size_; }

        /// @brief Executes the insert command.
        void execute() override {
            table_.insert_without_undo(pos_, text_);
        };

        /// @brief Undoes the insert command.
        void undo() override {
            table_.pieces(old_pieces_);
            table_.add_buffer_.resize(old_add_buffer_size_);
        }

        /// @return The name of the command.
        [[nodiscard]] std::string name() const override {
            return "Insert Text";
        };
    };

    /**
     * @brief Command to delete text from the piece table.
     *
     * This command encapsulates the logic for deleting text within a specific range
     * in the piece table, supporting undo and redo operations.
     */
    struct DeleteCommand : plastic::Command {
    protected:
        Table& table_; ///< Reference to the piece table.
        Index start_{}; ///< Start position of the text to be deleted.
        Index end_{}; ///< End position of the text to be deleted.
        std::vector<Piece> old_pieces_; ///< Backup of the original pieces before deletion.
        string_type delete_text_{}; ///< The text that was deleted.

    public:
        /// @brief Default constructor.
        DeleteCommand() = default;

        /**
         * @brief Constructs a DeleteCommand.
         * @param table Reference to the piece table.
         * @param start Start position of the text to be deleted.
         * @param end End position of the text to be deleted.
         */
        DeleteCommand(Table& table, Index start, Index end)
            : table_(table), start_(start), end_(end), old_pieces_(table.pieces()), delete_text_(table.text_range(start, end)) {}

        /// @brief Executes the delete command.
        void execute() override {
            table_.remove_without_undo(start_, end_);
        };

        /// @brief Undoes the delete command.
        void undo() override {
            table_.pieces(old_pieces_);
        };

        /// @return The name of the command.
        [[nodiscard]] std::string name() const override {
            return "Delete Text";
        };
    };

    /**
     * @brief Inserts text into the piece table without creating an undo command.
     * @param pos Position where the text will be inserted.
     * @param text The text to be inserted.
     */
    void insert_without_undo(Index pos, const string_type& text) {
        if (text.empty()) { return; }
        pos = std::min(pos, length());

        Index current_pos = 0;
        size_t piece_idx = 0;

        while (piece_idx < pieces_.size() && current_pos + pieces_[piece_idx].length() <= pos) {
            current_pos += pieces_[piece_idx].length();
            piece_idx++;
        }

        std::vector<Piece> new_pieces;
        new_pieces.reserve(pieces_.size() + 2);

        // Copy pieces before split point
        for (size_t i = 0; i < piece_idx; ++i) {
            new_pieces.push_back(pieces_[i]);
        }

        // Split the piece if inserting in the middle
        if (piece_idx < pieces_.size()) {
            const Piece& current = pieces_[piece_idx];
            Index offset = pos - current_pos;

            if (offset > 0) {
                new_pieces.emplace_back(current.is_original(),
                    current.start(),
                    offset);
            }

            // Insert new piece for added text
            new_pieces.emplace_back(false, add_buffer_.length(), text.length());

            if (offset < current.length()) {
                new_pieces.emplace_back(current.is_original(), current.start() + offset, current.length() - offset);
            }

            // Copy remaining pieces
            for (size_t i = piece_idx; i < pieces_.size(); ++i) {
                new_pieces.push_back(pieces_[i]);
            }
        } else {
            // Append to end
            new_pieces.emplace_back(false, add_buffer_.length(), text.length());
        }

        add_buffer_ += text;
        pieces_ = std::move(new_pieces);
        line_cache_.invalidate();
    }

    /**
     * @brief Removes text from the piece table without creating an undo command.
     * @param start Start position of the text to be removed.
     * @param end End position of the text to be removed.
     */
    void remove_without_undo(Index start, Index end) {
        if (start >= end || start >= length()) return;
        end = std::min(end, length());

        // Find pieces that contain the range to remove
        std::vector<Piece> new_pieces;
        Index current_pos = 0;

        for (const auto& piece : pieces_) {
            Index piece_end = current_pos + piece.length();

            if (
                // Piece is before deletion range - keep it
                piece_end <= start
                // Piece is after deletion range - keep it
                || current_pos >= end
                ) {
                new_pieces.push_back(piece);
            } else {
                // Pieces overlap with deletion range
                if (current_pos < start) {
                    // Keep the part before the deletion range
                    Index keep_len = start - current_pos;
                    new_pieces.emplace_back(piece.is_original(), piece.start(), keep_len);
                }

                if (piece_end > end) {
                    // Keep the part after the deletion range
                    Index offset = end - current_pos;
                    Index keep_len = piece_end - end;
                    new_pieces.emplace_back(piece.is_original(), piece.start() + offset, keep_len);
                }
            }
            current_pos = piece_end;
        }
        pieces_ = std::move(new_pieces);
        line_cache_.invalidate();
    }

public:
    /// @brief Default constructor for the Table.
    Table() = default;

    /**
     * @brief Constructs a Table with an initial text buffer.
     * @param initial The initial text buffer.
     */
    explicit Table(string_type initial = {})
        : original_buffer_(std::move(initial)) {
        if (!original_buffer_.empty()) {
            pieces_.emplace_back(true, 0, original_buffer_.length());
        }
        line_cache_.invalidate();
    }

    /**
     * @brief Calculates the total length of the text in the piece table.
     * @return The total length of the text.
     */
    [[nodiscard]] Index length() const {
        Index total = 0;
        for (const auto& piece : pieces_) {
            total += piece.length();
        }
        return total;
    }

    /**
     * @brief Inserts text into the piece table.
     * @param pos Position where the text will be inserted.
     * @param text The text to be inserted.
     */
    void insert(Index pos, const string_type& text) {
        command_manager_.execute(std::make_unique<InsertCommand>(*this, pos, text));
    }

    /**
     * @brief Removes text from the piece table.
     * @param start Start position of the text to be removed.
     * @param end End position of the text to be removed.
     */
    void remove(Index start, Index end) {
        if (start >= end || start >= length()) return;
        end = std::min(end, length());

        command_manager_.execute(std::make_unique<DeleteCommand>(*this, start, end));
    }

    /**
     * @brief Replaces text in a specified range with new text.
     * @param range The range of text to be replaced.
     * @param text The new text to replace the old text.
     */
    void replace(Range range, const string_type& text) {
        command_manager_.begin_batch();
        remove(range.start(), range.end());
        insert(range.start(), text);
        command_manager_.end_batch();
    }

    /**
     * @brief Retrieves the entire text from the piece table.
     * @return The concatenated text from all pieces.
     */
    [[nodiscard]] string_type text() const {
        string_type result;
        result.reserve(length());

        for (const auto& piece : pieces_) {
            result += piece.get_text(original_buffer_, add_buffer_);
        }

        return result;
    }

    /**
     * @brief Retrieves a range of text from the piece table.
     * @param start Start position of the range.
     * @param end End position of the range.
     * @return The text within the specified range.
     */
    [[nodiscard]] string_type text_range(Index start, Index end) const {
        if (start >= end) return {};

        string_type result;
        Index current_pos = 0;

        for (const auto& piece : pieces_) {
            Index piece_end = current_pos + piece.length();

            if (current_pos < end && piece_end > start) {
                Index piece_start = std::max(start - current_pos, Index{0});
                Index piece_length = std::min(piece.length() - piece_start, end - (current_pos + piece_start));

                result += piece.get_text(original_buffer_, add_buffer_).substr(piece_start, piece_length);
            }
            current_pos = piece_end;
            if (current_pos >= end) break;
        }
        return result;
    }

private:
    /**
     * @brief Ensures the line cache is updated.
     *
     * This method updates the line cache if it is marked as dirty.
     */
    void ensure_line_cache_updated() {
        if (line_cache_.is_dirty_) {
            line_cache_.update(text());
        }
    }

public:

    /**
     * @brief Retrieves the total number of lines in the text.
     * @return The number of lines.
     */
    Line line_count() {
        ensure_line_cache_updated();
        return line_cache_.line_count();
    }

    /**
     * @brief Converts a character index to a line and column position.
     * @param index The character index.
     * @return The corresponding line and column position.
     */
    Position index_to_position(Index index) const {
        ensure_line_cache_updated();
        return line_cache_.index_to_position(index, text());
    }

    /**
     * @brief Converts a line and column position to a character index.
     * @param line The line number.
     * @param column The column number.
     * @return The corresponding character index.
     */
    Index position_to_index(Line line, Column column) {
        ensure_line_cache_updated();

        if (line >= line_cache_.line_count()) {
            // If line is out of bounds, return the end of the text
            return length();
        }

        Index line_start = line_cache_.line_start(line);

        // Get the entire line
        Line next_line = line + 1;
        Index line_end = next_line < line_cache_.line_count()
            ? line_cache_.line_start(next_line) - 1 // Exclude newline
            : length();

        // Limit column to line length
        column = std::min(column, line_end - line_start);

        return line_start + column;
    }

    /**
     * @brief Retrieves the text of a specific line.
     * @param line The line number.
     * @return The text of the specified line.
     */
    string_type line(Line line) {
        ensure_line_cache_updated();

        // Early return if line is out of bounds
        if (line >= line_cache_.line_count()) { return {}; }

        Index start = line_cache_.line_start(line);
        Line next_line = line + 1;
        Index end = next_line < line_cache_.line_count()
            ? line_cache_.line_start(next_line)
            : length();

        auto line_text = text_range(start, end);

        // Remove trailing newline if present
        if (!line_text.empty() && Traits:: is_newline(line_text.back())) {
            line_text.pop_back();
        }
        return line_text;
    }

    /**
     * @brief Undoes the last command.
     */
    void undo() {
        if (command_manager_.can_undo()) {
            command_manager_.undo();
            line_cache_.invalidate();
        }
    }

    /**
     * @brief Redoes the last undone command.
     */
    void redo() {
        if (command_manager_.can_redo()) {
            command_manager_.redo();
            line_cache_.invalidate();
        }
    }

    /**
     * @brief Checks if an undo operation is possible.
     * @return True if undo is possible, false otherwise.
     */
    [[nodiscard]] bool can_undo() const {
        return command_manager_.can_undo();
    }

    /**
     * @brief Checks if a redo operation is possible.
     * @return True if redo is possible, false otherwise.
     */
    [[nodiscard]] bool can_redo() const {
        return command_manager_.can_redo();
    }

    /**
     * @brief Finds the next occurrence of a search string.
     * @param search The string to search for.
     * @param start_pos The position to start the search from.
     * @return The index of the next occurrence, or string_type::npos if not found.
     */
    [[nodiscard]] Index find_next(const string_type& search, Index start_pos = 0) const {
        if (search.empty() || start_pos >= length()) {
            return string_type::npos;
        }

        string_type text = this->text();
        return text.find(search, start_pos);
    }

    /**
     * @brief Finds the previous occurrence of a search string.
     * @param search The string to search for.
     * @param start_pos The position to start the search from.
     * @return The index of the previous occurrence, or string_type::npos if not found.
     */
    [[nodiscard]] Index find_prev(const string_type& search, Index start_pos) const {
        if (search.empty() || start_pos == 0) {
            return string_type::npos;
        }

        string_type text = this->text();
        return text.rfind(search, start_pos - 1);
    }

    /**
     * @brief Finds the start of the word at or before a given position.
     * @param pos The position to search from.
     * @return The index of the start of the word.
     */
    [[nodiscard]] Index find_word_start(Index pos) const {
        if (pos == 0) return 0;

        string_type text = text();
        if (pos > text.length()) {
            pos = text.length();
        }

        // Skip whitespace backward
        while (pos > 0 && Traits::is_whitespace(text[pos - 1])) {
            --pos;
        }

        // Find start of word
        while (pos > 0 && Traits::is_word_char(text[pos - 1])) {
            --pos;
        }
        return pos;
    }

    /**
     * @brief Finds the end of the word at or after a given position.
     * @param pos The position to search from.
     * @return The index of the end of the word.
     */
    [[nodiscard]] Index find_word_end(Index pos) const {
        string_type text = text();

        if (pos >= text.length()) {
            return text.length();
        }

        // Skip whitespace forward
        while (pos < text.length() && Traits::is_whitespace(text[pos])) {
            ++pos;
        }

        // Find end of word
        while (pos < text.length() && Traits::is_word_char(text[pos])) {
            ++pos;
        }

        return pos;
    }
    };
}

export namespace keditor
{
    namespace text
    {
        /// @brief Type alias for the piece table using char type.
        using PieceTable = piece::Table<char>;

        namespace piece
        {
            /// @brief Type alias for the piece table using char type.
            using Table = keditor::piece::Table<char>;
        }
    }

    namespace utf8
    {
        /// @brief Type alias for the piece table using char8_t type.
        using PieceTable = piece::Table<char8_t>;

        namespace piece
        {
            using Table = keditor::piece::Table<char8_t>;
        }
    }

    namespace utf16
    {
        /// @brief Type alias for the piece table using char16_t type.
        using PieceTable = piece::Table<char16_t>;

        namespace piece
        {
            using Table = keditor::piece::Table<char16_t>;
        }
    }

    namespace utf32
    {
        /// @brief Type alias for the piece table using char32_t type.
        using PieceTable = piece::Table<char32_t>;

        namespace piece
        {
            using Table = keditor::piece::Table<char32_t>;
        }
    }
}