//
// Created by ajost1 on 9/16/2024.
//

#ifndef EDITOR_HPP
#define EDITOR_HPP

#include <raylib.h>
#include <raygui.h>

enum hue
{
    HEX_PATTENS = 0xD4EAFFff,
    HEX_BLACK = 0x000000FF,
    HEX_WHITE = 0xFFFFFFFF,
    LEMON = 0xccff99ff,
};



class App {
    public:
    static void init()
    {
        GuiSetStyle(DEFAULT, TEXT_SIZE, 20);
        GuiSetStyle(BUTTON, BACKGROUND_COLOR, HEX_BLACK);
        GuiSetStyle(BUTTON, TEXT_ALIGNMENT, TEXT_ALIGN_CENTER);
        GuiSetStyle(BUTTON, TEXT_COLOR_NORMAL, HEX_WHITE);
        GuiSetStyle(BUTTON, TEXT_COLOR_FOCUSED, HEX_BLACK);

        GuiSetStyle(BUTTON, BORDER_COLOR_NORMAL, HEX_PATTENS);
        GuiSetStyle(BUTTON, BORDER_COLOR_FOCUSED, HEX_BLACK);
        GuiSetStyle(BUTTON, BASE_COLOR_FOCUSED, LEMON);
        GuiSetStyle(BUTTON, BASE_COLOR_NORMAL, HEX_BLACK);    };
    void update();
    void render();
    private:

};



#endif //EDITOR_HPP
