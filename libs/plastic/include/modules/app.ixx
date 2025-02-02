//
// Created by ajost1 on 1/30/2025.
//

export module plastic.app;

export namespace plastic
{
    struct App {
        virtual ~App() = default;
        virtual void run() = 0;
    };
}
