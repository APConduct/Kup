//
// Created by ajost1 on 1/16/2025.
//

#ifndef CONTAINER_HPP
#define CONTAINER_HPP
#include <memory>
#include <utility>
#include <vector>

#include "plastic.hpp"
#include "Rect.hpp"
#include "plastic/element.hpp"
#include "plastic/layout.hpp"

namespace plastic
{
    struct Container : Element {
    protected:
        std::vector<std::shared_ptr<Element>> children;
        std::shared_ptr<Layout> lay;
    public:

        explicit Container(std::shared_ptr<Context> ctx) : Element(std::move(ctx)) {}

        void add_child(const std::shared_ptr<Element> child) {
            children.push_back(std::move(child));
            invalidate_layout();
        }

        void add_child(const std::shared_ptr<Element>& child) {
            children.push_back(child);
            invalidate_layout();
        }

        void remove_child(const std::shared_ptr<Element>& child) {
            auto it = std::find(children.begin(), children.end(), child);
            if (it != children.end()) {
                children.erase(it);
                invalidate_layout();
            }
        }

        void set_layout(const std::shared_ptr<Layout>& layout) {
            this->lay = layout;
            invalidate_layout();
        }

        void set_layout(const std::shared_ptr<Layout> layout) {
            this->lay = std::move(layout);
            invalidate_layout();
        }

        void clear_children() {
            children.clear();
            invalidate_layout();
        }


        Rect measure(const Rect& constraints) override {
            if (!lay) return constraints;

            Size available_size{constraints.width, constraints.height};
            Size content_size = lay->measure(children, available_size);

            // Apply container's own constraints
            const auto& props = get_layout_properties();
            return Rect(
                constraints.x,
                constraints.y,
                props.constraints.constrain(content_size).width,
                props.constraints.constrain(content_size).height
            );
        }

        void layout(Rect& bounds) override {
            if (lay) {
                lay->arrange(bounds, children);
            }
        }

        void render() override {
            // Render container background if needed
            const auto& style = ctx->get_style();
            const auto bounds = get_bounds();

            // Maybe alter for rounded corners or different states
            bounds.fill(style.background_color);

            // Render children
            for (const auto& child : children) {
                if (child->is_visible()) {
                    child->render();
                }
            }

            //Render border if needed
            if (style.border_width > 0) {
                bounds.draw_lines(style.border_width, style.border_color);
            }
        }

    protected:
        bool needs_layout{true};
        std::weak_ptr<Container> weak_parent;

        void invalidate_layout() {
            needs_layout = true;
            // Propogate to parent if needed
            if (auto parent = weak_parent.lock()) {
                parent->invalidate_layout();
            }
        }

    };
}

#endif //CONTAINER_HPP
