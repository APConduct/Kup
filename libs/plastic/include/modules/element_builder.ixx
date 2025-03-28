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
import plastic.rect;
import plastic.point;
import plastic.events;
import plastic.edge;
import plastic.flex_layout;
import plastic.rgb;


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
        explicit operator std::shared_ptr<Element>() const {
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
            element_->set_preferred_size(width, height);
            return derived();
        }

        Derived& width(float width) {
            auto size = element_->get_preferred_size();
            size.width(width);
            element_->set_preferred_size(size);
            return derived();
        }

        Derived& height(float height) {
            auto size = element_->get_preferred_size();
            size.height(height);
            element_->set_preferred_size(size);
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
            style.border_color = color;
            style.border_width = width;
            element_->set_style(style);
            return derived();
        }

        Derived& border_1() {
            return border(1.0f, Colors::black());
        }

        Derived& border_2() {
            return border(2.0f, Colors::black());
        }

        Derived& border_color(const Color& color) {
            auto style = element_->get_style();
            style.border_color = color;
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
            auto style = element_->get_style();
            style.shadow_radius = 2.0f;
            style.shadow_offset = {1.0f, 1.0f};
            style.shadow_color = rgba(0x000000, 0.2f);
            element_->set_style(style);
            return derived();
        }

        Derived& shadow_md() {
            auto style = element_->get_style();
            style.shadow_radius = 4.0f;
            style.shadow_offset = {2.0f, 2.0f};
            style.shadow_color = rgba(0x000000, 0.3f);
            element_->set_style(style);
            return derived();
        }

        Derived& shadow_lg() {
            auto style = element_->get_style();
            style.shadow_radius = 8.0f;
            style.shadow_offset = {3.0f, 3.0f};
            style.shadow_color = rgba(0x000000, 0.4f);
            element_->set_style(style);
            return derived();
        }

        // Radius
        Derived& rounded(float radius) {
            auto style = element_->get_style();
            style.corner_radius = radius;
            element_->set_style(style);
            return derived();
        }

        Derived& rounded_sm() {
            return rounded(4.0f);
        }

        Derived& rounded_md() {
            return rounded(8.0f);
        }

        Derived& rounded_lg() {
            return rounded(16.0f);
        }

        Derived& circle() {
            return rounded(1000.0f); // Very large value to ensure circular shape
        }

        // Event handlers
        Derived& on_click(const std::function<void()>& handler) {
            // Implementation would connect to the element's event system
            return derived();
        }
    };

    // Builder for div/container elements
    class DivBuilder : public ElementBuilder<DivBuilder, FlexBox> {
    public:
        explicit DivBuilder(std::shared_ptr<FlexBox> element = std::make_shared<FlexBox>())
            : ElementBuilder(std::move(element)) {}

        // Basic flex properties
        DivBuilder& flex() {
            // Base flex behavior is already enabled in FlexBox
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

        DivBuilder& justify_start() {
            element_->with_justify_content(FlexAlign::Start);
            return *this;
        }

        DivBuilder& justify_end() {
            element_->with_justify_content(FlexAlign::End);
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

        DivBuilder& items_stretch() {
            element_->with_align_items(FlexAlign::Stretch);
            return *this;
        }

        // Spacing methods
        DivBuilder& gap(float space) {
            element_->with_gap(space);
            return *this;
        }

        DivBuilder& gap_1() { return gap(4); }
        DivBuilder& gap_2() { return gap(8); }
        DivBuilder& gap_3() { return gap(12); }
        DivBuilder& gap_4() { return gap(16); }
        DivBuilder& gap_5() { return gap(20); }

        // Size helpers
        DivBuilder& size_4() { return size(16, 16); }
        DivBuilder& size_8() { return size(32, 32); }
        DivBuilder& size_12() { return size(48, 48); }
        DivBuilder& size_16() { return size(64, 64); }
        DivBuilder& size_20() { return size(80, 80); }
        DivBuilder& size_24() { return size(96, 96); }

        // Add children
        DivBuilder& child(const std::shared_ptr<Element>& child) {
            element_->add_child(child);
            return *this;
        }

        DivBuilder& child(const std::string& text) {
            element_->add_child(std::make_shared<Text>(text));
            return *this;
        }

        template<typename... Children>
        DivBuilder& children(Children... children) {
            (element_->add_child(children), ...);
            return *this;
        }
    };

    // Builder for text elements
    class TextBuilder : public ElementBuilder<TextBuilder, Text> {
    public:
        explicit TextBuilder(const std::string& text)
            : ElementBuilder(std::make_shared<Text>(text)) {}
    };

    // Builder for button elements
    class ButtonBuilder : public ElementBuilder<ButtonBuilder, Button> {
    public:
        explicit ButtonBuilder(const std::string& label)
            : ElementBuilder(std::make_shared<Button>(label)) {}

        ButtonBuilder& on_click(const std::function<void()>& handler) {
            element_->on_click(std::move(handler));
            return *this;
        }
    };

    // Factory functions for creating builders
    inline DivBuilder div() {
        return DivBuilder{};
    }

    inline TextBuilder text(const std::string& content) {
        return TextBuilder(content);
    }

    inline ButtonBuilder button(const std::string& label) {
        return ButtonBuilder(label);
    }
}