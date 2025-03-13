//
// Created by Aidan Jost on 3/7/25.
//

module;

#if defined(_WIN32)
#include <bits/stdc++.h>
#elif defined(__APPLE__)
#include <__algorithm/ranges_max.h>
#include <__algorithm/ranges_min.h>
#endif
#include <raylib.h>
export module plastic.optimized_renderer;
import plastic.element;
import plastic.context;
import plastic.rect;

export namespace plastic
{
    bool needs_redraw{false};
    Rect<float> dirty_region;

    void mark_dirty(const Rect<float>& region) {
        if (!needs_redraw) {
            dirty_region = region;
        } else {
            // Union operation to expand dirty region
            float x1 = std::ranges::min(dirty_region.x(), region.x());
            float y1 = std::ranges::min(dirty_region.y(), region.y());
            float x2 = std::ranges::max(dirty_region.x() + dirty_region.width(), region.x() + region.width());
            float y2 = std::ranges::max(dirty_region.y() + dirty_region.height(), region.y() + region.height());
            dirty_region = Rect<float>(x1, y1, x2, y2);
        }
        needs_redraw = true;
    }

    void render(const Element& element, Context* cx) {
        if (!needs_redraw) return;

        BeginScissorMode(
            static_cast<int>(dirty_region.x()),
            static_cast<int>(dirty_region.y()),
            static_cast<int>(dirty_region.width()),
            static_cast<int>(dirty_region.height())
            );
        element.paint(cx);
        EndScissorMode();
        needs_redraw = false;

    }
}
