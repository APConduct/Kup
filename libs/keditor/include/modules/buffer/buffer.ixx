
//
// Created by Aidan Jost on 3/21/25.
//

module;

export module keditor.buffer.buffer;

import keditor.core.types;
import keditor.buffer.piece_table;
import plastic;
#include <string>

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
    };
}
