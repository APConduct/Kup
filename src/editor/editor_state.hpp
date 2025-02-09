//
// Created by ajost1 on 2/2/2025.
//

#ifndef EDITOR_STATE_HPP
#define EDITOR_STATE_HPP
#include <memory>
#include "buffer.hpp"

namespace kup
{
    struct EditorState {
        std::shared_ptr<Buffer> buffer;

        bool has_focus{false};

        // View state
        Font font{};
        float font_size{20.0f};
        float spacing{1.0f};

        // UI state
        bool show_line_numbers{true};
        bool show_minimap{false};
        bool is_focused{false};
        bool auto_delete{false};

        // Scroll and cursor state
        float scroll_x{0};
        float scroll_y{0};
        BufferPosition cursor{};

        // Theme/styling
        struct Theme {
            Color background{BLACK};
            Color text{WHITE};
            Color cursor{WHITE};
            Color line_numbers{GRAY};
            Color selection{BLUE};
        } theme;

        // Editor settings
        struct {
            bool wrap_text{false};
            bool show_whitespace{false};
            size_t tab_size{4};
            bool use_spaces_for_tabs{true};
        } settings;

        // features state
        struct {
            bool minimap_enabled{false};
            float minimap_scale{0.1f};
            bool status_bar_visible{true};
            bool gutter_visible{true};
        } features;

    };
}

#endif //EDITOR_STATE_HPP
