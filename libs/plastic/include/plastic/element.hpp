//
// Created by ajost1 on 1/23/2025.
//

#ifndef ELEMENT_HPP
#define ELEMENT_HPP
#include <memory>

#include "context.hpp"

namespace plastic
{
    struct Element {
        virtual ~Element() = default;
        virtual Rect measure(const Rect& constraints) = 0;
        virtual void layout(const Rect& bounds) = 0;

        std::shared_ptr<Context> ctx;

        explicit Element(std::shared_ptr<Context> ctx) : ctx(std::move(ctx)) {}

        // Utility methods
        [[nodiscard]] bool is_visible() const {
            return ctx->get_visible();
        }

        [[nodiscard]] Rect get_bounds() const {
            return ctx ? ctx->get_bounds(): Rect();
        }
    };

}

#endif //ELEMENT_HPP
