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
import plastic.event_visitor;

namespace kup
{
    struct EditorView : public plastic::StatefulView<EditorState> {
    private:
    public:


        explicit EditorView(EditorState initial_state)
            : StatefulView(std::move(initial_state)) {}



        EditorView(const Font& font, float font_size, float line_spacing)
            : StatefulView(EditorState{}) {
            state.font = font;
            state.font_size = font_size;
            state.spacing = line_spacing;
            state.buffer = std::make_shared<Buffer>();
        }

        std::shared_ptr<plastic::Element> render(plastic::Context* cx ) const override {
            // Create the Container with horizontal layout
            auto container = std::make_shared<plastic::LayoutContainer>(
                std::make_unique<plastic::HorizontalLayout>()
                );

            // Create and confgiure the line numbers
            if ( state.show_line_numbers )
            {
                auto line_numbers = TextView::create()
                   .with_buffer(state.buffer)
                   .with_font(state.font, state.font_size, state.spacing)
                   .build();
                line_numbers->set_style(create_line_number_style());
                container->add_child(line_numbers->render(cx));
            }

            auto main_text = TextView::create()
                .with_buffer(state.buffer)
                .with_font(state.font, state.font_size, state.spacing)
                .build();

            main_text->set_style(create_text_view_style());
            container->add_child(main_text->render(cx));

            //if (state.show_minimap) {
            //    auto minimap = MinimapView::create()
            //        .with_buffer(state.buffer)
            //        .with_font(state.font, state.font_size, state.spacing)
            //        .build();
            //
            //    container->add_child(minimap->render(cx));
            //}

            return container;
        }

        void handle_event(plastic::events::Event& event, plastic::Context* cx) override {
            if (std::visit(plastic::EventVisitor{}, event)) {
                return;
            }
            StatefulView::handle_event(event, cx);

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
    public:
        class Builder : public View::Builder<Builder> {
            EditorState state;
        public:
            Builder& with_font(const Font& font, float font_size, float line_spacing) {
                state.font = font;
                state.font_size = font_size;
                state.spacing = line_spacing;
                return *this;
            }

            Builder& show_line_numbers(bool show = true) {
                state.show_line_numbers = show;
                return *this;
            }

            Builder& show_minimap(bool show = true) {
                state.show_minimap = show;
                return *this;
            }

            std::shared_ptr<EditorView> build() {
                return std::make_shared<EditorView>(std::move(state));
            }
        };

        static Builder create() { return {}; }



    };

};


#endif //EDITOR_VIEW_HPP
