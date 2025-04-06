//
// Created by Aidan Jost on 4/2/25.
//

module;
#include <memory>

export module plastic.layout.builders;

import plastic.element;
import plastic.layout_properties;
import plastic.flex_layout;
import plastic.edge;
import plastic.color;
import plastic.style;
import plastic.elements.containers;
import plastic.size;

export namespace plastic
{
    namespace element
    {
        // Base builder with common layout and styling properties
        template<typename Derived, typename ElementType>
        class Builder {
        protected:
            std::shared_ptr<ElementType> element_;
            LayoutProperties layout_props_;
            style::Style style_;

        public:
            Builder() = default;
            explicit Builder(std::shared_ptr<ElementType> element)
                : element_(std::move(element)) {}

            // Layout properties
            Derived& with_padding(float padding) {
                layout_props_.padding = Edge(padding);
                apply_layout_properties();
                return derived();
            }

            Derived& with_padding(const Edge<float>& padding) {
                layout_props_.padding = padding;
                apply_layout_properties();
                return derived();
            }

            Derived& with_margin(float margin) {
                layout_props_.margin = Edge(margin);
                apply_layout_properties();
                return derived();
            }

            Derived& with_margin(const Edge<float>& margin) {
                layout_props_.margin = margin;
                apply_layout_properties();
                return derived();
            }

            Derived& with_flex_grow(float grow = 1.0f) {
                layout_props_.flex_grow = grow;
                apply_layout_properties();
                return derived();
            }

            Derived& bg(const Color& color) {
                style_.background_color_normal = color;
                apply_style();
                return derived();
            }

            Derived& with_border(float width, const Color& color) {
                style_.border_width = width;
                style_.border = color;
                apply_style();
                return derived();
            }

            Derived& with_corner_radius(float radius) {
                style_.corner_radius = radius;
                apply_style();
                return derived();
            }

            // Size cons`
            Derived& with_size(float width, float height) {
                layout_props_.preferred_size = Size<float>(width, height);
                apply_layout_properties();
                return derived();
            }

            // Build method
            std::shared_ptr<ElementType> build() {
                // Final application of properties
                apply_layout_properties();
                apply_style();
                return element_;
            }

        protected:
            // Helper to access derived class
            Derived& derived() {
                return static_cast<Derived&>(*this);
            }

            void apply_layout_properties() {
                if (element_) {
                    element_->set_layout_properties(layout_props_);
                }
            }

            void apply_style() {
                if (element_) {
                    element_->set_style(style_);
                }
            }



        };
    }


    class FlexBuilder : public element::Builder<FlexBuilder, FlexBox> {

    };
    inline FlexBuilder flex() {
        return {};
    }




}
