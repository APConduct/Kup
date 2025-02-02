//
// Created by ajost1 on 1/29/2025.
//
module;
#include <memory>
export module plastic.context;
import plastic.events;

export namespace plastic
{
    struct Context {
        virtual ~Context() = default;
        virtual void request_layout() = 0; // request redraw
        virtual void request_point() = 0;


       // virtual void dispatch_event(std::unique_ptr<events::Event> event) = 0;
    };
}
