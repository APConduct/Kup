#include <raylib.h>
#include <string>
#define RAYGUI_IMPLEMENTATION


//#include <raygui.h>

#include "TextArea.hpp"





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
    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(1600, 960, "Kup");

    constexpr int GUI_BAR_UNIT = 64;

    constexpr int FONT_SIZE = 40;
    constexpr int FILE_MARGIN_WIDTH = 104;
    constexpr int SIDEBAR_WIDTH = GUI_BAR_UNIT;
    constexpr int TOP_BAR_WIDTH = GUI_BAR_UNIT;
    constexpr float CURSOR_OFFSET = 8;
    constexpr float GUI_LINE_WIDTH = 2;

    constexpr int GRIP_GAP = 5;

    const std::string JB_MONO_REG_PATH =  "src/resources/JetBrainsMono-2.304/fonts/ttf/JetBrainsMono-Regular.ttf";
    const std::string BRASS_MONO_REG_PATH =  "../src/resources/fonts/BrassMono/BrassMono-Regular.ttf";
    const std::string BRASS_MONO_CODE_REG_PATH =  "../src/resources/fonts/BrassMono/BrassMonoCode-Regular.ttf";
    const std::string ZED_MONO_REG_PATH = "src/resources/fonts/zed-mono-1.2.0/zed-mono-regular.ttf";
    const std::string IBM_PLEX_REG_PATH = "../src/resources/fonts/IBM_Plex_Mono/IBMPlexMono-Regular.ttf";

    const auto jb_mono_reg = LoadFontEx(JB_MONO_REG_PATH.c_str(),
        FONT_SIZE,nullptr,0);

    const auto zed_mono_reg = LoadFontEx(ZED_MONO_REG_PATH.c_str(),
        FONT_SIZE,nullptr,0);
    auto* text_area = new kupui::TextArea((SIDEBAR_WIDTH + FILE_MARGIN_WIDTH + GRIP_GAP),60, jb_mono_reg, FONT_SIZE, static_cast<float>(jb_mono_reg.glyphs->offsetX));
    SetTargetFPS(120);


    while (!WindowShouldClose())
    {
        text_area->Update();


        std::string dir_path(GetWorkingDirectory());
        // dir_path.append("\\..");
        FilePathList list = LoadDirectoryFiles(dir_path.c_str());
        char** work_path = list.paths;
        std::vector<string> paths(work_path, work_path + list.count);


        BeginDrawing();
        ClearBackground(BLACK);
        text_area->Render();

        // Draw cursor at correct position
        if (text_area->focused){
            Vector2 cursor_pos = {
                text_area->get_cursor_x() - text_area->get_fontSize()/CURSOR_OFFSET,
                text_area->get_cursor_y()
            };
            DrawTextEx(
                GetFontDefault(),
                "|",
                cursor_pos,
                text_area->get_fontSize(),
                0,
                text_area->cursor_visible ? SKYBLUE : BLANK);
        }



        auto x_start = static_cast<float>(text_area->get_x() - GRIP_GAP);
        auto x_end = static_cast<float>(text_area->get_x()- GRIP_GAP);
        auto y_end = static_cast<float>(GetScreenHeight() - TOP_BAR_WIDTH);
        DrawLineEx({x_start, 0}, {x_end, y_end},GUI_LINE_WIDTH,WHITE);

        DrawLineEx({0, y_end}, {cast_to_float(GetScreenWidth()), y_end},GUI_LINE_WIDTH,WHITE);


        int jump = 40;
        for (const auto & path : paths) {
            DrawText(path.substr(dir_path.size()+1).c_str(), 40, jump, 20, WHITE);
            jump += 40;
        }

        EndDrawing();
    }
    CloseWindow();
    return 0;

}
