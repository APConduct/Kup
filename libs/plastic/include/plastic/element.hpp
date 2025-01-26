//
// Created by ajost1 on 1/23/2025.
//

#ifndef ELEMENT_HPP
#define ELEMENT_HPP
#include <memory>

#include "context.hpp"
#include "plastic/layout_properties.hpp"

namespace plastic::element
{

    struct Element {
        virtual ~Element() = default;
        virtual Rect measure(const Rect& constraints) = 0;
        virtual void layout(Rect& bounds) = 0;
        virtual void render() = 0;

        std::shared_ptr<Context> ctx;

        explicit Element(std::shared_ptr<Context> ctx) : ctx(std::move(ctx)) {}

        // Utility methods
        [[nodiscard]] bool is_visible() const {
            return ctx->get_visible();
        }

        [[nodiscard]] Rect get_bounds() const {
            return ctx ? ctx->get_bounds(): Rect();
        }

        virtual void set_layout_properties(const LayoutProperties& props) {
            layout_properties = props;
        }

        [[nodiscard]] const LayoutProperties& get_layout_properties() const {
            return layout_properties;
        }


    protected:
        LayoutProperties layout_properties;
    };

}

#endif //ELEMENT_HPP
