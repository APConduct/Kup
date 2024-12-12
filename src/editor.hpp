//
// Created by ajost1 on 11/24/2024.
//


#ifndef EDITOR_HPP
#define EDITOR_HPP

#include <algorithm>
#include <cstddef>
#include <fibersapi.h>
#include <iterator>
#include <memory>
#include <raylib.h>
#include <string>
#include <vector>
#include <winnt.h>
#include "TextArea.hpp"
#include "piece_table.hpp"
#include "view.hpp"

using std::string;
using std::vector;

struct BufferTab : View {
    string path;
    string name;
    std::unique_ptr<kupui::TextArea> text_area;
    bool is_active{false};

    BufferTab(
        const string& filepath,
        const Font& font,
        float font_size,
        float spacing) {

        path = filepath;
        name = GetFileName(filepath.c_str());
        // Position calculated by TextEditor
        text_area = std::make_unique<kupui::TextArea>(
            0, 0, font, font_size, spacing
        );

        // Load content if file exists
        if (FileExists(path.c_str())) {
            const char* content = LoadFileText(path.c_str());
            if (content) {
                text_area->load_content(content);
                UnloadFileText(const_cast<char*>(content));
            }
        }
    }

    void render() override {
        if (text_area) text_area->render();
    }

    void update() override {
        if (text_area && is_active) text_area->update();
    }

    void set_position(float x, float y){
        if (text_area) {
            text_area->pos_x = x;
            text_area->pos_y = y;
        }
    }
};

struct TextEditor : View {
    vector<std::unique_ptr<BufferTab>> tabs;
    size_t current_tab{0};
    Font font{};
    float font_size{20};
    float spacing{0};
    float tab_height{25};
    float tab_padding{5};
    Vector2 content_start{208, 60}; // Start pos for text area

    TextEditor(const Font& editor_font, float size, float space)
        : font(editor_font), font_size(size), spacing(space) {}

    void open_file(const string& path) {
        // Check if file is open already
        auto it = std::find_if(tabs.begin(), tabs.end(),
            [&path](const auto& tab) {return tab->path == path;});

        if (it != tabs.end()) {
            // File already open, switch to it
            size_t index = std::distance(tabs.begin(), it);
            set_active_tab(tabs.size() - 1);
        }
    }

    void set_active_tab(size_t index) {
        if (index < tabs.size()) {
            // Deactivate current tab
            if (current_tab < tabs.size()) {
                tabs[current_tab]->is_active = false;
            }
            // Activate new tab
            current_tab = index;
            tabs[current_tab]->is_active = true;
        }
    }

    void render() override {
        // Render Tabs
        float tab_x = content_start.x;
        float tab_y = 0;

        for (size_t i = 0; i < tabs.size(); i++) {
            const auto& tab = tabs[i];
            bool is_current = (i == current_tab);

            // Draw tab background
            Color tab_color = is_current ? DARKGRAY : GRAY;
            DrawRectangle(tab_x, tab_y,
                MeasureTextEx(font, tab->name.c_str(),
                font_size/2, spacing).x +
                tab_padding*2, tab_height, tab_color);

            // Draw filename
            DrawTextEx(font, tab->name.c_str(),
                {tab_x + tab_padding, tab_y + tab_padding},
                font_size/2, spacing,
                is_current ? WHITE : LIGHTGRAY);

            tab_x += MeasureTextEx(font, tab->name.c_str(),
                font_size/2, spacing).x + tab_padding*3;
        }

        // Render current Buffer
        if (!tabs.empty()) {
            tabs[current_tab]->render();
        }
    }

    void update() override {
        // Handle tab clicks
        if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) {
            Vector2 mouse = GetMousePosition();
            if (mouse.y < tab_height) { // Click in tab area
                float tab_x = content_start.x;
                for (size_t i = 0; i < tabs.size(); i++) {
                    float tab_width = MeasureTextEx(font,
                        tabs[i]->name.c_str(), font_size/2,
                        spacing).x + tab_padding*3;

                    if (mouse.x >= tab_x && mouse.x < tab_x + tab_width) {
                        set_active_tab(i);
                        break;
                    }
                    tab_x += tab_width;
                }
            }
        }

        // Update current buffer
        if (!tabs.empty()) {
            tabs[current_tab]->update();
        }
    }

    void close_current_tab() {
        if (!tabs.empty()) {
            tabs.erase(tabs.begin() + current_tab);
            if (current_tab >= tabs.size()) {
                current_tab = tabs.empty() ? 0 : tabs.size() - 1;
            }
        }
    }
};

#endif //EDITOR_HPP
