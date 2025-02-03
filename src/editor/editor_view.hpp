//
// Created by ajost1 on 2/2/2025.
//

#ifndef EDITOR_VIEW_HPP
#define EDITOR_VIEW_HPP

#include <algorithm>
#include "editor_state.hpp"
#include "line_numbers.hpp"
#include "text_view.hpp"
import plastic;
import plastic.stateful_view;
import plastic.context;
import plastic.layout_container;
import plastic.horizontal_layout;

namespace kup
{
    struct EditorView : public plastic::StatefulView<EditorState> {
    private:
        Font font;
        float font_size;
        float line_spacing;
    public:
        EditorView(EditorState initial_state, const Font& font, float font_size, float line_spacing)
            : StatefulView(std::move(initial_state)), font(font), font_size(font_size), line_spacing(line_spacing) {}

        EditorView(const Font& font, float font_size, float line_spacing)
            : StatefulView(EditorState{}), font(font), font_size(font_size), line_spacing(line_spacing) {
            state.buffer = std::make_shared<Buffer>();
        }

        std::shared_ptr<plastic::Element> render(plastic::Context* cx ) const override {
            // Create the Container with horizontal layout
            auto container = std::make_shared<plastic::LayoutContainer>(
                std::make_unique<plastic::HorizontalLayout>()
                );

            // Create and confgiure the line numbers
            auto line_numbers = std::make_shared<LineNumberView>(
                state.buffer,
                font,
                font_size,
                line_spacing
            );
            auto line_numb_style = create_line_number_style();
            line_numbers->set_style(line_numb_style);

            // Configure the text view
            auto text_view = std::make_shared<TextView>(
                state.buffer,
                font,
                font_size,
                line_spacing
            );

            auto text_style = create_text_view_style();
            text_view->set_style(text_style);

            // Add views to the container
            container->add_child(line_numbers->render(cx));
            container->add_child(text_view->render(cx));

            return container;

        }

        void handle_event(plastic::events::Event& event, plastic::Context* cx) override {
            std::visit([this](const auto& e) {handle_event_impl(e);}, event);
        }

        static plastic::style::Style create_line_number_style() {
            plastic::style::Style style;
            style.background_color_normal.emplace(plastic::Color::rgb(30,30,30));
            style.text_color_normal.emplace(plastic::Color::rgb(128,128,128));

            // Set margin and padding
            style.margin = plastic::Edge<float>{0, 2, 0, 2};
            style.padding = plastic::Edge<float>{2, 0, 2, 0};

            // Set the preferred size (fixed width)
            style.preferred_size = plastic::Size<float>{50, 0};

            // Set layout properties
            auto layout_props = style.layout_properties;
            layout_props.fill_height = true;
            layout_props.flex_shrink = 0;

            return style;
        }

        static plastic::style::Style create_text_view_style() {
            plastic::style::Style style;
            style.background_color_normal.emplace(plastic::Color::rgb(30,30,30));
            style.text_color_normal.emplace(plastic::Color::rgb(128,128,128));

            // Set margin and padding
            style.margin = plastic::Edge<float>{0, 2, 0, 2};
            style.padding = plastic::Edge<float>{2, 0, 2, 0};

            // Set layout properties
            auto layout_props = style.layout_properties;
            layout_props.fill_height = true;
            layout_props.flex_grow = 1;

            return style;
        }
    };

};


#endif //EDITOR_VIEW_HPP
