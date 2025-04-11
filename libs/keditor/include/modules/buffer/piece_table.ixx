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
    template<typename CharT>
    struct Table {
        using Traits = buffer::Traits<CharT>;

        using char_type = typename Traits::char_type;

        using string_type = typename Traits::string_type;

    protected:

        struct Piece {
        protected:
            bool is_original_{};
            Index start_{};
            Index length_{};
        public:
            [[nodiscard]] bool is_original() const { return is_original_; }

            [[nodiscard]] Index start() const { return start_; }

            [[nodiscard]] Index length() const { return length_; }

            Piece& is_original(bool is_original) {
                is_original_ = is_original;
                return *this;
            }

            Piece& start(Index start) {
                start_ = start;
                return *this;
            }

            Piece& length(Index length) {
                length_ = length;
                return *this;
            }

            Piece() = default;

            Piece(bool is_original, Index start, Index length)
                : is_original_(is_original), start_(start), length_(length) {}

            [[nodiscard]] string_type text(
                const string_type& original,
                const string_type& add
                ) const {
                const auto& source = is_original_ ? original : add;
                return source.substr(start_, length_);
            }
        };

        string_type original_buffer_{};

        string_type add_buffer_{};

        std::vector<Piece> pieces_{};

        plastic::CommandManager command_manager_{};

    public:

        struct LineCache {
        protected:
            std::vector<Index> line_starts_{};

            bool is_dirty_{true};

        public:

            [[nodiscard]] std::vector<Index> line_starts() const { return line_starts_; }

            [[nodiscard]] bool is_dirty() const { return is_dirty_; }

            LineCache& line_starts(const std::vector<Index>& starts) {
                line_starts_ = starts;
                return *this;
            }

            LineCache& is_dirty(bool dirty) {
                is_dirty_ = dirty;
                return *this;
            }

            void invalidate() {
                is_dirty_ = true;
            }

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

            [[nodiscard]] Index line_count() const {
                return line_starts_.size();
            }

            [[nodiscard]] Index line_start(Index line) const {
                return line < line_starts_.size()
                    ? line_starts_[line]
                    : line_starts_.empty() ? 0 : line_starts_.back();
            }

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
        LineCache line_cache_;

    public:

        [[nodiscard]] string_type original_buffer() const { return original_buffer_; }

        [[nodiscard]] string_type add_buffer() const { return add_buffer_; }

        std::vector<Piece>& pieces() { return pieces_; }

        plastic::CommandManager& command_manager() { return command_manager_; }

        Table& original_buffer(const string_type& buffer) {
            original_buffer_ = buffer;
            return *this;
        }

        Table& add_buffer(const string_type& buffer) {
            add_buffer_ = buffer;
            return *this;
        }

        Table& pieces(const std::vector<Piece>& pieces) {
            pieces_ = pieces;
            return *this;
        }

        Table& command_manager(plastic::CommandManager& manager) {
            command_manager_ = manager;
            return *this;
        }

    protected:
        struct  InsertCommand : plastic::Command {
        private:
            Table& table_;

            Index pos_{};

            string_type text_{};

            std::vector<Piece> old_pieces_;

            size_t old_add_buffer_size_{};

        public:
            InsertCommand() = default;

            InsertCommand(Table& table, Index pos, const string_type& text)
                : table_(table), pos_(pos), text_(text), old_pieces_(table.pieces()), old_add_buffer_size_(table.add_buffer().length()) {}

            Table& table() { return table_; }

            [[nodiscard]] Index pos() const { return pos_; }

            [[nodiscard]] const string_type& text() const { return text_; }

            std::vector<Piece>& old_pieces() { return old_pieces_; }

            size_t& old_add_buffer_size() { return old_add_buffer_size_; }

            void execute() override {
                table_.insert_without_undo(pos_, text_);
            };

            void undo() override {
                table_.pieces(old_pieces_);
                table_.add_buffer_.resize(old_add_buffer_size_);
            }

            [[nodiscard]] std::string name() const override {
                return "Insert Text";
            };
        };

        struct DeleteCommand : plastic::Command {
        protected:
            Table& table_;
            Index start_{};
            Index end_{};
            std::vector<Piece> old_pieces_;
            string_type delete_text_{};

        public:
            DeleteCommand() = default;
            DeleteCommand(Table& table, Index start, Index end)
                : table_(table), start_(start), end_(end), old_pieces_(table.pieces()), delete_text_(table.text_range(start, end)) {}

            void execute() override {
                table_.remove_without_undo(start_, end_);
            };
            void undo() override {
                table_.pieces(old_pieces_);
            };

            [[nodiscard]] std::string name() const override {
                return "Delete Text";
            };
        };

        void insert_without_undo(Index pos, const string_type& text) {
            if (text.empty()) {return;}
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
        Table() = default;
        explicit Table(string_type initial = {})
            : original_buffer_(std::move(initial)) {
            if (!original_buffer_.empty()) {
                pieces_.emplace_back(true, 0, original_buffer_.length());
            }
            line_cache_.invalidate();
        }

        [[nodiscard]] Index length() const {
            Index total = 0;
            for (const auto& piece : pieces_) {
                total += piece.length();
            }
            return total;
        }

        void insert(Index pos, const string_type& text) {
            command_manager_.execute(std::make_unique<InsertCommand>(*this, pos, text));
        }

        void remove(Index start, Index end) {
            if (start >= end || start >= length()) return;
            end = std::min(end, length());

            command_manager_.execute(std::make_unique<DeleteCommand>(*this, start, end));
        }

        /// Replace text in range with new text
        void replace(Range range, const string_type& text) {
            command_manager_.begin_batch();
            remove(range.start(), range.end());
            insert(range.start(), text);
        }

        [[nodiscard]] string_type text() const {
            string_type result;
            result.reserve(length());

            for (const auto& piece : pieces_) {
                result += piece.get_text(original_buffer_, add_buffer_);
            }

            return result;
        }

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
        void ensure_line_cache_updated() {
            if (line_cache_.is_dirty_) {
                line_cache_.update(text());
            }
        }

    public:

        Line line_count() {
            ensure_line_cache_updated();
            return line_cache_.line_count();
        }

        Position index_to_position(Index index) {
            ensure_line_cache_updated();
            return line_cache_.index_to_position(index, text());
        }

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

        void undo() {
            if (command_manager_.can_undo()) {
                command_manager_.undo();
                line_cache_.invalidate();
            }
        }

        void redo() {
            if (command_manager_.can_redo()) {
                command_manager_.redo();
                line_cache_.invalidate();
            }
        }

        [[nodiscard]] bool can_undo() const {
            return command_manager_.can_undo();
        }

        [[nodiscard]] bool can_redo() const {
            return command_manager_.can_redo();
        }

        [[nodiscard]] Index find_next(const string_type& search, Index start_pos = 0) const {
            if (search.empty() || start_pos >= length()) {
                return string_type::npos;
            }

            string_type text = this->text();
            return text.find(search, start_pos);
        }

        [[nodiscard]] Index find_prev(const string_type& search, Index start_pos) const {
            if (search.empty() || start_pos == 0) {
                return string_type::npos;
            }

            string_type text = this->text();
            return text.rfind(search, start_pos - 1);
        }

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



;


