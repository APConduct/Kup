//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <raylib.h>
#include <string>
export module line_numbers;
import plastic.element;
import plastic.color;
import plastic.context;
import plastic.size;


export namespace editor {
    class LineNumbersWidget : public plastic::Element {
    private:
        std::string text_content_;
        size_t line_count_{1};
        float line_height_{14.0f};
        int visible_start_{1};
        int visible_end_{1};
        plastic::Color line_color_{plastic::Color::gray()};
        plastic::Color current_line_color_{plastic::Color::white()};
        int current_line_{1};
        float gutter_width_{40.0f};

    public:
        void set_line_count(size_t count) {
            if (line_count_ != count) {
                line_count_ = count;
                invalidate();
            }
        }

        void set_visible_range(int start, int end) {
            if (visible_start_ != start || visible_end_ != end) {
                visible_start_ = start;
                visible_end_ = end;
                invalidate();
            }
        }

        void set_current_line(int line) {
            if (current_line_ != line) {
                current_line_ = line;
                invalidate();
            }
        }

        void layout(plastic::Context* cx) override {
            // Simple layout just uses the provided bounds
        }

        void paint(plastic::Context* cx) const override {
            const auto& bounds = get_bounds();

            // Draw background
            if (auto bg_color = get_style().background_color_normal) {
                DrawRectangleRec({bounds.x(), bounds.y(), bounds.width(), bounds.height()}, bg_color->rl());
            }

            // Draw line numbers
            float y = bounds.y();
            for (int line = visible_start_; line <= visible_end_; ++line) {
                plastic::Color color = (line == current_line_) ? current_line_color_ : line_color_;

                std::string line_number = std::to_string(line);
                float x = bounds.x() + bounds.width() - 10 - static_cast<float>(MeasureText(line_number.c_str(), 12));

                DrawText(line_number.c_str(), static_cast<int>(x), static_cast<int>(y), 12, color.rl());

                y += line_height_;
                if (y > bounds.y() + bounds.height()) break;
            }
        }

        [[nodiscard]] plastic::Size<float> get_preferred_size() const override {
            // Calculate width based on line count
            int digits = static_cast<int>(std::log10(std::max<size_t>(line_count_, 1))) + 1;
            float preferred_width = gutter_width_ + static_cast<float>(digits) * 8.0f;
            return plastic::Size<float>{preferred_width, static_cast<float>(line_count_) * line_height_};
        }

        void set_line_height(float height) {
            line_height_ = height;
            invalidate();
        }
    };
}