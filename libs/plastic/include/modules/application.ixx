//
// Created by ajost1 on 1/30/2025.
//
module;
#include <memory>
#include <vector>
#include <functional>
#include <string>
export module plastic.application;

import plastic.window;
import plastic.size;
import plastic.context;
import plastic.element;
import plastic.view;

export namespace plastic
{
    struct Application {



        std::string app_name;
        Size<float> default_window_size;

        Application(std::string  app_name, const Size<float>& default_window_size)
            :app_name(std::move(app_name)), default_window_size(default_window_size) {}

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
            std::shared_ptr<Window> window;
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

        std::shared_ptr<Window> create_window() {
            auto window = std::make_shared<Window>(default_window_size);
            windows.push_back(window);
            return window;
        }

        virtual ~Application() = default;

    private:
        bool should_close{false};
        bool loop{true};

        std::vector<std::shared_ptr<Window>> windows;

    public:

        void set_should_close(const bool should_close) {
            this->should_close = should_close;
        }


        [[noreturn]] virtual void run();
        virtual void close();
        virtual void stop();



    };
}
