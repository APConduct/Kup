//
// Created by ajost1 on 1/30/2025.
//
module;


#include <memory>
#include <vector>
export module plastic.app_context;
import plastic.window_base;
import plastic.event_dispatcher;



export namespace plastic::context
{
    struct AppContext  : std::enable_shared_from_this<AppContext> {

    private:
        EventDispatcher event_dispatcher_;

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










    };
}
