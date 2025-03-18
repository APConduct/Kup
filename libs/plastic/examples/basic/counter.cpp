#include <string>
#include <iostream>

import plastic;

using namespace plastic;
using namespace plastic::ui;

class CounterView : public View {
private:
    int count_ = 0;
    std::shared_ptr<Text> counter_text_;
    std::shared_ptr<Button> minus_button_;
    std::shared_ptr<Button> plus_button_;
    std::shared_ptr<Element> container_;

public:
    CounterView() {


        // Create styles for the buttons
        auto button_style = style::Style()
            .bg(colors::primary)
            .with_text_color_normal(colors::text);


        // Create elements
        counter_text_ = std::make_shared<Text>(std::to_string(count_), 32, colors::text);

        minus_button_ = std::make_shared<Button>("-", [this]() {
            count_--;
            counter_text_->with_text(std::to_string(count_));
        });
        minus_button_->set_style(button_style);
        minus_button_->with_padding(12);

        plus_button_ = std::make_shared<Button>("+", [this]() {
            count_++;
            counter_text_->with_text(std::to_string(count_));
        });
        plus_button_->set_style(button_style);
        plus_button_->with_padding(12);

        // Create horizontal stack for buttons with explicit spacing
        auto button_stack = std::make_shared<HStack>();
        button_stack->set_layout_properties(LayoutProperties().with_spacing(16));
        button_stack->add_child(minus_button_);
        button_stack->add_child(plus_button_);

        // Create vertical stack for the entire layout with explicit spacing
        auto v_stack = std::make_shared<VStack>();
        v_stack->set_layout_properties(LayoutProperties().with_spacing(16));
        v_stack->add_child(counter_text_);
        v_stack->add_child(button_stack);

        // Set up the flex container
        auto flex = std::make_shared<FlexBox>();
        flex->with_align_items(FlexAlign::Center);
        flex->with_justify_content(FlexAlign::Center);
        flex->set_layout_properties(LayoutProperties()
            .with_spacing(16)
            .with_margin(16));
        flex->add_child(v_stack);

        container_ = flex;
    }

    std::shared_ptr<Element> render(Context* cx) override {
        std::cout << "\n=== CounterView Render ===\n";

        // Log the current state
        if (container_) {
            std::cout << "Container bounds before: "
                      << container_->get_bounds().width() << "x"
                      << container_->get_bounds().height() << "\n";
        }

        // Force layout if needed
        if (container_) {
            container_->layout(cx);
            std::cout << "Container bounds after layout: "
                      << container_->get_bounds().width() << "x"
                      << container_->get_bounds().height() << "\n";
        }

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
