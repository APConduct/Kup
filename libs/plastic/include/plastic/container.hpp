//
// Created by ajost1 on 1/16/2025.
//

#ifndef CONTAINER_HPP
#define CONTAINER_HPP
#include <memory>
#include <vector>

#include "layout.hpp"
#include "plastic.hpp"

namespace plastic
{
    struct Layout;

    struct Container {
    protected:
        std::vector<std::shared_ptr<Component>> children;
        std::shared_ptr<Layout> layout;
    public:
        void add_child(const std::shared_ptr<Component>& child) {
            children.push_back(child);
        }

        void set_layout(const std::shared_ptr<Layout>& layout) {
            this->layout = layout;
        }

        void apply_layout() {
            if (layout) {
                layout->arrange(*this);
            }
        };

        Rect measure(const Rect& constraints) {
            if (layout) {
                return layout->measure(*this);
            }
            return Rect{0,0,0,0};
        }

        void measure();

    };
}

#endif //CONTAINER_HPP
