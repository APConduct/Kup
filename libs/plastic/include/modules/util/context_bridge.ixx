//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <memory>
export module plastic.context_bridge;


import plastic.app_context;
import plastic.window_context;
import plastic.window;
import plastic.window_options;

export namespace plastic {
    class ContextBridge {
    public:
        // Factory method for window creation that doesn't cause circular deps
        static std::shared_ptr<Window> create_window(
            context::AppContext* app_context,
            std::shared_ptr<context::WindowContext> window_context,
            const window::WindowOptions& options
        ) {
            auto window = std::make_shared<Window>(
                window_context,
                options.size,
                options.title
            );

            // Apply window options
            // ... (setup window bounds, etc)

            // Return window without directly calling add_window
            return window;
        }
    };
}
