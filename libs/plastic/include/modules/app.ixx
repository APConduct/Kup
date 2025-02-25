//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
export module plastic.app;
import plastic.application;
import plastic.platform;

export namespace plastic
{
    struct App {
    private:
        Application app_;
        std::shared_ptr<Platform> platform_{};

    public:
        virtual ~App() = default;
        virtual void run() = 0;

    };
}
