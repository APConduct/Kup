//
// Created by Aidan Jost on 3/7/25.
//


module;
export module plastic.platform_interface;

import plastic.events;

export namespace plastic {
    struct PlatformInterface {
        virtual ~PlatformInterface() = default;
        virtual bool initialize() = 0;
        virtual void shutdown() = 0;
        virtual void update() = 0;
        virtual void dispatch_event(const events::Event& event) = 0;

    };
}
