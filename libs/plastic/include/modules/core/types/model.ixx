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

    /// @brief A model class that holds data and notifies observers on changes
    /// @tparam T The type of the data
    /// @note This class is used to create a model that can be observed by other components
    template <typename T>
    struct Model {
    private:
        T data;

        /// @brief A list of observers that will be notified when the data changes
        std::vector<std::function<void(const T&)>> observers;
    public:

        /// @brief Update the data and notify observers
        /// @param updater The function to update the data
        void update(std::function<void(T&)> updater) {
            updater(data);
            is_dirty = true;
            for (const auto& observer : observers) {
                observer(data);
            }
        }

        /// @brief Get the current value of the data
        /// @return The current value of the data
        [[nodiscard]] const T& get() const {
            return data;
        }

        /// @brief Observe the model for changes
        void observe(std::function<void(const T&)> observer) {
            observers.push_back(observer);
        }

        /// @brief whether the model is dirty or not (i.e. has been updated)
        bool is_dirty;

        /// @brief Default constructor
        Model() : data(), is_dirty(false) {}

        /// @brief Constructor with initial data
        /// @param data The initial data
        /// @note This constructor initializes the model with the given data
        explicit Model(const T& data) : data(data), is_dirty(false) {}
        explicit Model(T&& data) : data(std::move(data)), is_dirty(false) {}

        /// @brief set the data and mark it as dirty
        void set(const T& data) {
            this->data = data;
            is_dirty = true;
        }

        /// @brief set the data and mark it as dirty
        void set(T&& data) {
            this->data = std::move(data);
            is_dirty = true;
        }

        /// @brief Clear the data and mark it as dirty
        void clear() {
            data = T();
            is_dirty = true;
        }

        /// @brief tells the model to mark itself as dirty
        void mark_dirty() {
            is_dirty = true;
        }

        /// @brief tells the model to mark itself as clean
        void mark_clean() {
            is_dirty = false;
        }

        /// @brief Check if the model is dirty
        /// @return true if the model is dirty, false otherwise
        [[nodiscard]] bool dirty() const {
            return is_dirty;
        }
    };
};


