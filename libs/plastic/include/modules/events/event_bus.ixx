//
// Created by Aidan Jost on 3/28/25.
//

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
        std::unordered_map<std::string, std::vector<std::function<void(const events::Event&)>>> channels_;

        std::vector<std::function<void(const events::Event&)>> middleware_;

    public:
        void subscribe(const std::string& channel, std::function<void(const events::Event&)> handler) {
            channels_[channel].emplace_back(handler);
        }



        void publish(const std::string& channel, const events::Event& event) {
            if (auto it = channels_.find(channel); it != channels_.end()) {
                for (const auto& handler : it->second) {
                    handler(event);
                }
            }
            dispatcher_.emit(event);
        }
    };
}
