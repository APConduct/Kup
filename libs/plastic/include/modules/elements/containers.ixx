//
// Created by Aidan Jost on 3/8/25.
//
/// @file containers.ixx
/// @brief Container elements for the Plastic UI framework

module;
#include <memory>
#include <vector>
#include <raylib.h>
#include <iostream>
export module plastic.elements.containers;

import plastic.element;
import plastic.context;
import plastic.rect;
import plastic.color;
import plastic.size;
import plastic.layout_container;
import plastic.vertical_layout;
import plastic.horizontal_layout;
import plastic.flex_layout;
import plastic.style;

import plastic.layout_properties;

export namespace plastic
{
    // Base container with common functionality
    class Container : public Element {
    protected:
        Color background_color_{Color::transparent()};
        float corner_radius_{0};
        float border_width_{0};
        Color border_color_{Color::transparent()};
        bool clip_children_{false};
        Size<float> preferred_size_{0, 0};

    public:
        [[nodiscard]] Size<float> get_preferred_size() const override {
            return preferred_size_;
        }

        static void set_preferred_size(Size<float> preferred_size) {}
        Container() = default;

        void paint(Context* cx) const override {
            const auto& bounds = get_bounds();

            // Draw background
            if (background_color_.a > 0) {
                if (corner_radius_ > 0) {
                    DrawRectangleRounded(bounds.to_rl(), corner_radius_, 10, background_color_.rl());
                } else {
                    DrawRectangleRec(bounds.to_rl(), background_color_.rl());
                }
            }

            // Draw border
            if (border_width_ > 0 && border_color_.a > 0) {
                if (corner_radius_ > 0) {
                    DrawRectangleRoundedLines(bounds.to_rl(), corner_radius_, 10, border_color_.rl());
                } else {
                    DrawRectangleLinesEx(bounds.to_rl(), border_width_, border_color_.rl());
                }
            }

            // Apply clipping if needed
            if (clip_children_) {
                BeginScissorMode(
                    static_cast<int>(bounds.x()),
                    static_cast<int>(bounds.y()),
                    static_cast<int>(bounds.width()),
                    static_cast<int>(bounds.height())
                );
            }

            // Paint all children
            for (const auto& child : get_children()) {
                child->paint(cx);
            }

            if (clip_children_) {
                EndScissorMode();
            }
        }

        void layout(Context* cx) override {
            // Layout is handled by derived classes
        }

        Container& with_background(const Color& color) {
            background_color_ = color;
            invalidate();
            return *this;
        }

        Container& with_corner_radius(float radius) {
            corner_radius_ = radius;
            invalidate();
            return *this;
        }

        Container& with_border(float width, const Color& color) {
            border_width_ = width;
            border_color_ = color;
            invalidate();
            return *this;
        }

        Container& with_clip(bool clip) {
            clip_children_ = clip;
            invalidate();
            return *this;
        }
    };

    // Vertical container
    class VStack : public LayoutContainer {
        std::shared_ptr<style::Style> style_;
    public:
        VStack() : LayoutContainer(std::make_unique<VerticalLayout>()) {}

        VStack& with_style(const style::Style& style) {
            style_ = std::make_shared<style::Style>(style);
            set_style(*style_);
            return *this;
        }


        template<typename... Children>
        static std::shared_ptr<VStack> create(Children... children) {
            auto container = std::make_shared<VStack>();
            (container->add_child(children), ...);
            return container;
        }

        VStack& with_spacing(float spacing) {
            LayoutProperties props = get_layout_properties();
            props.spacing = spacing;
            set_layout_properties(props);
            return *this;
        }
    };

    // Horizontal container
    class HStack : public LayoutContainer {
    public:
        HStack() : LayoutContainer(std::make_unique<HorizontalLayout>()) {}

        template<typename... Children>
        static std::shared_ptr<HStack> create(Children... children) {
            auto container = std::make_shared<HStack>();
            (container->add_child(children), ...);
            return container;
        }

        HStack& with_spacing(float spacing) {
            LayoutProperties props = get_layout_properties();
            props.spacing = spacing;
            set_layout_properties(props);
            return *this;
        }

    };

    // More flexible layout using FlexLayout
    class FlexBox : public LayoutContainer {
        Size<float> preferred_size_{0, 0};
    public:
        FlexBox() : LayoutContainer(std::make_unique<FlexLayout>()) {
            auto layout = dynamic_cast<FlexLayout*>(layout_.get());
            if (layout) {
                FlexLayoutProperties props;
                props.with_align_items(FlexAlign::Center)
                    .with_justify_content(FlexAlign::Center)
                    .with_gap(8)
                    .with_padding(8);
                layout->set_props(props);

                std::cout << "FlexBox created with align_items: Center, justify_content: Center\n";
            }

            // Set padding and margin through layout properties
            set_layout_properties(LayoutProperties()
                .with_padding(8)
                .with_margin(8));
        }

        template<typename... Children>
        static std::shared_ptr<FlexBox> create(Children... children) {
            auto container = std::make_shared<FlexBox>();
            (container->add_child(children), ...);
            return container;
        }

        FlexBox& with_direction(FlexDirection direction) {
            auto layout = dynamic_cast<FlexLayout*>(layout_.get());
            if (layout) {
                FlexLayoutProperties props = layout->props();
                props.with_direction(direction);
                layout->set_props(props);
                invalidate();
            }
            return *this;
        }

        FlexBox& with_align_items(FlexAlign align) {
            auto layout = dynamic_cast<FlexLayout*>(layout_.get());
            if (layout) {
                FlexLayoutProperties props = layout->props();
                props.with_align_items(align);
                layout->set_props(props);
                invalidate();
            }
            return *this;
        }

        FlexBox& with_justify_content(FlexAlign align) {
            auto layout = dynamic_cast<FlexLayout*>(layout_.get());
            if (layout) {
                FlexLayoutProperties props = layout->props();
                props.with_justify_content(align);
                layout->set_props(props);
                invalidate();
            }
            return *this;
        }

        FlexBox& with_gap(float gap) {
            auto layout = dynamic_cast<FlexLayout*>(layout_.get());
            if (layout) {
                FlexLayoutProperties props = layout->props();
                props.with_gap(gap);
                layout->set_props(props);
                invalidate();
            }
            return *this;
        }

        void set_preferred_size(float width, float height) {
            preferred_size_.width(width);
            preferred_size_.height(height);
        }

        [[nodiscard]] Size<float> get_preferred_size() const override {
            if (auto layout = dynamic_cast<FlexLayout*>(layout_.get())) {
                return layout->measure(*this);
            }
            return preferred_size_;
        }

        void layout(Context* cx) override {
            std::cout << "FlexBox layout - bounds: "
              << bounds.width() << "x" << bounds.height() << "\n";

            // Call base layout implementation
            LayoutContainer::layout(cx);
        };
    };
}
