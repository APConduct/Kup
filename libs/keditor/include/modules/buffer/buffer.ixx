
//
// Created by Aidan Jost on 3/21/25.
//

module;
#include <functional>
#include <raylib.h>
#include <string>
#include <vector>

export module keditor.buffer.buffer;

import keditor.core.types;
import keditor.buffer.piece_table;
import plastic;
import keditor.buffer.traits;


export namespace keditor
{
    namespace text
    {
        template <typename CharT>
        struct Buffer : plastic::Element {
            using Traits = buffer::Traits<CharT>;
            using char_type = typename Traits::char_type;
            using string_type = typename Traits::string_type;

        private:
            keditor::piece::Table<char> buffer_;

            Position cursor_{};
            Selection selection_{};

            std::size_t composition_timeout_ms_{500};

            struct CompositionState {
                string_type buffer_{};
                bool is_active_{false};
                float timer{0.0f};
                size_t delete_counter_{0};
                std::chrono::steady_clock::time_point last_input_;
                bool force_commit_{false};

                void reset() {
                    buffer_.clear();
                    is_active_ = false;
                    timer = 0.0f;
                    delete_counter_ = 0;
                    force_commit_ = false;
                }
            } composition_;

            struct VisualState {
                float scroll_x_{0.0f};
                float scroll_y_{0.0f};
                bool cursor_visible_{true};
                float cursor_blink_timer_{0.0f};
                plastic::TransitionProperty<float> cursor_opacity_{1.0f};

                float line_height_{0.0f};
                float char_width_{0.0f};

                plastic::Size<float> viewport_size_{};
                plastic::Size<float> content_size_{};

                plastic::Animation<float> scroll_x_animation_{0,0,0.3f, [](float){}};
                plastic::Animation<float> scroll_y_animation_{0,0,0.3f, [](float){}};

            } visual_;

            std::shared_ptr<plastic::Font> font_{};
            struct TextStyle {
                plastic::Color text_color_{plastic::Color::white()};
                plastic::Color selection_color_{plastic::Color::rgba(66, 133,244,128)};
                plastic::Color cursor_color_{plastic::Color::rgb(225, 225, 225)};
                float font_size_{16.0f};
                float line_height_factor_{1.2f};
                float letter_spacing_{0.0f};
            } style_;

            struct LineCache {
                struct Line {
                    string_type text_{};
                    plastic::Point<float> position_{};
                    plastic::Size<float> size_{};
                    bool is_dirty_{true};
                };
                std::vector<Line> lines_;
                bool is_dirty_{true};

                void invalidate() {
                    is_dirty_ = true;
                    for (auto& line : lines_) {
                        line.is_dirty_ = true;
                    }
                }
            } line_cache_;

            std::function<void()> on_text_changed_;
            std::function<void()> on_cursor_moved_;
            std::function<void()> on_selection_changed_;

        public:
            explicit Buffer(string_type initial = {}) : buffer_(std::move(initial)) {
                font_ = plastic::font::get_default();
                update_line_cache();
            }

            void layout(plastic::Context* cx) override {
                if (line_cache_.is_dirty_) {
                    update_line_cache();
                }

                visual_.content_size_ = calc_content_size();

                visual_.viewport_size_ = plastic::Size<float>{bounds.width(), bounds.height()};

                if (font_) {
                    // Measure "M" for approximating character width
                    auto m_size = font_->measure_text(Traits::to_string("M"), style_.font_size_,
                                                       style_.letter_spacing_);
                    visual_.char_width_ = m_size.width();

                    visual_.line_height_ = m_size.height() * style_.line_height_factor_;
                }
            }

        protected:
            template <typename StringT>
            std::string utf8_display(const StringT& text) {
                if constexpr (std::is_same_v<typename StringT::value_type, char>) {
                    return std::string(text.begin(), text.end());
                } else if constexpr (std::is_same_v<typename StringT::value_type, char8_t>) {
                    // Proper UTF-8 handling
                    return std::string(reinterpret_cast<const char*>(text.data()), text.size());
                } else {
                    // For other character types, convert with consideration for encoding
                    std::string result;
                    result.reserve(text.size());
                    for (auto ch : text) {
                        // Handle multi-byte characters properly
                        if (ch <= 0x7F) {
                            result.push_back(static_cast<char>(ch));
                        } else {
                            // Replace with Unicode replacement character
                            result += "\xEF\xBF\xBD";
                        }
                    }
                    return result;
                }
            }

        public:

            void paint(plastic::Context* cx) const override {
                BeginScissorMode(
                    static_cast<int>(bounds.x()),
                    static_cast<int>(bounds.y()),
                    static_cast<int>(bounds.width()),
                    static_cast<int>(bounds.height())
                );

                if (selection_.is_active()) {
                    draw_selection();
                }

                for (const auto& line : line_cache_.lines_) {
                    if (!is_line_visible(line)) {
                        continue;
                    }

                    plastic::Point<float> draw_pos = get_screen_position(line.position_);

                    // Convert to std::string for rendering
                    // In production, have proper UTF-8 rendering
                    std::string display_text = utf8_display(line.text_);

                    font_->draw_text(display_text, draw_pos, style_.font_size_, style_.letter_spacing_, style_.text_color_);
                }
                if (visual_.cursor_visible_) {
                    draw_cursor();
                }
                if (composition_.is_active_ && !composition_.buffer_.empty()) {
                    draw_composition();
                }
                EndScissorMode();
            }

            bool process_event(const plastic::events::Event& event, plastic::Context* cx) override {
                return std::visit([this, cx](const auto& e) {
                    return handle_event_impl(e, cx);
                }, event);
            }

            void set_text(const string_type& text) {
                buffer_ = keditor::piece::Table<CharT>(text);
                // might need to remove the reference Position constructor
                Index idx(0);
                Line line(0);
                Column col(0);
                cursor_ = Position(idx, line, col);
                selection_ = Selection();
                composition_.reset();
                line_cache_.invalidate();

                if (on_text_changed_) {
                    on_text_changed_();
                }
                invalidate();
            }

            [[nodiscard]] string_type get_text() const {
                return buffer_.text();
            }

            void insert_text(const string_type& text) {
                if (selection_.is_active() && !selection_.is_empty()) {
                    Range range = selection_.range();
                    buffer_.remove(range.start(), range.end());
                    cursor_.index(range.start());
                }
                buffer_.insert(cursor_.index(), text);
                cursor_.index(cursor_.index() + text.length());
                update_cursor_position();

                selection_.is_active(false);

                if (on_text_changed_) {
                    on_text_changed_();
                }

                line_cache_.invalidate();
                ensure_cursor_visible();
                invalidate();
            }

            void delete_text(Range range) {
                if (range.is_empty()) {
                    return;
                }

                buffer_.remove(range.start(), range.end());
                cursor_.index(range.start());
                update_cursor_position();

                // Clear selection
                selection_.is_active(false);
                if (on_text_changed_) {
                    on_text_changed_();
                }

                line_cache_.invalidate();
                ensure_cursor_visible();
                invalidate();
            }

            void set_style(const TextStyle& style) {
                style_ = style;
                line_cache_.invalidate();
                invalidate();
            }

            void set_cursor_position(const Position& pos) {
                cursor_ = pos;

                if (on_cursor_moved_) {
                    on_cursor_moved_();
                }
                ensure_cursor_visible();
                invalidate();
            }

            [[nodiscard]] Position get_cursor_position() const {
                return cursor_;
            }

            [[nodiscard]] Selection get_selection() const {
                return selection_;
            }

            void set_on_text_changed(std::function<void()> handler) {
                on_text_changed_ = std::move(handler);
            }

            void set_on_cursor_moved(std::function<void()> handler) {
                on_cursor_moved_ = std::move(handler);
            }

            void set_on_selection_changed(std::function<void()> handler) {
                on_selection_changed_ = std::move(handler);
            }

            void move_cursor_left() {
                if (composition_.is_active_) {
                    composition_.force_commit_ = true;
                }
                if (cursor_.index() > 0) {
                    cursor_.index(cursor_.index() - 1);
                    update_cursor_position();
                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }
                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void move_cursor_right() {
                if (composition_.is_active_) {
                    composition_.force_commit_ = true;
                }
                if (cursor_.index() < buffer_.length()) {
                    cursor_.index(cursor_.index() + 1);
                    update_cursor_position();
                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }
                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void move_cursor_up() {
                if (composition_.is_active_) {
                    composition_.force_commit_ = true;
                }
                if (cursor_.index() > 0) {
                    Line prev_line = cursor_.line() - 1;
                    cursor_.index(buffer_.position_to_index(prev_line, cursor_.col()));
                    update_cursor_position();

                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }
                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void move_cursor_down() {
                if (composition_.is_active_) {
                    composition_.force_commit_ = true;
                }
                Line next_line = cursor_.line() + 1;
                if (next_line < buffer_.line_count()) {
                    cursor_.index(buffer_.position_to_index(next_line, cursor_.col()));
                    update_cursor_position();
                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }
                    ensure_cursor_visible();
                    invalidate();
                }
            }
        protected:
            bool handle_event_impl(const plastic::events::KeyPressEvent& event, plastic::Context* cx) {
                if (event.pressed) {
                    visual_.cursor_visible_ = true;
                    visual_.cursor_blink_timer_ = 0.0f;

                    switch (event.key) {
                        case plastic::events::KeyboardKey::KEY_LEFT:
                            if (event.shift.value_or(false)) {
                                extend_selection_left();
                            } else {
                                selection_.is_active(false);
                                move_cursor_left();
                            }
                            return true;

                        case plastic::events::KeyboardKey::KEY_RIGHT:
                            if (event.shift.value_or(false)) {
                                extend_selection_right();
                            } else {
                                selection_.is_active(false);
                                move_cursor_right();
                            }
                            return true;

                        case plastic::events::KeyboardKey::KEY_UP:
                            if (event.shift.value_or(false)) {
                                extend_selection_up();
                            } else {
                                selection_.is_active(false);
                                move_cursor_up();
                            }
                            return true;

                        case plastic::events::KeyboardKey::KEY_DOWN:
                            if (event.shift.value_or(false)) {
                                extend_selection_down();
                            } else {
                                selection_.is_active(false);
                                move_cursor_down();
                            }
                            return true;

                        case plastic::events::KeyboardKey::KEY_HOME:
                            if (event.shift.value_or(false)) {
                                extend_selection_to_line_start();
                            } else {
                                selection_.is_active(false);
                                move_cursor_to_line_start();
                            }
                            return true;

                        case plastic::events::KeyboardKey::KEY_END:
                            if (event.shift.value_or(false)) {
                                extend_selection_to_line_end();
                            } else {
                                selection_.is_active(false);
                                move_cursor_to_line_end();
                            }
                            return true;

                        case plastic::events::KeyboardKey::KEY_BACKSPACE:
                            handle_backspace();
                            return true;

                        case plastic::events::KeyboardKey::KEY_DELETE:
                            handle_delete();
                            return true;

                        case plastic::events::KeyboardKey::KEY_ENTER:
                            if (composition_.is_active()) {
                                commit_composition();
                            }
                            insert_text(Traits::to_string("\n"));
                            return true;

                        case plastic::events::KeyboardKey::KEY_TAB:
                            if (composition_.is_active()) {
                                commit_composition();
                            }
                            insert_text(Traits::to_string("\t"));
                            return true;

                        default:
                            return false;

                    }
                }
                return false;
            }

            bool handle_event_impl(plastic::events::TextInputEvent& event, plastic::Context* cx) {
                auto now = std::chrono::steady_clock::now();

                if (composition_.is_active()) {
                    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(now - composition_.last_input_).count();

                    // Check timeout and also if there's a special condition like cursor movement
                    if (elapsed > composition_timeout_ms_ || composition_.force_commit_) {
                        commit_composition();
                    }
                }

                // Rest of the method remains the same
                composition_.is_active_ = true;
                composition_.last_input_ = now;
                composition_.force_commit_ = false; // Reset after checking


                string_type input_text;
                input_text.reserve(event.text.size());

                for (char c : event.text) {
                    input_text.push_back(static_cast<char_type>(c));
                }
                composition_.buffer_ += input_text;

                line_cache_.invalidate();
                invalidate();
                return true;
            }

            void handle_backspace() {
                if (composition_.is_active()) {
                    if (!composition_.buffer_.empty()) {
                        composition_.buffer_.pop_back();
                        composition_.last_input_ = std::chrono::steady_clock::now();
                        line_cache_.invalidate();
                        invalidate();
                    } else {
                        composition_.delete_counter_++;
                        composition_.last_input_ = std::chrono::steady_clock::now();
                    }
                    return;
                }

                if (selection_.is_active() && !selection_.is_empty()) {
                    delete_text(selection_.range());
                    return;
                }

                if (cursor_.index() > 0) {
                    delete_text({cursor_.index() - 1, cursor_.index()});
                }
            }

            void handle_delete() {
                if (composition_.is_active()) {
                    commit_composition();
                }

                if (selection_.is_active() && !selection_.is_empty()) {
                    delete_text(selection_.range());
                    return;
                }

                if (cursor_.index() < buffer_.length()) {
                    delete_text({cursor_.index(), cursor_.index() + 1});
                }
            }

            void commit_composition() {
                if (!composition_.is_active_) return;

                if (composition_.delete_counter_ > 0) {
                    Index start = cursor_.index() >= composition_.delete_counter_
                        ? cursor_.index() - composition_.delete_counter_
                        : 0;

                    buffer_.remove(start, cursor_.index());
                    cursor_.index(start);
                }

                if (!composition_.buffer_.empty()) {
                    buffer_.insert(cursor_.index(), composition_.buffer_);
                    cursor_.index(cursor_.index() + composition_.buffer_.length());
                }

                // Update state
                update_cursor_position();
                composition_.reset();

                if (on_text_changed_) {
                    on_text_changed_();
                }

                line_cache_.invalidate();
                ensure_cursor_visible();
                invalidate();
            }

            void extend_selection_left() {
                if (!selection_.is_active()) {
                    selection_.is_active(true);
                    selection_.anchor(cursor_);
                }

                if (cursor_.index() > 0) {
                    cursor_.index(cursor_.index() - 1);
                    update_cursor_position();

                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }

                    if (on_selection_changed_) {
                        on_selection_changed_();
                    }
                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void extend_selection_right() {
                if (!selection_.is_active()) {
                    selection_.is_active(true);
                    selection_.anchor(cursor_);
                }

                if (cursor_.index() < buffer_.length()) {
                    cursor_.index(cursor_.index() + 1);
                    update_cursor_position();

                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }

                    if (on_selection_changed_) {
                        on_selection_changed_();
                    }

                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void extend_selection_up() {
                if (!selection_.is_active()) {
                    selection_.is_active(true);
                    selection_.anchor(cursor_);
                }

                if (cursor_.line() > 0) {
                    Line prev_line = cursor_.line() - 1;
                    cursor_.index(buffer_.position_to_index(prev_line, cursor_.col()));
                    update_cursor_position();

                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }

                    if (on_selection_changed_) {
                        on_selection_changed_();
                    }

                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void extend_selection_down() {
                if (!selection_.is_active()) {
                    selection_.is_active(true);
                    selection_.anchor(cursor_);
                }

                Line next_line = cursor_.line() + 1;
                if (next_line < buffer_.line_count()) {
                    cursor_.index(buffer_.position_to_index(next_line, cursor_.col()));
                    update_cursor_position();

                    if (on_cursor_moved_) {
                        on_cursor_moved_();
                    }
                    if (on_selection_changed_) {
                        on_selection_changed_();
                    }
                    ensure_cursor_visible();
                    invalidate();
                }
            }

            void extend_selection_to_line_start() {
                if (!selection_.is_active()) {
                    selection_.is_active(true);
                    selection_.anchor(cursor_);
                }
                cursor_.index(buffer_.position_to_index(cursor_.line(), 0));
                update_cursor_position();

                if (on_cursor_moved_) {
                    on_cursor_moved_();
                }

                if (on_selection_changed_) {
                    on_selection_changed_();
                }
                ensure_cursor_visible();
                invalidate();
            }

            void extend_selection_to_line_end() {
                if (!selection_.is_active()) {
                    selection_.is_active(true);
                    selection_.anchor(cursor_);
                }

                Line next_line = cursor_.line() + 1;
                Index end_index = next_line < buffer_.line_count()
                    ? buffer_.position_to_index(next_line, 0) - 1
                    : buffer_.length();

                cursor_.index(end_index);
                update_cursor_position();

                if (on_cursor_moved_) {
                    on_cursor_moved_();
                }
                if (on_selection_changed_) {
                    on_selection_changed_();
                }
                ensure_cursor_visible();
                invalidate();
            }

            void move_cursor_to_line_start() {
                if (composition_.is_active_) {
                    composition_.force_commit_ = true;
                }
                cursor_.index(buffer_.position_to_index(cursor_.line(), 0));
                update_cursor_position();
                if (on_cursor_moved_) {
                    on_cursor_moved_();
                }
                ensure_cursor_visible();
                invalidate();
            }

            void move_cursor_to_line_end() {
                if (composition_.is_active_) {
                    composition_.force_commit_ = true;
                }
                Line next_line = cursor_.line() + 1;
                Index end_index = next_line < buffer_.line_count()
                    ? buffer_.position_to_index(next_line, 0) - 1
                    : buffer_.length();
                cursor_.index(end_index);
                update_cursor_position();
                if (on_cursor_moved_) {
                    on_cursor_moved_();
                }
                ensure_cursor_visible();
                invalidate();
            }

            void update_cursor_position() {
                cursor_ = buffer_.index_to_position(cursor_.index());
                selection_.cursor(cursor_);
            }

            void draw_cursor() const {
                if (auto pos = get_cursor_screen_pos()) {
                    DrawRectangle(
                        static_cast<int>(pos->x),
                        static_cast<int>(pos->y),
                        2, // cursor width
                        static_cast<int>(visual_.line_height_),
                        ColorAlpha(style_.cursor_color_.rl(), visual_.cursor_opacity_.get())
                    );
                }
            }

            void draw_selection() const {
                if (!selection_.is_active() || selection_.is_empty()) {
                    return;
                }

                Range range = selection_.range();
                Position start = buffer_.index_to_position(range.start());
                Position end = buffer_.index_to_position(range.end());

                if (start.line() == end.line()) {
                    draw_selection_line(start.line(), start.col(), end.col());
                    return;
                }
                draw_selection_line(start.line(), start.col(), static_cast<Index>(-1));

                for (Line line = start.line() + 1; line < end.line(); ++line) {
                    draw_selection_line(line, 0, static_cast<Index>(-1));
                }

                // Draw the last line (partially)
                draw_selection_line(end.line(), 0, end.col());
            }
            void draw_selection_line(Line line, Column start_col, Column end_col) const {
                if (line >= line_cache_.lines_.size()) {
                    return;
                }
                const auto& line_data = line_cache_.lines_[line];
                string_type line_text = line_data.text_;
                if (end_col == static_cast<Column>(-1)) {
                    end_col = line_text.length();
                }

                float x1 = line_data.position_.x() + start_col * visual_.char_width_;
                float x2 = line_data.position_.x() + end_col * visual_.char_width_;
                float y = line_data.position_.y();

                plastic::Point<float> pos1 = get_screen_position({x1, y});
                plastic::Point<float> pos2 = get_screen_position({x2, y});

                DrawRectangle(
                    static_cast<int>(pos1.x),
                    static_cast<int>(pos1.y),
                    static_cast<int>(pos2.x - pos1.x),
                    static_cast<int>(visual_.line_height_),
                    style_.selection_color_.rl()
                );
            }

            void draw_composition() const {
                if (!composition_.is_active_ || composition_.buffer_.empty()) {
                    return;
                }
                auto cursor_pos = get_cursor_screen_pos();
                if (!cursor_pos) {
                    return;
                }
                std::string display_text(composition_.buffer_.begin(), composition_.buffer_.end());
                font_->draw_text(
                    display_text, *cursor_pos,
                    style_.font_size_,
                    style_.letter_spacing_,
                    style_.text_color_
                    );

                // Draw underline
                float width = font_->measure_text(
                    display_text,
                    style_.font_size_,
                    style_.letter_spacing_).width();

                DrawLine(
                    static_cast<int>(cursor_pos->x()),
                    static_cast<int>(cursor_pos->y() + visual_.line_height_ - 2),
                    static_cast<int>(cursor_pos->x() + width),
                    static_cast<int>(cursor_pos->y() + visual_.line_height_ - 2),
                    style_.text_color_.rl()
                );
            }

            [[nodiscard]] std::optional<plastic::Point<float>> get_cursor_screen_pos() const {
                if (cursor_.line() >= line_cache_.lines_.size()) {
                    return std::nullopt;
                }
                const auto& line = line_cache_.lines_[cursor_.line()];
                float x = line.position_.x();

                if (cursor_.col() > 0) {
                    x += cursor_.col() * visual_.char_width_;
                }
                return plastic::Point<float>(bounds.x() + x - visual_.scroll_x_,
                    bounds.y() + line.position_.y() - visual_.scroll_y_);
            }

            plastic::Point<float> get_screen_position(plastic::Point<float>& pos) const {
                return plastic::Point<float>(
                    bounds.x() + pos.x - visual_.scroll_x_,
                    bounds.y() + pos.y - visual_.scroll_y_
                );
            }

            bool is_line_visible(const LineCache::Line& line) const {
                float screen_y = bounds.y() + line.position_.y - visual_.scroll_y_;
                return screen_y + visual_.line_height_ >= bounds.y() &&
                       screen_y <= bounds.y() + bounds.height();
            }

            plastic::Size<float> calc_content_size() const {
                float max_width = 0;
                float total_height = 0;

                for (const auto& line : line_cache_.lines_) {
                    max_width = std::max(max_width, line.position_.x + line.size_.width());
                    total_height = std::max(total_height, line.position_.y + line.size_.height());
                }

                return plastic::Size<float>(max_width, total_height);
            }

            void ensure_cursor_visible() {
                auto cursor_pos = get_cursor_screen_pos();
                if (!cursor_pos) {
                    return;
                }

                float margin = visual_.line_height_;

                if (cursor_pos->x < bounds.x() + margin) {
                    // Scroll left
                    float target_scroll = visual_.scroll_x_ - (bounds.x() + margin - cursor_pos->x);
                    animate_scroll_x(std::max(0.0f, target_scroll));
                } else if (cursor_pos->x > bounds.x() + bounds.width() - margin) {
                    // Scroll right
                    float target_scroll = visual_.scroll_x_ + (cursor_pos->x - (bounds.x() + bounds.width() - margin));
                    animate_scroll_x(std::min(visual_.content_size_.width() - bounds.width(), target_scroll));
                }

                if (cursor_pos->y < bounds.y() + margin) {
                    float target_scroll = visual_.scroll_y_ - (bounds.y() + margin - cursor_pos->y);
                    animate_scroll_y(std::max(0.0f, target_scroll));
                } else if (cursor_pos->y + visual_.line_height_ > bounds.y() + bounds.height() - margin) {
                    float target_scroll = visual_.scroll_y_ + (cursor_pos->y + visual_.line_height_ - (bounds.y() + bounds.height() - margin));
                    animate_scroll_y(target_scroll);
                }
            }

            void animate_scroll_x(float target) {
                visual_.scroll_x_animation_ = plastic::Animation<float>(
                    visual_.scroll_x_,
                    target,
                    0.2f, // Duration
                    [this](float value) {
                        visual_.scroll_x_ = value;
                        invalidate();
                    }
                );
                visual_.scroll_x_animation_.start();
            }

            void animate_scroll_y(float target) {
                visual_.scroll_y_animation_ = plastic::Animation<float>(
                    visual_.scroll_y_,
                    target,
                    0.2f, // Duration
                    [this](float value) {
                        visual_.scroll_y_ = value;
                        invalidate();
                    }
                );
                visual_.scroll_y_animation_.start();
            }

            void update_line_cache() {
                string_type text = buffer_.text();

                string_type display_text = text;
                if (composition_.is_active_) {
                    // Apply any pending delete
                    if (composition_.delete_counter_ > 0 && cursor_.index() >= composition_.delete_counter_) {
                        Index start = cursor_.index() - composition_.delete_counter_;
                        display_text.erase(start, composition_.delete_counter_);
                    }

                    // Insert composition buffer
                    display_text.insert(cursor_.index(), composition_.buffer_);
                }

                line_cache_.lines_.clear();
                float y = 0;

                // Split text into lines
                Index pos = 0;
                while (pos < display_text.length()) {
                    Index line_end = display_text.find(Traits::to_string("\n")[0], pos);
                    if (line_end == string_type::npos) {
                        line_end = display_text.length();
                    }

                    string_type line = display_text.substr(pos, line_end - pos);

                    // Calculate line metrics
                    std::string display_line(line.begin(), line.end());
                    plastic::Size<float> line_size = font_->measure_text(
                        display_line,
                        style_.font_size_,
                        style_.letter_spacing_
                    );

                    line_cache_.lines_.push_back({
                        line,
                        plastic::Point<float>(0, y),
                        line_size,
                        false
                    });

                    y += line_size.height() * style_.line_height_factor_;
                    pos = line_end + 1;
                }

                // Ensure we have at least one line
                if (line_cache_.empty()) {
                    plastic::Size<float> line_size = font_->measure_text(
                        "",
                        style_.font_size_,
                        style_.letter_spacing_
                    );

                    line_cache_.lines_.push_back({
                        string_type(),
                        plastic::Point<float>(0, 0),
                        line_size,
                        false
                    });
                }
                line_cache_.is_dirty_ = false;
            }
        };
    }
    namespace ascii::text
    {
        using Buffer = keditor::text::Buffer<char>;
    }
    namespace utf8::text
    {
        using Buffer = keditor::text::Buffer<char8_t>;
    }
}
