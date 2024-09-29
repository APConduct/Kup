#include <iostream>
#include <unistd.h>
#include <fstream>
#include <raylib.h>
//#include "Button.hpp"
//#define RAYGUI_IMPLEMENTATION
//#include "raygui.h"
#include <vector>
#include <imgui.h>
#include <rlImGui.h>
#include <rlImGuiColors.h>
#include <lua.h>


//#include <gtk/gtk.h>
//#include <gtk/gtkwindow.h>
#include "TextArea.hpp"

// TODO - implement cursor struct

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

    auto* text_area = new kupui::TextArea();

    SetTargetFPS(120);


    rlImGuiSetup(true);



    while (!WindowShouldClose())
    {
        rlImGuiBegin();

        bool open = true;
        ImGui::ShowDemoWindow(&open);

        // end ImGui Content


        text_area->Update();
        BeginDrawing();
        ClearBackground(BLACK);
        text_area->Render();

        rlImGuiEnd();


        EndDrawing();
    }
    rlImGuiShutdown();

    CloseWindow();

    return 0;

}

