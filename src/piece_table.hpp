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
    piece *current{};
    piece_chain() = default;


    std::string string;
    explicit piece_chain(const piece *first_piece)
    {
        this->links.clear();
        this->links.push_back(*first_piece);

    };
    explicit piece_chain(const piece& first_piece)
    {
        this->links.clear();
        this->links.push_back(first_piece);
    };


    [[nodiscard]] int current_piece_length() const{return static_cast<int>(this->current->length);}

};

// main text structure of text buffers with markers
struct piece_table
{
    // original buffer in table
    std::string original;
    // buffer in table to push input onto
    std::string working_buffer;
    std::vector<piece_chain> history;
    std::vector<piece_chain> redo_stack;
    piece_chain* current{};

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
};

#endif //PIECE_TABLE_HPP

