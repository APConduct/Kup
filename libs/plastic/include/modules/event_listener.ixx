//
// Created by ajost1 on 2/2/2025.
//
module;
#include <type_traits>
export module plastic.event_listener;
import plastic.event_dispatcher;
import plastic.events;


export namespace plastic
{
    // Event listener interface with variadic templates
    template<typename... Events>
    class EventListener {
    public:
        virtual ~EventListener() = default;

    protected:
        EventDispatcher& dispatcher;

        explicit EventListener(EventDispatcher& dispatcher) : dispatcher(dispatcher) {
            (subscribe<Events>(), ...);
        }

        template<typename T>
        void subscribe() {
            dispatcher.subscribe<T>([this](const T& event) {
                this->handle(event);
            });
        }

        template<typename T>
        void handle(const T& event) {
            if constexpr (std::disjunction_v<std::is_same<T, Events>...>) {
                handle_impl(event);
            }
        }

        virtual void handle_impl(const events::MouseMoveEvent&) = 0;
        virtual void handle_impl(const events::MouseButtonEvent&) = 0;
        virtual void handle_impl(const events::MouseScrollEvent&) = 0;
        virtual void handle_impl(const events::MouseDragEvent&) = 0;
        virtual void handle_impl(const events::KeyPressEvent&) = 0;
        virtual void handle_impl(const events::ResizeEvent&) = 0;
        virtual void handle_impl(const events::FocusEvent&) = 0;
    };
}
