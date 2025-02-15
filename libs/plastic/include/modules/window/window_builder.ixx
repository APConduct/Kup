//
// Created by Aidan Jost on 2/15/25.
//
module;
#include <memory>
export module plastic.window_builder;

import plastic.window_options;
import plastic.window_context;
import plastic.window;

export namespace plastic
{
    class WindowBuilder {
    public:
        static std::shared_ptr<Window> create(
            const std::shared_ptr<context::WindowContext>& context,
            int window_id,
            const WindowOptions& options = WindowOptions{})
        {
            auto window = std::make_shared<Window>(context, options.size);

            window->set_title(options.title);

            window->handle_resize(options.size);

            return window;
        }

    };
}
