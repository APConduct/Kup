//
// Created by Aidan Jost on 3/13/25.
//
/// @file styled_text.ixx
/// @brief Styled text element

module;
#include <memory>
#include <string>

export module plastic.elements.styled_text;


import plastic.element;
import plastic.context;
import plastic.color;
import plastic.font;
import plastic.font_registry;
import plastic.size;
import plastic.point;
import plastic.font.weight;

export namespace plastic
{
    class StyledText : public Element {
        using FontWeight = font::Weight;
    private:
        std::string text_;
        std::string font_family_{"Rubik"};
        FontWeight font_weight_{FontWeight::Regular};
        float font_size_{16.0f};
        float spacing_{1.0f};
        Color color_{Color::white()};
        std::shared_ptr<Font> font_;
        bool size_calculated_{false};

    public:
        StyledText() = default;

        explicit StyledText(std::string text,
                           std::string font_family = "Rubik",
                           FontWeight weight = FontWeight::Regular,
                           float font_size = 16.0f,
                           Color color = Color::white())
            : text_(std::move(text)),
              font_family_(std::move(font_family)),
              font_weight_(weight),
              font_size_(font_size),
              color_(color)
        {
            font_ = get_font(font_family_, font_weight_);
            calculate_size();
        }

        void paint(Context* cx) const override {
            if (!font_) return;

            font_->draw_text(
                text_,
                Point{bounds.x(), bounds.y()},
                font_size_,
                spacing_,
                color_
            );
        }

        void layout(Context* cx) override {
            if (!size_calculated_ || !font_) {
                font_ = get_font(font_family_, font_weight_);
                calculate_size();
            }
        }

        void calculate_size() {
            if (!font_) return;

            auto size = font_->measure_text(text_, font_size_, spacing_);
            current_size = size;
            size_calculated_ = true;
        }

        StyledText& with_text(std::string text) {
            if (text_ != text) {
                text_ = std::move(text);
                size_calculated_ = false;
                invalidate();
            }
            return *this;
        }

        StyledText& with_font(std::string family, FontWeight weight = FontWeight::Regular) {
            font_family_ = std::move(family);
            font_weight_ = weight;
            font_ = get_font(font_family_, font_weight_);
            size_calculated_ = false;
            invalidate();
            return *this;
        }

        StyledText& with_font_size(float size) {
            font_size_ = size;
            size_calculated_ = false;
            invalidate();
            return *this;
        }

        StyledText& with_color(const Color& color) {
            color_ = color;
            invalidate();
            return *this;
        }

        StyledText& with_spacing(float spacing) {
            spacing_ = spacing;
            size_calculated_ = false;
            invalidate();
            return *this;
        }

        [[nodiscard]] const std::string& text() const { return text_; }
    };
}