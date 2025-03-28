//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <unordered_map>
#include <functional>
#if defined(_WIN32)
#include <memory>
#endif
export module plastic.component_registry;

import plastic.element;

export namespace plastic
{
    class ComponentRegistry {
    private:
        std::unordered_map<std::string, std::function<std::shared_ptr<Element>()>> factories;
    public:
        void register_component(const std::string& name, std::function<std::shared_ptr<Element>()> factory) {
            factories[name] = std::move(factory);
        }

        std::shared_ptr<Element> create(const std::string& name) {
            if (const auto it = factories.find(name); it != factories.end()) {
                return it->second();
            }
            return nullptr;
        }
    };
}
