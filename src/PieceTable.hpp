//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECETABLE_HPP
#define PIECETABLE_HPP
#include <string>
#include <vector>


struct Piece
{
    // start index in source buffer
    int start;
    // length from start in buffer
    int length;
    // buffer the piece is stored in
    bool origin;

    Piece()
    {
        start = 0;
        length = 0;
        origin = false;
    }
    Piece(int start, int length, bool origin);


};



struct PieceTable
{

     std::string original_buff;
     std::string add_buff;
     std::vector<Piece> pieces;
     std::vector<Piece> redo_stack;

    PieceTable()
    {
        original_buff = "";
        add_buff = "";
        pieces.assign(0, Piece());


    };
    std::string to_str()
    {
        std::string str;
        for (const auto & piece : pieces)
        {
            if (piece.origin == true)
            {
                str.append(original_buff.substr(piece.start, piece.length));
            }else
            {
                str.append(add_buff.substr(piece.start, piece.length));
            }
        }
        return str;
    };
    Piece getPiece(int index);
    Piece getPieceAt(const int index)
    {
        for (const auto & piece : pieces)
        {
            if (piece.start <= index && index <= (piece.length + piece.start))
            {
                return piece;
            }
        }
        return this->getPiece(0);
    };

};




// span - private to the sequence



#endif //PIECETABLE_HPP

