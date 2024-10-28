//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECE_TABLE_HPP
#define PIECE_TABLE_HPP
#include <string>
#include <vector>


struct piece
{


    //index in buffer to start from
    unsigned int start;
    // length from start in buffer
    unsigned int length;
    // buffer the links are stored in

    std::string original;



    piece()
    {
        start = 0;
        length = 1;
        original = "";
    }
};



inline bool pieces_are_equal(const piece &a, const piece &b)
{
    return (a.start == b.start && a.length == b.length && a.original == b.original ? true : false);
}


inline bool operator==(const piece& lhs, const piece& rhs)
{

    return (lhs.start == rhs.start && lhs.length == rhs.length && lhs.original == rhs.original ? true : false);
}

inline bool piece_is_older(const piece& lhs, const piece& rhs)
{
    if (lhs.start < rhs.start)
    {
        return true;
    }
    return false;
}



static piece new_piece(const char *original)
{
    const std::string orig = original;
    piece new_piece;
    new_piece.length = TextLength(original);
    new_piece.original = original;
    return new_piece;
}

static piece new_piece()
{
    piece new_piece;
    new_piece.start = 0;
    new_piece.length = 0;
    new_piece.original = "";
    return new_piece;
}

inline piece new_piece(const int start, const int length, const bool added, const char *original, const char *add)
{
    piece piece;
    piece.start = start;
    piece.length = length;
    piece.original = original;
    return piece;
}

inline piece new_piece(const std::string& original)
{
    piece piece;
    piece.start = 0;
    piece.length = original.length();
    piece.original = original;
    return piece;
}


inline std::string piece_to_string(const piece* piece)
{
    const std::string s = piece->original;

    return s.substr(piece->start, piece->length);
}

struct PieceChain
{
    // doubly linked list of pieces
    std::vector<piece> links;

    // returns piece with the highest start val
    piece *current{};

    explicit PieceChain(const piece *first_piece)
    {
        this->links.clear();
        this->links.push_back(*first_piece);

    };
    explicit PieceChain(const piece& first_piece)
    {
        this->links.clear();
        this->links.push_back(first_piece);
    };

    [[nodiscard]] int current_piece_length() const{return static_cast<int>(this->current->length);}

    [[nodiscard]] std::string to_string() const
    {
        std::string string;
        std::string orig;
        for (const auto &piece : this->links)
        {
            string.append(piece.original.substr( piece.start, piece.original.length()));
        }
        return string;
    };


};

// main text structure of text buffers with markers
struct piece_table
{
    // original buffer in table
    std::string original;

    // buffer in table to push input onto
    std::string working_buffer;

    // undo stack
    std::vector<PieceChain> history;
    std::vector<PieceChain> redo_stack;

    PieceChain* current(){return &this->history.back();};

    // takes contents of a file
    explicit piece_table(const char* original)
    {
        this->original = original;
        this->working_buffer = "";
        this->history = {};
        this->redo_stack = {};
    }

    piece_table()
    {
        this->original = "";
        this->working_buffer = "";
        this->history = {};
        this->redo_stack = {};
    };
    void* clean{};
};

#endif //PIECE_TABLE_HPP

