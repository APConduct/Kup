//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECE_TABLE_HPP
#define PIECE_TABLE_HPP
#include <algorithm>
#include <cstddef>
#include <string>
#include <utility>
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
        bool isOriginal;
        size_t start;
        size_t length;

        Piece(bool orig, size_t s, size_t len)
            : isOriginal(orig), start(s), length(len) {}
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
        std::vector<Piece> oldPieces;
        size_t addBufferLengthBefore;

    public:
        InsertCommand(PieceTable& t, size_t pos, std::string  txt)
            : table(t), position(pos), text(std::move(txt)) {
            oldPieces = table.pieces;
            addBufferLengthBefore = table.addBuffer.length();
        }

        void execute() override {
            table.insert_without_undo(position, text);
        }

        void undo() override {
            table.addBuffer.resize(addBufferLengthBefore);
            table.pieces = oldPieces;
        }
    };

    // Delete command
    class DeleteCommand : public Command {
        PieceTable& table;
        size_t start;
        size_t end;
        std::vector<Piece> oldPieces;
        size_t old_total_length;

    public:
        DeleteCommand(PieceTable& t, size_t s, size_t e)
            : table(t), start(s), end(e) {
            oldPieces = table.pieces;
            old_total_length = table.total_length;
        }

        void execute() override {
            table.remove_without_undo(start, end);
        }

        void undo() override {
            table.pieces = oldPieces;
            table.total_length = old_total_length;
            table.line_cache.invalidate();
        }
    };

    std::string originalBuffer;
    std::string addBuffer;
    std::vector<Piece> pieces;
    std::stack<std::unique_ptr<Command>> undoStack;
    std::stack<std::unique_ptr<Command>> redoStack;

    // Helper method to get text range

public:

    // Internal insert without recording undo
    void insert_without_undo(size_t pos, const std::string& text) {
        if (text.empty()) return;

        // Endure position is valid
        pos = std::min(pos, total_length);

        size_t currentPos = 0;
        size_t pieceIndex = 0;

        while (pieceIndex < pieces.size() && currentPos + pieces[pieceIndex].length <= pos) {
            currentPos += pieces[pieceIndex].length;
            pieceIndex++;
        }

        std::vector<Piece> newPieces;

        for (size_t i = 0; i < pieceIndex; i++) {
            newPieces.push_back(pieces[i]);
        }

        if (pieceIndex < pieces.size()) {
            Piece& currentPiece = pieces[pieceIndex];
            size_t offset = pos - currentPos;

            if (offset > 0) {
                newPieces.emplace_back(currentPiece.isOriginal,
                                     currentPiece.start,
                                     offset);
            }

            newPieces.emplace_back(false,
                                 addBuffer.length(),
                                 text.length());

            if (offset < currentPiece.length) {
                newPieces.emplace_back(currentPiece.isOriginal,
                                     currentPiece.start + offset,
                                     currentPiece.length - offset);
            }

            for (size_t i = pieceIndex + 1; i < pieces.size(); i++) {
                newPieces.push_back(pieces[i]);
            }
        } else {
            newPieces.emplace_back(false,
                                 addBuffer.length(),
                                 text.length());
        }

        addBuffer += text;
        pieces = std::move(newPieces);

        total_length += text.length();
        line_cache.invalidate();
    }

    // Internal remove without recording undo
    void remove_without_undo(size_t start, size_t end) {
        if (start >= end || start >= total_length) return;

        // Clamp end position to validate range
        end = std::min(end, total_length);

        size_t currentPos = 0;
        size_t startPiece = 0;

        // Find start piece
        while (startPiece < pieces.size() && currentPos + pieces[startPiece].length <= start) {
            currentPos += pieces[startPiece].length;
            startPiece++;
        }

        std::vector<Piece> newPieces;

        // Copy pieces before deletion
        for (size_t i = 0; i < startPiece; i++) {
            newPieces.push_back(pieces[i]);
        }

        if (startPiece < pieces.size()) {
            size_t startOffset = start - currentPos;

            if (startOffset > 0) {
                // Keep the first part of the start piece
                newPieces.emplace_back(pieces[startPiece].isOriginal,
                                     pieces[startPiece].start,
                                     startOffset);
            }

            // Skip pieces until we reach the end position
            size_t endPiece = startPiece;
            while (endPiece < pieces.size() && currentPos + pieces[endPiece].length <= end) {
                currentPos += pieces[endPiece].length;
                endPiece++;
            }

            if (endPiece < pieces.size() && currentPos < end) {
                size_t endOffset = end - currentPos;
                if (endOffset < pieces[endPiece].length) {
                    // Keep the last part of the end piece
                    newPieces.emplace_back(pieces[endPiece].isOriginal,
                                         pieces[endPiece].start + endOffset,
                                         pieces[endPiece].length - endOffset);
                }
            }

            // Add remaining pieces
            for (size_t i = endPiece + 1; i < pieces.size(); i++) {
                newPieces.push_back(pieces[i]);
            }
        }

        pieces = std::move(newPieces);

        total_length -= (end - start);
        line_cache.invalidate();

    }

    explicit PieceTable(const std::string& initial = "") : originalBuffer(initial) {
        if (!initial.empty()) {
            pieces.emplace_back(true, 0, initial.length());
        }
    }

    void insert(size_t pos, const std::string& text) {
        auto cmd = std::make_unique<InsertCommand>(*this, pos, text);
        cmd->execute();
        undoStack.push(std::move(cmd));

        // Clear redo stack when new action is performed
        while (!redoStack.empty()) {
            redoStack.pop();
        }
    }

    void remove(size_t start, size_t end) {
        auto cmd = std::make_unique<DeleteCommand>(*this, start, end);
        cmd->execute();
        undoStack.push(std::move(cmd));

        // Clear redo stack when new action is performed
        while (!redoStack.empty()) {
            redoStack.pop();
        }
    }

    [[nodiscard]] bool canUndo() const {
        return !undoStack.empty();
    }

    [[nodiscard]] bool canRedo() const {
        return !redoStack.empty();
    }

    void undo() {
        if (!canUndo()) return;

        auto cmd = std::move(undoStack.top());
        undoStack.pop();
        cmd->undo();
        redoStack.push(std::move(cmd));
    }

    void redo() {
        if (!canRedo()) return;

        auto cmd = std::move(redoStack.top());
        redoStack.pop();
        cmd->execute();
        undoStack.push(std::move(cmd));
    }

    [[nodiscard]] std::string get_text() const {
        std::string result;
        for (const auto& piece : pieces) {
            const std::string& buffer = piece.isOriginal ? originalBuffer : addBuffer;
            result += buffer.substr(piece.start, piece.length);
        }
        return result;
    }
    [[nodiscard]] std::string get_text_in_range(size_t start, size_t end) const {
        std::string result;
        size_t currentPos = 0;

        for (const auto& piece : pieces) {
            size_t pieceEnd = currentPos + piece.length;

            if (currentPos < end && pieceEnd > start) {
                size_t pieceStart = std::max(start - currentPos, static_cast<size_t>(0));
                size_t pieceLength = std::min(piece.length - pieceStart,
                                            end - (currentPos + pieceStart));

                const std::string& buffer = piece.isOriginal ? originalBuffer : addBuffer;
                result += buffer.substr(piece.start + pieceStart, pieceLength);
            }

            currentPos = pieceEnd;
            if (currentPos >= end) break;
        }

        return result;
    }

};

#endif //PIECE_TABLE_HPP
