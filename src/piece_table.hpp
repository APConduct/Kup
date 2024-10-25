//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECE_TABLE_HPP
#define PIECE_TABLE_HPP
#include <iostream>
#include <string>
#include <vector>

//#include "piece.h"
#include "kup.h"



struct piece_chain
{



    std::vector<piece> pieces;
    piece *current_piece{};


    std::string string;
    explicit piece_chain(const piece *first_piece)
    {
        this->pieces.clear();
        this->pieces.push_back(*first_piece);
        this->current_piece = new piece;
        //this->currentPiece = first_piece;

    };
    explicit piece_chain(const piece& first_piece)
    {
        this->pieces.clear();
        this->pieces.push_back(first_piece);
        //this->currentPiece = &this->pieces.back();
    };

    explicit piece_chain(const char *original_str)
    {
        this->current_piece = new piece(original_str);
    }

    [[nodiscard]] int current_piece_length() const{return static_cast<int>(this->current_piece->length);};

    static piece latest_piece(){
        //int offsets[this->pieces.size()];
        //for (int i = 0; i < this->pieces.size(); i++)
        //{
        //    offsets[i] = this->pieces[i].start;
        //}
        //const int* max_offset = std::sortable<piece_chain>(offsets, offsets + this->pieces.size());

        //for (const auto & piece : this->pieces)
        //{
        //    if (piece.start == *max_offset)
        //    {
        //        return piece;
        //    }
        //}
        std::cout << "no piece found";
        return piece(nullptr);
        };



};


struct PieceTable
{
    /**
     * original buffer in table
     */
    std::string original;
    /**
     * buffer in table to push input onto
     */
    std::string add_buffer;
    std::vector<piece_chain> history;
    std::vector<piece_chain> redo_stack;

    piece* current_piece;

    //auto current = new piece();

    //std::vector<TableState>::value_type current;

    explicit PieceTable(const char* original)
    {
        this->original = original;
        this->add_buffer = "";

        this->history = {};
        this->redo_stack = {};

        this->current_piece = &history.back().pieces.back();



    }
    // main text structure of text buffers with markers
    PieceTable()
    {
        this->original = "";
        this->add_buffer = "";

        this->history = {};
        this->redo_stack = {};


        const auto table_state = piece_chain("");
        this->history.push_back(table_state);

        //this->history.back().currentPiece = &this->history.back().pieces.back();

        this->current_piece = &history.back().pieces.back();


    };

    // empty/new (as in unfinished) chain

};

inline piece_chain PT_take_current(const PieceTable& piece_table, const piece& piece)
{
    piece_chain piece_chain = piece_table.history.back();

    //piece_chain.pieces.push_back(piece(x));
    return piece_chain;
}

#endif //PIECE_TABLE_HPP

