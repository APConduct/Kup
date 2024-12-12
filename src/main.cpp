#include "piece_table.hpp"
#include <raylib.h>
#include <string>
#include <vector>
#define RAYGUI_IMPLEMENTATION


#include "raygui.h"

#include "TextArea.hpp"
#include "editor.hpp"
#include "FileTree.hpp"

using std::string;
using std::vector;

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

    if (argc != 2) {
        printf("Usage: ./main <Hue>\n");
    }else {
        std::cout << "\nOPTIONS IMPLEMENTATION IS IN PROGRESS.\nSTARTING KUP NORMALLY\n\n";
    }

    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(1600, 960, "Kup");

    constexpr int BUFFER_FONT_SIZE = 32;
    constexpr int UI_FONT_SIZE = 32;

    constexpr int FILE_MARGIN_WIDTH = 104;
    constexpr int MENU_BAR_WIDTH = 40;
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
    float y = 60;
    Font rn_font = jb_mono_reg_buffer;
    float font_size = BUFFER_FONT_SIZE; // 32
    float space = 0;

    auto text_area = kupui::TextArea((FILE_MARGIN_WIDTH + GRIP_GAP + FILE_TREE_START_TEST_WIDTH),60, jb_mono_reg_buffer, BUFFER_FONT_SIZE, 0);
    BufferTab bt = BufferTab();

    FileTree file_tree(jb_mono_reg_ui, UI_FONT_SIZE, 0);
    file_tree.set_root(GetWorkingDirectory());
    file_tree.on_file_selected = [&text_area](const std::string& path){
        // Load file content into text area
        const char* content = LoadFileText(path.c_str());
        if (content) {
            std::string content_str(content);
            text_area.load_content(content_str); // Copy to string
            UnloadFileText(const_cast<char*>(content));

            // Reset cursor and update display
            text_area.cursor.index = 0;
            text_area.update_cursor_position();
            text_area.render_cache.invalidate();
            text_area.update_render_cache();
        }
    };

    SetTargetFPS(120);
    while (!WindowShouldClose())
    {
        text_area.update();

        file_tree.update();
        //std::string dir_path(GetWorkingDirectory());
        //FilePathList list = LoadDirectoryFiles(dir_path.c_str());
        //char** work_path = list.paths;
        //std::vector<string> paths = std::vector<std::string>(work_path, work_path + list.count);

        BeginDrawing();
        ClearBackground(BLACK);

        file_tree.render();

        // render FileTree text
        // int jump = UI_FONT_SIZE+6;
        // for (const auto & path : paths) {
        //     DrawTextEx(jb_mono_reg_ui, path.substr(dir_path.size()+1).c_str(), {20, 20+static_cast<float>(jump)}, UI_FONT_SIZE,
        //         0,
        //         WHITE);
        //     jump += UI_FONT_SIZE+6;
        // }

        // render editor background
        int tapx = static_cast<int>(text_area.pos_x)-GRIP_GAP;
        int tapy = static_cast<int>(text_area.pos_y);
        DrawRectangle(tapx, tapy, GetScreenWidth()-tapx, GetScreenHeight()-tapy, BLACK);

        text_area.render();

        if(text_area.render_cache.lines.empty()){
            text_area.update_render_cache();
        }
        for (const auto& line : text_area.render_cache.lines){
            DrawTextEx(
                text_area.font, line.text.c_str(),
                line.position,
                text_area.font_size,
                text_area.spacing,
                text_area.text_color);
        }


        // Draw cursor at correct position
        if (text_area.focused){
            Vector2 cursor_pos = {
                text_area.get_cursor_x() - text_area.get_fontSize()/CURSOR_OFFSET,
                text_area.get_cursor_y()
            };
            DrawTextEx(
                GetFontDefault(),
                "|",
                cursor_pos,
                text_area.get_fontSize(),
                0,
                text_area.cursor_visible ? SKYBLUE : BLANK);
        }

        auto x_start = static_cast<float>(text_area.get_x() - GRIP_GAP);
        auto x_end = static_cast<float>(text_area.get_x()- GRIP_GAP);
        auto y_end = static_cast<float>(GetScreenHeight() - MENU_BAR_WIDTH);
        // line between file tree and buffer view
        DrawLineEx({x_start, 0}, {x_end, y_end},GUI_LINE_WIDTH,WHITE);

        // line between main content and bottom bar
        DrawLineEx({0, y_end}, {static_cast<float>(GetScreenWidth()), y_end},GUI_LINE_WIDTH,WHITE);


        EndDrawing();
    }
    CloseWindow();
    return 0;

}
