//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <memory>
#include <vector>
export module plastic.element_pool;

export namespace plastic
{

    /// @brief A simple object pool for managing reusable elements.
    /// @tparam T The type of elements to be pooled.
    template<typename T>
    class ElementPool {
        std::vector<std::unique_ptr<T>> free_elements_;

        /// @brief Private constructor to prevent instantiation.
        /// This class should be used as a singleton or through a factory method.
        std::shared_ptr<T> acquire() {
            if (free_elements_.empty()) {
                return std::make_shared<T>();
            } else {
                auto element = std::move(free_elements_.back());
                free_elements_.pop_back();
                return element;
            }
        }

        /// @brief Reset the element to its default state
        /// @param element The element to reset
        void release(T* element) {
            element->reset();
            free_elements_.push_back(std::unique_ptr<T>(element));
        }
    };

}
