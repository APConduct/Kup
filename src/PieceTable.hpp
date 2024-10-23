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

struct TableState
{
    std::vector<Piece> pieces;
};


struct PieceTable
{

     std::string origin_buff;
     std::string add_buff;
     std::vector<TableState> piece_table;

     std::vector<Piece> redo_stack;

    PieceTable()
    {
        origin_buff = "";
        add_buff = "";
        piece_table.assign(0, TableState());


    };

};




// span - private to the sequence



#endif //PIECETABLE_HPP

