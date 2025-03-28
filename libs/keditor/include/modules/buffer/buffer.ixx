
//
// Created by Aidan Jost on 3/21/25.
//

module;
#include <raylib.h>
#include <string>
#include <vector>
export module keditor.buffer.buffer;

import keditor.core.types;
import keditor.buffer.piece_table;
import plastic;


export namespace keditor
{
    template<typename CharT>
    class Buffer : public plastic::Element {
    public:
        using char_type = CharT;
        using string_type = std::basic_string<CharT>;

    protected:
        PieceTable<CharT> content_{};
        Position cursor_{};
        std::optional<Range> selection_{};

        struct CompositionState {
            string_type buffer;
            bool is_active{false};
            float timer{0.0f};
            static constexpr float TIMEOUT = 0.5f;
            size_t delete_counter{0};

            void reset() {
                buffer.clear();
                is_active = false;
                timer = 0.0f;
                delete_counter = 0;
            }
        } composition_;

        // Visual state
        struct {
            float scroll_x{0.0f};
            float scroll_y{0.0f};
        } visual_;

        struct LineCache {
            struct Line {
                string_type text;
                plastic::Point<float> position;
                plastic::Size<float> size;
                bool is_dirty{true};
            };
            std::vector<Line> lines_;
            bool is_dirty{true};

            void invalidate() {
                is_dirty = true;
            }
        } line_cache_;

    public:
        explicit Buffer(const string_type initial = {}) : content_{initial} {
            // update_line_cache();
        }

        void layout(plastic::Context* cx) override {
            if (line_cache_.is_dirty) {
                // update_line_cache();
            }
        };

        void paint(plastic::Context* cx) const override {
            plastic::Rect clip_rect = bounds;
            BeginScissorMode(
                static_cast<int>(clip_rect.x()),
                static_cast<int>(clip_rect.y()),
                static_cast<int>(clip_rect.width()),
                static_cast<int>(clip_rect.height()));

            /// ...
        };
    };
}
