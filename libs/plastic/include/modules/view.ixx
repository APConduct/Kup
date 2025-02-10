//
// Created by ajost1 on 1/29/2025.
//
module;
#include <memory>
export module plastic.view;

import plastic.element;
import plastic.model;
import plastic.context;
import plastic.events;

export namespace plastic
{
    struct View {
    protected:
        Context* cx_{nullptr};
    public:
        virtual ~View() = default;

        virtual std::shared_ptr<Element> render(Context* cx) const = 0;

        virtual void update(float delta_time) {};

        virtual void handle_event(events::Event& event, Context* cx) {};

        virtual void mount(Context* cx) {
            cx_ = cx;
        }

        virtual void unmount(Context* cx) {
            cx_ = nullptr;
        }

        [[nodiscard]] Context* get_context() const { return cx_; }

        template <typename Self>
        struct Builder {
        protected:
            Self& self() { return *static_cast<Self*>(this); }
        };

    };
}
