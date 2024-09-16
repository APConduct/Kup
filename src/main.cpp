#include <iostream>
#include <fstream>
#include <raylib.h>
#include "Button.hpp"
#define RAYGUI_IMPLEMENTATION
#include "raygui.h"

enum hue
{
    HEX_PATTENS = 0xD4EAFFff,
    HEX_BLACK = 0x000000FF,
    HEX_WHITE = 0xFFFFFFFF,
    LEMON = 0xccff99ff,
};


void reset_style()
{
    GuiSetStyle(DEFAULT, TEXT_SIZE, 20);
    GuiSetStyle(BUTTON, BACKGROUND_COLOR, HEX_BLACK);
    GuiSetStyle(BUTTON, TEXT_ALIGNMENT, TEXT_ALIGN_CENTER);
    GuiSetStyle(BUTTON, TEXT_COLOR_NORMAL, HEX_WHITE);
    GuiSetStyle(BUTTON, TEXT_COLOR_FOCUSED, HEX_BLACK);

    GuiSetStyle(BUTTON, BORDER_COLOR_NORMAL, HEX_PATTENS);
    GuiSetStyle(BUTTON, BORDER_COLOR_FOCUSED, HEX_BLACK);
    GuiSetStyle(BUTTON, BASE_COLOR_FOCUSED, LEMON);
    GuiSetStyle(BUTTON, BASE_COLOR_NORMAL, HEX_BLACK);
}
void reset_button_colors()
{
    GuiSetStyle(BUTTON, TEXT_COLOR_NORMAL, HEX_WHITE);
    GuiSetStyle(BUTTON, BASE_COLOR_NORMAL, HEX_BLACK);
}

int main()
{
    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(800, 600, "Kup");
    SetTargetFPS(120);



    //const auto* file_menu_button = new Button(0,0,80,40, "File");
    std::string editor_string;
    int backspace_frame_counter = 0;
    int framesCounter = 0;
    while (!WindowShouldClose())
    {
        //SetMouseCursor(MOUSE_CURSOR_IBEAM);

        if (!IsKeyDown(KEY_BACKSPACE))
        {
            backspace_frame_counter = 0;
        }else
        {
            backspace_frame_counter ++;
            if (backspace_frame_counter > 64)
            {
                if ((backspace_frame_counter % 3) == 0)
                {
                    if (!editor_string.empty())
                    {
                        editor_string.pop_back();
                    }
                }
            }
        }
        std::cout << backspace_frame_counter << std::endl;

        int key_char = GetCharPressed();
        while (key_char > 0)
        {
            // NOTE: Only allow keys in range [32..125]
            if ((key_char >= 32) && (key_char <= 125))
            {
                editor_string += static_cast<char>(key_char);
                std::cout << editor_string << std::endl;

            }


            key_char = GetCharPressed();
        }


        if (IsKeyPressed(KEY_BACKSPACE))
        {
            if (!editor_string.empty())
            {
                editor_string.pop_back();
            }
        }




        BeginDrawing();
        ClearBackground(BLACK);

        DrawText(editor_string.c_str(), 10, 10, 20, WHITE);
        DrawText("|", 12+MeasureText(editor_string.c_str(), 20), 10-2, 24, SKYBLUE);

        //reset_style();
        //if (file_menu_button->isPressed()){// do something}


        EndDrawing();
    }
    CloseWindow();
    return 0;
}

