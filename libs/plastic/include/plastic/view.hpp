//
// Created by ajost1 on 1/25/2025.
//

#ifndef PLASTIC_VIEW_HPP
#define PLASTIC_VIEW_HPP

#include <functional>
#include <memory>

#include "model.hpp"

namespace plastic
{

    template <typename T>
    struct View {
        using RenderFunction = std::function<void(const T&)>;
    protected:
        std::shared_ptr<Model<T>> model;
        RenderFunction render_fn;

        void render(const T& state) const {
            render_function(state);
        }

    public:

        // Constructor
        explicit View(std::shared_ptr<Model<T>> model, RenderFunction render_func)
            : model(std::move(model)), render_fn(std::move(render_func)) {

            this->model->subscribe([this](const T& state) {
                this->render(state);
            });
        }

        void render() const {
            render_function(model->get());
        }

    };
}

#endif //PLASTIC_VIEW_HPP
