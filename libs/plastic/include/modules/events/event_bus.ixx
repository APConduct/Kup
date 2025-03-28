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
import plastic.event_system;

export namespace plastic
{
    class EventBus {
        EventDispatcher dispatcher_;
        std::unordered_map<std::string, std::shared_ptr<EventDispatcher>> channels_;

        std::vector<std::function<void(const events::Event&)>> middleware_;

    public:

        template<typename E>
        void subscribe(std::function<void(const E&)> handler) {
            dispatcher_.subscribe<E>(handler);
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
            dispatcher_.emit(event);
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


    private:
        std::shared_ptr<EventDispatcher> get_or_create_channel(const std::string& channel) {
            auto it = channels_.find(channel);
            if (it == channels_.end()) {
                auto dispatcher = std::make_shared<EventDispatcher>();
                channels_[channel] = dispatcher;
                return dispatcher;
            }
            return it->second;
        }

        std::shared_ptr<EventDispatcher> get_channel(const std::string& channel) {
            auto it = channels_.find(channel);
            return it != channels_.end() ? it->second : nullptr;
        }


    };
}
