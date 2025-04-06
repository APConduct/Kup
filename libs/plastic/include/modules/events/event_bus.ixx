//
// Created by Aidan Jost on 3/28/25.
//

/// The main Event class to be used in/with 'App'
module;
#include <functional>
#include <string>
#include <unordered_map>
export module plastic.event_bus;
import plastic.event_dispatcher;
import plastic.event_queue;
import plastic.event_system;
import plastic.events;
import plastic.event_logger;
import plastic.event_throttler;

export namespace plastic
{
    class EventBus {
        std::vector<std::function<bool(const events::Event&)>> filters_;
        std::shared_ptr<EventDispatcher> dispatcher_{};
        std::unordered_map<std::string, std::shared_ptr<EventDispatcher>> channels_{};

        std::vector<std::function<void(const events::Event&)>> middleware_;

        std::shared_ptr<EventQueue> queue_;
        bool logging_enabled_{false};

        size_t batch_size_limit_{100};


    public:

        EventBus() : dispatcher_(std::make_shared<plastic::EventDispatcher>()), queue_(std::make_shared<EventQueue>()) {}

        template<typename E>
        void subscribe(std::function<void(const E&)> handler) {
            dispatcher_->subscribe<E>(std::move(handler));
        }


        static std::function<bool(const events::Event&)> create_mouse_filter() {
            return [](const events::Event& e) {
                return std::holds_alternative<events::MouseButtonEvent>(e) ||
                       std::holds_alternative<events::MouseMoveEvent>(e) ||
                       std::holds_alternative<events::MouseScrollEvent>(e) ||
                       std::holds_alternative<events::MouseDragEvent>(e);
            };
        }



        // Subscribe to channel-specific events
        template<typename E>
        void subscribe_to_channel(const std::string& channel, std::function<void(const E&)> handler) {
            get_or_create_channel(channel)->subscribe<E>(std::move(handler));
        }


        void publish(const events::Event& event) {
            // Run through middleware
            for (const auto& mw : middleware_) {
                mw(event);
            }

            // Check filters
            for (const auto& filter : filters_) {
                if (!filter(event)) return;
            }

            dispatcher_->emit(event);
        }

        // Publish to specific channel
        void publish_to_channel(const std::string& channel, const events::Event& event) {
            if (auto ch = get_channel(channel)) {
                ch->emit(event);
            }
            // Also publish globally
            publish(event);
        }

        // Add middleware
        void add_middleware(std::function<void(const events::Event&)> middleware) {
            middleware_.push_back(std::move(middleware));
        }

        std::shared_ptr<EventDispatcher> get_or_create_channel(const std::string& channel) {
            auto it = this->channels_.find(channel);
            if (it == channels_.end()) {
                auto dispatcher = std::make_shared<EventDispatcher>();
                channels_[channel] = dispatcher;
                return dispatcher;
            }
            return it->second;
        }

        std::shared_ptr<EventDispatcher> get_channel(const std::string& channel) {
            auto it = this->channels_.find(channel);
            return it != channels_.end() ? it->second : nullptr;
        }

        void add_filter(std::function<bool(const events::Event&)> filter) {
            filters_.push_back(std::move(filter));
        }

        void clear_filters() {
            filters_.clear();
        }

        void clear_middlewares() {
            middleware_.clear();
        }

        void remove_channel(const std::string& channel) {
            channels_.erase(channel);
        }

        template<typename T>
        void queue(T&& event) {
            queue_->push(std::forward<T>(event));
        }

        void process_queued_events() {
            for (const auto& event : queue_->get_events()) {
                publish(event);
            }
            queue_->clear();
        }

        void enable_logging(bool enable = true) {
            logging_enabled_ = enable;
            if (enable) {
                add_middleware([](const events::Event& event) {
                    EventLogger::log_event(event);
                });
            }
        }

        void clear() {
            channels_.clear();
            filters_.clear();
            middleware_.clear();
            queue_->clear();
        }

        template<typename E>
        void subscribe_throttled(
            std::function<void(const E&)> handler,
            std::chrono::milliseconds threshold) {
            auto throttler = std::make_shared<EventThrottler<E>>(threshold);

            subscribe<E>([handler, throttler](const E& event) {
                if (throttler->should_process(event)) {
                    handler(event);
                }
            });
        }

        void set_batch_size_limit(size_t limit) {
            batch_size_limit_ = limit;
        }

        template<typename T>
        void batch_add(T&& event) {
            queue_->push(std::forward<T>(event));
            if (queue_->size() >= batch_size_limit_) {
                process_queued_events();
            }
        }

        void flush_batch() {
            process_queued_events();
        }

        template<typename... Events>
        void add_listener(std::function<void(const Events&)>... handlers) {
            (subscribe<Events>(std::move(handlers)), ...);
        }


        template<typename E>
        void subscribe_with_priority(std::function<void(const E&)> handler, EventPriority priority) {
            auto wrapped_handler = [handler, priority, this](const E& event) {
                if (priority == EventPriority::High) {
                    handler(event);
                } else {
                    queue_->push_with_priority(event, priority);
                }
            };
        }


    };
}
