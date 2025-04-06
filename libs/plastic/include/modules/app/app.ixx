//
// Created by ajost1 on 1/30/2025.
//
module;
#include <functional>
#include <string>
#if defined(_WIN32)
#include <memory>
#endif

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
import plastic.element;
import plastic.view;
import plastic.context;
import plastic.color;
import plastic.view_wrapper;
import plastic.rect;
import plastic.window_options;
import plastic.event_bus;
import plastic.theme;
import plastic.font_registry;

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
        bool initialized_ = false;
        std::shared_ptr<EventBus> event_bus_;
        Theme theme_;


    public:


        virtual ~App() = default;
        template<typename F>
        auto run(F&& f) -> decltype(f(*app_->app_context_)) {
            return with_context(std::forward<F>(f));
        }

        std::shared_ptr<EventBus> events() {
            return event_bus_;
        }

        void set_theme(std::shared_ptr<Theme> theme) {
            this->theme_ = *theme;
            if (auto window = window_manager_->get_window(0)) {
                window->set_theme(theme);
            }
        }

        template<typename F>
        int run_with(F&& setup_fn) {
            if (!init()) {
                return 1;
            }

            // Call setup function with 'this' pointer
            setup_fn(this);

            // Run the app
            run();
            return 0;
        }

        App& with_theme(std::shared_ptr<Theme> theme) {
            this->theme_ = *theme;
            if (auto window = window_manager_->get_window(0)) {
                window->set_theme(theme);
            }
            return *this;
        }

        App& with_default_font(const std::string& family) {
            FontRegistry::set_global_default_font(get_font(family));
            return *this;
        }

        template<typename ViewType, typename... Args>
        std::shared_ptr<Window> open_window(
            const window::WindowOptions& options,
            Args&&... args
        ) {
            // Create window with existing method
            auto window = create_window<ViewWrapper>();

            // Apply window options
            if (!options.title.empty()) {
                window->set_title(options.title);
            }

            if (options.window_bounds) {
                const auto& bounds = options.window_bounds.value();
                switch (bounds.type) {
                    case window::WindowBoundsType::Windowed:
                        window->set_bounds(Rect<float>{
                            bounds.bounds.x,
                            bounds.bounds.y,
                            bounds.bounds.width,
                            bounds.bounds.height
                        });
                    break;
                    case window::WindowBoundsType::Maximized:
                        window->maximize();
                    break;
                    case window::WindowBoundsType::Fullscreen:
                        window->set_fullscreen(true);
                    break;
                }
            }

            // Create and set view
            auto view = std::make_shared<ViewType>(std::forward<Args>(args)...);
            window->set_root(view);

            return window;
        }

        // virtual void init() = 0;
        // virtual void run() = 0;
        // virtual void on_start() = 0;
        // virtual void on_stop() = 0;
        // virtual void on_update() = 0;
        // virtual void on_render() = 0;
        // virtual void on_event(const events::Event& event) = 0;
        // virtual void on_window_close() = 0;

    protected:

        void setup_default_event_handling() {
            // Add logging middleware in debug mode
#ifdef PLASTIC_DEBUG
            event_bus_->add_middleware([](const events::Event& event) {
                EventLogger::log_event(event);
            });
#endif

            // Window events - use the template parameter explicitly
            event_bus_->subscribe<events::WindowCloseEvent>(
                [this](const events::WindowCloseEvent& event) {
                    if (auto window = window_manager_->get_window(event.window_id)) {
                        window->request_close();
                    }
                });

            // Platform events - use the template parameter explicitly
            event_bus_->subscribe<events::WindowResizeEvent>(
                [this](const events::WindowResizeEvent& event) {
                    if (auto window = window_manager_->get_window(0)) {
                        window->handle_resize(event.size);
                    }
                });

            // Input events - use the template parameter explicitly
            event_bus_->subscribe_to_channel<events::KeyPressEvent>(
                "input",
                [this](const events::KeyPressEvent& event) {
                    if (event.pressed && event.ctrl.value_or(false)) {
                        if (event.key == events::KeyboardKey::KEY_Q) {
                            request_quit();
                        }
                    }
                });
        }
        void request_quit() {
            // Publish quit request event
            events::WindowCloseEvent event{0, events::get_current_timestamp()};
            event_bus_->publish(event);
        }


    public:

        explicit App(std::string name = "Plastic App", Size<float> default_size = Size<float>{800, 600})
        : name_(std::move(name)), default_window_size_(default_size)
        {
            // Create app context
            app_context_ = std::make_shared<context::AppContext>();

            event_bus_ = std::make_shared<EventBus>();

            // Create platform implementation (using Raylib by default)
            platform_ = std::make_shared<RaylibPlatform>(app_context_);

            // Create window manager
            window_manager_ = std::make_shared<WindowManager>(app_context_);

            // Create application
            app_ = std::make_shared<Application>(name_, default_window_size_);
            app_->app_context_ = app_context_;
            app_->window_manager_ = window_manager_;

        }

        bool init() const {
            if (!platform_->initialize()) {
                return false;
            }

            // Connect app context to platform
            app_context_->set_platform(platform_);


            return true;
        }

        static App create_simple(const std::string& title) {
            return App(title)
                .with_theme(std::make_shared<Theme>(Theme::dark_theme()))
                .with_default_font("Rubik");
        }

        // Create and show the main window with a root view
        template<typename ViewType, typename... Args>
        std::shared_ptr<Window> create_window(Args&&... args) {
            auto window_context = platform_->create_window_context();
            auto window = std::make_shared<Window>(window_context, default_window_size_, name_);

            // Set title immediately after creation
            window_context->set_title(name_);

            // Create and set the root view
            auto view = std::make_shared<ViewType>(std::forward<Args>(args)...);
            window->set_root(view);

            // Add to window manager
            window_manager_->add_window(window);

            return window;
        }

        template<typename E>
        void register_event_handler(std::function<void(const E&)> handler) {
            if (platform_) {
                platform_->register_event_handler<E>(std::move(handler));
            }
        }

    protected:
        std::function<void(const events::WindowCloseEvent&)> on_window_close_;
        std::function<void(const events::KeyPressEvent&)> on_key_press_;

    public:
        void set_on_window_close(std::function<void(const events::WindowCloseEvent&)> handler) {
            on_window_close_ = std::move(handler);
        }

        void set_on_key_press(std::function<void(const events::KeyPressEvent&)> handler) {
            on_key_press_ = std::move(handler);
        }

        App& on_window_close(std::function<void(const events::WindowCloseEvent&)> handler) {
            on_window_close_ = std::move(handler);
            return *this;
        }

        App& on_key_press(std::function<void(const events::KeyPressEvent&)> handler) {
            on_key_press_ = std::move(handler);
            return *this;
        }

        void handle_window_close(const events::WindowCloseEvent& event) const {
            if (on_window_close_) {
                on_window_close_(event);
            }
        }

        void handle_key_press(const events::KeyPressEvent& event) const {
            if (on_key_press_) {
                on_key_press_(event);
            }
        }

        void run() {
            if (!init()) {
                throw std::runtime_error("Failed to initialize application");
            }


            while (window_manager_->has_windows()) {
                // Process platform events
                platform_->update();

                // Update all windows
                window_manager_->for_each_window([this](WindowBase& window) {
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

            auto init_success = init();
            if (!init_success) {
                throw std::runtime_error("Failed to initialize application");
            }

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

        // Builder methods that return *this for chaining
        App& with_title(std::string title) {
            name_ = std::move(title);
            return *this;
        }

        App& with_size(Size<float> size) {
            default_window_size_ = size;
            return *this;
        }

        // Method to quickly set up a UI function as the root view
        template<typename ViewFn>
        App& with_ui(ViewFn&& ui_fn, Color bg_color = Color::rgb(30, 30, 30)) {
            // Create a simple function-based view
            class FunctionView : public View {
            private:
                ViewFn ui_fn_;
                Color bg_color_;

            public:
                FunctionView(ViewFn fn, Color bg_color)
                    : ui_fn_(std::move(fn)), bg_color_(bg_color) {}

                std::shared_ptr<Element> render(Context* cx)  override {
                    return ui_fn_(cx);
                }

                void on_mount() override {
                    set_background_color(bg_color_);
                }
            };

            // Create a window if none exists
            if (!window_manager_->has_windows()) {
                auto view = std::make_shared<FunctionView>(std::forward<ViewFn>(ui_fn), bg_color);
                auto window = create_window<ViewWrapper>();
                window->set_root(view);
            }

            return *this;
        }

        int run_and_return() {
            if (!init()) {
                return 1;
            }

            run();
            return 0;
        }

        template<typename ViewType, typename... Args>
        std::shared_ptr<Window> open_secondary_window(
            const window::WindowOptions& options,
            Args&&... args
        ) {
            if (!platform_->supports_multiple_windows()) {
                throw std::runtime_error("Multiple windows are not supported on this platform");
            }

            // Create window context
            auto window_context = platform_->create_window_context();

            // Create window with the context
            auto window = std::make_shared<Window>(window_context, options.size, options.title);

            // Set window properties from options
            if (!options.title.empty()) {
                window->set_title(options.title);
            }

            if (options.window_bounds) {
                const auto& bounds = options.window_bounds.value();
                switch (bounds.type) {
                    case window::WindowBoundsType::Windowed:
                        window->set_bounds(Rect<float>{
                            bounds.bounds.x,
                            bounds.bounds.y,
                            bounds.bounds.width,
                            bounds.bounds.height
                        });
                    break;
                    case window::WindowBoundsType::Maximized:
                        window->maximize();
                    break;
                    case window::WindowBoundsType::Fullscreen:
                        window->set_fullscreen(true);
                    break;
                }
            }

            // Create the view
            auto view = std::make_shared<ViewType>(std::forward<Args>(args)...);
            window->set_root(view);

            // Add window to window manager
            window_manager_->add_window(window);

            return window;
        }

        bool supports_multiple_windows() const {
            return platform_->supports_multiple_windows();
        }


    };


    inline int run_app(
        std::string title,
        std::function<std::shared_ptr<Element>(Context*)> create_ui_fn,
        Size<float> size = Size<float>{800, 600},
        Color bg_color = Color::rgb(30, 30, 30)
        ) {

        return App()
            .with_title(std::move(title))
            .with_size(size)
            .with_ui(std::move(create_ui_fn), bg_color)
            .run_and_return();
        }

    // Helper for creating an App instance
    inline std::shared_ptr<App> create_app(const std::string& name = "Plastic App",
                                           const Size<float>& size = Size<float>{800, 600}) {
        return std::make_shared<App>(name, size);
    }




}
