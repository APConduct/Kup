//
// Created by ajost1 on 1/24/2025.
//

#ifndef PANEL_HPP
#define PANEL_HPP

#include "component.hpp"
#include "plastic//prototype/context.hpp"
#include "../events/event_system.hpp"
#include "point.hpp"
#include "rect.hpp"
#include <memory>
#include <raylib.h>
#include <string>
#include <utility>
#include <vector>

namespace plastic::proto {

    class Panel : public Component {
    private:
        std::string title;
        bool collapsed{false};
        float header_height{25.0f};
        std::vector<std::shared_ptr<Component>> children;

    public:
        Panel(const std::shared_ptr<Context>& ctx, std::string title)
            : Component(ctx), title(std::move(title)) {
                min_size.height = header_height * 2;
                min_size.width = MeasureTextEx(
                    ctx->get_style().font,
                    this->title.c_str(),
                    static_cast<float>(ctx->get_style().font_size),
                    0
                ).x + 40;
        }

        Rect measure(const Rect& constraints) override {
            if (collapsed) {
                return Rect(
                    constraints.x,
                    constraints.y,
                    constraints.width,
                    header_height
                );
            }

            // Measure the children and calculate the total size
            float total_height = header_height;
            float max_width = min_size.width;

            for (const auto& child : children) {
                if (child->is_visible()) {
                    auto child_size = child->measure(constraints);
                    total_height += child_size.height;
                    max_width = std::max(max_width, child_size.width);
                }
            }

            return Rect(
                constraints.x,
                constraints.y,
                std::clamp(max_width, min_size.width, constraints.width),
                std::clamp(total_height, min_size.height, constraints.height)
            );
        }

        void layout(const Rect& bounds) override {
            Component::layout(bounds);

            if (collapsed) {
                return;
            }

            float y_offset = bounds.y + header_height;

            for (const auto& child : children) {
                if (child->is_visible()) {
                    Rect child_constrainst(
                        bounds.x,
                        y_offset,
                        bounds.width,
                        bounds.height -( y_offset - bounds.y)
                    );
                    auto child_size = child->measure(child_constrainst);
                    child->layout(Rect(
                        bounds.x,
                        y_offset,
                        bounds.width,
                        bounds.height
                    ));

                    y_offset += child_size.height;
                }
            }
        }

        void render() override {
            if (!is_visible()) return;

            auto& style = ctx->get_style();
            auto bounds = get_bounds();

            // Draw the panel background
            bounds.fill(style.background_color);

            // Draw the panel header
            const Rect header_bounds(
                bounds.x,
                bounds.y,
                bounds.width,
                header_height
            );
            header_bounds.fill(style.header_color);

            // Draw title
            DrawTextEx(
                style.font,
                title.c_str(),
                plastic::proto::Point(
                    header_bounds.x + 5,
                    header_bounds.y + header_height / 2 - static_cast<float>(style.font_size) / 2
                ).to_raylib(),
                static_cast<float>(style.font_size),
                0,
                style.text_color
            );

            // Draw collapse/expand button
            Rect button_bounds(
                bounds.right() - 20,
                bounds.y + 5,
                15,
                15
            );

            button_bounds.fill(style.button_color);
            DrawTextEx(
                style.font,
                collapsed ? "+" : "-",
                Point<float>(
                    button_bounds.x + 4,
                    button_bounds.y
                ).to_raylib(),
                 static_cast<float>(style.font_size), 0, style.text_color
            );

            // Draw children if not collapsed
            if (!collapsed) {
                for (const auto& child : children) {
                    if (child->is_visible()) child->render();
                }

            }

        }

        void process_event(const events::MouseButtonEvent& e) override {
            // Check for header click to toggle collapse
            if (e.pressed && e.button == MOUSE_BUTTON_LEFT) {
                Rect header_bounds(
                    get_bounds().x,
                    get_bounds().y,
                    get_bounds().width,
                    header_height
                );

                if (header_bounds.contains(Point<float>(e.position).to_raylib())) {
                    collapsed = !collapsed;
                    layout(ctx->get_bounds());
                    return;
                }
            }

            // Handle regular resize events
            Component::process_event(e);
        }

        void add_child(std::shared_ptr<Component> child) {
            children.push_back(std::move(child));
            layout(ctx->get_bounds());
        }

    };

}

#endif //PANEL_HPP
