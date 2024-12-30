//
// Created by ajost1 on 12/29/2024.
//

#ifndef VIEW_HPP
#define VIEW_HPP

#include "Model.hpp"
#include "entity.hpp"

template <typename T>
struct View {
    using EntityId = int;

    explicit View(EntityId id) : model_(std::make_shared<Model<T>>(id)) {}

    EntityId entity_id() const {
        return model_->entity_id();
    }

    void update(const std::function<void(T&)>& updater) {
        model_->update(updater);
    }

    std::shared_ptr<T> read() const {
        return model_->read();
    }

private:
    std::shared_ptr<Model<T>> model_;
};

#endif //VIEW_HPP
