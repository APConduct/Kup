#pragma once

#include <algorithm>
#include <raylib.h>
struct ScrollBar {
    bool is_vertical;
    bool is_dragging{false};
    float drag_start{0};
    float scroll_start{0};

    void render(Rectangle bounds, float content_size, float viewport_size, float& scroll_offset) {
        if (content_size <= viewport_size) return;

        float scroll_ratio = viewport_size / content_size;
        float handle_size = std::max(20.0f, viewport_size * scroll_ratio);
        float max_scroll = content_size - viewport_size;
        float handle_position = (scroll_offset/max_scroll) * (viewport_size-handle_size);

        // Draw track
        Color track_color = ColorAlpha(GRAY, 0.3f);
        DrawRectangleRec(bounds, track_color);

        // Draw handle
        Rectangle handle = bounds;
        if (is_vertical) {
            handle.height = handle_size;
            handle.y += handle_position;
        } else {
            handle.width = handle_size;
            handle.x += handle_position;
        }

        // Handle mouse interaction
        Vector2 mouse = GetMousePosition();
        bool mouse_over = CheckCollisionPointRec(mouse, handle);
        Color handle_color = mouse_over ? LIGHTGRAY : GRAY;

        if (mouse_over && IsMouseButtonDown(MOUSE_LEFT_BUTTON)) {
            is_dragging = true;
            drag_start = is_vertical ? mouse.y : mouse.x;
            scroll_start = scroll_offset;
        }

        if (is_dragging) {
            if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) {
                float delta = (is_vertical ? mouse.y : mouse.x) - drag_start;
                float scroll_delta = (delta / (viewport_size-handle_size)) * max_scroll;
                scroll_offset = std::clamp(scroll_start + scroll_delta, 0.0f, max_scroll);
            } else {
                is_dragging = false;
            }
        }

        DrawRectangleRec(handle, handle_color);
    }
};
