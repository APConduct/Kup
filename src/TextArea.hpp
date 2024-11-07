//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <algorithm>
#include <cstddef>
#include <functional>
#include <lua.h>
#include <sstream>
#include <string>
#include <vector>
#include <bits/stdc++.h>
#include "ext/tinyfd/tinyfiledialogs.h"
#include "piece_table.hpp"
#include <raylib.h>
#include <lua.hpp>

typedef std::string string;



namespace kupui {


struct  TextArea {
    int FPS = GetFPS();
    float spacing {-2};
    float pos_x{}, pos_y{};
    Color color{};
    float fontSize{};
    Font font{};
    float scale{1};
    std::string input_buffer;


    void move_cursor_left(){
        if (cursor.index > 0){
            cursor.index--;
            update_cursor_position();
        }
    }

    void move_cursor_right(){
        if (cursor.index < text_buffer.get_text().length()){
            cursor.index ++;
            update_cursor_position();
        }
    }

    void move_cursor_up(){

        std::string text = text_buffer.get_text();
        size_t line_start = text.rfind('\n', cursor.index - 1);
         if (line_start == std::string::npos){
            cursor.index = 0;
        } else{
            size_t prev_line_start = text.rfind('\n', line_start - 1);
            size_t offset = cursor.index - line_start;
            if (prev_line_start == std::string::npos){
                cursor.index = std::min(offset - 1, line_start);;
            } else{
                cursor.index = std::min(prev_line_start + offset, line_start);
            }
        }
        update_cursor_position();
    }

    void move_cursor_down(){
        std::string text = text_buffer.get_text();
        size_t line_end = text.find('\n', cursor.index);
        if (line_end != std::string::npos){
            size_t curr_line_start = text.rfind('\n', cursor.index);
            curr_line_start = (curr_line_start == std::string::npos) ? 0 : curr_line_start + 1;
            size_t column = cursor.index - curr_line_start;

            // Find the start of the next line
            size_t next_line_start = line_end + 1;
            size_t next_line_end = text.find('\n', next_line_start);
            if (next_line_end == std::string::npos) next_line_end = text.length();

            // Position cursor at the same column in next line, or end of line is shorter
            cursor.index = std::min(next_line_start + column, next_line_end);
            update_cursor_position();
        }
    }


    // Add a cached length to avoid recalculating
    size_t total_length{0};
    // Add line index cache for faster line-based operations

    struct LineCache{
        std::vector<size_t> line_starts;
        bool is_dirty{true};

        void invalidate(){ is_dirty = true; }
        void update(const std::string& text){
            if (is_dirty) return;
            line_starts.clear();
            line_starts.push_back(0);
            for(size_t i = 0; i < text.length(); i++){
                if (text[i] == '\n') line_starts.push_back(i + 1);
            }
            is_dirty = false;
        }
    } line_cache;

    struct CursorState {
        size_t index{0};
        size_t line{0};
        size_t column{0};
        char symbol{'|'};

                void update(const PieceTable& buffer){
                    //Update line/column based on index
                    std::string text = buffer.get_text().substr(0,index);
                    line = std::count(text.begin(), text.end(), '\n');
                    auto last_new_line = text.find_last_of('\n');
                    column = last_new_line == std::string::npos ? index : index - last_new_line - 1;
                }

    } cursor;

    struct CompositionState {
        std::string buffer;
        bool is_active{false};
        float timer{0.0f};
        static constexpr float TIMEOUT = 0.5;

        void reset(){
            buffer.clear();
            is_active = false;
            timer = 0.0f;
        }
    } composition;
    struct RenderCache{
        struct Line{
            string text;
            Vector2 position;
            bool is_dirty{true};
        };
        mutable std::vector<Line> lines;
        void invalidate() {
            for (auto& line : lines) line.is_dirty = true;
        }
    }render_cache;





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
        : text_buffer(initial)
    {
        L = luaL_newstate();
        luaL_openlibs(L);
    }

    size_t cursor_index{};

    std::stack<CursorCommand> cursor_undo_stack;
    std::stack<CursorCommand> cursor_redo_stack;

    void insert(const std::string& text) {
        if (text.empty()) return;

        size_t text_length = text_buffer.get_text().length();
        if (cursor_index > text_length) {
            cursor_index = text_length;
            cursor.index = text_length;

        }

        size_t old_pos = cursor_index;
        text_buffer.insert(cursor_index, text);
        cursor_index += text.length();
        cursor.index = cursor_index;

        CursorCommand cmd = {old_pos, cursor_index};
        cursor_undo_stack.push(cmd);

        //cursor_undo_stack.emplace(old_pos, cursor_index);
        // Clear redo stack
        while (!cursor_redo_stack.empty()) {
            cursor_redo_stack.pop();
        }
        update_cursor_position();
        render_cache.invalidate();
        update_render_cache();
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
        update_cursor_position();
        render_cache.invalidate();
        update_render_cache();
    }


    void undo() {

            // Commit pending input
            if (is_composing || !input_buffer.empty()){
                commit_position();
            }

            if (!text_buffer.canUndo() || cursor_undo_stack.empty()) return;

            auto cursor_cmd = cursor_undo_stack.top();
            cursor_undo_stack.pop();

            text_buffer.undo();

            cursor_index = cursor_cmd.old_pos;
            cursor.index = cursor_index;

            update_cursor_position();

            cursor_redo_stack.push(cursor_cmd);

            render_cache.invalidate();
            update_render_cache();
        }

        void redo() {
            if (!text_buffer.canRedo() || cursor_redo_stack.empty()) return;

            auto cursor_cmd = cursor_redo_stack.top();
            cursor_redo_stack.pop();

            text_buffer.redo();

            cursor_index = cursor_cmd.new_pos;
            cursor.index = cursor_index;

            update_cursor_position();

            cursor_undo_stack.push(cursor_cmd);

            render_cache.invalidate();
            update_render_cache();
        }



    TextArea()
    {
        this->pos_x = 0;
        this->pos_y = 0;
        this->color = WHITE;
        this->fontSize = 20;
        this->font = GetFontDefault();
        this->focused = true;
        this->cursor.column = 0;
        this->cursor.line = 0;
        this->cursor.symbol = *"|";
        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
        this->spacing = 0;
        this->scale = 3;
        this->cursor_index = 0;

        L = luaL_newstate();
        luaL_openlibs(L);
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
        this->cursor.column = 0;
        this->cursor.line = 0;
        this->cursor.symbol = *"|";
        this->auto_backspace = false;
        this->backspace_frame_counter = 0;
        this->font = font;
        this->spacing = spacing;
        this->scale = 1;

        //L = luaL_newstate();
        //luaL_openlibs(L);

    };



    ~TextArea();
    [[nodiscard]] float get_pos_y() const
    {
        return this->pos_y;
    };




    [[nodiscard]] std::vector<std::string> text_vec() const
    {
        std::string display_text = text_buffer.get_text();

        // Insert the input buffer at the cursor_old_struct position
        if (!input_buffer.empty()) {
            display_text.insert(cursor_index, input_buffer);
        }

        std::vector<std::string> v;
        std::stringstream ss(display_text);
        std::string s;

        while (getline(ss, s, '\n')) {
            v.push_back(s);
        }
        if (display_text.empty() || display_text.back() == '\n'){
            v.push_back("");
        }
        return v;
    }

    [[nodiscard]] int refresh_cursor_x() const
    {
        auto lines = text_vec();
        if (cursor.line < lines.size()){
            return static_cast<int>(lines[cursor.line].size());
        };
        return 0;
    }


        float cursor_blink_timer = 0.0f;
        float cursor_blink_rate = 0.53f;
        bool cursor_visible = true;
    void Update()
    {
        // TODO - IMPL/DEF LINES BELOW
        // this->handle_input();
        // this->update_composition();
        // this->update_cursor();
        if(IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL))
        {
            if(IsKeyPressed(KEY_S))
            {

                // TODO - DO SAVE LOGIC

                //try
                //{
                //    const std::string dialog = tinyfd_saveFileDialog("Save Your File (:", GetApplicationDirectory(),0,nullptr,"");
                //    std::string text_content = this->text_buffer.get_text();
                //    char *save_text = text_content.data();
                //    SaveFileText(dialog.c_str(), save_text);
                //}catch(...){}
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

        // check arrow keys before char input to not block movement with composition
        if (IsKeyPressed(KEY_LEFT) || (IsKeyDown(KEY_LEFT))){
            move_cursor_left();
        }

        if (IsKeyPressed(KEY_RIGHT) || (IsKeyDown(KEY_RIGHT))){
            move_cursor_right();
        }

        if (IsKeyPressed(KEY_UP) || (IsKeyDown(KEY_UP))){
            move_cursor_up();
        }

        if (IsKeyPressed(KEY_DOWN) || (IsKeyDown(KEY_DOWN))){
            move_cursor_down();
        }


        int char_key = GetCharPressed();
        while (char_key > 0) {
            if ((char_key >= 32) && (char_key < 127)) {
                const char new_char = static_cast<char>(char_key);

                // Ensure cursor is within bounds before adding to input buffer
                size_t text_length = text_buffer.get_text().length();
                if (cursor.index > text_length){
                    cursor.index = text_length;
                }

                input_buffer += new_char;
                is_composing = true;
                compose_timer = 0.0f; // Reset timer on new input

                update_render_cache();

                if (new_char == ' ' || new_char == '.' || new_char == ',' ||
                    new_char == ';' || new_char == '!' || new_char == '?')
                {
                    commit_position();
                }
            }
            char_key = GetCharPressed();
        }

        if (is_composing)
        {
            compose_timer += GetFrameTime();

            if (compose_timer >= COMPOSE_TIMEOUT)
            {
                commit_position();
            }

        }

        if (IsKeyPressed(KEY_BACKSPACE)){

            if (!input_buffer.empty()) {
                // If we're composing, just remove from buffer
                input_buffer.pop_back();
                compose_timer = 0.0f;
                update_render_cache();
            } else if (this->cursor_index > 0)
            {
                size_t current_line = cursor.line;

                this->remove(1);

                if (cursor.line == current_line && cursor.column > 0)
                {
                    this->cursor.column--;
                }
                update_cursor_position();
            }
        }

        if (IsKeyPressed(KEY_ENTER))
        {
            if (!input_buffer.empty())
            {
                this->insert(input_buffer);
                this->cursor.index += input_buffer.length();
                this->input_buffer.clear();
                //this->cursor.column += input_buffer.length();
            }
            this->insert("\n");
            cursor.index++;
            //this->cursor.line++;
            update_cursor_position(); //update line and column

            //this->cursor.column = text_vec().at(cursor.line).size();
            is_composing = false;
            compose_timer = 0.0f;
            render_cache.invalidate();
            update_render_cache();
        };

        // Update cursor blink
                cursor_blink_timer += GetFrameTime();
                if (cursor_blink_timer >= cursor_blink_rate) {
                    cursor_visible = !cursor_visible;
                    cursor_blink_timer = 0;
                }

                // Reset blink on any input
                int key = GetKeyPressed();
                if (key != 0){
                    cursor_visible = true;
                    cursor_blink_timer = 0;
                }

    };

    void Render() const
    {

        if(render_cache.lines.empty()){
            update_render_cache();
        }

        for (const auto& line : render_cache.lines){
            DrawTextEx(
                font, line.text.c_str(),
                line.position,
                fontSize,
                spacing,
                color
            );

        }

        //std::string display_text = text_buffer.get_text();

        // Insert the input buffer at the cursor_old_struct position

        //if (!input_buffer.empty()) {
        //    display_text.insert(cursor_index, input_buffer);
        //}

        // Split into lines and render

        //std::stringstream ss(display_text);
        //std::string line;
        //int start_y = 0;
        //while (getline(ss, line, '\n')) {
        //    DrawTextEx(
        //        this->font,
        //        line.c_str(),
        //        {static_cast<float>(this->pos_x),
        //         this->pos_y + static_cast<float>(this->font.baseSize) * (this->scale * static_cast<float>(start_y))},
        //        this->fontSize,
        //        this->spacing,
        //        this->color
        //    );
        //    start_y++;
        //}
    };
    [[nodiscard]] std::string get_current_line() const
    {
        return this->text_vec().at(this->cursor.line);
    }
    [[nodiscard]] Font get_font() const
    {
        return this->font;
    }
    [[nodiscard]] float get_fontSize() const
    {
        return this->fontSize;
    }
    [[nodiscard]] size_t get_cursor_line() const
    {
        return this->cursor.line;
    }

    [[nodiscard]] size_t get_cursor_column() const
    {
        return this->cursor.line;
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
    // Example binding implementation
    static int l_buffer_insert(lua_State* L) {
        auto* area = static_cast<TextArea*>(lua_touserdata(L, 1));
        const char* text = luaL_checkstring(L, 2);
        // size_t pos = luaL_checkinteger(L, 3);
        area->insert(text);
        return 0;
    }


    // Core API for Lua
    static void registerLuaAPI(lua_State* L) {
        // Buffer operations
        lua_register(L, "buffer_insert", l_buffer_insert);
        //lua_register(L, "buffer_remove", l_buffer_remove);
        //lua_register(L, "buffer_get_text", l_buffer_get_text);

        // Cursor operations
        //lua_register(L, "cursor_move", l_cursor_move);
        //lua_register(L, "cursor_get_position", l_cursor_get_position);

        // Composition
        //lua_register(L, "start_composition", l_start_composition);
        //lua_register(L, "end_composition", l_end_composition);

        // Rendering
        //lua_register(L, "set_font", l_set_font);
        //lua_register(L, "set_colors", l_set_colors);
    }

    // Example binding implementation
    //static int l_buffer_insert(lua_State* L) {
    //    TextArea* area = (TextArea*)lua_touserdata(L, 1);
    //    const char* text = luaL_checkstring(L, 2);
    //    size_t pos = luaL_checkinteger(L, 3);
    //    area->insert(text, pos);
    //    return 0;
    //}
// @prefer: keep all non-public members as protected
protected:
    void update_cursor_position(){
        std::string text = text_buffer.get_text();
        size_t text_length = text.length();

        if (cursor.index > text_length){
            cursor.index = text_length;
            cursor_index = text_length;
        }

        if(cursor.index == 0){
            cursor.line = 0;
            cursor.column = 0;
        } else {
            std::string text_before_cursor = text.substr(0, cursor.index);
            cursor.line  = std::count(text_before_cursor.begin(), text_before_cursor.end(),'\n');
            size_t last_newline = text_before_cursor.rfind('\n');
            cursor.column = (last_newline == std::string::npos) ? cursor.index : cursor.index - last_newline - 1;

        }
    }
    void commit_position(){
        if (!input_buffer.empty()){

            // Get current text length for bounds checking
            size_t text_length = text_buffer.get_text().length();
            if (cursor.index > text_length){
                cursor.index = text_length;
            }

            string commit_text = input_buffer;
            this->insert(commit_text); // insert as one operation
            cursor.index += commit_text.length();
            update_cursor_position(); // update line//column

            input_buffer.clear();
            is_composing = false;
            compose_timer = 0.0f;
            render_cache.invalidate();
            update_render_cache();
        }
    }

    void update_render_cache() const{
        string display_text = text_buffer.get_text();
        if(!this->input_buffer.empty()){
            display_text.insert(cursor.index, input_buffer);
        }
        render_cache.lines.clear();
        float y = pos_y;

        std::stringstream ss(display_text);
        std::string line;
        while (std::getline(ss, line, '\n')){
            RenderCache::Line cached_line{
                line,
                {pos_x, y},
                false
            };
            render_cache.lines.push_back(cached_line);
            y += font.baseSize * scale;
        }
    }
    struct Event{
        enum Type { Insert, Delete, CursorMove, CompositionStart, CompositionEnd};
        Type type;
        size_t position;
        string text;
    };

    std::vector<std::function<void(const Event&)>> event_handlers;
    bool auto_backspace{};
    int backspace_frame_counter{};
public:
    void addEventListener(const std::function<void(const Event&)>& handler) {
        event_handlers.push_back(handler);
    }

protected:
    void fireEvent(const Event& event) {
        for (const auto& handler : event_handlers) {
            handler(event);
        }
    }
    lua_State* L;  // Lua state
    // Core state variables...

public:
    Vector2 get_cursor_screen_pos() const {
        float x = pos_x;
        float y =  pos_y;

        // get text up tp cursor
        string text = text_buffer.get_text().substr(0, cursor.index);

        // count newlines for y position
        size_t newlines = std::count(text.begin(), text.end(), '\n');
        y += newlines * fontSize;

        // get x position
        size_t last_newline = text.rfind('\n');
        if (last_newline != std::string::npos){
            // If we're not on the first line, measure from the last newline
            string current_line = text.substr(last_newline + 1);
            x += MeasureTextEx(font,current_line.c_str(), fontSize, spacing).x;
        } else {
            // If we're on the first line, measure from the start
            x += MeasureTextEx(font,text.c_str(), fontSize, spacing).x;
        }

        // add composition buffer offset if composing
        if (is_composing && !input_buffer.empty()) {
            x += MeasureTextEx(font,input_buffer.c_str(), fontSize, spacing).x;
        }

        return {x, y};
    }

    // helper functions for main.cpp
    float get_cursor_x() const { return get_cursor_screen_pos().x; }
    float get_cursor_y() const { return get_cursor_screen_pos().y; }

    bool focused{true};

};

} // kupui

#endif //TEXTAREA_HPP
