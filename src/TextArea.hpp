//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <string>
#include <vector>
#include <bits/stdc++.h>
#include <tinyfiledialogs.h>
#include "piece_table.hpp"


#include <raylib.h>





namespace kupui {

struct  TextArea {
    float spacing;
    float pos_x, pos_y;
    Color color{};
    float fontSize;
    Font font{};
    float scale;


    piece_table table;



    public:

    piece_chain piece_chain;
    TextArea()
    {
        //this->table = piece_table{};

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

        this->spacing = 0;
        this->scale = 3;

    };
    TextArea(const float pos_x, const float pos_y)
    {

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

        this->spacing = 0;
        this->scale = 3;

    };

    TextArea(const float pos_x, const float pos_y, const float spacing, const Font& font)
    {

        this->text = "";
        this->pos_x = pos_x;
        this->pos_y = pos_y;
        this->color = WHITE;
        this->fontSize = 20;
        this->font = font;
        this->lines = 0;
        this->focused = true;
        this->cursor.index_x = 0;
        this->cursor.index_y = 0;
        this->cursor.index_g = 0;
        this->cursor.symbol = *"|";

        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
        this->font = font;

        this->spacing = spacing;
        this->scale = 1;
    };

    TextArea(const float pos_x, const float pos_y, const Font& font, const float font_size, float spacing)
    {

        this->text = "";
        this->pos_x = pos_x;
        this->pos_y = pos_y;
        this->color = WHITE;
        this->fontSize = font_size;
        this->font = font;
        this->lines = 0;
        this->focused = true;
        this->cursor.index_x = 0;
        this->cursor.index_y = 0;
        this->cursor.index_g = 0;
        this->cursor.symbol = *"|";

        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
        this->font = font;

        this->spacing = spacing;
        this->scale = 1;
    };



    ~TextArea();
    [[nodiscard]] float get_pos_y() const
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
    void set_pos_x(const float x)
    {
        this->pos_x = x;
    }
    [[nodiscard]] float get_pos_x() const
    {
        return this->pos_x;
    }
    [[nodiscard]] int get_x() const
    {
        return static_cast<int>(this->pos_x);
    }
    [[nodiscard]] int get_y() const
    {
        return static_cast<int>(this->pos_y);
    }

    [[nodiscard]] std::vector<std::string> text_vec() const
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

        // TODO - EXTRACT AND MODULARIZE KEY BINDS FOR CONFIG
        if(IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL))
        {
            if(IsKeyPressed(KEY_S))
            {
                try
                {
                    const std::string dialog = tinyfd_saveFileDialog("Save Your File (:", GetApplicationDirectory(),0,nullptr,"");
                    char *save_text = this->text.data();
                    SaveFileText(dialog.c_str(), save_text);
                }catch(...){}
            }
        }

        int char_key = GetCharPressed();
        while (char_key > 0)
        {
            if ((char_key >= 32) && (char_key < 127))
            {


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
                    this->cursor.index_x = static_cast<int>(this->text_vec().at(cursor.index_y).size());
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
        for(const auto & text_line : this->text_vec())
        {
            DrawTextEx(this->font, text_line.c_str(), {static_cast<float>(this->pos_x), this->pos_y + static_cast<float>(this->font.baseSize) * (this->scale * static_cast<float>(start_y))}, this->fontSize,-2, this->color);
            start_y ++;
        }
        //DrawText(this->text.c_str(), this->pos_x, this->pos_y, this->fontSize, this->color);


    };
    [[nodiscard]] std::string get_current_line() const
    {
        return this->text_vec().at(this->cursor.index_y);
    }
    [[nodiscard]] Font get_font() const
    {
        return this->font;
    }
    [[nodiscard]] float get_fontSize() const
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
    [[nodiscard]] float get_scale() const
    {
        return this->scale;
    }
    [[nodiscard]] float get_spacing() const
    {
        return this->spacing;
    }
    //std::vector<std::string> text_lines;
    std::string text;
protected:
    //int width, height;
    int lines;
    bool focused;
    bool auto_backspace;
    int backspace_frame_counter;
};

} // kupui

#endif //TEXTAREA_HPP
