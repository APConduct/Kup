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
        this->cursor.pre_str = "";
        this->cursor.symbol = *"|";
    };
    TextArea(int cursor_i_y, int cursor_i_x, const char *symbol);
    TextArea(int width, int height, Color color, char symbol, int fontSize);
    ~TextArea();

    struct cursor
    {
        int index_x{};
        int index_y{};
        int index_g{};
        std::string pre_str;
        char symbol{};
    } cursor;
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

        if(IsKeyPressed(KEY_LEFT))
        {
            this->cursor.index_x--;
        }

        printf("%d", this->cursor.index_g);
        printf("%llu", this->text.length());

    };
    void Render() const
    {
        const std::string text = this->text;
        //text += this->current_line;
        DrawText(text.c_str(), this->pos_x, this->pos_y, this->fontSize, this->color);
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

protected:
    //int width, height;
    int pos_x, pos_y;
    Color color{};
    int fontSize;
    std::string text;
    std::vector<std::string> text_lines;
    std::string current_line;
    Font font{};
    int lines;
    bool focused;


};

} // kupui

#endif //TEXTAREA_HPP
