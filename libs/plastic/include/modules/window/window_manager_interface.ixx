//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <memory>
export module plastic.window_manager_interface;

import plastic.window_base;

export namespace plastic {
    class WindowManagerInterface {
    public:
        virtual ~WindowManagerInterface() = default;
        virtual void add_window(const std::shared_ptr<WindowBase>& window) = 0;
        virtual void remove_window(int window_id) = 0;
        [[nodiscard]] virtual bool has_windows() const = 0;
    };
}

