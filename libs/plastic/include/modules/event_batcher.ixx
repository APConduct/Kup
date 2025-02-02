//
// Created by ajost1 on 2/2/2025.
//
module;
#include <vector>
#include <algorithm>


export module plastic.event_batcher;

import plastic.event_dispatcher;
import plastic.events;
import plastic.event_queue;

export namespace plastic
{
    class EventBatcher {
        using Event = events::Event;
    private:
        std::vector<events::Event> batch;
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
                } catch (const std::exception& e) {}
            }
            batch.clear();
        }
    };
}
