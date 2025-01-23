#ifndef PLASTIC_EVENT_SYSTEM_HPP
#define PLASTIC_EVENT_SYSTEM_HPP

#include "plastic/config.hpp"
#include <algorithm>
#include <cmath>
#include <cstddef>
#include <format>
#include <functional>
#include <iterator>
#include <memory>
#include <mutex>
#include <optional>
#include <string>
#include <type_traits>
#include <typeindex>
#include <unordered_map>
#include <utility>
#include <vector>
#include <variant>
#include "raylib.h"
#include "plastic/point.hpp"
#include "plastic/rect.hpp"


namespace plastic::events {



// Base event types
struct MouseMoveEvent {
    Vector2 position;
    Vector2 delta;
    double timestamp;
};

struct MouseButtonEvent {
    Vector2 position;
    MouseButton button;
    bool pressed;
    bool shift;
    bool ctrl;
    bool alt;
    double timestamp;
};

struct MouseScrollEvent {
    Vector2 position;
    Vector2 delta;
    double timestamp;
};

struct MouseDragEvent {
    Vector2 start;
    Vector2 current;
    Vector2 delta;
    MouseButton button;
    double timestamp;
    std::optional<bool> shift;
};

struct KeyPressEvent {
    KeyboardKey key;
    bool pressed;
    bool repeat;
    bool shift;
    bool ctrl;
    bool alt;
    int scancode;
    double timestamp;
};

struct TextInputEvent {
    std::string text;
    double timestamp;
};

struct ResizeEvent {
    int width;
    int height;
    double timestamp;
};

struct FocusEvent {
    bool gained;
    double timestamp;
};

// Custon event template for user defined events
template<typename T>
struct CustomEvent {
    T data;
    double timestamp;
};

using Event = std::variant<
    MouseMoveEvent,
    MouseButtonEvent,
    MouseScrollEvent,
    MouseDragEvent,
    KeyPressEvent,
    TextInputEvent,
    ResizeEvent,
    FocusEvent
    >;

// Event handler function type
// using EventHandler = std::function<void(const Event&)>;

// Base class for event handlers with type erasure
struct EventHandlerBase {
    virtual ~EventHandlerBase() = default;
    virtual void call(const Event& event) = 0;
};

// Typed event handler
template<typename T>
struct TypedEventHandler : public EventHandlerBase {
private:
    std::function<void(const T&)> handler;


public:
    explicit TypedEventHandler(std::function<void(const T&)> handler) : handler(std::move(handler)) {}

    void call(const Event& event) override {
        if (auto* e = std::get_if<T>(&event)){
            handler(*e);
        }
    }
};

struct EventQueue {
    private:
    std::vector<Event> queued_events;
    std::mutex queue_mutex;

    static bool should_compress(const MouseMoveEvent& a, const MouseMoveEvent& b) {
        return (b.timestamp - a.timestamp) < 0.016; // less than 1 frame
    }

    static void compress(MouseMoveEvent& target, const MouseMoveEvent& source) {
        target.delta.x += source.delta.x;
        target.delta.y += source.delta.y;
        target.position = source.position;
        target.timestamp = source.timestamp;
    }

    public:
    // Queue an event for dispatching
    template<typename T>
    void push(T&& event) {
        static_assert(std::is_constructible_v<Event, std::decay<T>>, "Event type must be be one of the variant alternatives");

        std::lock_guard<std::mutex> lock(queue_mutex);
        queued_events.push_back(std::forward<T>(event));
    }

    [[nodiscard]] const std::vector<Event>& get_events() const {
        return queued_events;
    }

    // Get mutable reference to the events (used by EventDispatcher)
    std::vector<Event>& get_events() {
        return queued_events;
    }

    // Cleare all queued events
    void clear() {
        std::lock_guard<std::mutex> lock(queue_mutex);
        queued_events.clear();
    }

    [[nodiscard]] bool empty() const {
        return queued_events.empty();
    }

    // Get the number of queued events
    [[nodiscard]] size_t size() const {
        return queued_events.size();
    }

    // Get the first event in the queue
    [[nodiscard]] std::optional<Event> pop() {
        std::lock_guard<std::mutex> lock(queue_mutex);
        if (queued_events.empty()){
            return std::nullopt;
        }
        auto event = queued_events.front();
        queued_events.erase(queued_events.begin());
        return event;
    }

    // Process all events with a given handler
    template<typename Handler>
    void process_all(Handler&& handler) {
        std::lock_guard<std::mutex> lock(queue_mutex);

        for (const auto& event : queued_events){
            handler(event);
        }
        queued_events.clear();
    }

    // Process and remove all events that match a given predicate
    template<typename Predicate>
    void process_if(Predicate&& predicate) {
        std::lock_guard<std::mutex> lock(queue_mutex);

        queued_events.erase(
            std::remove_if(queued_events.begin(), queued_events.end(), predicate),
            queued_events.end()
        );
    }

    // Iterate through each event (const version)
    template<typename Func>
    void for_each(Func&& func) const {
        std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(queue_mutex));

        for (const auto& event : queued_events){
            func(event);
        }
    }

    // Add event at thw front of the queue (for high priority events)
    template<typename T>
    void push_front(T&& event) {
        static_assert(std::is_constructible_v<Event, std::decay<T>>, "Event type must be one of the variant alternatives");

        std::lock_guard<std::mutex> lock(queue_mutex);
        queued_events.insert(queued_events.begin(), std::forward<T>(event));
    }

    // Merge annother event queue into this queue
    void merge(EventQueue& other) {
        std::lock_guard<std::mutex> lock(queue_mutex);
        std::lock_guard<std::mutex> other_lock(other.queue_mutex);

        queued_events.insert(
            queued_events.end(),
            std::make_move_iterator(other.queued_events.begin()),
            std::make_move_iterator(other.queued_events.end())
        );
        other.queued_events.clear();
    }

    template<typename T>
    void push_compressed(T&& event) {
        static_assert(std::is_constructible_v<Event, std::decay<T>>, "Event type must be one of the variant alternatives");

        std::lock_guard<std::mutex> lock(queue_mutex);

        // Try to compress the event with the previous event if possible
        if (!queued_events.empty()) {
            if (auto* last = std::get_if<T>(&queued_events.back())) {
                if (should_compress(*last, event)) {
                    compress(*last, event);
                }
            }
        }
        queued_events.push_back(std::forward<T>(event));
    }

};


template <typename T>
constexpr bool is_valid_entry_v = std::is_constructible_v<Event, std::decay<T>>;



// Event timestamp helper
inline double get_current_timestamp() {
    return GetTime();
}

// Event creation helper
template<typename T, typename... Args>
T create_event(Args&&... args){
    return T{std::forward<Args>(args)..., get_current_timestamp()};
}

#ifdef PLASTIC_DEBUG
    struct EventDegugInfo {
        std::string event_type;
        double timestamp;
        std::string details;
    };

    class EventLogger {
    public:
        static void log_event(const Event& event) {
            std::visit([](const auto& e) {
                EventDegugInfo info {
                    typeid(e).name(),
                    e.timestamp, get_event_details(e)
                };

                TraceLog(LOG_INFO, "Event: %s, Timestamp: %f, Details: %s",
                    info.event_type.c_str(), info.timestamp, info.details.c_str());
            }, event);
        }

    private:
        static std::string get_event_details(const MouseMoveEvent& e) {
            return std::format("Position: ({}, {}), Delta: ({}, {})", e.position.x, e.position.y, e.delta.x, e.delta.y);
        }

        static std::string get_event_details(const MouseButtonEvent& e) {
            return std::format("Button: {}, Position: ({}, {}), Pressed: {}",
                static_cast<int>(e.button), e.position.x, e.position.y, e.pressed ? "true" : "false");
        }

        static std::string get_event_details(const MouseScrollEvent& e) {
            return std::format("Position: ({}, {}), Delta: ({}, {})", e.position.x, e.position.y, e.delta.x, e.delta.y);
        }

        static std::string get_event_details(const MouseDragEvent& e) {
                    return std::format("Start: ({}, {}), Current: ({}, {}), Delta: ({}, {}), Button: {}",
                        e.start.x, e.start.y, e.current.x, e.current.y, e.delta.x, e.delta.y,
                        static_cast<int>(e.button));
                }

                static std::string get_event_details(const KeyPressEvent& e) {
                            return "Key: " + std::to_string(static_cast<int>(e.key)) +
                                   ", Pressed: " + (e.pressed ? "true" : "false") +
                                   ", Repeat: " + (e.repeat ? "true" : "false") +
                                   ", Shift: " + (e.shift ? "true" : "false") +
                                   ", Ctrl: " + (e.ctrl ? "true" : "false") +
                                   ", Alt: " + (e.alt ? "true" : "false");
                        }

        static std::string get_event_details(const TextInputEvent& e) {
            return std::format("Text: {}", e.text);
        }

        static std::string get_event_details(const ResizeEvent& e) {
            return std::format("Width: {}, Height: {}", e.width, e.height);
        }

        static std::string get_event_details(const FocusEvent& e) {
            return std::format("Gained: {}", e.gained);
        }
    };
#endif


// Event dispatcher with support for multiple event types
struct EventDispatcher{
    using HandlerMap = std::unordered_map<std::type_index, std::vector<std:: unique_ptr<EventHandlerBase>>>;

    enum class EventPriority {
        Low,
        Normal,
        High
    };
private:

    HandlerMap handlers;
    std::vector<std::function<void(const Event&)>> global_handlers;
    std::vector<std::function<bool(const Event&)>> filters;
    EventQueue event_queue;

    bool should_dispatch(const Event& event) {
        return std::all_of(filters.begin(), filters.end(), [&event](const auto& filter) {
            return filter(event);
        });
    }


public:
    template<typename T>
    void subscribe(std::function<void(const T&)> handler){
        handlers[std::type_index(typeid(T))].push_back(std::make_unique<TypedEventHandler<T>>(std::move(handler)));
    }

    void subscribe_global(std::function<void(const Event&)> handler){
        global_handlers.push_back(std::move(handler));
    }

    // Emit an event
    void emit(const Event& event){

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
        static_assert(std::is_constructible_v<Event, std::decay_t<T>>, "Event type must be one of the variant alternatives");
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
        static_assert(std::is_constructible_v<Event, std::decay<T>>, "Event type must be one of the variant alternatives");

        if (priority == EventPriority::High){
            event_queue.push_front(std::forward<T>(event));
        } else {
            event_queue.push(std::forward<T>(event));
        }
    }

    // Event filtering
    template<typename Predicate>
    void add_filter(std::function<bool(const Event&)> filter) {
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
    static std::function<bool(const Event&)>
    create_type_filter(std::type_index allowed_type) {
        return [allowed_type](const Event& event) {
            return std::visit([allowed_type]([[maybe_unused]] const auto& e) {
                return std::type_index(typeid(e)) == allowed_type;
            }, event);
        };
    }

    static std::function<bool(const Event&)> create_mouse_filter() {
            return [](const Event& event) {
                return std::visit([]([[maybe_unused]] const auto& e) {
                    using T = std::decay_t<decltype(e)>;
                    return std::is_same_v<T, MouseMoveEvent> ||
                           std::is_same_v<T, MouseButtonEvent> ||
                           std::is_same_v<T, MouseScrollEvent> ||
                           std::is_same_v<T, MouseDragEvent>;
                }, event);
            };
        }

    static std::function<bool(const Event&)> create_keyboard_filter() {
        return [](const Event& event) {
            return std::visit([]([[maybe_unused]] const auto& e) {
                using T = std::decay_t<decltype(e)>;
                return std::is_same_v<T, KeyPressEvent> ||
                       std::is_same_v<T, TextInputEvent>;
            }, event);
        };
    }

};

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

    virtual void handle_impl(const MouseMoveEvent&) = 0;
    virtual void handle_impl(const MouseButtonEvent&) = 0;
    virtual void handle_impl(const MouseScrollEvent&) = 0;
    virtual void handle_impl(const MouseDragEvent&) = 0;
    virtual void handle_impl(const KeyPressEvent&) = 0;
    virtual void handle_impl(const ResizeEvent&) = 0;
    virtual void handle_impl(const FocusEvent&) = 0;
};


// Example component base class using the event system
class Component : public EventListener<
    MouseMoveEvent,
    MouseButtonEvent,
    MouseScrollEvent,
    MouseDragEvent,
    KeyPressEvent,
    ResizeEvent,
    FocusEvent
> {
protected:
    plastic::Rect bounds;
    bool focused = false;
    bool hovered = false;
    bool active = false;

public:
    explicit Component(EventDispatcher& dispatcher) : EventListener(dispatcher) {}

    virtual void update(float delta_time) {}
    virtual void render() const {}

protected:
    virtual void on_mouse_move(const MouseMoveEvent& e) {}
    virtual void on_mouse_button(const MouseButtonEvent& e) {}
    virtual void on_mouse_scroll(const MouseScrollEvent& e) {}
    virtual void on_mouse_drag(const MouseDragEvent& e) {}
    virtual void on_key_press(const KeyPressEvent& e) {}
    virtual void on_resize(const ResizeEvent& e) {}
    virtual void on_focus(const FocusEvent& e) {}

    void handle_impl(const MouseMoveEvent& e) override {
        hovered = CheckCollisionPointRec(e.position, bounds.to_raylib());
        on_mouse_move(e);
    }

    void handle_impl(const MouseButtonEvent& e) override {
        if (hovered){
            on_mouse_button(e);
        }
    }

    void handle_impl(const MouseScrollEvent& e) override {
        on_mouse_scroll(e);
    }

    void handle_impl(const MouseDragEvent& e) override {
        if (active) on_mouse_drag(e);
    }

    void handle_impl(const KeyPressEvent& e) override {
        if (focused) on_key_press(e);
    }

    void handle_impl(const ResizeEvent& e) override {
        on_resize(e);
    }

    void handle_impl(const FocusEvent& e) override {
        focused = e.gained;
        on_focus(e);
    }

    void set_bounds(const Rectangle& new_bounds) {
        this->bounds = Rect(new_bounds);
    }

    void set_bounds(const Rect& new_bounds) {
        this->bounds = new_bounds;
    }

    void set_bounds(const Rectangle new_bounds) {
        this->bounds = Rect(new_bounds);
    }

    void set_bounds(const Rect new_bounds) {
        this->bounds = new_bounds;
    }


    void set_active(const bool active) {
        this->active = active;
    }

    void set_focused(const bool focused) {
        this->focused = focused;
    }

    void set_hovered(const bool hovered) {
        this->hovered = hovered;
    }

    [[nodiscard]] bool is_focused() const {
        return focused;
    }

    [[nodiscard]] bool is_hovered() const {
        return hovered;
    }

    [[nodiscard]] bool is_active() const {
        return active;
    }

    [[nodiscard]] Rectangle get_bounds() const {
        return bounds.to_raylib();
    }
};

// Example usage with custom component
class Button : public Component {
    std::string text;
    std::function<void()> click_handler;
    Font font{};

public:
    Button(EventDispatcher& dispatcher, std::string text, std::function<void()> on_click) : Component(dispatcher), text(std::move(text)), click_handler(std::move(on_click)) {}

protected:
    void on_mouse_button(const MouseButtonEvent& e) override {
        if (e.pressed && e.button == MOUSE_LEFT_BUTTON){
            click_handler();
        }
    }

    void render() const override {
        DrawRectangleRec(bounds.to_raylib(), is_active() ? DARKGRAY : (is_hovered() ? LIGHTGRAY : GRAY));
        const char* text_str = text.c_str();
        auto [x, y] = MeasureTextEx(font, text_str, 20, 1);
        const Point text_pos(
            bounds.x + (bounds.width / 2 - x )/ 2,
            bounds.y + bounds.height / 2 - y / 2
        );
        DrawTextEx(font, text_str, text_pos.to_raylib(), 20, 1, WHITE);
    }
};

// Exa,ple usage with custom events

struct ThemeChangeEvent {
    std::string theme_name;
    double timestamp;
};

using CustomEvents = std::variant<
    ThemeChangeEvent,
    CustomEvent<int>,
    CustomEvent<std::string>
>;

using AnyEvent = std::variant<Event, CustomEvents>;

class EventBatcher {
private:
    std::vector<Event> batch;
    EventDispatcher& dispatcher;
    size_t batch_size_limit;

public:
    explicit EventBatcher(EventDispatcher& dispatcher, size_t limit = 100) : dispatcher(dispatcher), batch_size_limit(limit) {}

    template<typename T>
    void add_event(T&& event) {
        static_assert(is_valid_entry_v<T>, "Event type must be one of the variant alternatives");

        batch.push_back(std::forward<T>(event));
        if (batch.size() >= batch_size_limit) {
            flush();
        }
    }

    void flush() {
        if (batch.empty()) {
            return;
        }

        for (const auto& event : batch) {
            try {
                dispatcher.emit(event);
            } catch (const std::exception& e) {
                #ifdef PLASTIC_DEBUG
                    TraceLog(LOG_ERROR, "Error dispatching event: %s", e.what());
                #endif
            }
        }
        batch.clear();
    }
};

// Event listener with a single event type
    template<typename Event>
    class SingleEventListener {
    public:
        virtual ~SingleEventListener() = default;

    protected:
        EventDispatcher& dispatcher;

        explicit SingleEventListener(EventDispatcher& dispatcher) : dispatcher(dispatcher) {
            subscribe();
        }

        void subscribe() {
            dispatcher.subscribe<Event>([this](const Event& event) {
                this->handle(event);
            });
        }

        virtual void handle(const Event&) = 0;
    };


} // namespace plastic::events
#endif //PLASTIC_EVENT_SYSTEM_HPP
