//
// Created by ajost1 on 10/24/2024.
//

#ifndef KUP_PIECE_H
#define KUP_PIECE_H

#include <raylib.h>

 struct piece
{

    //index in buffer to start from
    unsigned int start;
    // length from start in buffer
    unsigned int length;
    // buffer the links are stored in

    const char* original{};


    explicit piece(const char *original)
    {
        this->start = 0;
        this->original = original;
        const std::string orig_str = original;
        length = static_cast<int>(orig_str.length());

        //this->add = nullptr;

    }

    piece()
    {
        start = 0;
        length = 0;
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

// returns piece(nullptr) if equal. clean chain first
inline piece older_piece(const piece& lhs, const piece& rhs)
{
    if (lhs.start != rhs.start)
    {
        if (lhs.start < rhs.start)
        {
            return lhs;
        }
        return rhs;
    }

    return piece(nullptr);
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
    piece.original = original.c_str();
    return piece;
}


inline std::string piece_to_string(const piece* piece)
{
    const std::string s = piece->original;

    return s.substr(piece->start, piece->length);
}

#endif //KUP_PIECE_H
