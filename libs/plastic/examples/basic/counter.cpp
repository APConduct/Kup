#include <string>
import plastic;

using namespace plastic;
using namespace plastic::ui;

class CounterView : public View {
private:
    int count_ = 0;
    std::shared_ptr<Text> counter_text_{};
    std::shared_ptr<Button> minus_button_{};
    std::shared_ptr<Button> plus_button_{};
    std::shared_ptr<Element> container_;

public:
    CounterView() {
        // Create styles for the buttons
        auto button_style = style::Style()
            .bg(colors::primary)
            .with_text_color_normal(colors::text)
            .with_corner_radius(4.0f);

        // Create elements once
        counter_text_ = text(std::to_string(count_), 32, colors::text);

        minus_button_ = button("-", [this]() {
            count_--;
            counter_text_->with_text(std::to_string(count_));
            invalidate_paint();
        });
        minus_button_->set_style(button_style);
        minus_button_->set_layout_properties(LayoutProperties()
            .with_padding(8)
            .with_preferred_size(Size<float>{50, 40}));

        plus_button_ = button("+", [this]() {
            count_++;
            counter_text_->with_text(std::to_string(count_));
            invalidate_paint();
        });
        plus_button_->set_style(button_style);
        plus_button_->set_layout_properties(LayoutProperties()
            .with_padding(8)
            .with_preferred_size(Size<float>{50, 40}));

        // Create container
        auto buttons = h_stack(16, minus_button_, plus_button_);
        container_ = center(v_stack(16, counter_text_, buttons));
    }

    std::shared_ptr<Element> render(Context* cx) override {
        return container_;
    }

    void on_mount() override {
        set_background_color(colors::background);
    }
};

int main() {
    return App()
        .with_title("Counter Example")
        .with_size(Size<float>{300, 200})
        .with_ui([](Context* cx) {
            return std::make_shared<CounterView>()->render(cx);
        })
        .run_and_return();
}
