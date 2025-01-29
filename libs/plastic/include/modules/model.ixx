//
// Created by ajost1 on 1/29/2025.
//

module;

#include <algorithm>

export module plastic.model;

export namespace plastic
{
    template <typename T>
    struct Model {
        T data;





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


