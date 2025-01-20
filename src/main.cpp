#include <cmath>
#include <dde.h>
#include <raylib.h>
#include <string>
#define RAYGUI_IMPLEMENTATION

#include "raygui.h"

#include "editor.hpp"
#include "FileTree.hpp"
#include "TextArea.hpp"

using std::string;

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

    Hue();
    Hue(unsigned char r, unsigned char g, unsigned char b, unsigned char a);
    Hue(unsigned char r, unsigned char g, unsigned char b);
};

int main(int argc, char *argv[])
{
    if (argc == 2) {
        std::cout << "\nOPTIONS IMPLEMENTATION IS IN PROGRESS.\nSTARTING KUP NORMALLY\n\n";
    }

    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(1600, 960, "Kup");

    // Variables for timing
    float last_time = 0.0f;
    float delta_time = 0.0f;

    // Load Fonts
    constexpr int BUFFER_FONT_SIZE = 32;
    constexpr int UI_FONT_SIZE = 32;

    constexpr int FILE_MARGIN_WIDTH = 104;
    constexpr int MENU_BAR_WIDTH = 44;
    constexpr float CURSOR_OFFSET = 8;
    constexpr float GUI_LINE_WIDTH = 2;

    constexpr float FILE_TREE_START_TEST_WIDTH = 100;

    constexpr int GRIP_GAP = static_cast<int>(GUI_LINE_WIDTH*2);

    const std::string JB_MONO_REG_PATH =  "res/JetBrainsMono-2.304/fonts/ttf/JetBrainsMono-Regular.ttf";
    const std::string JB_MONO_THIN_PATH =  "res/JetBrainsMono-2.304/fonts/ttf/JetBrainsMono-Thin.ttf";

    const std::string BRASS_MONO_REG_PATH =  "res/fonts/BrassMono/BrassMono-Regular.ttf";
    const std::string BRASS_MONO_CODE_REG_PATH =  "res/fonts/BrassMono/BrassMonoCode-Regular.ttf";
    const std::string ZED_MONO_REG_PATH = "res/fonts/zed-mono-1.2.0/zed-mono-regular.ttf";
    const std::string IBM_PLEX_REG_PATH = "res/fonts/IBM_Plex_Mono/IBMPlexMono-Regular.ttf";

    const auto jb_mono_reg_buffer = LoadFontEx(JB_MONO_REG_PATH.c_str(),
        BUFFER_FONT_SIZE,nullptr,0);

    const auto jb_mono_reg_ui = LoadFontEx(JB_MONO_REG_PATH.c_str(),
        UI_FONT_SIZE,nullptr,0);

    auto jb_mono_thin = LoadFontEx(JB_MONO_THIN_PATH.c_str(),
        BUFFER_FONT_SIZE,nullptr,0);

    const auto zed_mono_reg = LoadFontEx(ZED_MONO_REG_PATH.c_str(),
        BUFFER_FONT_SIZE,nullptr,0);

    float x = FILE_MARGIN_WIDTH + GRIP_GAP + FILE_TREE_START_TEST_WIDTH; // 208

    TextEditor editor(jb_mono_reg_buffer, BUFFER_FONT_SIZE, 0, MENU_BAR_WIDTH);

    FileTree file_tree(jb_mono_reg_ui, UI_FONT_SIZE, 0, x, MENU_BAR_WIDTH);
    file_tree.set_root(GetWorkingDirectory());
    file_tree.on_file_selected = [&editor](const std::string& path){
        editor.open_file(path);
    };

    SetTargetFPS(120);
    while (!WindowShouldClose())
    {
        // Timing
        auto current_time = static_cast<float>(GetTime());
        delta_time = current_time - last_time;
        last_time = current_time;

        editor.update(delta_time);
        file_tree.update(delta_time);

        BeginDrawing();
        ClearBackground(BLACK);

        // render FileTree text
        file_tree.render();

        // render editor background
        int tapx = static_cast<int>(editor.content_start.x)-GRIP_GAP;
        int tapy = static_cast<int>(editor.content_start.y);
        DrawRectangle(tapx, tapy, GetScreenWidth()-tapx, GetScreenHeight()-tapy, BLACK);

        editor.render();

        // Draw cursor at correct position
        if (!editor.tabs.empty()) {
            if (editor.is_focused){
                Vector2 cursor_pos = {
                    editor.tabs.at(editor.current_tab)->get_cursor_x() - editor.font_size/CURSOR_OFFSET,
                    editor.tabs.at(editor.current_tab)->get_cursor_y()
                };
                DrawTextEx(
                    GetFontDefault(),
                    "|",
                    cursor_pos,
                    editor.font_size,
                    0,
                    editor.tabs.at(editor.current_tab)->text_area->cursor_visible ? SKYBLUE : BLANK);
            }
        }

        auto x_start = static_cast<float>(editor.content_start.x - GRIP_GAP);
        auto x_end = static_cast<float>(editor.content_start.x - GRIP_GAP);
        auto y_end = static_cast<float>(GetScreenHeight() - MENU_BAR_WIDTH);

        //DrawRectangle(0,y_end,GetScreenWidth(),MENU_BAR_WIDTH,BLACK);

        // line between file tree and buffer view
        DrawLineEx({x_start, 0}, {x_end, y_end},GUI_LINE_WIDTH,WHITE);

        // line between main content and bottom bar
        DrawLineEx({0, y_end}, {static_cast<float>(GetScreenWidth()), y_end},GUI_LINE_WIDTH,WHITE);

        EndDrawing();
    }
    CloseWindow();
    return 0;

}
