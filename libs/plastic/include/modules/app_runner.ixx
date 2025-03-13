module;
#include <string>
#include <functional>
#if defined(_WIN32)
#include <memory>
#endif
export module plastic.app_runner;

import plastic.app;
import plastic.window_types;
import plastic.size;
import plastic.point;

export namespace plastic
{
    class AppRunner {
    private:
        std::string name_{"Plastic App"};
        Size<float> default_size_{800, 600};
        
    public:
        AppRunner() = default;
        
        // Constructor with app name
        explicit AppRunner(std::string name) : name_(std::move(name)) {}
        
        // Named builder method
        static AppRunner create() {
            return AppRunner{};
        }
        
        // Builder method to set app name
        AppRunner& with_name(std::string name) {
            name_ = std::move(name);
            return *this;
        }
        
        // Builder method to set app size
        AppRunner& with_size(Size<float> size) {
            default_size_ = size;
            return *this;
        }
        
        // Run method with setup function (GPUI.rs style)
        template<typename F>
        int run(F&& setup_fn) const {
            // Create an app instance with the given name and size
            auto app = std::make_shared<App>(name_, default_size_);
            
            // Initialize the app
            if (!app->init()) {
                return 1;
            }
            
            // Call the setup function with the app instance
            setup_fn(app.get());
            
            // Run the application main loop
            app->run();
            
            return 0;
        }
    };
}
