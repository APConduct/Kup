#include <iostream>
#include <fstream>
#include <raylib.h>
//#include "Button.hpp"
//#define RAYGUI_IMPLEMENTATION
//#include "raygui.h"
#include <vector>

#include <gtk/gtk.h>
#include "TextArea.hpp"

// TODO - implement cursor struct

enum hue
{
    HEX_PATTENS = 0xD4EAFFff,
    HEX_BLACK = 0x000000FF,
    HEX_WHITE = 0xFFFFFFFF,
    LEMON = 0xccff99ff,
};



int main()
{
    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(1600, 960, "Kup");

    auto* text_area = new kupui::TextArea();

    SetTargetFPS(120);

    //popen("cmd","r");
    //std::cout << test;

    while (!WindowShouldClose())
    {
        text_area->Update();
        BeginDrawing();
        ClearBackground(BLACK);
        text_area->Render();

        EndDrawing();
    }
    CloseWindow();
    return 0;

}

