//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <unordered_map>
#include <string>
#include <functional>
export module plastic.event_broadcast;

import plastic.event_dispatcher;
import plastic.events;

export namespace plastic {
    class EventBroadcaster {
    private:
        std::unordered_map<std::string, std::shared_ptr<EventDispatcher>> channels_;

    public:
        std::shared_ptr<EventDispatcher> create_channel(const std::string& name) {
            auto dispatcher = std::make_shared<EventDispatcher>();
            channels_[name] = dispatcher;
            return dispatcher;
        }

        std::shared_ptr<EventDispatcher> get_channel(const std::string& name) {
            auto it = channels_.find(name);
            if (it != channels_.end()) {
                return it->second;
            }
            return nullptr;
        }

        void broadcast(const std::string& channel_name, const events::Event& event) {
            if (auto channel = get_channel(channel_name)) {
                channel->emit(event);
            }
        }

        template<typename T>
        void subscribe_to(const std::string& channel_name, std::function<void(const T&)> handler) {
            auto channel = get_channel(channel_name);
            if (!channel) {
                channel = create_channel(channel_name);
            }
            channel->subscribe<T>(std::move(handler));
        }

        void remove_channel(const std::string& name) {
            channels_.erase(name);
        }
    };
}