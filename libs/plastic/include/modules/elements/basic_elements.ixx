//
// Created by Aidan Jost on 3/7/25.
//
/// @file basic_elements.ixx
/// @brief Basic elements for the Plastic UI framework

module;
#include <string>
#include <functional>
#include <raylib.h>
#include <iostream>
#if defined(_WIN32)
#include <variant>
#endif
export module plastic.elements.basic;

import plastic.element;
import plastic.context;
import plastic.rect;
import plastic.color;
import plastic.events;
import plastic.size;
import plastic.point;
import plastic.font_registry;

export namespace plastic
{

    /// @brief Basic text element
    /// @tparam T The type of the text element
    /// @note This element is used to display text on the screen
    class Text : public Element {
    private:
        std::string text_;
        float font_size_{16.0f};
        Color color_{Color::white()};
        bool size_calculated_{false};
    

    public:

        /// @brief Default constructor
        Text() = default;


        /// @brief Constructor with text
        /// @param text The text to display
        /// @param font_size The font size of the text
        /// @param color The color of the text
        explicit Text(std::string text, float font_size = 16.0f, Color color = Color::white())
    : text_(std::move(text)), font_size_(font_size), color_(color) {
            calculate_size();
        }

        /// @brief Paints the text element on the screen
        void paint(Context* cx) const override {
            auto default_font = FontRegistry::get_global_default_font();

            if (default_font && default_font->is_valid()) {
                // Use our custom font
                default_font->draw_text(
                    text_,
                    Point{bounds.x(), bounds.y()},
                    font_size_,
                    1.0f, // Use default spacing
                    color_
                );
            } else {
                // Fallback to Raylib's DrawText
                DrawText(
                    text_.c_str(),
                    static_cast<int>(bounds.x()),
                    static_cast<int>(bounds.y()),
                    static_cast<int>(font_size_),
                    color_.rl()
                );
            }
        }

        /// @brief Layout the text element
        /// @param cx The context of the element
        void layout(Context* cx) override {
            if (!size_calculated_) {
                calculate_size();
            }
        }

        /// @brief Calculate the size of the text element
        void calculate_size() {
            auto default_font = FontRegistry::get_global_default_font();

            if (default_font && default_font->is_valid()) {
                // Measure using our custom font
                current_size = default_font->measure_text(text_, font_size_, 1.0f);
            } else {
                // Fallback to Raylib's MeasureText
                auto [x, y] = MeasureTextEx(GetFontDefault(), text_.c_str(), font_size_, 1.0f);
                current_size = Size<float>{x, y};
            }

            size_calculated_ = true;
        }

        /// @brief Set the text of the element
        /// @param text The text to display
        /// @return A reference to the current instance of the Text element
        Text& with_text(std::string text) {
            if (text_ != text) {
                text_ = std::move(text);
                size_calculated_ = false;
                invalidate();
            }
            return *this;
        }

        /// @brief Set the font size of the element
        /// @param size The font size of the text
        /// @return A reference to the current instance of the Text element
        Text& with_font_size(float size) {
            font_size_ = size;
            invalidate();
            return *this;
        }

        /// @brief Set the color of the element
        /// @param color The color of the text
        /// @return A reference to the current instance of the Text element
        Text& with_color(const Color& color) {
            color_ = color;
            invalidate();
            return *this;
        }

        /// @brief get the preferred size of the text element
        /// @return The preferred size of the text element
        [[nodiscard]] Size<float> get_preferred_size() const override {
            // Use cached size if available
            if (size_calculated_) {
                return current_size;
            }

            // Otherwise calculate it
            auto default_font = FontRegistry::get_global_default_font();
            if (default_font && default_font->is_valid()) {
                return default_font->measure_text(text_, font_size_, 1.0f);
            }
            Vector2 size = MeasureTextEx(GetFontDefault(), text_.c_str(), font_size_, 1.0f);
            return Size<float>{size.x, size.y};
        };

        [[nodiscard]] const std::string& text() const { return text_; }


    };

    /// @brief Basic button element
    class Button : public Element {
    private:
        std::string text_;
        float font_size_{16.0f};
        Color text_color_{Color::white()};
        Color bg_color_{Color::rgb(66, 133, 244)};
        Color hover_color_{Color::rgb(77, 144, 254)};
        Color pressed_color_{Color::rgb(48, 115, 230)};
        float corner_radius_{4.0f};
        float padding_{10.0f};
        bool is_hovered_{false};
        bool is_pressed_{false};
        std::function<void()> on_click_;


    public:
        Button() : Button("Button") {};

        explicit Button(std::string text, std::function<void()> on_click = nullptr)
            : text_(std::move(text)), on_click_(std::move(on_click)) {
            bounds = Rect<float>{0, 0, 100, 40};
        }

        void paint(Context* cx) const override {
            const auto& bounds = get_bounds();

            // Determine the current background color based on state
            Color current_bg;
            if (is_pressed_) current_bg = pressed_color_;
            else if (is_hovered_) current_bg = hover_color_;
            else current_bg = bg_color_;

            // Draw button background
            if (corner_radius_ > 0) {
                DrawRectangleRounded(bounds.to_rl(), corner_radius_, 10, current_bg.rl());
            } else {
                DrawRectangleRec(bounds.to_rl(), current_bg.rl());
            }

            // Get default font
            auto default_font = FontRegistry::get_global_default_font();

            // Draw text centered
            if (default_font && default_font->is_valid()) {
                // Measure text using our custom font
                auto text_size = default_font->measure_text(text_, font_size_, 1.0f);
                float text_x = bounds.x() + (bounds.width() - text_size.width()) / 2;
                float text_y = bounds.y() + (bounds.height() - text_size.height()) / 2;

                // Draw text using our custom font
                default_font->draw_text(
                    text_,
                    Point{text_x, text_y},
                    font_size_,
                    1.0f,
                    text_color_
                );
            } else {
                // Fallback to Raylib's default font
                Vector2 text_size = MeasureTextEx(GetFontDefault(), text_.c_str(), font_size_, 1.0f);
                float text_x = bounds.x() + (bounds.width() - text_size.x) / 2;
                float text_y = bounds.y() + (bounds.height() - text_size.y) / 2;

                DrawText(
                    text_.c_str(),
                    static_cast<int>(text_x),
                    static_cast<int>(text_y),
                    static_cast<int>(font_size_),
                    text_color_.rl()
                );
            }
        }

        void layout(Context* cx) override {
            // Calculate minimum button size based on text
            Vector2 text_size = MeasureTextEx(GetFontDefault(), text_.c_str(), font_size_, 1.0f);
            current_size = Size<float>{
                text_size.x + padding_ * 2,
                text_size.y + padding_ * 2
            };
        }

        bool process_event(const events::Event& event, Context* cx) override {
            if (auto* mouse_event = std::get_if<events::MouseButtonEvent>(&event)) {
                Point<float> mouse_pos{mouse_event->position.width(), mouse_event->position.height()};

                std::cout << "Button: Processing mouse event at " << mouse_pos.x << "," << mouse_pos.y << "\n";
                std::cout << "Button bounds: " << bounds.x() << "," << bounds.y()
                          << " " << bounds.width() << "x" << bounds.height() << "\n";

                bool is_inside = bounds.contains(mouse_pos);
                std::cout << "Button: Mouse " << (is_inside ? "inside" : "outside") << " bounds\n";

                if (is_inside) {
                    if (mouse_event->pressed) {
                        std::cout << "Button: Pressed\n";
                        is_pressed_ = true;
                        invalidate();
                        return true;
                    } else if (is_pressed_) {
                        std::cout << "Button: Released, executing callback\n";
                        is_pressed_ = false;
                        if (on_click_) {
                            on_click_();
                        } else {
                            std::cout << "Button: No callback registered\n";
                        }
                        invalidate();
                        return true;
                    }
                }
            }
            return false;
        }
        Button& on_click(std::function<void()> callback) {
            if (callback) {
                on_click_ = std::move(callback);
            }
            return *this;
        }

        Button& with_font_size(float size) {
            font_size_ = size;
            invalidate();
            return *this;
        }

        Button& with_colors(const Color& text, const Color& bg, const Color& hover, const Color& pressed) {
            text_color_ = text;
            bg_color_ = bg;
            hover_color_ = hover;
            pressed_color_ = pressed;
            invalidate();
            return *this;
        }

        Button& with_corner_radius(float radius) {
            corner_radius_ = radius;
            invalidate();
            return *this;
        }

        Button& with_padding(float padding) {
            padding_ = padding;
            invalidate();
            return *this;
        }

        [[nodiscard]] Size<float> get_preferred_size() const override {
            // Calculate minimum button size based on text
            Vector2 text_size = MeasureTextEx(font::get_default()->rl(), text_.c_str(), font_size_, 1.0f);
            return Size<float>{
                text_size.x + padding_ * 2,
                text_size.y + padding_ * 2
            };
        };

    };

    class Spacer : public Element {
    private:
        Size<float> min_size_{0, 0};

    public:
        Spacer() = default;

        explicit Spacer(float width, float height)
            : min_size_{width, height} {}

        explicit Spacer(Size<float> size)
            : min_size_(size) {}

        void paint(Context* cx) const override {
            // Nothing to paint
        }

        void layout(Context* cx) override {
            current_size = min_size_;
        }

        [[nodiscard]] Size<float> get_preferred_size() const override {
            return min_size_;
        }

        Spacer& with_size(float width, float height) {
            min_size_ = Size<float>{width, height};
            invalidate();
            return *this;
        }


    };

    class TextField : public Element {
    private:
        std::string text_;
        std::string placeholder_;
        float font_size_{16.0f};
        Color text_color_{Color::white()};
        Color placeholder_color_{Color::rgb(150, 150, 150)};
        Color bg_color_{Color::rgb(50, 50, 50)};
        Color border_color_{Color::rgb(100, 100, 100)};
        Color focused_border_color_{Color::rgb(66, 133, 244)};
        float corner_radius_{4.0f};
        float padding_{10.0f};
        bool is_focused_{false};
        std::function<void(const std::string&)> on_text_change_;

    public:
        TextField() = default;

        explicit TextField(std::string placeholder, std::string initial_text = "")
            : text_(std::move(initial_text)), placeholder_(std::move(placeholder)) {}

        void paint(Context* cx) const override {
            const auto& bounds = get_bounds();

            // Draw background
            if (corner_radius_ > 0) {
                DrawRectangleRounded(bounds.to_rl(), corner_radius_, 10, bg_color_.rl());
            } else {
                DrawRectangleRec(bounds.to_rl(), bg_color_.rl());
            }

            // Draw border
            if (corner_radius_ > 0) {
                DrawRectangleRoundedLines(
                    bounds.to_rl(),
                    corner_radius_,
                    10,
                    (is_focused_ ? focused_border_color_ : border_color_).rl()
                );
            } else {
                DrawRectangleLinesEx(
                    bounds.to_rl(),
                    1.0f,
                    (is_focused_ ? focused_border_color_ : border_color_).rl()
                );
            }

            // Draw text or placeholder
            const std::string& display_text = text_.empty() ? placeholder_ : text_;
            const Color& display_color = text_.empty() ? placeholder_color_ : text_color_;

            DrawText(
                display_text.c_str(),
                static_cast<int>(bounds.x() + padding_),
                static_cast<int>(bounds.y() + (bounds.height() - font_size_) / 2),
                static_cast<int>(font_size_),
                display_color.rl()
            );

            // Draw cursor if focused
            if (is_focused_ && !text_.empty()) {
                auto text_width = static_cast<float>(MeasureText(text_.c_str(), static_cast<int>(font_size_)));
                float cursor_x = bounds.x() + padding_ + text_width;
                float cursor_y = bounds.y() + (bounds.height() - font_size_) / 2;

                DrawLineEx(
                    {cursor_x, cursor_y},
                    {cursor_x, cursor_y + font_size_},
                    1.0f,
                    text_color_.rl()
                );
            }
        }

        void layout(Context* cx) override {
            // Calculate minimum size based on placeholder
            auto text_width = static_cast<float>(MeasureText(placeholder_.c_str(), static_cast<int>(font_size_)));
            current_size = Size<float>{
                text_width + padding_ * 2,
                font_size_ + padding_ * 2
            };
        }

        bool process_event(const events::Event& event, Context* cx) override {
            if (auto* mouse_event = std::get_if<events::MouseButtonEvent>(&event)) {
                // Check if mouse is inside field
                Point<float> mouse_pos{mouse_event->position.width(), mouse_event->position.height()};
                bool is_inside = bounds.contains(mouse_pos);

                if (mouse_event->button == MouseButton::MOUSE_LEFT_BUTTON && mouse_event->pressed) {
                    is_focused_ = is_inside;
                    invalidate();
                    return is_inside;
                }
            } else if (auto* key_event = std::get_if<events::KeyPressEvent>(&event)) {
                if (is_focused_ && key_event->pressed) {
                    // Handle key presses
                    if (key_event->key == KeyboardKey::KEY_BACKSPACE && !text_.empty()) {
                        text_.pop_back();
                        if (on_text_change_) on_text_change_(text_);
                        invalidate();
                        return true;
                    }
                    return true;
                }
            } else if (auto* text_event = std::get_if<events::TextInputEvent>(&event)) {
                if (is_focused_) {
                    // Handle text input
                    text_ += text_event->text;
                    if (on_text_change_) on_text_change_(text_);
                    invalidate();
                    return true;
                }
            }

            return false;
        }

        TextField& with_text(std::string text) {
            text_ = std::move(text);
            invalidate();
            return *this;
        }

        TextField& with_placeholder(std::string placeholder) {
            placeholder_ = std::move(placeholder);
            invalidate();
            return *this;
        }

        TextField& with_font_size(float size) {
            font_size_ = size;
            invalidate();
            return *this;
        }

        TextField& with_colors(const Color& text, const Color& placeholder, const Color& bg, const Color& border) {
            text_color_ = text;
            placeholder_color_ = placeholder;
            bg_color_ = bg;
            border_color_ = border;
            invalidate();
            return *this;
        }

        TextField& on_text_change(std::function<void(const std::string&)> callback) {
            on_text_change_ = std::move(callback);
            return *this;
        }

        [[nodiscard]] const std::string& text() const { return text_; }
    };

    class Checkbox : public Element {
    private:
        bool checked_{false};
        std::string label_;
        float font_size_{16.0f};
        Color text_color_{Color::white()};
        Color check_color_{Color::rgb(66, 133, 244)};
        Color box_color_{Color::rgb(50, 50, 50)};
        Color border_color_{Color::rgb(100, 100, 100)};
        float box_size_{18.0f};
        float spacing_{8.0f};
        std::function<void(bool)> on_change_;

    public:
        Checkbox() = default;

        explicit Checkbox(std::string label, bool initial_checked = false)
            : checked_(initial_checked), label_(std::move(label)) {}

        void paint(Context* cx) const override {
            const auto& bounds = get_bounds();

            // Draw checkbox
            float box_x = bounds.x();
            float box_y = bounds.y() + (bounds.height() - box_size_) / 2;

            // Draw box background
            DrawRectangleRec(
                {box_x, box_y, box_size_, box_size_},
                box_color_.rl()
            );

            // Draw box border
            DrawRectangleLinesEx(
                {box_x, box_y, box_size_, box_size_},
                1.0f,
                border_color_.rl()
            );

            // Draw check mark if checked
            if (checked_) {
                DrawLine(
                    static_cast<int>(box_x + box_size_ * 0.2f),
                    static_cast<int>(box_y + box_size_ * 0.5f),
                    static_cast<int>(box_x + box_size_ * 0.4f),
                    static_cast<int>(box_y + box_size_ * 0.7f),
                    check_color_.rl()
                );
                DrawLine(
                    static_cast<int>(box_x + box_size_ * 0.4f),
                    static_cast<int>(box_y + box_size_ * 0.7f),
                    static_cast<int>(box_x + box_size_ * 0.8f),
                    static_cast<int>(box_y + box_size_ * 0.3f),
                    check_color_.rl()
                );
            }

            // Draw label
            DrawText(
                label_.c_str(),
                static_cast<int>(box_x + box_size_ + spacing_),
                static_cast<int>(bounds.y() + (bounds.height() - font_size_) / 2),
                static_cast<int>(font_size_),
                text_color_.rl()
            );
        }

        void layout(Context* cx) override {
            // Calculate size based on checkbox and label
            auto label_width = static_cast<float>(MeasureText(label_.c_str(), static_cast<int>(font_size_)));
            current_size = Size<float>{
                box_size_ + spacing_ + label_width,
                std::max(box_size_, font_size_)
            };
        }

        bool process_event(const events::Event& event, Context* cx) override {
            if (auto* mouse_event = std::get_if<events::MouseButtonEvent>(&event)) {
                // Check if mouse is inside checkbox
                Point<float> mouse_pos{mouse_event->position.width(), mouse_event->position.height()};
                bool is_inside = bounds.contains(mouse_pos);

                if (is_inside && mouse_event->button == MouseButton::MOUSE_LEFT_BUTTON && !mouse_event->pressed) {
                    checked_ = !checked_;
                    if (on_change_) on_change_(checked_);
                    invalidate();
                    return true;
                }
            }

            return false;
        }

        Checkbox& with_checked(bool checked) {
            checked_ = checked;
            invalidate();
            return *this;
        }

        Checkbox& with_label(std::string label) {
            label_ = std::move(label);
            invalidate();
            return *this;
        }

        Checkbox& with_font_size(float size) {
            font_size_ = size;
            invalidate();
            return *this;
        }

        Checkbox& on_change(std::function<void(bool)> callback) {
            on_change_ = std::move(callback);
            return *this;
        }

        [[nodiscard]] bool is_checked() const { return checked_; }
    };


}