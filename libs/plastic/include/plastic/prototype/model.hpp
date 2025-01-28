//
// Created by ajost1 on 1/25/2025.
//

#ifndef PLASTIC_MODEL_HPP
#define PLASTIC_MODEL_HPP
#include <functional>
#include <memory>

namespace plastic::proto
{

    template <typename T>
    struct Model {
        using Observer = std::function<void(const T&)>;

    protected:
        std::shared_ptr<T> state;
        mutable std::mutex state_mutex;
        std::vector<Observer> observers;
        mutable std::mutex observer_mutex;

        void notify() const {
            std::lock_guard lock(observer_mutex);
            for (const auto& observer : observers) {
                observer(*state);
            }
        }

    public:

        // Constructor
        explicit Model(const T& initial_state) : state(initial_state) {}
        explicit Model(const T initial_state) : state(std::make_shared<T>(std::move(initial_state))) {}

        T get() const {
            std::lock_guard lock(state_mutex);
            return *state;
        }

        // Update the state and notify observers
        void update(std::function<void(T&)> updater) {
            {
                std::lock_guard lock(state_mutex);
                updater(*state);
            }
            notify();
        }

        void subscribe(Observer observer) {
            std::lock_guard lock(observer_mutex);
            observers.push_back(std::move(observer));
        }

    };

}

#endif //PLASTIC_MODEL_HPP
