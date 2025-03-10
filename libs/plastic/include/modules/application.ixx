//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <vector>
#include <string>
export module plastic.application;

import plastic.window;
import plastic.size;
import plastic.app_context;
import plastic.element;
import plastic.view;
import plastic.platform;
import plastic.window_manager;
import plastic.window_options;
import plastic.window_base;

export namespace plastic
{
    struct Application {
        std::string app_name_;
        Size<float> default_window_size;
        std::shared_ptr<context::AppContext> app_context_;

        std::shared_ptr<WindowManager> window_manager_;

        // std::shared_ptr<Platform> platform_{};
        bool is_running_{false};

        Application(std::string  app_name, const Size<float>& default_window_size)
            :app_name_(std::move(app_name)), default_window_size(default_window_size) {}

        explicit Application(std::string app_name = "Plastic App")
            :app_name_(std::move(app_name)) {
            app_context_ = std::make_shared<context::AppContext>();
            // platform_ = std::make_shared<Platform>(app_context_);
        }

        class Builder {
            std::string app_name {"Plastic App"};
            Size<float> default_window_size{800, 600};


        public:
            Builder& with_name(const std::string& name) {
                app_name = name;
                return *this;
            }

            Builder& with_default_window_size(const Size<float>& size) {
                default_window_size = size;
                return *this;
            }

            std::unique_ptr<Application> build() {
                return std::make_unique<Application>(app_name, default_window_size);
            }
        };

        static Builder create() {
            return {};
        }

        class WindowBuilder {
            std::shared_ptr<Window> window{};
        public:
            explicit WindowBuilder(std::shared_ptr<Window> w) : window(std::move(w)) {}

            WindowBuilder& with_title(const std::string& title) {
                window->set_title(title);
                return *this;
            }

            WindowBuilder& with_root(const std::shared_ptr<View>& root) {
                window->set_root(root);
                return *this;
            }

            WindowBuilder& with_size(const Size<float>& size) {
                window->handle_resize(size);
                return *this;
            }

            std::shared_ptr<Window> build() { return window; }

        };

        [[nodiscard]] std::shared_ptr<WindowBase> create_window() const {
            return window_manager_->create_window(
                WindowOptions{}
                    .with_title(app_name_)
                    .with_size(default_window_size)
        );
        }

        virtual ~Application() = default;

    private:
        bool should_close{false};
        bool loop{true};

        std::vector<std::shared_ptr<Window>> windows{};

    public:

        void set_should_close(const bool should_close) {
            this->should_close = should_close;
        }


        [[noreturn]] virtual void run() {
            is_running_ = true;
            while (!should_close) {
                // Main application loop logic
            }
            throw std::runtime_error("Application exited run loop");

        };
        virtual void close() {
            should_close = true;
            is_running_ = false;
        };
        virtual void stop() {
            is_running_ = false;

        };




        // Main application run with context



    };
}
