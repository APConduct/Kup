//
// Created by Aidan Jost on 3/21/25.
//

module;
#include <stack>
#include <string>
#include <vector>
export module keditor.buffer.piece_table;
import keditor.core.types;

export namespace keditor
{

    template<typename CharT>
    class PieceTable {
    private:
        using string_type = std::basic_string<CharT>;

        struct Piece {
            bool is_original_{};
            Index start_{};
            Index length_{};

            Piece(bool orig, Index s, Index len) : is_original_(orig), start_(s), length_(len) {}

            string_type get_text(const string_type& original, const string_type& added) const
            {
                const auto& source = is_original_ ? original : added;
                return source.substr(start_, length_);
            }
        };

        public:
            class Command {
            public:
                virtual ~Command() = default;
                virtual void execute() = 0;
                virtual void undo() = 0;
                [[nodiscard]] virtual string_type description() const = 0;
            };

            class InsertCommand : public Command {
                PieceTable& table_;
                Index pos_{};
                string_type text_;
                std::vector<Piece> old_pieces_;
                size_t old_add_buffer_size_;

            public:
                InsertCommand(PieceTable& t, Index pos, const string_type& text)
                    : table_(t),
                    pos_(pos),
                    text_(text),
                    old_pieces_(t.pieces_),
                    old_add_buffer_size_(t.add_buffer_.size()) {}

                void execute() override
                {
                    table_.insert_without_undo(pos_, text_);
                }

                void undo() override {
                    table_.pieces_ = old_pieces_;
                    table_.add_buffer_.resize(old_add_buffer_size_);
                }

                string_type description() const override {
                    return string_type("Insert ") + std::to_string(text_.length());
                }
            };

        class DeleteCommand : public Command {
            PieceTable& table_;
            Index start_{};
            Index end_{};
            std::vector<Piece> old_pieces_;
            string_type deleted_text_;

        public:
            DeleteCommand(PieceTable& t, Index start, Index end)
                : table_(t),
                start_(start),
                end_(end),
                old_pieces_(t.pieces_),
                deleted_text_(t.get_text_range(start, end)) {}

            void execute() override {
                table_.remove_without_undo(start_, end_);
            }

            void undo() override {
                table_.pieces_ = old_pieces_;
            }

            string_type description() const override {
                return string_type("Delete ") + std::to_string(end_ - start_);
            }
        };

        string_type original_buffer_;
        string_type add_buffer_;
        std::vector<Piece> pieces_;
        std::stack<std::unique_ptr<Command>> undo_stack_;
        std::stack<std::unique_ptr<Command>> redo_stack_;

        void insert_without_undo(Index pos, const string_type& text)
        {
            if (text.empty()) return;
            pos = std::min(pos, get_length());

            Index current_pos = pos;
            size_t piece_idx = 0;

            while (piece_idx < pieces_.size() &&
                current_pos + pieces_[piece_idx].length_ <= pos) {
                current_pos += pieces_[piece_idx].length_;
                piece_idx++;
            }

            std::vector<Piece> new_pieces_;
            new_pieces_.reserve(pieces_.size() + 2);

            for (const auto& piece : pieces_) {
                new_pieces_.push_back(piece);
            }

            if (piece_idx < pieces_.size()) {
                const Piece& current = pieces_[piece_idx];
                Index offset = pos - current_pos;

                if (offset > 0) {
                    new_pieces_.emplace_back(current.is_original_, current.start_, offset);
                }
                new_pieces_.emplace_back(false, add_buffer_.length(), text.length());

                if (offset < current.length_) {
                    new_pieces_.emplace_back(current.is_original_, current.start_ + offset, current.length_ - offset);
                }

                for (size_t i = piece_idx + 1; i < pieces_.size(); i++) {
                    new_pieces_.push_back(pieces_[i]);
                }

            } else {
                new_pieces_.emplace_back(false, add_buffer_.length(), text.length());
            }
            add_buffer_ += text;
            pieces_ = std::move(new_pieces_);
        }

        void remove_without_undo(Index pos) {
            if (pos >= get_length()) return;

            Index current_pos = 0;
            size_t piece_idx = 0;

            while (piece_idx < pieces_.size() &&
                current_pos + pieces_[piece_idx].length_ <= pos) {
                current_pos += pieces_[piece_idx].length_;
                piece_idx++;
            }

            std::vector<Piece> new_pieces_;
            new_pieces_.reserve(pieces_.size() + 2);

            for (size_t i = 0; i < piece_idx; i++) {
                new_pieces_.push_back(pieces_[i]);
            }

            if (piece_idx < pieces_.size()) {
                const Piece& current = pieces_[piece_idx];
                Index offset = pos - current_pos;

                if (offset > 0) {
                    new_pieces_.emplace_back(current.is_original_, current.start_, offset);
                }

                if (offset < current.length_) {
                    new_pieces_.emplace_back(current.is_original_, current.start_ + offset, current.length_ - offset);
                }

                for (size_t i = piece_idx + 1; i < pieces_.size(); i++) {
                    new_pieces_.push_back(pieces_[i]);
                }
            }

            pieces_ = std::move(new_pieces_);
        }

    public:
        explicit PieceTable(string_type initial = "")
            : original_buffer_(std::move(initial))
        {
            if (!original_buffer_.empty())
            {
                pieces_.emplace_back(true, 0, original_buffer_.size());
            }
        }

        void insert(Index pos, const string_type& text) {
            auto cmd = std::make_unique<InsertCommand>(*this, pos, text);
            cmd->execute();
            undo_stack_.push(std::move(cmd));
            redo_stack_ = {};
        }

        void remove(Index start, Index end) {
            if (start >= end || start >= get_length()) return;
            end = std::min(end, get_length());

            auto cmd = std::make_unique<DeleteCommand>(*this, start, end);
            cmd->execute();
            undo_stack_.push(std::move(cmd));
            redo_stack_ = {};

        }

        string_type get_text() const {
            string_type result;
            result.reserve(get_length());

            for (const auto& piece : pieces_) {
                result += piece.get_text(original_buffer_, add_buffer_);
            }

            return result;
        }

        string_type get_text_range(Index start, Index end) const {
            if (start >= end) return {};

            string_type result;
            Index current_pos = 0;

            for (const auto& piece : pieces_) {
                Index piece_end = current_pos + piece.length_;

                if (current_pos < end && piece_end > start) {
                    Index piece_start = std::max(current_pos, start);
                    Index piece_length = std::min(piece_end, end) - piece_start;
                    result += piece.get_text(original_buffer_, add_buffer_).substr(piece_start - current_pos, piece_length);
                }
                current_pos = piece_end;
                if (current_pos >= end) break;
            }
            return result;
        }

        [[nodiscard]] Index get_length() const {
            Index total = 0;
            for (const auto& piece : pieces_) {
                total += piece.length_;
            }
            return total;
        }

        void undo() {
            if (undo_stack_.empty()) return;

            auto cmd = std::move(undo_stack_.top());
            undo_stack_.pop();
            cmd->undo();
            redo_stack_.push(std::move(cmd));
        }

        void redo() {
            if (redo_stack_.empty()) return;

            auto cmd = std::move(redo_stack_.top());
            redo_stack_.pop();
            cmd->execute();
            undo_stack_.push(std::move(cmd));
        }

    };

};


