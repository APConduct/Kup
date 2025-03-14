//
// Created by ajost1 on 9/24/2024.
//

#ifndef TEXTAREA_HPP
#define TEXTAREA_HPP
#include <algorithm>
#include <cstddef>
#include <functional>
#include <sstream>
#include <stack>
#include <string>
#include <vector>
#include <iostream>
#include "piece_table.hpp"
#include <raylib.h>
#include "scroll_bar.hpp"

typedef std::string string;

namespace kupui {

struct  TextArea {


    int FPS = GetFPS();

    float space_below{0};

    float spacing {0};
    float pos_x{0}, pos_y{0};
    Color text_color{WHITE};
    float font_size{20};
    Font font{};
    float scale{1};
    std::string input_buffer;
    bool focused{true};

    // Scroll state
    float scroll_offset_y{0};
    float scroll_offset_x{0};
    // Maybe make these more sophisticated
    float visible_height{static_cast<float>(GetScreenHeight()) - pos_y - space_below};
    float visible_width{static_cast<float>(GetScreenWidth()) - pos_x};

    float total_height{0};
    float max_width{0};

    ScrollBar vertical_scrollbar{true};
    ScrollBar horizontal_scrollbar{false};

    PieceTable text_buffer;
    bool is_composing{false};
    float compose_timer = 0.0f;        // Timer for composition
    const float COMPOSE_TIMEOUT = 0.5f; // Half second timeout (adjust as needed)

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

        const std::string text = text_buffer.get_text();
        if (const size_t line_start = text.rfind('\n', cursor.index - 1); line_start == std::string::npos){
            cursor.index = 0;
        } else{
            const size_t prev_line_start = text.rfind('\n', line_start - 1);
            const size_t offset = cursor.index - line_start;
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

    [[nodiscard]] bool is_mouse_over() const {
        Vector2 mouse = GetMousePosition();
        return (
            mouse.x >= pos_x &&
            mouse.x <= pos_x + visible_width &&
            mouse.y >= pos_y &&
            mouse.y <= pos_y + visible_height
        );
    }

    float calculate_max_width() const {
        float width = 0;
        for (const auto& line : text_vec()) {
            float line_width = MeasureTextEx(
                font,
                line.c_str(),
                font_size,
                spacing
            ).x;
            width = std::max(width, line_width);
        }
        return width;
    }

    void update_dimensions() {
        // Update content bounds
        max_width = calculate_max_width();
        total_height = static_cast<float>(text_vec().size()) * (font_size + spacing);

        // Update visible area
        visible_height = static_cast<float>(GetScreenHeight()) - pos_y - space_below;
        visible_width = static_cast<float>(GetScreenWidth()) - pos_x;
    }

    void handle_scroll() {
        // Only handle scroll if mouse is over the text area
        if (!is_mouse_over()) return;

        auto [x, y] = GetMouseWheelMoveV();
        if (x != 0 || y != 0) {
            if (IsKeyDown(KEY_LEFT_SHIFT)){
                // Horizontal scroll with shift+wheel
                scroll_offset_x = std::clamp(
                    scroll_offset_x - y * 40.0f,
                    0.0f,
                    std::max(0.0f, max_width - visible_width)
                );
            } else {
                // Vertical scroll
                scroll_offset_y = std::clamp(
                    scroll_offset_y - y * 40.0f,
                    0.0f,
                    std::max(0.0f, total_height - visible_height)
                );

                // Horizontal scroll
                scroll_offset_x = std::clamp(
                    scroll_offset_x - x * 40.0f,
                    0.0f,
                    std::max(0.0f, max_width - visible_width)
                );
            }
        }
    }

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
            //update line/column based on index
            std::string text = buffer.get_text().substr(0,index);
            line = std::ranges::count(text, '\n');
            auto last_new_line = text.find_last_of('\n');
            column = last_new_line == std::string::npos ? index : index - last_new_line - 1;
        }
    } cursor;

    struct CompositionState {
        std::string buffer;
        bool is_active{false};
        float timer{0.0f};
        static constexpr float TIMEOUT = 0.5;
        size_t delete_counter{0};

        void reset(){
            buffer.clear();
            is_active = false;
            timer = 0.0f;
            delete_counter = 0;
        }
    } composition;

    struct RenderCache{
        struct Line{
            string text;
            Vector2 position;
            bool is_dirty{true};
        };
        mutable std::vector<Line> lines;
        void invalidate() const {
            for (auto& [text, position, is_dirty] : lines) is_dirty = true;
        }
    } render_cache;

    struct CursorCommand {
        size_t old_pos;
        size_t new_pos;

        CursorCommand(size_t old_pos, size_t new_pos)
            : old_pos(old_pos), new_pos(new_pos) {}
    };

    explicit TextArea(const std::string& initial = "")
        : text_buffer(initial)
    {
//        L = luaL_newstate();
//        luaL_openlibs(L);
    }

    std::stack<CursorCommand> cursor_undo_stack;
    std::stack<CursorCommand> cursor_redo_stack;

    void insert(const std::string& text) {
        if (text.empty()) return;

        size_t text_length = text_buffer.get_text().length();
        if (cursor.index > text_length) {
            cursor.index = text_length;
        }

        size_t old_pos = cursor.index;
        text_buffer.insert(cursor.index, text);
        cursor.index += text.length();

        CursorCommand cmd = {old_pos, cursor.index};
        cursor_undo_stack.push(cmd);

        // Clear redo stack
        while (!cursor_redo_stack.empty()) {
            cursor_redo_stack.pop();
        }
        update_cursor_position();
        render_cache.invalidate();
        update_render_cache();
    }

    void remove(size_t start, size_t end) {
        if (start >= end || start >= text_buffer.get_text().length()) return;

        size_t old_pos = cursor.index;
        text_buffer.remove(start, end);
        cursor.index = std::min(cursor.index, start);

        CursorCommand cmd = {old_pos, cursor.index};
        cursor_undo_stack.push(cmd);

        // Clear redo stack
        while (!cursor_redo_stack.empty()) {
            cursor_redo_stack.pop();
        }
        update_cursor_position();
        render_cache.invalidate();
        update_render_cache();
    }

    void remove(size_t length) {
        if (cursor.index == 0 || length == 0) return;

        // Adjust length if it's more than available characters
        length = std::min(length, cursor.index);

        size_t old_pos = cursor.index;
        const size_t remove_start = cursor.index - length;

        text_buffer.remove(remove_start, cursor.index);
        cursor.index = remove_start;
        cursor_undo_stack.emplace(old_pos, cursor.index);

        while (!cursor_redo_stack.empty()) {
            cursor_redo_stack.pop();
        }
        update_cursor_position();
        render_cache.invalidate();
        update_render_cache();
    }


    void undo() {

            // Commit pending input
            if (is_composing || !input_buffer.empty()) commit_position();

            if (!text_buffer.can_undo() || cursor_undo_stack.empty()) return;

            auto cursor_cmd = cursor_undo_stack.top();
            cursor_undo_stack.pop();
            text_buffer.undo();
            cursor.index = cursor_cmd.old_pos;
            update_cursor_position();
            cursor_redo_stack.push(cursor_cmd);
            render_cache.invalidate();
            update_render_cache();
        }

        void redo() {
            if (!text_buffer.can_redo() || cursor_redo_stack.empty()) return;

            auto cursor_cmd = cursor_redo_stack.top();
            cursor_redo_stack.pop();
            text_buffer.redo();

            cursor.index = cursor_cmd.new_pos;
            update_cursor_position();
            cursor_undo_stack.push(cursor_cmd);

            render_cache.invalidate();
            update_render_cache();
        }



    TextArea(const float pos_x, const float pos_y,
        const Font& font, const float font_size,const float spacing)
    : spacing(spacing), pos_x(pos_x), pos_y(pos_y), font_size(font_size), font(font)
    {}

    TextArea(const float pos_x, const float pos_y,
        const Font& font, const float font_size,const float spacing, float space_below)
    : space_below(space_below), spacing(spacing), pos_x(pos_x), pos_y(pos_y), font_size(font_size), font(font)
    {}

    TextArea& at_x(float x) {
        this->pos_x = x;
        return *this;
    }

    TextArea& at_y(float y) {
        this->pos_y = y;
        return *this;
    }




    [[nodiscard]] float get_pos_y() const { return this->pos_y; };

    [[nodiscard]] std::vector<std::string> text_vec() const
    {
        std::string display_text = text_buffer.get_text();

        // Insert the input buffer at the cursor_old_struct position
        if (!input_buffer.empty()) {
            display_text.insert(cursor.index, input_buffer);
        }

        std::vector<std::string> v;
        std::stringstream ss(display_text);
        std::string s;

        while (getline(ss, s, '\n')) {
            v.push_back(s);
        }
        if (display_text.empty() || display_text.back() == '\n'){
            v.emplace_back("");
        }
        return v;
    }

    float cursor_blink_timer = 0.0f;
    float cursor_blink_rate = 0.53f;
    bool cursor_visible = true;

    void update_cursor_position(){
        std::string text = text_buffer.get_text();
        size_t text_length = text.length();

        if (cursor.index > text_length){
            cursor.index = text_length;
        }

        if(cursor.index == 0){
            cursor.line = 0;
            cursor.column = 0;
        } else {
            std::string text_before_cursor = text.substr(0, cursor.index);
            // ReSharper disable once CppUseRangeAlgorithm
            cursor.line  = std::count(text_before_cursor.begin(), text_before_cursor.end(),'\n');
            size_t last_newline = text_before_cursor.rfind('\n');
            cursor.column = (last_newline == std::string::npos) ? cursor.index : cursor.index - last_newline - 1;
        }

        // adjust visible cursor position for scrolling
        float cursor_screen_x = pos_x + (static_cast<float>(cursor.column) * font_size) - scroll_offset_x;
        float cursor_screen_y = pos_y + (static_cast<float>(cursor.line) * (font_size + spacing)) - scroll_offset_y;

        // Auto-scroll to keep cursor in view
        if (cursor_screen_y < pos_y) {
            scroll_offset_y = static_cast<float>(cursor.line) * (font_size + spacing);
        } else if (cursor_screen_y + font_size > pos_y + visible_height) {
            scroll_offset_y = static_cast<float>(cursor.line + 1) * (font_size + spacing) - visible_height;
        }

        if (cursor_screen_x < pos_x) {
            scroll_offset_x = static_cast<float>(cursor.column) * font_size;
        } else if (cursor_screen_x + font_size > pos_x + visible_width) {
            scroll_offset_x = static_cast<float>(cursor.column + 1) * font_size - visible_width;
        }
    }
protected:

    void commit_position(){
        if (!input_buffer.empty()){

            // Get current text length for bounds checking
            if (const size_t text_length = text_buffer.get_text().length(); cursor.index > text_length){
                cursor.index = text_length;
            }

            const string commit_text = input_buffer;
            this->insert(commit_text); // insert as one operation
            // cursor.index += commit_text.length();
            update_cursor_position(); // update line//column
            input_buffer.clear();
            is_composing = false;
            compose_timer = 0.0f;
            render_cache.invalidate();
            update_render_cache();
        }
    }


    void commit_deletion() {

        if (composition.delete_counter > 0 && cursor.index >= composition.delete_counter) {
            // Calculate the range to delete (characters before cursor)
            size_t delete_start = cursor.index - composition.delete_counter;

            // Explicitly delete ONLY from delete_start to cursor.index (nothing after)
            remove(delete_start, cursor.index);

            // Move cursor to position after deletion
            cursor.index = delete_start;
            update_cursor_position();
        }

        composition.delete_counter = 0;
        is_composing = false;
        compose_timer = 0.0f;
        render_cache.invalidate();
        update_render_cache();
    }

public:

    void update_render_cache() const{
        const_cast<TextArea*>(this)->update_dimensions();
        string display_text = text_buffer.get_text();
        if(!this->input_buffer.empty()){
            display_text.insert(cursor.index, input_buffer);
        }

        if (composition.delete_counter > 0) {
            if(cursor.index >= composition.delete_counter) {
                size_t delete_start = cursor.index - composition.delete_counter;
                display_text.erase(delete_start, composition.delete_counter);
            }

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
            y += static_cast<float>(font.baseSize) * scale;
        }
    }


    void update()
    {
        update_dimensions();
        handle_scroll();

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
            // return;
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

                if (composition.delete_counter > 0) {
                    commit_deletion();
                }

                const char new_char = static_cast<char>(char_key);

                // Ensure cursor is within bounds before adding to input buffer
                if (const size_t text_length = text_buffer.get_text().length(); cursor.index > text_length){
                    cursor.index = text_length;
                }

                input_buffer += new_char;
                is_composing = true;
                compose_timer = 0.0f; // Reset timer on new input

                update_render_cache();
            }
            char_key = GetCharPressed();
        }

        if (is_composing)
        {
            compose_timer += GetFrameTime();

            if (compose_timer >= COMPOSE_TIMEOUT)
            {
                if (composition.delete_counter > 0) {
                    commit_deletion();
                } else {
                    commit_position();
                }
                is_composing = false;
            }
        }

        if (IsKeyPressed(KEY_BACKSPACE)){
            if (!input_buffer.empty()) {
                // If we're composing, just remove from buffer
                input_buffer.pop_back();
                compose_timer = 0.0f;
                update_render_cache();
            } else if (this->cursor.index > 0) {

                compose_timer = 0.0f;

                if (is_composing && composition.delete_counter > 0) {
                    // If already composing deletions, add to the counter
                    composition.delete_counter++;
                } else {
                    // Start a new composition
                    composition.delete_counter = 1;
                    is_composing = true;
                }
                update_render_cache();
                // update_cursor_position();
            }
            std::cout << "Backspace pressed" << std::endl;
            std::cout << text_buffer.get_text().length() << std::endl;
        }

        if (IsKeyPressed(KEY_ENTER))
        {
            if (!input_buffer.empty())
            {
                this->insert(input_buffer);
                this->cursor.index += input_buffer.length();
                this->input_buffer.clear();
            }
            this->insert("\n");
            update_cursor_position(); //update line and column

            is_composing = false;
            compose_timer = 0.0f;
            render_cache.invalidate();
            update_render_cache();
        };

        // update cursor blink
        cursor_blink_timer += GetFrameTime();
        if (cursor_blink_timer >= cursor_blink_rate) {
            cursor_visible = !cursor_visible;
            cursor_blink_timer = 0;
        }

        // Reset blink on any input
        if (const int key = GetKeyPressed(); key != 0){
            cursor_visible = true;
            cursor_blink_timer = 0;
        }
    };

private:
    bool first_render{true};

public:

    void render()
    {


        if (first_render) {
            update_dimensions();
            update_cursor_position();
            update_render_cache();
            scroll_offset_x = 0;
            scroll_offset_y = 0;
            first_render = false;
        }
        if(render_cache.lines.empty()){
            update_render_cache();
        }

        BeginScissorMode(
            static_cast<int>(pos_x),
            static_cast<int>(pos_y),
            static_cast<int>(visible_width),
            static_cast<int>(visible_height));

        // Apply scroll offsets when rendering
        for (const auto& line : render_cache.lines){
            Vector2 pos = {
                line.position.x - scroll_offset_x,
                line.position.y - scroll_offset_y
            };

            // Only render if line is visible
            if (pos.y + font_size >= pos_y && pos.y <= pos_y + visible_height){
                DrawTextEx(
                    font, line.text.c_str(),
                    pos,
                    font_size,
                    spacing,
                    text_color
                );
            }
        }
        EndScissorMode();

        // Render scrollbars
        const Rectangle v_bounds = {
            pos_x + visible_width - 12, // scrollbar width 12
            pos_y,
            12,
            visible_height - space_below
        };
        vertical_scrollbar.render(v_bounds, total_height, visible_height, scroll_offset_y);

        const Rectangle h_bounds = {
            pos_x,
            pos_y + visible_height - 12,
            visible_width - 12, // Subtract vertical scrollbar width
            12
        };
        horizontal_scrollbar.render(h_bounds, max_width, visible_width, scroll_offset_x);
    };
    [[nodiscard]] std::string get_current_line() const {
        return this->text_vec().at(this->cursor.line);
    }

    [[nodiscard]] Font get_font() const { return this->font; }

    [[nodiscard]] float get_fontSize() const { return this->font_size; }

    [[nodiscard]] size_t get_cursor_line() const {
        return this->cursor.line;
    }

    [[nodiscard]] size_t get_cursor_column() const {
        return this->cursor.column;
    }

    void set_pos_x(const float x) { this->pos_x = x; }
    void set_pos_y(const float y) { this->pos_y = y; }

    [[nodiscard]] int get_x() const { return static_cast<int>(this->pos_x); }

    [[nodiscard]] int get_y() const { return static_cast<int>(this->pos_y); }

    struct Event{
        enum class Type { Insert, Delete, CursorMove, CompositionStart, CompositionEnd};
        Type type;
        size_t position;
        string text;
    };

    std::vector<std::function<void(const Event&)>> event_handlers;
    bool auto_backspace{false};
    int backspace_frame_counter{0};
public:
    void addEventListener(const std::function<void(const Event&)>& handler) {
        event_handlers.push_back(handler);
    }

    void load_content(const std::string& content){
        text_buffer = PieceTable(content);
        cursor.index = 0;
        input_buffer.clear();
        is_composing = false;
        compose_timer = 0.0f;
        cursor_undo_stack = std::stack<CursorCommand>();
        cursor_redo_stack = std::stack<CursorCommand>();

        scroll_offset_x = 0;
        scroll_offset_y = 0;

        update_cursor_position();
        render_cache.invalidate();
        update_render_cache();

        update_dimensions();
    }

protected:
    void fireEvent(const Event& event) const {
        for (const auto& handler : event_handlers) {
            handler(event);
        }
    }


public:
    Vector2 get_cursor_screen_pos() const {
        float x = pos_x;
        float y =  pos_y;

        // get text up tp cursor
        const size_t n_del = (composition.delete_counter > 0) ? composition.delete_counter : 0;
        string text = text_buffer.get_text().substr(0, cursor.index - n_del);

        // count newlines for y position
        const size_t newlines = std::ranges::count(text, '\n');
        y += static_cast<float>(newlines) * font_size;

        // get x position
        if (const size_t last_newline = text.rfind('\n'); last_newline != std::string::npos){
            // If we're not on the first line, measure from the last newline
            const string current_line = text.substr(last_newline + 1);
            x += MeasureTextEx(font,current_line.c_str(), font_size, spacing).x;
        } else {
            // If we're on the first line, measure from the start
            x += MeasureTextEx(font,text.c_str(), font_size, spacing).x;
        }

        // add composition buffer offset if composing
        if (is_composing && !input_buffer.empty()) {
            x += MeasureTextEx(font,input_buffer.c_str(), font_size, spacing).x;
        }

        return {x, y};
    }

    // helper functions for main.cpp
    float get_cursor_x() const { return get_cursor_screen_pos().x; }
    float get_cursor_y() const { return get_cursor_screen_pos().y; }


};

} // kupui
inline std::unique_ptr<kupui::TextArea> create_text_area() {
    return std::make_unique<kupui::TextArea>("  ");
};

#endif //TEXTAREA_HPP
