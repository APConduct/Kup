#include <raylib.h>
#include <string>
#define RAYGUI_IMPLEMENTATION


//#include <raygui.h>

//#include <json/json.h>
//#include <lua.hpp>
//#include <lualib.h>
//#include <lua.hpp>
#include "font.h"
#include "TextArea.hpp"

#define ZERO 0
#define ONE 1
#define TWO 2
#define THREE 3
#define FOUR 4
#define FIVE 5
#define EIGHT 8
#define TEN 10



// casts template to float
template<typename Number> float

cast_to_float(Number number)
{return static_cast<float>(number);}

// casts template to int
template<typename Number> int
cast_to_int(){return static_cast<int>(Number());
}
// static casts a float to int

// static casts an int to float

// color values for raygui components
enum hues
{
    HEX_PATTENS = 0xD4EAFFff,
    HEX_BLACK = 0x000000FF,
    HEX_WHITE = 0xFFFFFFFF,
    LEMON = 0xccff99ff,

    KUP_RED1 = 0xE8426CFF,
    KUP_GREEN = 0x38D17DFF

};
struct Hue
{
    unsigned char r;        // Color red value
    unsigned char g;        // Color green value
    unsigned char b;        // Color blue value
    unsigned char a;        // Color alpha value

};



int main(int argc, char **argv)
{
    SetConfigFlags(FLAG_WINDOW_RESIZABLE | FLAG_MSAA_4X_HINT);
    InitWindow(1600, 960, "Kup");

    constexpr int GUI_BAR_UNIT = 64;

    constexpr int FONT_SIZE = 40;
    constexpr int FILE_MARGIN_WIDTH = 104;
    constexpr int SIDEBAR_WIDTH = GUI_BAR_UNIT;
    constexpr int TOP_BAR_WIDTH = GUI_BAR_UNIT;
    constexpr float CURSOR_OFFSET = 8;
    constexpr float GUI_LINE_WIDTH = 2;

    constexpr int GRIP_GAP = 8;
    float CURSOR_JESUS_SPACE = 2;

    std::string JB_MONO_REG_PATH =  "../src/resources/JetBrainsMono-2.304/fonts/ttf/JetBrainsMono-Regular.ttf";
    const std::string BRASS_MONO_REG_PATH =  "../src/resources/fonts/BrassMono/BrassMono-Regular.ttf";
    const std::string BRASS_MONO_CODE_REG_PATH =  "../src/resources/fonts/BrassMono/BrassMonoCode-Regular.ttf";

    const auto font = LoadFontEx(BRASS_MONO_CODE_REG_PATH.c_str(),
        FONT_SIZE,nullptr,0);
    auto* text_area = new kupui::TextArea((SIDEBAR_WIDTH + FILE_MARGIN_WIDTH + GRIP_GAP),60, font, FONT_SIZE, -2);
    SetTargetFPS(120);

    float text_cursor_pos_x = 0, text_cursor_pos_y = 0;


    while (!WindowShouldClose())
    {
        text_area->Update();

        text_cursor_pos_x =
            CURSOR_JESUS_SPACE +
                MeasureTextEx(
                    text_area->font,
                    text_area->get_current_line().substr(0,text_area->get_cursor_index_x()).c_str(),
                    text_area->get_fontSize(), text_area->spacing).x
        + text_area->get_pos_x();


        text_cursor_pos_y =
            text_area->get_pos_y()
            + (static_cast<float>(text_area->get_font().baseSize) * text_area->get_scale() * static_cast<float>(text_area->get_cursor_index_y()));
        BeginDrawing();
        ClearBackground(BLACK);
        text_area->Render();
        if (text_area->get_font() != GetFontDefault())
        {
            //
            DrawTextEx(GetFontDefault(), "|", {
                text_cursor_pos_x - text_area->get_fontSize()/CURSOR_OFFSET, text_cursor_pos_y},
                text_area->get_fontSize(),text_area->get_spacing(),
                SKYBLUE);
        }else
        {

            DrawText("|",static_cast<int>(text_cursor_pos_x),static_cast<int>(text_cursor_pos_y), static_cast<int>(text_area->get_fontSize()), WHITE);
        }

        float x_start = cast_to_float(text_area->get_x() - GRIP_GAP);
        float x_end = cast_to_float(text_area->get_x()- GRIP_GAP);
        float y_end = cast_to_float(GetScreenHeight()) - TOP_BAR_WIDTH;
        DrawLineEx({x_start, text_area->get_pos_y()}, {x_end, y_end},GUI_LINE_WIDTH,WHITE);

        EndDrawing();
    }
    CloseWindow();
    return 0;

}

