//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <functional>
#include <memory>
#include <string>


export module plastic.run;
import plastic.app;
import plastic.app_builder;
import plastic.window;
import plastic.window_events;
import plastic.element;
import plastic.view;
import plastic.context;
import plastic.graphics;
import plastic.color;
import plastic.size;
import plastic.view_wrapper;

export namespace plastic
{
    inline int run(std::string title,
              std::function<std::shared_ptr<Element>(Context*)> create_ui_fn,
              Size<float> size = Size<float>{800, 600},
              Color bg_color = Color::rgb(30, 30, 30)) {

        // Create an App instance
        App app(title, size);
        if (!app.init()) {
            return 1;  // Error handling
        }

        // Create a simple view that just delegates to the user's UI creation function
        class SimpleView : public View {
        private:
            std::function<std::shared_ptr<Element>(Context*)> create_ui_fn_;
            Color bg_color_;

        public:
            SimpleView(std::function<std::shared_ptr<Element>(Context*)> create_ui_fn, Color bg_color)
                : create_ui_fn_(std::move(create_ui_fn)), bg_color_(bg_color) {}

            std::shared_ptr<Element> render(Context* cx) const override {
                return create_ui_fn_(cx);
            }

            void on_mount() override {
                set_background_color(bg_color_);
            }
        };

        // Create the view with the user's UI function
        auto view = std::make_shared<SimpleView>(create_ui_fn, bg_color);

        // Create a window and set the view
        auto window = app.create_window<ViewWrapper>();
        window->set_root(view);

        // Run the app and return the result
        app.run();
        return 0;
    }
}
