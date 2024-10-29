//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <string>
#include <vector>
#include <bits/stdc++.h>
#include <tinyfiledialogs.h>
#include "piece_table.hpp"
//#include "Piece.h"
#include "kuputils.h"



#include <raylib.h>

typedef std::string String;



namespace kupui {


struct  TextArea {
    int FPS = GetFPS();
    float spacing = -2;
    float pos_x{}, pos_y{};
    Color color{};
    float fontSize{};
    Font font{};
    float scale{};
    std::string input_buffer;

    //unsigned int indexOnAddBuff{};

    PieceTable text_buffer;
    bool is_composing = false;
    float compose_timer = 0.0f;        // Timer for composition
    const float COMPOSE_TIMEOUT = 0.5f; // Half second timeout (adjust as needed)


    struct CursorCommand {
        size_t old_pos;
        size_t new_pos;

        size_t old_pos_y;
        size_t new_pos_y;

        CursorCommand(size_t old_pos, size_t new_pos)
            : old_pos(old_pos), new_pos(new_pos), old_pos_y(old_pos), new_pos_y(new_pos) {}
    };

    explicit TextArea(const std::string& initial = "")
        : text_buffer(initial){}

    size_t cursor_index{};

    std::stack<CursorCommand> cursor_undo_stack;
    std::stack<CursorCommand> cursor_redo_stack;

    void insert(const std::string& text) {
        size_t old_pos = cursor_index;
        text_buffer.insert(cursor_index, text);
        cursor_index += text.length();
        cursor_undo_stack.emplace(old_pos, cursor_index);

        // Clear redo stack
        while (!cursor_redo_stack.empty()) {
            cursor_redo_stack.pop();
        }
    }

    void remove(size_t length) {
        if (cursor_index == 0 || length == 0) return;

        // Adjust length if it's more than available characters
        length = std::min(length, cursor_index);

        size_t old_pos = cursor_index;
        size_t remove_start = cursor_index - length;

        text_buffer.remove(remove_start, cursor_index);
        cursor_index = remove_start;
        cursor_undo_stack.emplace(old_pos, cursor_index);

        while (!cursor_redo_stack.empty()) {
            cursor_redo_stack.pop();
        }
    }


    void undo() {
        if (!text_buffer.canUndo() || cursor_undo_stack.empty()) return;

        auto cursor_cmd = cursor_undo_stack.top();
        cursor_undo_stack.pop();

        text_buffer.undo();

        cursor_index = cursor_cmd.old_pos;
        cursor.index_x = cursor_cmd.old_pos;

        std::string text_before_cursor = text_buffer.getText().substr(0, cursor_index);
        cursor.index_y = std::ranges::count(text_before_cursor, '\n');

        cursor_redo_stack.push(cursor_cmd);
    }

    void redo() {
        if (!text_buffer.canRedo() || cursor_redo_stack.empty()) return;

        auto cursor_cmd = cursor_redo_stack.top();
        cursor_redo_stack.pop();

        text_buffer.redo();

        cursor_index = cursor_cmd.new_pos;
        cursor.index_x = cursor_cmd.new_pos;

        std::string text_before_cursor = text_buffer.getText().substr(0, cursor_index);
        cursor.index_y = std::ranges::count(text_before_cursor, '\n');

        cursor_undo_stack.push(cursor_cmd);
    }



    TextArea()
    {
        this->pos_x = 0;
        this->pos_y = 0;
        this->color = WHITE;
        this->fontSize = 20;
        this->font = GetFontDefault();
        this->focused = true;
        this->cursor.index_x = 0;
        this->cursor.index_y = 0;
        this->cursor.symbol = *"|";
        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
        this->spacing = 0;
        this->scale = 3;
        //this->indexOnAddBuff = 0;
        this->cursor_index = 0;
    }
    ;

    TextArea(const float pos_x, const float pos_y,
        const Font& font, const float font_size,const float spacing)
    {
        this->pos_x = pos_x;
        this->pos_y = pos_y;
        this->color = WHITE;
        this->fontSize = font_size;
        this->font = font;
        this->focused = true;
        this->cursor.index_x = 0;
        this->cursor.index_y = 0;
        this->cursor.symbol = *"|";
        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
        this->font = font;
        this->spacing = spacing;
        this->scale = 1;

    };



    ~TextArea();
    [[nodiscard]] float get_pos_y() const
    {
        return this->pos_y;
    };

    struct cursor
    {
        size_t index_x{};
        size_t index_y{};
        size_t index_g{};
        char symbol{};
    } cursor;


    [[nodiscard]] std::vector<std::string> text_vec() const
    {
        std::string display_text = text_buffer.getText();

        // Insert the input buffer at the cursor position
        if (!input_buffer.empty()) {
            display_text.insert(cursor_index, input_buffer);
        }

        std::vector<std::string> v;
        std::stringstream ss(display_text);
        std::string s;

        while (getline(ss, s, '\n')) {
            v.push_back(s);
        }
        v.emplace_back("");
        return v;
    }

    [[nodiscard]] int refresh_cursor_x() const
    {
        return static_cast<int>(this->text_vec().at(cursor.index_y).size());
    }

    void Update()
    {
        if(IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL))
        {
            if(IsKeyPressed(KEY_S))
            {
                try
                {
                    const std::string dialog = tinyfd_saveFileDialog("Save Your File (:", GetApplicationDirectory(),0,nullptr,"");
                    char *save_text = this->text_buffer.getText().data();
                    SaveFileText(dialog.c_str(), save_text);
                }catch(...){}
            }

            if(IsKeyPressed(KEY_Z))
            {
                this->undo();
            }
            if(IsKeyPressed(KEY_Y))
            {
                this->redo();
            }
        }

        int char_key = GetCharPressed();
        while (char_key > 0)
        {
            if ((char_key >= 32) && (char_key < 127))
            {
                const char new_char = static_cast<char>(char_key);
                input_buffer += new_char;
                is_composing = true;

                if (new_char == ' ' || new_char == '.' || new_char == ',' ||
                    new_char == ';' || new_char == '!' || new_char == '?') {
                    this->insert(input_buffer);
                    this->cursor.index_g += input_buffer.length();
                    this->cursor.index_x += input_buffer.length();
                    input_buffer.clear();
                    is_composing = false;
                    }

                this->cursor.index_g ++;
                this->cursor.index_x++;

            }
            char_key = GetCharPressed();
        }

        if (is_composing)
        {
            compose_timer += GetFrameTime();

            if (compose_timer >= COMPOSE_TIMEOUT)
            {
                if(!input_buffer.empty())
                {
                    this->insert(input_buffer);
                    this->cursor.index_g += input_buffer.length();
                    if (!IsKeyDown(KEY_ENTER))
                    {this->cursor.index_x += input_buffer.length();}
                    input_buffer.clear();
                }
                is_composing = false;
                compose_timer = 0.0f;
            }

        }

        if (IsKeyPressed(KEY_BACKSPACE))
        {

            if (!input_buffer.empty()) {
                // If we're composing, just remove from buffer
                input_buffer.pop_back();
                if (this->cursor.index_x > 0)
                {
                    this->cursor.index_x--;
                }
                cursor.index_g--;
                compose_timer = 0.0f; // Reset timer
            } else if (this->cursor_index > 0)
            {
                if (this->cursor.index_x > 0)
                {
                    this->cursor.index_x--;
                }else
                {
                    this->cursor.index_y--;
                }
                this->remove(1);
            }
                this->cursor.index_x = refresh_cursor_x();


        }

        if (IsKeyPressed(KEY_ENTER))
        {
            if (!input_buffer.empty())
            {
                this->insert(input_buffer);
                this->cursor.index_g += input_buffer.length();
                this->input_buffer.clear();
                this->cursor.index_x += input_buffer.length();
            }
            this->insert("\n");
            this->cursor.index_y++;
            this->cursor.index_x = text_vec().at(cursor.index_y).size();
            is_composing = false;
            compose_timer = 0.0f;
        }
   };

    void Render() const
    {
        std::string display_text = text_buffer.getText();

        // Insert the input buffer at the cursor position
        if (!input_buffer.empty()) {
            display_text.insert(cursor_index, input_buffer);
        }

        // Split into lines and render
        std::stringstream ss(display_text);
        std::string line;
        int start_y = 0;

        while (getline(ss, line, '\n')) {
            DrawTextEx(
                this->font,
                line.c_str(),
                {static_cast<float>(this->pos_x),
                 this->pos_y + static_cast<float>(this->font.baseSize) * (this->scale * static_cast<float>(start_y))},
                this->fontSize,
                this->spacing,
                this->color
            );
            start_y++;
        }
    };
    [[nodiscard]] std::string get_current_line() const
    {
        return this->text_vec().at(this->cursor.index_y);
    }
    [[nodiscard]] Font get_font() const
    {
        return this->font;
    }
    [[nodiscard]] float get_fontSize() const
    {
        return this->fontSize;
    }
    [[nodiscard]] size_t get_cursor_index_y() const
    {
        return this->cursor.index_y;
    }

    [[nodiscard]] size_t get_cursor_index_x() const
    {
        return this->cursor.index_x;
    }
    [[nodiscard]] float get_scale() const
    {
        return this->scale;
    }
    [[nodiscard]] float get_spacing() const
    {
        return this->spacing;
    }

    void set_pos_x(const float x)
    {
        this->pos_x = x;
    }
    [[nodiscard]] float get_pos_x() const
    {
        return this->pos_x;
    }
    [[nodiscard]] int get_x() const
    {
        return static_cast<int>(this->pos_x);
    }
    [[nodiscard]] int get_y() const
    {
        return static_cast<int>(this->pos_y);
    }
protected:
    bool focused{};
    bool auto_backspace{};
    int backspace_frame_counter{};
};

} // kupui

#endif //TEXTAREA_HPP
