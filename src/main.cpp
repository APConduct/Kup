#include <iostream>
#include <fstream>
#include <raylib.h>
#include "Button.hpp"
#define RAYGUI_IMPLEMENTATION
#include <vector>

#include <gtk/gtk.h>
#include "raygui.h"
#include "../TextArea.hpp"

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
    InitWindow(800, 600, "Kup");



    SetTargetFPS(120);
    while (!WindowShouldClose())
    {

        EndDrawing();
    }
    CloseWindow();
    return 0;

}

