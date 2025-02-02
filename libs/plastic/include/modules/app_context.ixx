//
// Created by ajost1 on 1/30/2025.
//
module;


#include <memory>
#include <vector>
export module plastic.app_context;
import plastic.window;

export namespace plastic::context
{
    struct AppContext {

    private:
        std::vector<std::weak_ptr<Window>> windows_;

    public:
        void add_window(const std::shared_ptr<Window>& window) {
            windows_.push_back(window);
        }

        void remove_window(const std::shared_ptr<Window>& window) {
            std::erase_if(windows_,
                          [window](const std::weak_ptr<Window>& w) {
                              return w.lock() == window;
                          });

        }

    };
}
