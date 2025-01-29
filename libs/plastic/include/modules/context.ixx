//
// Created by ajost1 on 1/29/2025.
//

export module plastic.context;

export namespace plastic
{
    struct Context {
        virtual ~Context() = default;
        virtual void request_layout() = 0; // request redraw
        virtual void request_point() = 0;


        // dispatch_event(std::unique_ptr<Event> event) = 0;
    };
}
