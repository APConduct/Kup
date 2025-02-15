//
// Created by ajost1 on 1/30/2025.
//
module;


#include <memory>
#include <vector>
export module plastic.app_context;
import plastic.window_base;
import plastic.event_dispatcher;
import plastic.window_options;
import plastic.context;


export namespace plastic::context
{
    struct AppContext  : std::enable_shared_from_this<AppContext> {

    private:
        EventDispatcher event_dispatcher_;
        int next_window_id_{0};

    public:















        // Context passing pattern
        template<typename F>
        auto with_context(F&& f) -> decltype(f(*this)) {
            return f(*this);
        }

        template<typename F>
        auto run(F&& f) -> decltype(f(*this)) {
            return with_context(std::forward<F>(f));
        }



        EventDispatcher& events() {
            return event_dispatcher_;
        }

        [[nodiscard]] int next_window_id() const {
            return next_window_id_;
        }

        void increment_window_id() {
            next_window_id_++;
        }








    };
}
