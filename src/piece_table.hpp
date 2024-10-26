//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECE_TABLE_HPP
#define PIECE_TABLE_HPP
#include <string>
#include <vector>

#include "piece.h"



struct piece_chain
{
    std::vector<piece> links;
    piece *current_piece{};
    piece_chain() = default;


    std::string string;
    explicit piece_chain(const piece *first_piece)
    {
        this->links.clear();
        this->links.push_back(*first_piece);
        this->current_piece = new piece;
        //this->currentPiece = first_piece;

    };
    explicit piece_chain(const piece& first_piece)
    {
        this->links.clear();
        this->links.push_back(first_piece);
        //this->currentPiece = &this->links.back();
    };

    explicit piece_chain(const char *original_str)
    {
        this->current_piece = new piece(original_str);
    }

    [[nodiscard]] int current_piece_length() const{return static_cast<int>(this->current_piece->length);}

     //piece latest_piece(){

        //return std::max_element(this->links.begin(), this->links.end(), [](const piece &lhs, const piece &rhs){});
    //};




};

struct piece_table
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
    piece_chain* current{};

    //auto current = new piece();

    //std::vector<TableState>::value_type current;

    explicit piece_table(const char* original)
    {
        this->original = original;
        this->add_buffer = "";

        this->history = {};
        this->redo_stack = {};

        this->current_piece = &history.back().links.back();



    }
    // main text structure of text buffers with markers
    piece_table()
    {
        this->original = "";
        this->add_buffer = "";

        this->history = {};
        this->redo_stack = {};


        const auto table_state = piece_chain("");
        this->history.push_back(table_state);

        //this->history.back().currentPiece = &this->history.back().links.back();

        this->current_piece = &history.back().links.back();


    };

    // empty/new (as in unfinished) chain

};

static inline piece_chain PT_take_current(const piece_table& piece_table, const piece& piece)
{
    piece_chain piece_chain = piece_table.history.back();

    //piece_chain.links.push_back(piece(x));
    return piece_chain;
}

#endif //PIECE_TABLE_HPP

