#include <iostream>
#include <unistd.h>
#include <fstream>
#include <raylib.h>
//#include "Button.hpp"
#define RAYGUI_IMPLEMENTATION
#include <raygui.h>
#include <vector>
#include <tinyfiledialogs.h>
#include <json/json.h>
#include <lua.hpp>
#include <lualib.h>
#include "TextArea.hpp"


#define RL_DEF_FONT_JUMP_Y 15
#define CURSOR_JESUS_SPACE 2

enum hue
{
    HEX_PATTENS = 0xD4EAFFff,
    HEX_BLACK = 0x000000FF,
    HEX_WHITE = 0xFFFFFFFF,
    LEMON = 0xccff99ff,
};





int main(int argc, char **argv)
{
    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(1600, 960, "Kup");
    auto* text_area = new kupui::TextArea(40,40);
    SetTargetFPS(120);

    int text_cursor_pos_x =0, text_cursor_pos_y =0;


    while (!WindowShouldClose())
    {
        text_area->Update();

        text_cursor_pos_x =
            CURSOR_JESUS_SPACE +
                MeasureText(
                    text_area->get_current_line().substr(0,text_area->get_cursor_index_x()).c_str(),
                    text_area->get_fontSize())
        + text_area->get_pos_x();


        text_cursor_pos_y =
            text_area->get_pos_y()
            + (text_area->get_font().baseSize * 3 * text_area->get_lines());
        BeginDrawing();
        ClearBackground(BLACK);
        text_area->Render();
        DrawText("|", text_cursor_pos_x, text_cursor_pos_y, text_area->get_fontSize(), SKYBLUE);
        EndDrawing();
    }
    CloseWindow();
    return 0;

}

