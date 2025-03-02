//
// Created by Aidan Jost on 3/2/25.
//

#include "app.hpp"

namespace kup
{
    App::App(const Config& config)
        : config(config)
    {
        initialize_views();
    }

    void App::initialize_views() {
        file_tree = FileTreeView::create()
            .with_font(config.font, config.font_size, config.spacing)
            .with_callback([this] (const std::string& path) {
                open_file(path);
            })
            .build();

        file_tree->load_directory(GetWorkingDirectory());

        editor_view = EditorView::create()
            .with_font(config.font, config.font_size, config.spacing)
            .show_line_numbers(true)
            .build();
    }

    void App::update(float delta_time) {
        if (file_tree) file_tree->update(delta_time);
        if (editor_view) editor_view->update(delta_time);
        handle_keyboard_shortcuts();
    }

    void App::render() {
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


    }

    void App::handle_keyboard_shortcuts() {
        if (IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL)) {
            if (IsKeyPressed(KEY_O)) {
                // TODO: Implement file dialog
            }
            if (IsKeyPressed(KEY_S)) {
                // TODO: Implement save
            }
        }
    }
    void App::open_file(const std::string& path) {
        if (auto buffer = std::make_shared<Buffer>(path)) {
            editor_view->set_state([&](EditorState& state) {
                state.buffer = buffer;
            });
        }

    }






}
