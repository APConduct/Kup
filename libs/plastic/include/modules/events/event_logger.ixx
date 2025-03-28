//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <iostream>
export module plastic.event_logger;
import plastic.events;

export namespace plastic
{
    class EventLogger {
    public:
        static void log_event(const events::Event& event) {
            std::visit([](const auto& e) {
                std::cout << "Event: " << typeid(e).name()
                          << " at " << e.timestamp << std::endl;
            }, event);
        }
    };

}