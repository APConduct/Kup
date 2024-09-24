#include <iostream>
#include <fstream>
#include <raylib.h>
#include "Button.hpp"
#define RAYGUI_IMPLEMENTATION
#include <vector>

#include "raygui.h"

// TODO - make cursor position decrement when backspacing up a line
// TODO - implement cursor struct

enum hue
{
    HEX_PATTENS = 0xD4EAFFff,
    HEX_BLACK = 0x000000FF,
    HEX_WHITE = 0xFFFFFFFF,
    LEMON = 0xccff99ff,
};


void reset_button_colors()
{
    GuiSetStyle(BUTTON, TEXT_COLOR_NORMAL, HEX_WHITE);
    GuiSetStyle(BUTTON, BASE_COLOR_NORMAL, HEX_BLACK);
}

void draw_cursor(int cursor_pos_x, int cursor_pos_y, const char* const cursor_char, const int cursor_font_size)
{
    DrawText(cursor_char, cursor_pos_x, cursor_pos_y, cursor_font_size, SKYBLUE);
}

typedef struct cursor
{
    int x;
    int y;
    int line;
    int font_size;
    const char* symbol;
    cursor(int x, int y, int line, int font_size, const char* symbol)
    {
        this->x = x;
        this->y = y;
        this->line = line;
        this->font_size = font_size;
        this->symbol = symbol;
    };
    void render() const
    {
        DrawText(symbol, x, y, font_size, SKYBLUE);
    };
};

int main(int argc, char* argv)
{
    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(800, 600, "Kup");




    std::string editor_string;
    std::string current_editor_line_string;
    int backspace_frame_counter = 0;
    int framesCounter = 0;
    int cursor_pos_x = 0;
    int cursor_pos_y = 0;
    int cursor_lines_from_first = 0;
    int current_editor_file_lines = 1;
    const auto cursor_char = "|";
    constexpr int cursor_font_size = 24;

    cursor cursor = {0, 0, cursor_font_size, cursor_font_size, cursor_char};



    SetTargetFPS(120);
    while (!WindowShouldClose())
    {
        int editor_width = GetScreenWidth();
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
                    if (!current_editor_line_string.empty())
                    {
                        current_editor_line_string.pop_back();
                    }else{}
                }
            }
        }

        int key_char = GetCharPressed();
        while (key_char > 0)
        {
            // NOTE: Only allow keys in range [32..125]
            if ((key_char >= 32) && (key_char <= 125))
            {
                editor_string += static_cast<char>(key_char);
                current_editor_line_string += static_cast<char>(key_char);

            }
            key_char = GetCharPressed();
        }

        if (IsKeyPressed(KEY_BACKSPACE))
        {
            if (!editor_string.empty())
            {
                editor_string.pop_back();
            }
            if (!current_editor_line_string.empty())
            {
                current_editor_line_string.pop_back();
            }
        }

        cursor_pos_x = 12+MeasureText(current_editor_line_string.c_str(), 20);
        cursor_pos_y = 10-2 + (16*cursor_lines_from_first);

        if(IsWindowFocused())
        {
            if (IsKeyPressed(KEY_ENTER))
            {
                editor_string += '\n';
                current_editor_line_string.clear();
                cursor_lines_from_first++;
            }
        }

        BeginDrawing();
        ClearBackground(BLACK);
        DrawText(editor_string.c_str(), 10, 10, 20, WHITE);
        if(IsWindowFocused())
        {
            draw_cursor(cursor_pos_x, cursor_pos_y, cursor_char, cursor_font_size);
            framesCounter++;
        } else
        {
            framesCounter = 0;
        }

        //reset_style();
        //if (file_menu_button->isPressed()){// do something}


        EndDrawing();
    }
    CloseWindow();
    return 0;
}