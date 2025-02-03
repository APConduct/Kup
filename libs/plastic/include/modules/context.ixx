//
// Created by ajost1 on 1/29/2025.
//
module;
export module plastic.context;
import plastic.events;

export namespace plastic
{

    struct Context {
        virtual ~Context() = default;
        virtual void request_layout() = 0;
        virtual void request_paint() = 0;
        virtual void dispatch_event(const events::Event& event) = 0;
    };
}
