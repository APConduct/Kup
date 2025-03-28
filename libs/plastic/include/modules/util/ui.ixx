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


}

// export namespace plstc
// {
//     auto text(std::string content, float size = 16.0f, plastic::Color color = plastic::Color::white()) {
//         return plastic::ui::text(std::move(content), size, color);
//     };
//
//     auto button(std::string label, std::function<void()> on_click = nullptr) {
//         return plastic::ui::button(std::move(label), std::move(on_click));
//     };
//
//     auto textfield(std::string placeholder, std::string initial_value = "") {
//         return plastic::ui::textfield(std::move(placeholder), std::move(initial_value));
//     };
//
//     auto checkbox(std::string label, bool checked = false) {
//         return plastic::ui::checkbox(std::move(label), checked);
//     };
//
//     auto spacer(float width = 0, float height = 0) {
//         return plastic::ui::spacer(width, height);
//     };
//
//     auto v_stack(float spacing, auto... children) {
//         return plastic::ui::v_stack(spacing, children...);
//     };
//
//     auto h_stack(float spacing, auto... children) {
//         return plastic::ui::h_stack(spacing, children...);
//     };
//
//     auto flex(auto... children) {
//         return plastic::ui::flex(children...);
//     };
//
//     auto center(auto child) {
//         return plastic::ui::center(child);
//     };
//
//     auto padding(auto child, float padding) {
//         return plastic::ui::padding(child, padding);
//     };
//
//     auto bg(auto child, plastic::Color color) {
//         return plastic::ui::bg(child, color);
//     };
//
//     auto text_color(auto child, plastic::Color color) {
//         return plastic::ui::text_color(child, color);
//     };
//
//     auto with_style(auto element, const plastic::style::Style& style) {
//         return plastic::ui::with_style(element, style);
//     };
//
//     auto with_flex_grow(auto element, float flex_grow = 1.0f) {
//         return plastic::ui::with_flex_grow(element, flex_grow);
//     };
//
//     auto with_margin(auto element, float margin) {
//         return plastic::ui::with_margin(element, margin);
//     };
//
//     auto with_padding(auto element, float padding) {
//         return plastic::ui::with_padding(element, padding);
//     };
//
//     auto with_align_self(auto element, plastic::LayoutProperties::Alignment align) {
//         return plastic::ui::with_align_self(element, align);
//     };
// }
