//
// Created by ajost1 on 12/29/2024.
//


#ifndef PLASTIC_MODEL_HPP
#define PLASTIC_MODEL_HPP

#include <functional>

#include "entity.hpp"

template <typename T> struct WeakModel;

template <typename T>
struct Model : Entity, public std::enable_shared_from_this<Model<T>> {
    using EntityId = int;
    Model(EntityId id) : id_(id), data_(std::make_shared<T>()) {}

    EntityId entity_id() const override {
        return id_;
    }

    std::shared_ptr<Entity> downgrade() const override {
        return std::make_shared<WeakModel<T>>(std::weak_ptr<Model<T>>(this->shared_from_this()));
    }

    std::shared_ptr<Entity> upgrade() const override {
        return this->shared_from_this();
    };

    std::shared_ptr<T> read() const {
        return data_;
    }

    void update(const std::function<void(T&)>& updater) {
        updater(*data_);
    }

private:
    EntityId id_;
    std::shared_ptr<T> data_;
};

template <typename T>
struct WeakModel : Entity {
    WeakModel(const std::weak_ptr<Model<T>>& model) : model_(model) {}

    EntityId entity_id() const override {
        auto model = model_.lock();
        if (model) {
            return model->entity_id();
        }
        return -1;
    }

    std::shared_ptr<Entity> downgrade() const override {
        return std::make_shared<WeakModel<T>>(model_);
    }

    std::shared_ptr<Entity> upgrade() const override {
        return model_.lock();
    }

private:
    std::weak_ptr<Model<T>> model_;


};


#endif //PLASTIC_MODEL_HPP
