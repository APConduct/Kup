//
// Created by ajost1 on 1/29/2025.
//

module;

#include <algorithm>
#include <functional>
#include <vector>

export module plastic.model;

export namespace plastic
{
    template <typename T>
    struct Model {
    private:
        T data;


        std::vector<std::function<void(const T&)>> observers;
    public:

        void update(std::function<void(T&)> updater) {
            updater(data);
            is_dirty = true;
            for (const auto& observer : observers) {
                observer(data);
            }
        }

        [[nodiscard]] const T& get() const {
            return data;
        }

        void observe(std::function<void(const T&)> observer) {
            observers.push_back(observer);
        }


        bool is_dirty;
        Model() : data(), is_dirty(false) {}
        explicit Model(const T& data) : data(data), is_dirty(false) {}
        explicit Model(T&& data) : data(std::move(data)), is_dirty(false) {}

        void set(const T& data) {
            this->data = data;
            is_dirty = true;
        }

        void set(T&& data) {
            this->data = std::move(data);
            is_dirty = true;
        }

        void clear() {
            data = T();
            is_dirty = true;
        }

        void mark_dirty() {
            is_dirty = true;
        }

        void mark_clean() {
            is_dirty = false;
        }

        [[nodiscard]] bool dirty() const {
            return is_dirty;
        }
    };
};


