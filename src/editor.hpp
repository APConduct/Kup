//
// Created by ajost1 on 11/24/2024.
//


#ifndef EDITOR_HPP
#define EDITOR_HPP

#include <algorithm>
#include <cstddef>
#include <iterator>
#include <memory>
#include <raylib.h>
#include <string>
#include <vector>
#include "TextArea.hpp"
#include "view.hpp"

using std::string;
using std::vector;

// Get the filename from a path
struct BufferTab : View<BufferTab> {
    string path;
    string name;
    std::unique_ptr<kupui::TextArea> text_area;
    bool is_active{false};

    BufferTab(
        const string& filepath, const Font& font,
        float font_size, float spacing) {
        path = filepath;
        name = GetFileName(filepath.c_str());
        // Position calculated by TextEditor
        text_area = std::make_unique<kupui::TextArea>(
            208, 60, font, font_size, spacing
        );

        // Load content if file exists
        if (FileExists(path.c_str())) {
            if (const char* content = LoadFileText(path.c_str())) {
                text_area->load_content(content);
                UnloadFileText(const_cast<char*>(content));
            }
        }
    }

    void render() override {
        if (text_area) text_area->render();
    }

    void update(float delta_time) override {
        if (text_area && is_active) text_area->update();
    }

    void set_position(float x, float y){
        if (text_area) {
            text_area->pos_x = x;
            text_area->pos_y = y;
        }
    }

    Vector2 get_cursor_screen_pos(){
        return text_area->get_cursor_screen_pos();
    }

    float get_cursor_x(){
        return text_area->get_cursor_x();
    }

    float get_cursor_y(){
        return text_area->get_cursor_y();
    }
};

// TextEditor class
struct TextEditor : View<TextEditor> {
    vector<std::unique_ptr<BufferTab>> tabs;
    size_t current_tab{0};
    Font font{};
    float font_size{20};
    float spacing{0};
    float tab_height{25};
    float tab_padding{5};
    Vector2 content_start{208, 60}; // Start pos for text area

    bool is_focused{true};

    TextEditor(const Font& editor_font, float size, float space)
        : font(editor_font), font_size(size), spacing(space) {}

    void open_file(const string& path) {
        // Check if file is open already
        auto it = std::find_if(tabs.begin(), tabs.end(),
            [&path](const auto& tab) {return tab->path == path;});

        if (it != tabs.end()) {
            // File already open, switch to it
            size_t index = std::distance(tabs.begin(), it);
            set_active_tab(index);
        } else {
            // Add new tab
            auto new_tab = std::make_unique<BufferTab>(path, font, font_size, spacing);
            new_tab->set_position(content_start.x,content_start.y);
            tabs.push_back(std::move(new_tab));
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
            DrawRectangle(static_cast<int>(tab_x), static_cast<int>(tab_y),
                static_cast<int>(MeasureTextEx(font, tab->name.c_str(),
                font_size/2, spacing).x) +
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

    void update(float delta_time) override {
        // Handle tab clicks
        if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) {
            if (auto [x, y] = GetMousePosition(); y < tab_height) { // Click in tab area
                float tab_x = content_start.x;
                for (size_t i = 0; i < tabs.size(); i++) {
                    float tab_width = MeasureTextEx(font,
                        tabs[i]->name.c_str(), font_size/2,
                        spacing).x + tab_padding*3;

                    if (x >= tab_x && x < tab_x + tab_width) {
                        set_active_tab(i);
                        break;
                    }
                    tab_x += tab_width;
                }
            }
        }

        // Update current buffer
        if (!tabs.empty()) {
            tabs[current_tab]->update(delta_time);
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
