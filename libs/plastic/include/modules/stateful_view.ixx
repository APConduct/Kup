//
// Created by ajost1 on 2/2/2025.
//
module;
#include <algorithm>

export module plastic.stateful_view;

import plastic.view;
import plastic.context;

export namespace plastic
{
    template <typename State>
    struct StatefulView : public View {
    protected:
        State state;
    public:
        explicit StatefulView(State initial_state) : state(std::move(initial_state)) {}

        template <typename F>
        void set_state(F&& updater) {
            updater(state);
            if (Context* cx = get_context()) {
                cx->request_layout();
            }
        }

        [[nodiscard]] const State& get_state() const {
            return state;
        }

        [[nodiscard]] State& get_state() {
            return state;
        }
    };
}
