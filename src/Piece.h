//
// Created by ajost1 on 10/24/2024.
//

#ifndef KUP_PIECE_H
#define KUP_PIECE_H

//#include <raylib.h>
#include <bits/stdc++.h>


struct Piece
{
    unsigned int start;
    unsigned int length;
    std::string* origin;
    Piece(const unsigned int _start, const unsigned int _length, std::string* _origin):
    start(_start), length(_length), origin(_origin)
    {}

    Piece(const unsigned int _start, const unsigned int _length, std::string& _origin)
    {
        start = _start;
        length = _length;
        origin = &_origin;
    };
    [[nodiscard]] std::string toString() const
    {
        return origin->substr(start, length);
    }

    // start and origin of new Piece will be from first one
    Piece operator+(const Piece& piece) const
    {
        return Piece{start, length + piece.length, origin};
    }
    // start and origin of new Piece will be from first one
    Piece operator-(const Piece& piece) const
    {
        return Piece{start, length - piece.length, origin};
    }
    //[[nodiscard]] std::vector<std::string> text_vec() const
    //{

    //}

};

struct PieceChain
{
    std::deque<Piece> pieces;
    [[nodiscard]] std::string toString() const
    {
        std::stringstream ss;
        for (const auto& piece : pieces)
        {
            ss << piece.toString();
        }
        return ss.str();
    }

};


#endif //KUP_PIECE_H
