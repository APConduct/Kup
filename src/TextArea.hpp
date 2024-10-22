//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <string>
#include <vector>
//#include "PieceTable.hpp"
#include <bits/stdc++.h>

#include <raylib.h>

namespace kupui {

class TextArea {

    public:

    TextArea()
    {
        //this->piece_table.add_buff = "";
        //this->piece_table.original_buff = "";
        this->text = "";
        this->pos_x = 0;
        this->pos_y = 0;
        this->color = WHITE;
        this->fontSize = 20;
        this->font = GetFontDefault();
        this->lines = 0;
        this->focused = true;
        this->cursor.index_x = 0;
        this->cursor.index_y = 0;
        this->cursor.index_g = 0;
        this->cursor.symbol = *"|";

        this->auto_backspace = false;
        this->backspace_frame_counter = 0;

    };
    TextArea(const int pos_x, const int pos_y)
    {
        this->text_lines.insert(text_lines.begin(), "");

        this->text = "";
        this->pos_x = pos_x;
        this->pos_y = pos_y;
        this->color = WHITE;
        this->fontSize = 20;
        this->font = GetFontDefault();
        this->lines = 0;
        this->focused = true;
        this->cursor.index_x = 0;
        this->cursor.index_y = 0;
        this->cursor.index_g = 0;
        this->cursor.symbol = *"|";

        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
    };
    //PieceTable piece_table;
    ~TextArea();
    [[nodiscard]] int get_pos_y() const
    {
        return this->pos_y;
    };

    struct cursor
    {
        int index_x{};
        int index_y{};
        int index_g{};
        char symbol{};
    } cursor;
    void set_pos_x(const int x)
    {
        this->pos_x = x;
    }
    [[nodiscard]] int get_pos_x() const
    {
        return this->pos_x;
    }

    [[nodiscard]] std::vector<std::string> get_text_lines() const
    {
        std::string s;

        std::stringstream ss(this->text);

        std::vector<std::string> v;


        while (getline(ss, s, '\n')) {

            v.push_back(s);
        }
        v.emplace_back("");
        return v;
    }

    void Update()
    {
        int char_key = GetCharPressed();
        while (char_key > 0)
        {
            if ((char_key >= 32) && (char_key < 127))
            {


                //this->piece_table.add_buff.push_back(static_cast<char>(char_key));

                this->text.insert(this->text.begin() + this->cursor.index_g, static_cast<char>(char_key));
                this->cursor.index_g ++;
                this->cursor.index_x++;
            }
            char_key = GetCharPressed();
        }

        if (IsKeyPressed(KEY_BACKSPACE))
        {
            if (this->cursor.index_g > 0)
            {
                if(this->cursor.index_x > 0)
                {
                    this->cursor.index_x--;
                }else
                {
                    this->cursor.index_y--;
                    this->lines--;
                    this->cursor.index_x = static_cast<int>(this->get_text_lines().at(cursor.index_y).size());
                }
                this->cursor.index_g--;
                this->text.erase(this->cursor.index_g);

            }
        }

        if (IsKeyPressed(KEY_ENTER))
        {
            
            this->lines++;
            this->cursor.index_y++;
            this->cursor.index_g++;
            this->text.insert(this->cursor.index_g-1, "\n");
            this->cursor.index_x = 0;
        }
        if(IsKeyPressed(KEY_LEFT))
        {
        //    if(this->cursor.index_g > 0)
        //    {
        //        if (this->cursor.index_x > 0)
        //        {
        //            this->cursor.index_x--;
        //        }
        //        else
        //        {
        //            --this->cursor.index_y;
        //            this->cursor.index_x = static_cast<int>(this->text_lines.at(this->cursor.index_y).size());
        //        }
        //        this->cursor.index_g--;
        //    };
        }
        if(IsKeyPressed(KEY_RIGHT))
        {
        //    if(this->cursor.index_g <= this->text.size())
        //    {
        //        this->cursor.index_x++;
        //        this->cursor.index_g++;
        //    }

        }


    };
    void Render() const
    {
        int start_y = 0;
        for(const auto & text_line : this->get_text_lines())
        {
            DrawText(text_line.c_str(), this->pos_x, this->pos_y + (this->font.baseSize * 3 * start_y), this->fontSize, this->color);
            start_y ++;
        }
        //DrawText(this->text.c_str(), this->pos_x, this->pos_y, this->fontSize, this->color);


    };
    [[nodiscard]] std::string get_current_line() const
    {
        return this->get_text_lines().at(this->cursor.index_y);
    }
    [[nodiscard]] Font get_font() const
    {
        return this->font;
    }
    [[nodiscard]] int get_fontSize() const
    {
        return this->fontSize;
    }
    [[nodiscard]] int get_lines() const
    {
        return this->lines;
    }

    [[nodiscard]] int get_cursor_index_y() const
    {
        return this->cursor.index_y;
    }
    [[nodiscard]] int get_cursor_index_x() const
    {
        return this->cursor.index_x;
    }
    std::vector<std::string> text_lines;
    std::string text;
protected:
    //int width, height;
    int pos_x, pos_y;
    Color color{};
    int fontSize;
    Font font{};
    int lines;
    bool focused;
    bool auto_backspace;
    int backspace_frame_counter;
};

} // kupui

#endif //TEXTAREA_HPP
