//
// Created by Aidan Jost on 3/2/25.
//

#include "app.hpp"

#include <iostream>

#include "tinyfiledialogs.h"

namespace kup
{
    class SimpleContext : public plastic::Context{
    public:
        void request_layout() override {}
        void request_paint() override {}
        void dispatch_event(const plastic::events::Event& event) override{};
    };
    App::App(const Config& config)
        : config(config)
    {
        initialize_views();
    }

    void App::initialize_views() {

        context_ = std::make_shared<SimpleContext>();

        file_tree = FileTreeView::create()
            .with_font(config.font, config.font_size, config.spacing)
            .with_callback([this] (const std::string& path) {
                open_file(path);
            })
            .build();

        file_tree->mount(context_.get());
        file_tree->load_directory(GetWorkingDirectory());

        editor_view = EditorView::create()
            .with_font(config.font, config.font_size, config.spacing)
            .show_line_numbers(true)
            .build();

        // Initialize with empty buffer
        auto empty_buffer = std::make_shared<Buffer>();
        editor_view->set_state([empty_buffer](EditorState& state) {
            state.buffer = empty_buffer;
        });

        editor_view->mount(context_.get());
    }

    void App::update(float delta_time) {
        if (file_tree) file_tree->update(delta_time);
        if (editor_view) editor_view->update(delta_time);
        handle_keyboard_shortcuts();
    }

    void App::render() const {
        ClearBackground(BLACK);

        const auto window_width = static_cast<float>(GetScreenWidth());
        const auto window_height = static_cast<float>(GetScreenHeight());

        // Calculate view areas
        plastic::Rect<float> file_tree_bounds{
            MARGIN,
            TOP_BAR_HEIGHT,
            FILE_TREE_WIDTH - MARGIN * 2,
            window_height - TOP_BAR_HEIGHT - MARGIN * 2

        };

        plastic::Rect<float> editor_bounds{
            FILE_TREE_WIDTH + MARGIN,
            TOP_BAR_HEIGHT,
            window_width - FILE_TREE_WIDTH - MARGIN * 2,
            window_height - TOP_BAR_HEIGHT - MARGIN * 2
        };

        // Draw backgrounds
        DrawRectangle(
            static_cast<int>(file_tree_bounds.x()),
            static_cast<int>(file_tree_bounds.y()),
            static_cast<int>(file_tree_bounds.width()),
            static_cast<int>(file_tree_bounds.height()),
            Color{30, 30, 30, 255}
        );

        DrawRectangle(
            static_cast<int>(editor_bounds.x()),
            static_cast<int>(editor_bounds.y()),
            static_cast<int>(editor_bounds.width()),
            static_cast<int>(editor_bounds.height()),
            Color{40, 40, 40, 255}
        );

        // Render views
        if (file_tree) {
            BeginScissorMode(
                static_cast<int>(file_tree_bounds.x()),
                static_cast<int>(file_tree_bounds.y()),
                static_cast<int>(file_tree_bounds.width()),
                static_cast<int>(file_tree_bounds.height())
            );

            // Debug output
            std::cout << "Rendering file tree" << std::endl;
            auto element = file_tree->render(context_.get());

            if (element) {
                std::cout << "File tree element rendered" << std::endl;
                element->set_bounds(file_tree_bounds);
                element->paint(context_.get());
            }else {
                std::cout << "File tree element is null" << std::endl;

            }

            EndScissorMode();
        }



        if (editor_view) {
            const EditorState& editor_state = editor_view->get_state();

            if (editor_state.buffer != nullptr) {
                BeginScissorMode(
                   static_cast<int>(editor_bounds.x()),
                   static_cast<int>(editor_bounds.y()),
                   static_cast<int>(editor_bounds.width()),
                   static_cast<int>(editor_bounds.height())
               );

                auto element = editor_view->render(context_.get());
                if (element) {
                    element->set_bounds(editor_bounds);
                    element->paint(context_.get());
                }

                EndScissorMode();
            }
        }

        draw_dividers();


    }

    void App::handle_keyboard_shortcuts() {
        if (IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL)) {
            if (IsKeyPressed(KEY_O)) {
                // Open file dialog
                char const* path = tinyfd_openFileDialog(
                    "Open File",
                    "",
                    0,
                    nullptr,
                    nullptr,
                    0
                );

                if (path != nullptr) {
                    open_file(path);
                }
            }
            if (IsKeyPressed(KEY_S)) {
                // TODO: Implement save
            }
        }
    }
    void App::open_file(const std::string& path) {
        if (auto buffer = std::make_shared<Buffer>(path)) {
            editor_view->set_state([buffer](EditorState& state) {
                state.buffer = buffer;
            });
        }

    }



    void App::draw_dividers() const {
        const float window_height = static_cast<float>(GetScreenHeight());

        // Draw vertical divider
        DrawLineEx(
            {FILE_TREE_WIDTH, 0},
            {FILE_TREE_WIDTH, window_height},
            config.line_width,
            WHITE
        );

        // Draw horizontal divider
        DrawLineEx(
            {0, window_height - config.space_below},
            {static_cast<float>(GetScreenWidth()), window_height - config.space_below},
            config.line_width,
            WHITE
        );
    }




}
