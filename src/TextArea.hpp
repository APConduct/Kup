//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <string>
#include <vector>

#include <raylib.h>

namespace kupui {



class TextArea {

    public:

    TextArea()
    {
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

    void Update()
    {
        int char_key = GetCharPressed();
        while (char_key > 0)
        {
            if ((char_key >= 32) && (char_key < 127))
            {

                // TODO - CHANGE INPUT INCREMENT TO INSERTION
                this->text_lines.at(this->cursor.index_y).insert(
                    this->text_lines.at(this->cursor.index_y).begin() + this->cursor.index_x,
                    static_cast<char>(char_key));
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
                    this->text_lines.at(this->cursor.index_y).erase(this->cursor.index_x - 1, 1);
                    this->cursor.index_x--;
                }else
                {
                    this->text_lines.at(this->cursor.index_y-1).append(this->text_lines.at(this->cursor.index_y));
                    this->text_lines.erase(this->text_lines.begin() + this->cursor.index_y);
                    this->cursor.index_y--;
                    this->lines--;
                    this->cursor.index_x = static_cast<int>(this->text_lines.at(cursor.index_y).size());
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
            const auto new_guy = "";
            this->text_lines.insert(this->text_lines.begin() + this->cursor.index_y, new_guy);
            this->cursor.index_x = 0;
        }
        if(IsKeyPressed(KEY_LEFT))
        {
            if(this->cursor.index_g > 0)
            {
                if (this->cursor.index_x > 0)
                {
                    this->cursor.index_x--;
                }
                else
                {
                    --this->cursor.index_y;
                    this->cursor.index_x = static_cast<int>(this->text_lines.at(this->cursor.index_y).size());
                }
                this->cursor.index_g--;
            };
        }
        if(IsKeyPressed(KEY_RIGHT))
        {
            if(this->cursor.index_g <= this->text.size())
            {

                this->cursor.index_x++;
                this->cursor.index_g++;
            }

        }


        //printf("%d", this->cursor.index_g);
        //printf("%llu", this->text.length());

        //this->text.append("\n");
        //printf(this->text.c_str());
        //this->text.pop_back();

    };
    void Render() const
    {
        //this->text_lines.push_back(this->current_line);
        int start_y = 0;
        for(const auto & text_line : this->text_lines)
        {
            std::string line = this->current_line;
            DrawText(text_line.c_str(), this->pos_x, this->pos_y + (this->font.baseSize * 3 * start_y), this->fontSize, this->color);
            start_y ++;
        }

        //this->text_lines.pop_back();

        //DrawText(this->text.c_str(), this->pos_x, this->pos_y, this->fontSize, this->color);
        //DrawTextEx(this->get_font(), this->text.c_str(), Vector2(static_cast<float>(this->pos_x), static_cast<float>(this->pos_y)), static_cast<float>(this->fontSize), 2, WHITE);
    };
    [[nodiscard]] const char *get_current_line() const
    {
        return current_line.c_str();
    }
    std::string get_current_line()
    {
        return this->text_lines.at(this->cursor.index_y);
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
    std::string current_line;
    Font font{};
    int lines;
    bool focused;
    bool auto_backspace;
    int backspace_frame_counter;
};

} // kupui

#endif //TEXTAREA_HPP
