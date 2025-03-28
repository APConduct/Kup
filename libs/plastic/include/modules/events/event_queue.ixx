//
// Created by ajost1 on 2/2/2025.
//

module;
#include <algorithm>
#include <functional>
#include <deque>
#include <mutex>
#include <optional>
#include <variant>
export module plastic.event_queue;

import plastic.point;
import plastic.events;

export namespace plastic
{
    struct EventQueue {
    private:
        std::deque<events::Event> queued_events;
        mutable std::mutex queue_mutex;

        static bool should_compress(const events::MouseMoveEvent& a, const events::MouseMoveEvent& b) {
            return a.timestamp - b.timestamp < 0.016; // less than 1 frame
        }

        static void compress(events::MouseMoveEvent& target, const events::MouseMoveEvent& source) {
            target.delta.x += source.delta.x;
            target.delta.y += source.delta.y;
            target.position = source.position;
            target.timestamp = source.timestamp;
        }

    public:

        void push(events::Event event) {  // Take by value
            std::lock_guard lock(queue_mutex);
            queued_events.push_back(std::move(event));  // Move into container
        }

        void push_front(events::Event event) {  // Take by value
            std::lock_guard lock(queue_mutex);
            queued_events.push_front(std::move(event));  // Move into container
        }

        [[nodiscard]] std::optional<events::Event> pop() {
            std::lock_guard lock(queue_mutex);
            if (queued_events.empty()) {
                return std::nullopt;
            }
            events::Event event = std::move(queued_events.front());  // Move out
            queued_events.pop_front();
            return event;
        }

        template<typename T>
        void push(T&& event) {
            static_assert(std::is_constructible_v<events::Event, std::decay_t<T>>, "Event type must be be one of the variant alternatives");
            std::lock_guard lock(queue_mutex);
            queued_events.push_back(std::forward<T>(event));
        }

        [[nodiscard]] std::vector<events::Event> get_events() const {
            std::lock_guard lock(queue_mutex);
            return {queued_events.begin(), queued_events.end()};
        }

        std::deque<events::Event>& get_events() {
            std::lock_guard lock(queue_mutex);
            return queued_events;
        }

        [[nodiscard]] events::Event& front() {
            std::lock_guard lock(queue_mutex);
            return queued_events.front();
        }

        [[nodiscard]] const events::Event& front() const {
            std::lock_guard lock(queue_mutex);
            return queued_events.front();
        }


        void clear() {
            std::lock_guard lock(queue_mutex);
            queued_events.clear();
        }

        [[nodiscard]] bool empty() const {
            std::lock_guard lock(queue_mutex);
            return queued_events.empty();
        }

        [[nodiscard]] size_t size() const {
            std::lock_guard lock(queue_mutex);
            return queued_events.size();
        }



        template<typename T>
        void process_all(std::function<void(const T&)> func) {
            std::lock_guard lock(queue_mutex);
            for (const auto& event : queued_events) {
                if (auto* e = std::get_if<T>(&event)) {
                    func(*e);
                }
            }
            queued_events.clear();
        }

        template<typename T>
        void process_all(T&& handler) {
            std::lock_guard lock(queue_mutex);
            for (const auto& event : queued_events) {
                handler(event);
            }
            queued_events.clear();
        }

        // Process events that match a predicate
        template<typename Predicate>
        void process_if(Predicate&& predicate) {
            std::lock_guard lock(queue_mutex);
            auto it = std::remove_if(queued_events.begin(), queued_events.end(),
                [&predicate](const events::Event& event) {
                    return !predicate(event);
                });
            queued_events.erase(it, queued_events.end());
        }


        template<typename Func>
        void for_each(Func&& func) const {
            for (const auto& event : queued_events) {
                func(event);
            }
        }

        template<typename T>
        void push_front(T&& event) {
            static_assert(std::is_constructible_v<events::Event, std::decay_t<T>>, "Event type must be one of the variant alternatives");
            std::lock_guard lock(queue_mutex);
            queued_events.insert(queued_events.begin(), std::forward<T>(event));
        }

        // Merge another queue into this one
        void merge(EventQueue& other) {
            std::lock_guard lock(queue_mutex);
            std::lock_guard other_lock(other.queue_mutex);

            for (auto& event : other.queued_events) {
                queued_events.push_back(std::move(event));
            }
            other.queued_events.clear();
        }

        void push_compressed(events::Event event) {
            std::lock_guard lock(queue_mutex);

            // Try to compress mouse move events
            if (std::holds_alternative<events::MouseMoveEvent>(event)) {
                if (!queued_events.empty() &&
                    std::holds_alternative<events::MouseMoveEvent>(queued_events.back())) {
                    auto& last = std::get<events::MouseMoveEvent>(queued_events.back());
                    auto& current = std::get<events::MouseMoveEvent>(event);

                    // Combine the events if they're close in time
                    if (current.timestamp - last.timestamp < 0.016) { // Less than 1 frame
                        last.delta.x += current.delta.x;
                        last.delta.y += current.delta.y;
                        last.position = current.position;
                        last.timestamp = current.timestamp;
                        return;
                    }
                    }
            }

            queued_events.push_back(std::move(event));
        }    };

    template<typename T>
    constexpr  bool is_valid_entry_v = std::is_constructible_v<events::Event, T>;



    template<typename T, typename... Args>
    T create_event(Args&&... args) {
        return T{std::forward<Args>(args)..., get_current_timestamp()};
    }

}
