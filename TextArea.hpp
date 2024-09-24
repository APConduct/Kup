//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include "raylib.h"

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

    TextArea();
    TextArea(int width, int height);
    TextArea(int width, int height, Color color);
    TextArea(int width, int height, Color color, char symbol);
    TextArea(int width, int height, Color color, char symbol, int fontSize);
    ~TextArea();
    void Draw();
    void Update();
    void DrawCursor();
    void UpdateCursor();
    cursor cursor{};

    protected:
    int width, height;
    Color color;
    Font* font;
    int fontSize;
    bool focused;



};

} // kupui

#endif //TEXTAREA_HPP
