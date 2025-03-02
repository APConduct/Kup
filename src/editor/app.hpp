//
// Created by Aidan Jost on 2/25/25.
//

#ifndef KUP_EDITOR_APP_HPP
#define KUP_EDITOR_APP_HPP

#include <memory>
#include <raylib.h>
#include "file_tree_view.hpp"
#include "editor_view.hpp"

namespace kup
{
    class App {
        struct Config {
            Font font;
            float font_size{20.0f};
            float spacing{1.0f};
            float space_below;
            float content_start_x{208};
            float content_start_y{40};
            float line_width{2};

            explicit Config(const Font& f, const float size, const float space, const float below)
                : font(f), font_size(size), spacing(space), space_below(below) {}
        };

    private:
        Config config;
        std::shared_ptr<FileTreeView> file_tree;
        std::shared_ptr<EditorView> editor_view;

        static constexpr float FILE_TREE_WIDTH = 200.0f;
        static constexpr float TOP_BAR_HEIGHT = 40.0f;
        static constexpr float MARGIN = 8.0f;

    public:
        explicit App(const Config& config);
        void update(float delta_time);
        void render();

    private:
        void initialize_views();
        void handle_keyboard_shortcuts();
        void open_file(const std::string& path);
        void draw_dividers() const;

        void draw_divider(float x, float y, float width, float height) const;
        void handle_event(const plastic::events::Event& event);
        void handle_file_tree_event(const plastic::events::Event& event);
    };
};


#endif //KUP_EDITOR_APP_HPP
