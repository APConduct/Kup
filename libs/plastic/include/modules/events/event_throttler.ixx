//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <chrono>
export module plastic.event_throttler;
export namespace plastic
{
    template<typename Event>
    class EventThrottler {
        using Clock = std::chrono::steady_clock;
        Clock::time_point last_event_;
        std::chrono::milliseconds threshold_;

    public:
        explicit EventThrottler(std::chrono::milliseconds threshold)
            : threshold_(threshold) {}

        bool should_process(const Event&) {
            auto now = Clock::now();
            if (now - last_event_ >= threshold_) {
                last_event_ = now;
                return true;
            }
            return false;
        }
    };

}