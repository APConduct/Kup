//
// Created by ajost1 on 2/2/2025.
//
module;
#include <algorithm>
#include <typeindex>
#include <unordered_map>
#include <vector>
#include <functional>
#include <variant>
export module plastic.event_dispatcher;

import plastic.event_base;
import plastic.events;
import plastic.typed_event_handler;
import plastic.event_queue;


export namespace plastic
{
struct EventDispatcher{
    using HandlerMap = std::unordered_map<std::type_index, std::vector<std:: unique_ptr<EventHandlerBase>>>;

    enum class EventPriority {
        Low,
        Normal,
        High
    };
private:

    HandlerMap handlers;
    std::vector<std::function<void(const events::Event&)>> global_handlers;
    std::vector<std::function<bool(const events::Event&)>> filters;
    EventQueue event_queue;

    bool should_dispatch(const events::Event& event) {
        return std::ranges::all_of(filters, [&event](const auto& filter) {
            return filter(event);
        });
    }


public:
    template<typename T>
    void subscribe(std::function<void(const T&)> handler){
        handlers[std::type_index(typeid(T))].push_back(std::make_unique<TypedEventHandler<T>>(std::move(handler)));
    }

    void subscribe_global(std::function<void(const events::Event&)> handler){
        global_handlers.push_back(std::move(handler));
    }

    // Emit an event
    void emit(const events::Event& event){

        #ifdef PLASTIC_DEBUG
            EventLogger::log_event(event);
        #endif

        // Check if event passes all filters
        if (!should_dispatch(event)){
            return;
        }

        // visit the variant to get the correct type index
        std::visit([this, event]([[maybe_unused]] const auto& concrete_event) {
            auto type_index = std::type_index(typeid(concrete_event));
            auto it = handlers.find(type_index);
            if (it != handlers.end()){
                for (const auto& handler : it->second){
                    handler->call(event);
                }
            }
        }, event);

        // Call the global handlers
        for (const auto& handler : global_handlers){
            handler(event);
        }
    }

    // Queue an event for dispatching
    template<typename T>
    void queue(T&& event){
        static_assert(std::is_constructible_v<events::Event, std::decay_t<T>>, "Event type must be one of the variant alternatives");
        event_queue.push(std::forward<T>(event));
    }

    void process_events() {
        for (const auto& event : event_queue.get_events()) {
            emit(event);
        }
        event_queue.clear();
    }

    template<typename T>
    void queue_with_priority(T&& event, EventPriority priority) {
        static_assert(std::is_constructible_v<events::Event, std::decay<T>>, "Event type must be one of the variant alternatives");

        if (priority == EventPriority::High){
            event_queue.push_front(std::forward<T>(event));
        } else {
            event_queue.push(std::forward<T>(event));
        }
    }

    // Event filtering
    template<typename Predicate>
    void add_filter(std::function<bool(const events::Event&)> filter) {
        if (filter) {
            filters.push_back(std::move(filter));
        } else {
            throw std::invalid_argument("Invalid filter function");
        }
    }

    void clear_filters() {
        filters.clear();
    }

    // filter factory functions
    static std::function<bool(const events::Event&)>
    create_type_filter(std::type_index allowed_type) {
        return [allowed_type](const events::Event& event) {
            return std::visit([allowed_type]([[maybe_unused]] const auto& e) {
                return std::type_index(typeid(e)) == allowed_type;
            }, event);
        };
    }

    static std::function<bool(const events::Event&)> create_mouse_filter() {
            return [](const events::Event& event) {
                return std::visit([]<typename V>([[maybe_unused]] const V& e) {
                    using T = std::decay_t<V>;
                    return std::is_same_v<T, events::MouseMoveEvent> ||
                           std::is_same_v<T, events::MouseButtonEvent> ||
                           std::is_same_v<T, events::MouseScrollEvent> ||
                           std::is_same_v<T, events::MouseDragEvent>;
                }, event);
            };
        }

    static std::function<bool(const events::Event&)> create_keyboard_filter() {
        return [](const events::Event& event) {
            return std::visit([]<typename V>([[maybe_unused]] const V& e) {
                using T = std::decay_t<V>;
                return std::is_same_v<T, events::KeyPressEvent> ||
                       std::is_same_v<T, events::TextInputEvent>;
            }, event);
        };
    }

    template<typename E>
    void register_handler(const std::string& id, std::function<bool(const E&)> handler) {
        handlers[std::type_index(typeid(E))].push_back(std::make_unique<TypedEventHandler<E>>(std::move(handler)));
    }

    void add_filter(std::function<bool(const events::Event&)> filter) {
        filters.push_back(std::move(filter));
    }

};
}
