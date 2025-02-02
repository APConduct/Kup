//
// Created by ajost1 on 2/2/2025.
//

module;
#include <cassert>
#include <cstdint>
#include <functional>
#include <memory>
#include <typeindex>

export module plastic.entity_map;
import plastic.component;

export namespace plastic
{
    using Generation = uint32_t;

    struct EntityId {
    private:
        uint32_t index_;
        Generation generation_;

    public:
        EntityId(uint32_t index, Generation generation) : index_(index), generation_(generation) {}

        [[nodiscard]] uint32_t index() const {
            return index_;
        }

        [[nodiscard]] Generation generation() const {
            return generation_;
        }

        [[nodiscard]] bool operator==(const EntityId& other) const {
            return index_ == other.index_ && generation_ == other.generation_;
        }

        [[nodiscard]] bool operator!=(const EntityId& other) const {
            return !(*this == other);
        }

    };

    class World {
        struct EntitySlot {
            Generation generation;
            bool is_alive;

            std::unordered_map<std::type_index, std::shared_ptr<Component>> components;

            EntitySlot() : generation(0), is_alive(false) {}

        };

        std::vector<EntitySlot> entities_;
        std::vector<uint32_t> free_indices_;

    public:
        World() = default;

        EntityId create_entity() {
            uint32_t index;
            if (!free_indices_.empty()) {
                index = free_indices_.back();
                free_indices_.pop_back();
            } else {
                index = static_cast<uint32_t>(entities_.size());
                entities_.emplace_back();
            }
            auto& slot = entities_[index];
            slot.is_alive = true;
            return {index, slot.generation};
        }

        [[nodiscard]] bool is_valid(EntityId id) const {
            return id.index() < entities_.size() && entities_[id.index()].generation == id.generation() && entities_[id.index()].is_alive;
        }

        void destroy_entity(EntityId id) {
            if (!is_valid(id)) {
                return;
            }
            auto& slot = entities_[id.index()];
            slot.is_alive = false;
            slot.components.clear();
            slot.generation++;

            free_indices_.push_back(id.index());
        }

        template<typename T, typename... Args>
        T& add_component(EntityId id, Args&&... args) {
            assert(is_valid(id));
            auto component = std::make_shared<T>(std::forward<Args>(args)...);
            auto& slot = entities_[id.index()];
            auto[it, success] = slot.components.emplace(
                std::type_index(typeid(T)),
                component
            );
            return *static_cast<T*>(it->second.get());
        }

        template<typename T>
        T* get_component(EntityId id) {
            if (!is_valid(id)) {
                return nullptr;
            }
            auto& slot = entities_[id.index()];
            auto it = slot.components.find(std::type_index(typeid(T)));
            if (it == slot.components.end()) {
                return nullptr;
            }
            return static_cast<T*>(it->second.get());
        }

        template<typename T>
        void remove_component(EntityId id) {
            if (!is_valid(id)) {
                return;
            }
            entities_[id.index()].components.erase(std::type_index(typeid(T)));
        }

    };
}
export template<>
struct std::hash<plastic::EntityId> {
    std::size_t operator()(const plastic::EntityId& id) const noexcept {
        return std::hash<uint32_t>()(id.index()) ^ std::hash<plastic::Generation>()(id.generation());
    }
};
