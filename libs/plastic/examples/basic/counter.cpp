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
            .with_corner_radius(4.0f)
            .with_preferred_size(Size<float>{50, 40}); // Set preferred size in style

        // Create elements
        counter_text_ = text(std::to_string(count_), 32, colors::text);
        counter_text_->set_layout_properties(LayoutProperties()
            .with_margin(8));

        minus_button_ = button("-", [this]() {
            count_--;
            counter_text_->with_text(std::to_string(count_));
        });
        minus_button_->set_style(button_style);

        plus_button_ = button("+", [this]() {
            count_++;
            counter_text_->with_text(std::to_string(count_));
        });
        plus_button_->set_style(button_style);

        // Create horizontal stack for buttons
        auto button_stack = std::make_shared<HStack>();
        button_stack->set_layout_properties(LayoutProperties()
            .with_padding(8)
            .with_spacing(16)); // Set spacing in layout properties
        button_stack->add_child(minus_button_);
        button_stack->add_child(plus_button_);

        // Create vertical stack for the entire layout
        auto v_stack = std::make_shared<VStack>();
        v_stack->set_layout_properties(LayoutProperties()
            .with_padding(16)
            .with_spacing(16)); // Set spacing in layout properties
        v_stack->add_child(counter_text_);
        v_stack->add_child(button_stack);

        // Create flex container for centering
        auto flex = std::make_shared<FlexBox>();
        flex->with_align_items(FlexAlign::Center);
        flex->with_justify_content(FlexAlign::Center);
        flex->add_child(v_stack);

        container_ = flex;
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
