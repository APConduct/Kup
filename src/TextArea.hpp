//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <string>
#include <vector>

#include <raylib.h>

namespace kupui {

typedef struct cursor
{
    Vector2 position;
    char symbol;
    Color color;
    int size;
};


class TextArea {

    public:

    TextArea()
    {
        this->text = "";
        this->pos_x = 0;
        this->pos_y = 0;
    };
    TextArea(int width, int height);
    TextArea(int width, int height, Color color);
    TextArea(int width, int height, Color color, char symbol);
    TextArea(int width, int height, Color color, char symbol, int fontSize);
    ~TextArea();
    void Update()
    {
        int char_key = GetCharPressed();
        while (char_key > 0)
        {
            if ((char_key >= 32) && (char_key < 127))
            {
                this->current_line += static_cast<char>(char_key);
            }
            char_key = GetCharPressed();
        }

        if (IsKeyPressed(KEY_BACKSPACE))
        {
            if (!this->current_line.empty())
            {
                this->current_line.pop_back();
            }
        }
    };
    void Render() const
    {
        std::string text = this->text;
        text += this->current_line;
        DrawText(text.c_str(), 0, 0, 20, WHITE);
    };
    void DrawCursor();
    void UpdateCursor();
    cursor cursor{};

    protected:
    int width, height;
    int pos_x, pos_y;
    Color color;
    Font* font;
    int fontSize;
    bool focused;
    int padding;
    const char * text;
    std::vector<std::string> text_lines;
    std::string current_line;


};

} // kupui

#endif //TEXTAREA_HPP