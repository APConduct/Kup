//
// Created by ajost1 on 1/16/2025.
//

#ifndef CONTAINER_HPP
#define CONTAINER_HPP
#include <memory>
#include <vector>

#include "plastic.hpp"
#include "Rect.hpp"

namespace plastic
{
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

        Rect measure(Rect& constraints) const;

    };
}

#endif //CONTAINER_HPP
