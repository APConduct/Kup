//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <vector>
#if defined(_WIN32)
#include <algorithm>
#include <memory>
#endif
export module plastic.object_pool;

export namespace plastic
{
    template <typename T>
    class ObjectPool {
        std::vector<std::unique_ptr<T>> free_objects;
        std::vector<std::unique_ptr<T>> used_objects;
    public:
        std::shared_ptr<T> acquire() {
            if (free_objects.empty()) {
                free_objects.push_back(std::make_unique<T>());
            }
            auto obj = std::move(free_objects.back());
            free_objects.pop_back();
            used_objects.push_back(std::move(obj));
            return std::shared_ptr<T>(used_objects.back().get(), [this](T* ptr) {
                this->release(ptr);
            });
        }

        void release(T* obj) {
            auto it = std::find_if(used_objects.begin(), used_objects.end(),
                [obj](const auto& p) { return p.get() == obj; });
            if (it != used_objects.end()) {
                free_objects.push_back(std::move(*it));
                used_objects.erase(it);
            }
        }
    };
}


