//
// Created by ajost1 on 11/24/2024.
//


#ifndef EDITOR_HPP
#define EDITOR_HPP

#include <raylib.h>
#include "TextArea.hpp"
#include "piece_table.hpp"
#include "view.hpp"

using std::string;
using std::vector;

struct BufferTab : View {
    string title;
    kupui::TextArea* buffer{};
    BufferTab() = default;
    BufferTab(string title, kupui::TextArea* buffer);
    explicit BufferTab(kupui::TextArea* buffer) {
        this->buffer = buffer;
    };
    void render() override {
        buffer->render();
    };
    void update() override {
        buffer->update();
    }

};

struct text_editor : View {

    float cursor_blink_timer = 0.0f;
    float cursor_blink_rate = 0.53f;
    bool cursor_visible = true;

    Font font{};
    Vector2 pos{};
    Color bg_color{};
    Color text_fill{};

    int current_tab = 0;

    vector<BufferTab> tabs;

    void render() override {
        for (auto& tab : tabs) {
            tab.buffer->render();
        }
    };
    void update() override {
        for (auto& tab : tabs) {
            tab.buffer->update();
        }
    }
    
    text_editor();
};

#endif //EDITOR_HPP
