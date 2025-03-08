//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <string>
export module plastic.app;
import plastic.application;
import plastic.platform;
import plastic.window_context;
import plastic.events;
import plastic.app_context;
import plastic.window_manager;
import plastic.size;
import plastic.raylib_platform;
import plastic.window;
import plastic.window_base;

export namespace plastic
{
    struct App : std::enable_shared_from_this<App> {
    private:
        std::shared_ptr<Platform> platform_{};
        std::string name_;
        Size<float> default_window_size_{800, 600};
        std::shared_ptr<context::AppContext> app_context_;
        std::shared_ptr<WindowManager> window_manager_;
        std::shared_ptr<Application> app_;


    public:
        virtual ~App() = default;
        template<typename F>
        auto run(F&& f) -> decltype(f(*app_->app_context_)) {
            return with_context(std::forward<F>(f));
        }



        // virtual void init() = 0;
        // virtual void run() = 0;
        // virtual void on_start() = 0;
        // virtual void on_stop() = 0;
        // virtual void on_update() = 0;
        // virtual void on_render() = 0;
        // virtual void on_event(const events::Event& event) = 0;
        // virtual void on_window_close() = 0;


        explicit App(std::string name = "Plastic App", Size<float> default_size = Size<float>{800, 600})
    : name_(std::move(name)), default_window_size_(default_size)
        {
            // Create app context
            app_context_ = std::make_shared<context::AppContext>();

            // Create platform implementation (using Raylib by default)
            platform_ = std::make_shared<RaylibPlatform>(app_context_);

            // Create window manager
            window_manager_ = std::make_shared<WindowManager>(app_context_);

            // Create application
            app_ = std::make_shared<Application>(name_, default_window_size_);
            app_->app_context_ = app_context_;
            app_->window_manager_ = window_manager_;
        }

        bool init() {
            if (!platform_->initialize()) {
                return false;
            }

            // Connect app context to platform
            app_context_->set_platform(platform_);

            return true;
        }

        // Create and show the main window with a root view
        template<typename ViewType, typename... Args>
        std::shared_ptr<Window> create_window(Args&&... args) {
            auto window_context = platform_->create_window_context();
            auto window = std::make_shared<Window>(window_context, default_window_size_, name_);

            // Create and set the root view
            auto view = std::make_shared<ViewType>(std::forward<Args>(args)...);
            window->set_root(view);

            // Add to window manager
            window_manager_->add_window(window);

            return window;
        }

        void run() {
            if (!init()) {
                throw std::runtime_error("Failed to initialize application");
            }

            while (window_manager_->has_windows()) {
                // Process platform events
                platform_->update();

                // Update all windows
                window_manager_->for_each_window([](WindowBase& window) {
                    window.update();
                    window.render();
                });

                // Remove closed windows
                for (const auto& [id, window] : window_manager_->windows()) {
                    if (window->should_close()) {
                        window_manager_->remove_window(id);
                    }
                }
            }

            // Shutdown when all windows are closed
            platform_->shutdown();
        }

        // Run with a custom initialization function
        template<typename F>
        auto run(F&& f) -> decltype(f(*app_context_)) {
            init();
            auto result = f(*app_context_);
            run();
            return result;
        }

        // Get the platform
        std::shared_ptr<Platform> platform() { return platform_; }

        // Get the app context
        std::shared_ptr<context::AppContext> context() { return app_context_; }

        // Get the window manager
        std::shared_ptr<WindowManager> window_manager() { return window_manager_; }


    };
}
