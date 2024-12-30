//
// Created by ajost1 on 12/30/2024.
//

#ifndef PLASTIC_ENTITY_HPP
#define PLASTIC_ENTITY_HPP
#include <memory>

using EntityId = int;
struct Entity {

    virtual ~Entity() = default;

    virtual EntityId entity_id() const = 0;
    virtual std::shared_ptr<Entity> downgrade() const = 0;
    virtual std::shared_ptr<Entity> upgrade() const = 0;
};

using EntityPtr = std::shared_ptr<Entity>;
using WeakEntityPtr = std::weak_ptr<Entity>;

#endif //PLASTIC_ENTITY_HPP
