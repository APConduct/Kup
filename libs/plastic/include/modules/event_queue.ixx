//
// Created by ajost1 on 2/2/2025.
//

module;
#include <algorithm>
#include <functional>
#include <vector>
#include <mutex>
#include <optional>
#include <raylib.h>
#include <variant>
export module plastic.event_queue;

import plastic.point;
import plastic.events;

export namespace plastic
{
    struct EventQueue {
    private:
        std::vector<events::Event> queued_events;
        std::mutex queue_mutex;

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
        template<typename T>
        void push(T&& event) {
            static_assert(std::is_constructible_v<events::Event, std::decay_t<T>>, "Event type must be be one of the variant alternatives");
            std::lock_guard lock(queue_mutex);
            queued_events.push_back(std::forward<T>(event));
        }

        [[nodiscard]] std::vector<events::Event> get_events() const {
            return queued_events;
        }

        std::vector<events::Event>& get_events() {
            return queued_events;
        }

        void clear() {
            std::lock_guard lock(queue_mutex);
            queued_events.clear();
        }

        [[nodiscard]] bool empty() const {
            return queued_events.empty();
        }

        [[nodiscard]] size_t size() const {
            return queued_events.size();
        }

        [[nodiscard]] std::optional<events::Event> pop() {
            std::lock_guard lock(queue_mutex);
            if (queued_events.empty()) {
                return std::nullopt;
            }
            auto event = queued_events.front();
            queued_events.erase(queued_events.begin());
            return event;
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

        template<typename Predicate>
        void process_if(Predicate&& predicate) {
            std::lock_guard lock(queue_mutex);
            queued_events.erase(
                std::remove_if(queued_events.begin(), queued_events.end(), predicate),
                queued_events.end()
            );
        }

        template<typename Func>
        void for_each(Func&& func) const {
            std::lock_guard lock(const_cast<std::mutex&>(queue_mutex));
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

        void merge(EventQueue& other) {
            std::lock_guard lock(queue_mutex);
            std::lock_guard other_lock(other.queue_mutex);
            queued_events.insert(
                queued_events.end(),
                std::make_move_iterator(other.queued_events.begin()),
                std::make_move_iterator(other.queued_events.end())
            );
            other.queued_events.clear();
        }

        template<typename T>
        void push_compressed(T&& event) {
            static_assert(std::is_constructible_v<events::Event, std::decay_t<T>>, "Event type must be one of the variant alternatives");
            std::lock_guard lock(queue_mutex);
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

    template<typename T>
    constexpr  bool is_valid_entry_v = std::is_constructible_v<events::Event, T>;

    inline double get_current_timestamp() {
        return GetTime();
    }

    template<typename T, typename... Args>
    T create_event(Args&&... args) {
        return T{std::forward<Args>(args)..., get_current_timestamp()};
    }

}
