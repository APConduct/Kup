//
// Created by ajost1 on 2/2/2025.
//

export module plastic.event_base;
import plastic.events;

export namespace plastic
{
    struct EventHandlerBase {
        virtual ~EventHandlerBase() = default;
        virtual void call(const events::Event& event) = 0;
    };
}
