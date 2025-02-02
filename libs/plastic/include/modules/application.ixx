//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <vector>
export module plastic.application;

import plastic.window;
import plastic.size;

export namespace plastic
{
    struct Application {
        virtual ~Application() = default;

        bool loop{true};

        std::vector<std::shared_ptr<Window>> windows;

        std::shared_ptr<Window> create_window() {
            auto window = std::make_shared<Window>();
            window->handle_resize(Size<float>(800, 600));
            windows.push_back(window);
            return window;
        }

        void run();

    };
}
