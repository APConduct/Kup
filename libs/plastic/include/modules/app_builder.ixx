//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <string>
#include <functional>
export module plastic.app_builder;

import plastic.element;
import plastic.context;
import plastic.size;
import plastic.color;
import plastic.app;
import plastic.window;
import plastic.view;
import plastic.layout_properties;
import plastic.elements.containers;
import plastic.view_wrapper;

export namespace plastic
{
    class AppBuilder {
    private:
        std::string title_{"Plastic App"};
        Size<float> size_{800, 600};
        Color background_color_{Color::rgb(30, 30, 30)};
        std::function<std::shared_ptr<Element>(Context*)> build_ui_;
        std::shared_ptr<View> root_view_;
        bool fullscreen_{false};
        bool maximized_{false};
        bool decorations_{true};
        bool transparent_{false};


    public:
        AppBuilder& title(std::string title) {
            title_ = std::move(title);
            return *this;
        }

        AppBuilder& size(float width, float height) {
            size_ = Size<float>{width, height};
            return *this;
        }

        AppBuilder& size(const Size<float>& size) {
            size_ = size;
            return *this;
        }

        AppBuilder& background(Color color) {
            background_color_ = color;
            return *this;
        }

        // UI builder accepting a function that creates UI elements
        AppBuilder& ui(std::function<std::shared_ptr<Element>(Context*)> builder) {
            build_ui_ = std::move(builder);
            return *this;
        }

        // Run the app and return exit code
        int run() {
            // Create the app instance
            App app(title_, size_);
            if (!app.init()) {
                return 1; // Initialization failed
            }

            // Create window with the proper template parameters
            std::shared_ptr<Window> window;

            if (build_ui_ && !root_view_) {
                class FunctionView : public View {
                private:
                    std::function<std::shared_ptr<Element>(Context*)> build_ui_;
                    Color background_color_;

                public:
                    FunctionView(std::function<std::shared_ptr<Element>(Context*)> build_ui, Color bg_color)
                        : build_ui_(std::move(build_ui)), background_color_(bg_color) {}

                    std::shared_ptr<Element> render(Context* cx) const override {
                        // Create the user's UI
                        auto user_ui = build_ui_(cx);

                        // Create a container with background color
                        auto container = std::make_shared<FlexBox>();

                        // Set background color
                        auto style = container->get_style();
                        style.background_color_normal = background_color_;
                        container->set_style(style);

                        // Make container fill available space
                        container->set_layout_properties(
                            LayoutProperties()
                                .with_flex_grow(1)
                        );

                        // Add the user's UI as a child
                        container->add_child(user_ui);

                        return container;
                    }
                };

                root_view_ = std::make_shared<FunctionView>(build_ui_, background_color_);
            } else if (!root_view_) {
                // Create default empty view
                class EmptyView : public View {
                public:
                    std::shared_ptr<Element> render(Context* cx) const override {
                        auto container = std::make_shared<FlexBox>();
                        auto style = container->get_style();
                        style.background_color_normal = background_color_;
                        container->set_style(style);
                        return container;
                    }
                };

                root_view_ = std::make_shared<EmptyView>();
            }



            // Create window with concrete view wrapper
            window = app.create_window<ViewWrapper>(root_view_);

            if (window) {
                window->set_title(title_);

                // Apply window settings
                if (fullscreen_) {
                    window->set_fullscreen(true);
                } else if (maximized_) {
                    window->maximize();
                } else {
                    window->set_size(size_);
                }

                window->set_decorations(decorations_);
                window->set_transparent(transparent_);
            }

            // Run the app
            app.run();
            return 0;

            // Create function-based view
            class FunctionView : public View {
            private:
                std::function<std::shared_ptr<Element>(Context*)> build_ui_;
                Color background_color_;

            public:
                FunctionView(std::function<std::shared_ptr<Element>(Context*)> build_ui, Color bg_color)
                    : build_ui_(std::move(build_ui)), background_color_(bg_color) {}

                std::shared_ptr<Element> render(Context* cx) const override {
                    return build_ui_(cx);
                }

                void on_mount() override {
                    View::on_mount();
                    set_background_color(background_color_);
                }
            };

            // Create window and set view
            auto view = std::make_shared<FunctionView>(build_ui_, background_color_);
            window = app.create_window<ViewWrapper>(view);
            window->set_root(view);

            // Run the app
            app.run();
            return 0;
        }

        // For more advanced usage, build and return the App instance
        std::shared_ptr<App> build() {
            auto app = std::make_shared<App>(title_, size_);
            auto init_result = app->init();
            return app;
        }




    };

    // Factory function for app creation
    inline AppBuilder app() {
        return AppBuilder{};
    }
}
