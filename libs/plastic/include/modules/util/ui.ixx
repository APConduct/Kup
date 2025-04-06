//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <memory>
#include <functional>
#include <string>
export module plastic.ui;


import plastic.element;
import plastic.elements.basic;
import plastic.elements.containers;
import plastic.color;
import plastic.size;
import plastic.rect;
import plastic.point;
import plastic.context;
import plastic.style;
import plastic.layout_properties;
import plastic.flex_layout;
import plastic.app;
import plastic.edge;
import plastic.elements.styled_text;
import plastic.font.weight;


export namespace plastic::ui
{

    using FontWeight = plastic::font::Weight;
    // Factory functions for basic elements
    inline std::shared_ptr<Text> text(std::string content, float size = 16.0f, Color color = Color::white()) {
        return std::make_shared<Text>(std::move(content), size, color);
    }


    inline std::shared_ptr<Button> button(std::string label, std::function<void()> on_click = nullptr) {
        auto btn = std::make_shared<Button>(std::move(label));
        if (on_click) {
            btn->on_click(std::move(on_click));
        }
        return btn;
    }

    inline std::shared_ptr<TextField> textfield(std::string placeholder, std::string initial_value = "") {
        return std::make_shared<TextField>(std::move(placeholder), std::move(initial_value));
    }

    inline std::shared_ptr<Checkbox> checkbox(std::string label, bool checked = false) {
        return std::make_shared<Checkbox>(std::move(label), checked);
    }

    inline std::shared_ptr<Spacer> spacer(float width = 0, float height = 0) {
        return std::make_shared<Spacer>(width, height);
    }

    // Layout containers with variadic templates for children
    template<typename... Children>
    inline std::shared_ptr<VStack> v_stack(float spacing, Children... children) {
        auto stack = std::make_shared<VStack>();
        stack->with_spacing(spacing);
        (stack->add_child(children), ...);
        return stack;
    }

    template<typename... Children>
    inline std::shared_ptr<HStack> h_stack(float spacing, Children... children) {
        auto stack = std::make_shared<HStack>();
        stack->with_spacing(spacing);
        (stack->add_child(children), ...);
        return stack;
    }

    template<typename... Children>
    inline std::shared_ptr<FlexBox> flex(Children... children) {
        auto flex = std::make_shared<FlexBox>();
        (flex->add_child(children), ...);
        return flex;
    }

    // Helper for centering content
    inline std::shared_ptr<FlexBox> center(const std::shared_ptr<Element>& child) {
        auto container = std::make_shared<FlexBox>();
        container->with_align_items(FlexAlign::Center);
        container->with_justify_content(FlexAlign::Center);
        container->add_child(child);
        return container;
    }

    // Helper for padding content
    inline std::shared_ptr<Element> padding(const std::shared_ptr<Element>& child, float padding) {
        auto container = std::make_shared<FlexBox>();
        container->add_child(child);
        container->set_layout_properties(LayoutProperties().with_padding(padding));
        return container;
    }

    // Style helpers
    inline std::shared_ptr<Element> bg(std::shared_ptr<Element> child, Color color) {
        // Apply background color to the element
        child->set_style(child->get_style().bg(color));
        return child;
    }

    inline std::shared_ptr<Element> text_color(std::shared_ptr<Element> child, Color color) {
        // Apply text color to the element
        child->set_style((child->get_style()).with_text_color_normal(color));
        return child;
    }

    // Element modifiers
    template <typename E>
    std::shared_ptr<E> with_style(std::shared_ptr<E> element, const style::Style& style) {
        element->set_style(style);
        return element;
    }

    template <typename E>
    std::shared_ptr<E> with_flex_grow(std::shared_ptr<E> element, float flex_grow = 1.0f) {
        auto props = element->get_layout_properties();
        props.flex_grow = flex_grow;
        element->set_layout_properties(props);
        return element;
    }

    template <typename E>
    std::shared_ptr<E> with_margin(std::shared_ptr<E> element, float margin) {
        auto props = element->get_layout_properties();
        props.margin = Edge<float>{margin, margin, margin, margin};
        element->set_layout_properties(props);
        return element;
    }

    template <typename E>
    std::shared_ptr<E> with_padding(std::shared_ptr<E> element, float padding) {
        auto props = element->get_layout_properties();
        props.padding = padding;
        element->set_layout_properties(props);
        return element;
    }

    template <typename E>
    std::shared_ptr<E> with_align_self(std::shared_ptr<E> element, LayoutProperties::Alignment align) {
        auto props = element->get_layout_properties();
        props.align_self = align;
        element->set_layout_properties(props);
        return element;
    }

    template <typename E>
    std::shared_ptr<FlexBox> with_align_items(std::shared_ptr<FlexBox> element, FlexAlign align) {
        element->with_align_items(align);
        return element;
    }

    template <typename E>
    std::shared_ptr<FlexBox> with_justify_content(std::shared_ptr<FlexBox> element, FlexAlign align) {
        element->with_justify_content(align);
        return element;
    }

    template <typename E>
    std::shared_ptr<FlexBox> with_direction(std::shared_ptr<FlexBox> element, FlexDirection direction) {
        element->with_direction(direction);
        return element;
    }

    template <typename E>
    std::shared_ptr<E> with_size(std::shared_ptr<E> element, float width, float height) {
        auto style = element->get_style();
        style.set_preferred_size(Size<float>{width, height});
        element->set_style(style);
        return element;
    }

    // Standard color palette similar to GPUI.rs
    namespace colors {
        inline const Color primary = Color::rgb(66, 133, 244);
        inline const Color secondary = Color::rgb(52, 168, 83);
        inline const Color accent = Color::rgb(234, 67, 53);
        inline const Color background = Color::rgb(30, 30, 30);
        inline const Color surface = Color::rgb(50, 50, 50);
        inline const Color text = Color::rgb(255, 255, 255);
        inline const Color text_secondary = Color::rgb(180, 180, 180);
        inline const Color divider = Color::rgb(100, 100, 100);
        inline const Color success = Color::rgb(76, 175, 80);
        inline const Color error = Color::rgb(244, 67, 54);
        inline const Color warning = Color::rgb(255, 152, 0);
        inline const Color info = Color::rgb(33, 150, 243);
    }

    inline int run(std::string title, std::function<std::shared_ptr<Element>(Context*)> create_ui_fn,
          Size<float> size = Size<float>{800, 600}, Color bg_color = Color::rgb(30, 30, 30)) {

        return App()
            .with_title(std::move(title))
            .with_size(size)
            .with_ui(std::move(create_ui_fn), bg_color)
            .run_and_return();
    }


    inline std::shared_ptr<StyledText> styled_text(
    std::string content,
    std::string font_family = "Rubik",
    FontWeight weight = FontWeight::Regular,
    float size = 16.0f,
    Color color = Color::white()
) {
        return std::make_shared<StyledText>(
            std::move(content),
            std::move(font_family),
            weight,
            size,
            color
        );
    }

    // Some common shortcuts
    inline std::shared_ptr<StyledText> h1(std::string text, Color color = colors::text) {
        return styled_text(std::move(text), "Rubik", FontWeight::Bold, 24.0f, color);
    }

    inline std::shared_ptr<StyledText> h2(std::string text, Color color = colors::text) {
        return styled_text(std::move(text), "Rubik", FontWeight::Medium, 20.0f, color);
    }

    inline std::shared_ptr<StyledText> h3(std::string text, Color color = colors::text) {
        return styled_text(std::move(text), "Rubik", FontWeight::Regular, 18.0f, color);
    }

    inline std::shared_ptr<StyledText> body(std::string text, Color color = colors::text) {
        return styled_text(std::move(text), "Rubik", FontWeight::Regular, 16.0f, color);
    }

    inline std::shared_ptr<StyledText> code(std::string text, Color color = colors::text) {
        return styled_text(std::move(text), "Plasevka", FontWeight::Regular, 14.0f, color);
    }

    // Dialog component
    std::shared_ptr<Element> dialog(
        const std::string& title,
        const std::string& message,
        std::function<void(bool)> on_result
    ) {
        auto container = std::make_shared<FlexBox>();
        container->with_direction(FlexDirection::Column)
                 .with_align_items(FlexAlign::Center)
                 .with_gap(16);

        // Add title
        container->add_child(text(title, 20, colors::text));

        // Add message
        container->add_child(text(message, 16, colors::text_secondary));

        // Add buttons
        auto buttons = std::make_shared<FlexBox>();
        buttons->with_direction(FlexDirection::Row)
               .with_gap(8)
               .with_justify_content(FlexAlign::Center);

        buttons->add_child(
            button("Cancel", [on_result] { on_result(false); })
        );
        buttons->add_child(
            button("OK", [on_result] { on_result(true); })
        );

        container->add_child(buttons);

        return container;
    }

    // Card component
    std::shared_ptr<Element> card(
        const std::string& title,
        std::shared_ptr<Element> content
    ) {
        auto container = std::make_shared<FlexBox>();
        container->with_direction(FlexDirection::Column)
                 .with_gap(8);

        // Add title if provided
        if (!title.empty()) {
            container->add_child(text(title, 18, colors::text));
        }

        // Add content
        container->add_child(content);

        // Style the card
        container->set_style(
            style::Style()
                .bg(colors::surface)
                .with_corner_radius(8)
                .with_padding(16)
        );

        return container;
    }

    // Pre-styled button variants
    inline auto primary_button(const std::string& label, std::function<void()> on_click) {
        return button(std::move(label), std::move(on_click))
            ->with_style(style::Style()
                .bg(colors::primary)
                .with_padding(8));
    }

    // Layout helpers
    inline auto card_container(std::shared_ptr<Element> content) {
        return std::move(v_stack(16,
                                 std::move(content))
            ->with_style(style::Style()
                         .bg(colors::surface)
                         .with_corner_radius(8)
                         .with_padding(16)));
    }


}

export namespace plastic::layout
{
    inline auto centered_column() {
        return std::move(std::make_shared<FlexBox>()
                         ->with_direction(FlexDirection::Column)
                         .with_align_items(FlexAlign::Center)
                         .with_justify_content(FlexAlign::Center));
    }

    inline auto form_layout() {
        return std::move(std::make_shared<FlexBox>()
                         ->with_direction(FlexDirection::Column)
                         .with_gap(12));
    }

}
