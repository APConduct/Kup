//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECE_TABLE_HPP
#define PIECE_TABLE_HPP
#include <cstddef>
#include <string>
#include <vector>
#include <memory>
#include <stack>

struct  PieceTable {
private:

    size_t total_length{0};
    struct LineCache{
        std::vector<size_t>line_starts;
        bool is_dirty{true};

        void invalidate(){is_dirty = true;}
        void update(const std::string& text){
            if(!is_dirty)return;
            line_starts.clear();
            line_starts.push_back(0);
            for(size_t i = 0; i < text.length(); i++){
                if( text[i] == '\n')  line_starts.push_back(i+1);

            }
            is_dirty = false;
        }
    }line_cache;



    // Represents a piece of text
    struct Piece {
        bool is_original;
        size_t start;
        size_t length;

        Piece(bool orig, size_t s, size_t len)
            : is_original(orig), start(s), length(len) {}
    };

    // Base class for commands
    class Command {
    public:
        virtual ~Command() = default;
        virtual void execute() = 0;
        virtual void undo() = 0;
    };

    // Insert command
    class InsertCommand : public Command {
        PieceTable& table;
        size_t position;
        std::string text;
        std::vector<Piece> old_pieces;
        size_t add_buffer_length_before;

    public:
        InsertCommand(PieceTable& t, size_t pos, std::string  txt)
            : table(t), position(pos), text(std::move(txt)) {
            old_pieces = table.pieces;
            add_buffer_length_before = table.add_buffer.length();
        }

        void execute() override {
            table.insert_without_undo(position, text);
        }

        void undo() override {
            table.add_buffer.resize(add_buffer_length_before);
            table.pieces = old_pieces;
        }
    };

    // Delete command
    class DeleteCommand : public Command {
        PieceTable& table;
        size_t start;
        size_t end;
        std::vector<Piece> old_pieces;
        size_t old_total_length;

    public:
        DeleteCommand(PieceTable& t, size_t s, size_t e)
            : table(t), start(s), end(e) {
            old_pieces = table.pieces;
            old_total_length = table.total_length;
        }

        void execute() override {
            table.remove_without_undo(start, end);
        }

        void undo() override {
            table.pieces = old_pieces;
            table.total_length = old_total_length;
            table.line_cache.invalidate();
        }
    };

    std::string original_buffer;
    std::string add_buffer;
    std::vector<Piece> pieces;
    std::stack<std::unique_ptr<Command>> undo_stack;
    std::stack<std::unique_ptr<Command>> redo_stack;

    // Helper method to get text range

public:

    // Internal insert without recording undo
    void insert_without_undo(size_t pos, const std::string& text) {
        if (text.empty()) return;

        // Endure position is valid
        pos = std::min(pos, total_length);

        size_t current_pos = 0;
        size_t piece_index = 0;

        while (piece_index < pieces.size() && current_pos + pieces[piece_index].length <= pos) {
            current_pos += pieces[piece_index].length;
            piece_index++;
        }

        std::vector<Piece> new_pieces;

        new_pieces.reserve(piece_index);
        for (size_t i = 0; i < piece_index; i++) {
            new_pieces.push_back(pieces[i]);
        }

        if (piece_index < pieces.size()) {
            Piece& currentPiece = pieces[piece_index];
            size_t offset = pos - current_pos;

            if (offset > 0) {
                new_pieces.emplace_back(currentPiece.is_original,
                                     currentPiece.start,
                                     offset);
            }

            new_pieces.emplace_back(false,
                                 add_buffer.length(),
                                 text.length());

            if (offset < currentPiece.length) {
                new_pieces.emplace_back(currentPiece.is_original,
                                     currentPiece.start + offset,
                                     currentPiece.length - offset);
            }

            for (size_t i = piece_index + 1; i < pieces.size(); i++) {
                new_pieces.push_back(pieces[i]);
            }
        } else {
            new_pieces.emplace_back(false,
                                 add_buffer.length(),
                                 text.length());
        }

        add_buffer += text;
        pieces = std::move(new_pieces);

        total_length += text.length();
        line_cache.invalidate();
    }

    // Internal remove without recording undo
    void remove_without_undo(size_t start, size_t end) {
        if (start >= end || start >= total_length) return;

        // Clamp end position to validate range
        end = std::min(end, total_length);



        std::cout << "Removing from " << start << " to " << end << std::endl;
        std::cout << "Text before: " << get_text() << std::endl;

        std::vector<Piece> new_pieces;
        size_t current_pos = 0;

        for (const auto & current_piece : pieces) {
            size_t piece_end = current_pos + current_piece.length;

            if (piece_end <= start) {
                new_pieces.push_back(current_piece);
                current_pos = piece_end;
                continue;
            }

            if (current_pos >= end) {
                new_pieces.push_back(current_piece);
                current_pos = piece_end;
                continue;
            }

            if (current_pos < start) {
                size_t keep_length = start - current_pos;
                new_pieces.emplace_back(current_piece.is_original,
                                     current_piece.start,
                                     keep_length);
            }

            if (piece_end > end) {
                size_t offset = end - current_pos;
                size_t keep_length = piece_end - end;
                new_pieces.emplace_back(
                    current_piece.is_original,
                    current_piece.start + offset,
                    keep_length);

            }

            current_pos = piece_end;

        }

        pieces = std::move(new_pieces);
        total_length -= (end - start);
        line_cache.invalidate();

        std::cout << "Text after: " << get_text() << std::endl;
    }

    explicit PieceTable(const std::string& initial = "") : original_buffer(initial) {
        if (!initial.empty()) {
            pieces.emplace_back(true, 0, initial.length());
        }
    }

    void insert(size_t pos, const std::string& text) {
        auto cmd = std::make_unique<InsertCommand>(*this, pos, text);
        cmd->execute();
        undo_stack.push(std::move(cmd));

        // Clear redo stack when new action is performed
        while (!redo_stack.empty()) {
            redo_stack.pop();
        }
    }

    void remove(size_t start, size_t end) {
        auto cmd = std::make_unique<DeleteCommand>(*this, start, end);
        cmd->execute();
        undo_stack.push(std::move(cmd));

        // Clear redo stack when new action is performed
        while (!redo_stack.empty()) {
            redo_stack.pop();
        }
    }

    [[nodiscard]] bool can_undo() const {
        return !undo_stack.empty();
    }

    [[nodiscard]] bool can_redo() const {
        return !redo_stack.empty();
    }

    void undo() {
        if (!can_undo()) return;

        auto cmd = std::move(undo_stack.top());
        undo_stack.pop();
        cmd->undo();
        redo_stack.push(std::move(cmd));
    }

    void redo() {
        if (!can_redo()) return;

        auto cmd = std::move(redo_stack.top());
        redo_stack.pop();
        cmd->execute();
        undo_stack.push(std::move(cmd));
    }

    [[nodiscard]] std::string get_text() const {
        std::string result;
        for (const auto& piece : pieces) {
            const std::string& buffer = piece.is_original ? original_buffer : add_buffer;
            result += buffer.substr(piece.start, piece.length);
        }
        return result;
    }
    [[nodiscard]] std::string get_text_in_range(size_t start, size_t end) const {
        std::string result;
        size_t current_pos = 0;

        for (const auto& piece : pieces) {
            size_t piece_end = current_pos + piece.length;

            if (current_pos < end && piece_end > start) {
                size_t pieceStart = std::max(start - current_pos, static_cast<size_t>(0));
                size_t pieceLength = std::min(piece.length - pieceStart,
                                            end - (current_pos + pieceStart));

                const std::string& buffer = piece.is_original ? original_buffer : add_buffer;
                result += buffer.substr(piece.start + pieceStart, pieceLength);
            }

            current_pos = piece_end;
            if (current_pos >= end) break;
        }

        return result;
    }

};

#endif //PIECE_TABLE_HPP
