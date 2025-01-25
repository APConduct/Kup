//
// Created by ajost1 on 1/24/2025.
//

#ifndef PANEL_HPP
#define PANEL_HPP

#include "component.hpp"
#include "plastic/context.hpp"
#include "plastic/rect.hpp"
#include <memory>
#include <string>
#include <utility>
#include <vector>

namespace plastic {

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
            Rect header_bounds(
                bounds.x,
                bounds.y,
                bounds.width,
                header_height
            );
            // TODO - FINISH THIS
        }
    };

}

#endif //PANEL_HPP
