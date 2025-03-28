//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <memory>
#include <string>
#include <unordered_map>
#include <functional>
export module plastic.resource_manager;
import plastic.font;

export namespace plastic
{
    class ResourceManager {
        std::unordered_map<std::string, std::weak_ptr<Font>> fonts_;
        std::unordered_map<std::string, std::weak_ptr<Texture>> textures_;

        template<typename T>
        std::shared_ptr<T> get_or_load(const std::string& path,
                                      std::unordered_map<std::string, std::weak_ptr<T>>& cache,
                                      std::function<std::shared_ptr<T>()> loader) {
            if (auto resource = cache[path].lock()) {
                return resource;
            }

            auto new_resource = loader();
            cache[path] = new_resource;
            return new_resource;
        }
    };

}