//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <vector>
export module plastic.event_recorder;
import plastic.events;
import plastic.event_dispatcher;

export namespace plastic
{
    class EventRecorder {
        std::vector<events::Event> recorded_events_;
    public:
        void record(const events::Event& event) {
            recorded_events_.push_back(event);
        }

        void replay(EventDispatcher& dispatcher) {
            for (const auto& event : recorded_events_) {
                dispatcher.emit(event);
            }
        }
    };

}