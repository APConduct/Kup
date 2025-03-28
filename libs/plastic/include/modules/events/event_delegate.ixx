//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <unordered_map>
#include <functional>
#include <string>
#include <chrono>
#include <thread>
#include <variant>
#include <memory>
#include <iostream>
#include <typeindex>
export module plastic.event_deligate;

import plastic.event_dispatcher;
import plastic.events;

export namespace plastic
{
    class EventDelegate {
        std::unordered_map<std::type_index, std::function<bool(const events::Event&)>> handlers_;

    public:
        template<typename E>
        void on(std::function<bool(const E&)> handler) {
            handlers_[std::type_index(typeid(E))] = [handler](const events::Event& e) {
                if (auto* event = std::get_if<E>(&e)) {
                    return handler(*event);
                }
                return false;
            };
        }

        bool handle(const events::Event& event) {
            auto it = handlers_.find(std::type_index(typeid(event.index())));
            if (it != handlers_.end()) {
                return it->second(event);
            }
            return false;
        }
    };
}