//
// Created by Aidan Jost on 3/8/25.
//
module;
#include <memory>
#include <string>
#include <vector>
#include <functional>
export module plastic.element_builder;

import plastic.element;
import plastic.elements.basic;
import plastic.elements.containers;
import plastic.size;
import plastic.color;
import plastic.style;
import plastic.layout_properties;
import plastic.context;
import plastic.flex_layout;
import plastic.edge;

export namespace plastic
{
    // Base builder for all elements
    template <typename Derived, typename ElementType>
    class ElementBuilder {
    protected:
        std::shared_ptr<ElementType> element_;

    public:
        explicit ElementBuilder(std::shared_ptr<ElementType> element)
            : element_(std::move(element)) {}

        // Convert to the underlying element
        operator std::shared_ptr<Element>() const {
            return element_;
        }

        std::shared_ptr<ElementType> build() const {
            return element_;
        }

        // Access the derived class for method chaining
        Derived& derived() {
            return static_cast<Derived&>(*this);
        }

        // Common styling methods
        Derived& size(float width, float height) {
            auto style = element_->get_style();
            style.set_preferred_size(Size<float>{width, height});
            element_->set_style(style);
            return derived();
        }

        Derived& size(const Size<float>& size) {
            auto style = element_->get_style();
            style.set_preferred_size(size);
            element_->set_style(style);
            return derived();
        }

        Derived& width(float width) {
            auto size = element_->get_style().get_preferred_size();
            size.width(width);
            element_->get_style().set_preferred_size(size);
            return derived();
        }

        Derived& height(float height) {
            auto size = element_->get_style().get_preferred_size();
            size.height(height);
            element_->get_style().set_preferred_size(size);
            return derived();
        }

        Derived& bg(const Color& color) {
            auto style = element_->get_style();
            style.background_color_normal = color;
            element_->set_style(style);
            return derived();
        }

        Derived& text_color(const Color& color) {
            auto style = element_->get_style();
            style.text_color_normal = color;
            element_->set_style(style);
            return derived();
        }

        Derived& padding(float padding) {
            auto props = element_->get_layout_properties();
            props.padding = padding;
            element_->set_layout_properties(props);
            return derived();
        }

        Derived& margin(float margin) {
            auto props = element_->get_layout_properties();
            props.margin = Edge<float>{margin, margin, margin, margin};
            element_->set_layout_properties(props);
            return derived();
        }

        Derived& flex_grow(float grow = 1.0f) {
            auto props = element_->get_layout_properties();
            props.flex_grow = grow;
            element_->set_layout_properties(props);
            return derived();
        }

        // Border methods
        Derived& border(float width, const Color& color) {
            auto style = element_->get_style();
            style.border = color;
            style.border_width = width;
            element_->set_style(style);
            return derived();
        }

        Derived& border_1() {
            return border(1.0f, Color::black());
        }

        Derived& border_2() {
            return border(2.0f, Color::black());
        }

        Derived& border_color(const Color& color) {
            auto style = element_->get_style();
            style.border = color;
            element_->set_style(style);
            return derived();
        }

        // Text styling
        Derived& text_xl() {
            auto style = element_->get_style();
            style.font_size = 20.0f;
            element_->set_style(style);
            return derived();
        }

        Derived& text_lg() {
            auto style = element_->get_style();
            style.font_size = 18.0f;
            element_->set_style(style);
            return derived();
        }

        Derived& text_sm() {
            auto style = element_->get_style();
            style.font_size = 14.0f;
            element_->set_style(style);
            return derived();
        }

        Derived& text_xs() {
            auto style = element_->get_style();
            style.font_size = 12.0f;
            element_->set_style(style);
            return derived();
        }

        // Shadow effects
        Derived& shadow_sm() {
            // Add shadow styling
            return derived();
        }

        Derived& shadow_md() {
            // Add shadow styling
            return derived();
        }

        Derived& shadow_lg() {
            // Add shadow styling
            return derived();
        }
    };

    // Specific builder for containers like div
    class DivBuilder : public ElementBuilder<DivBuilder, FlexBox> {
    public:
        explicit DivBuilder(std::shared_ptr<FlexBox> element = std::make_shared<FlexBox>())
            : ElementBuilder(std::move(element)) {}

        // Flex methods
        DivBuilder& flex() {
            // Enable flex layout
            return *this;
        }

        DivBuilder& flex_col() {
            element_->with_direction(FlexDirection::Column);
            return *this;
        }

        DivBuilder& flex_row() {
            element_->with_direction(FlexDirection::Row);
            return *this;
        }

        DivBuilder& justify_center() {
            element_->with_justify_content(FlexAlign::Center);
            return *this;
        }

        DivBuilder& justify_between() {
            element_->with_justify_content(FlexAlign::SpaceBetween);
            return *this;
        }

        DivBuilder& justify_around() {
            element_->with_justify_content(FlexAlign::SpaceAround);
            return *this;
        }

        DivBuilder& items_center() {
            element_->with_align_items(FlexAlign::Center);
            return *this;
        }

        DivBuilder& items_start() {
            element_->with_align_items(FlexAlign::Start);
            return *this;
        }

        DivBuilder& items_end() {
            element_->with_align_items(FlexAlign::End);
            return *this;
        }

        // Sizing helpers like in GPUI
        DivBuilder& size_4() { return size(16, 16); }
        DivBuilder& size_8() { return size(32, 32); }
        DivBuilder& size_12() { return size(48, 48); }
        DivBuilder& size_16() { return size(64, 64); }

        // Spacing methods
        DivBuilder& gap_1() { return gap(4); }
        DivBuilder& gap_2() { return gap(8); }
        DivBuilder& gap_3() { return gap(12); }
        DivBuilder& gap_4() { return gap(16); }

        DivBuilder& gap(float space) {
            element_->with_gap(space);
            return *this;
        }

        // Add children
        DivBuilder& child(const std::shared_ptr<Element>& child) {
            element_->add_child(child);
            return *this;
        }

        DivBuilder& child(const std::string& text) {
            element_->add_child(std::make_shared<Text>(text));
            return *this;
        }
    };

    // Specific builder for text elements
    class TextBuilder : public ElementBuilder<TextBuilder, Text> {
    public:
        explicit TextBuilder(const std::string& text)
            : ElementBuilder(std::make_shared<Text>(text)) {}
    };

    // Specific builder for button elements
    class ButtonBuilder : public ElementBuilder<ButtonBuilder, Button> {
    public:
        explicit ButtonBuilder(const std::string& label)
            : ElementBuilder(std::make_shared<Button>(label)) {}

        ButtonBuilder& on_click(std::function<void()> handler) {
            element_->on_click(std::move(handler));
            return *this;
        }
    };

    // Factory functions for creating element builders
    inline DivBuilder div() {
        return DivBuilder();
    }

    inline TextBuilder text(const std::string& content) {
        return TextBuilder(content);
    }

    inline ButtonBuilder button(const std::string& label) {
        return ButtonBuilder(label);
    }

    // Helper for creating pixel dimensions like in GPUI
    inline float px(float value) {
        return value;
    }
}



