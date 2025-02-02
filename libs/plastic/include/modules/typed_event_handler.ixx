//
// Created by ajost1 on 2/2/2025.
//
module;
#include <variant>
#include <functional>
export module plastic.typed_event_handler;

import plastic.events;
import plastic.event_base;

export namespace plastic
{
    template<typename T>
    struct TypedEventHandler : EventHandlerBase {
    private:
        std::function<void(const T&)> handler;
    public:
        explicit TypedEventHandler(std::function<void(const T&)> handler) : handler(std::move(handler)) {}
        void call(const events::Event& event) override {
            if (auto* e = std::get_if<T>(&event)){
                handler(*e);
            }
        }

        virtual void handle(const T& event) = 0;
    };

}
