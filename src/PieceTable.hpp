//
// Created by ajost1 on 10/14/2024.
//

#ifndef PIECETABLE_HPP
#define PIECETABLE_HPP
#include <string>
#include <vector>
#include <map>


struct Piece
{
    // start index in source buffer
    int start;
    // length from start in buffer
    int length;
    // buffer the piece is stored in
    std::string source;
};

struct PieceTable
{

    std::map<std::string, std::string> buffers;
    std::vector<Piece> pieces;
    PieceTable()
    {

        this->buffers = { {"original", ""}, {"add", ""}};
        this->pieces = {{0,static_cast<int>(this->buffers["original"].size()),"original"}};
    };
    explicit PieceTable(const std::string& original)
    {
        this->buffers = { {"original", original}, {"add", ""}};
        this->pieces = {{0,static_cast<int>(original.size()),"original"}};
    };

    std::string to_str()
    {
        std::string text = this->buffers["original"];
        for ( const auto& [start, length, source] : this->pieces )
        {
            text.append(buffers[source].substr(start, length));
        }
        return text;
    };

    size_t size()
    {
        return this->buffers["add"].size() + this->buffers["original"].size();
    }

};

// span - private to the sequence



#endif //PIECETABLE_HPP

