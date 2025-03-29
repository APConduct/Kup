//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <unordered_map>
#include <functional>
#include <string>
#include <variant>
export module plastic.event_deligation;

import plastic.event_dispatcher;
import plastic.events;

export namespace plastic
{
    class EventDelegation {
    private:
        std::unordered_map<std::string, std::function<bool(const events::Event&)>> handlers;

    public:
        template <typename E>
        void register_handler(const std::string& id, std::function<bool(const E&)> handler) {
            handlers[id] = [handler](const events::Event& event) -> bool {
                if (auto* e = std::get_if<E>(&event)) {
                    return handler(*e);
                }
                return false;
            };
        }

        bool handle_event(const std::string& id, const events::Event& event) {
            auto it = handlers.find(id);
            if (it != handlers.end()) {
                return it->second(event);
            }
            return false;
        }

        void unregister_handler(const std::string& id) {
            handlers.erase(id);
        }
    };
}
