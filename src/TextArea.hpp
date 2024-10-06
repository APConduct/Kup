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

                this->text += static_cast<char>(char_key);
                this->current_line += static_cast<char>(char_key);

                this->cursor.index_g ++;
                this->cursor.index_x++;
            }
            char_key = GetCharPressed();
        }

        if (IsKeyPressed(KEY_BACKSPACE))
        {
            if (!this->text.empty())
            {
                if(!this->current_line.empty())
                {
                    this->current_line.pop_back();
                    this->cursor.index_x--;
                }else
                {
                    this->current_line = this->text_lines.back();
                    this->text_lines.pop_back();
                }
                this->cursor.index_g--;
                if (this->text.back() == '\n')
                {
                    this->cursor.index_y--;
                    this->lines--;
                    this->cursor.index_x = static_cast<int>(this->current_line.length());
                }
                this->text.pop_back();

            }
        }

        if (IsKeyPressed(KEY_ENTER))
        {
            this->lines++;
            this->cursor.index_y++;
            this->cursor.index_g++;
            this->text.append("\n");
            this->text_lines.push_back(this->current_line);
            this->current_line = "";
            this->cursor.index_x = 0;
        }

        //if(IsKeyPressed(KEY_LEFT))
        //{
        //    this->cursor.index_x--;
        //}

        //printf("%d", this->cursor.index_g);
        //o8xisprintf("%llu", this->text.length());

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
        DrawText(this->current_line.c_str(), this->pos_x,this->pos_y + (this->font.baseSize * 3 * start_y), this->fontSize, this->color);

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
        return current_line;
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
