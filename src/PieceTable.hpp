//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECE_TABLE_HPP
#define PIECE_TABLE_HPP
#include <string>
#include <vector>


struct Piece
{
    // start index in source buffer
    int start;
    // length from start in buffer
    int length;
    // buffer the pieces are stored in
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
    /**
     * original buffer in table
     */
    std::string origin;
    /**
     * buffer in table to push input onto
     */
    std::string add;
     std::vector<TableState> states;
     std::vector<Piece> redo_stack;

    std::vector<TableState>::value_type head;

    PieceTable()
    {
        origin = "";
        add = "";

        states.assign(0, TableState());
        this->head =  this->states.back();


    };

};




// span - private to the sequence



#endif //PIECE_TABLE_HPP

