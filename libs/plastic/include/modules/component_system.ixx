//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <functional>
#if defined(_WIN32)
#include <memory>
#endif
export module plastic.component_system;

import plastic.element;
import plastic.context;

export namespace plastic
{
    // A hook system for functional component composition
    template<typename T>
    class State {
    private:
        T value_;
        std::function<void(const T&)> on_change_;

    public:
        explicit State(T initial) : value_(std::move(initial)) {}

        const T& get() const { return value_; }

        void set(const T& new_value) {
            if (value_ != new_value) {
                value_ = new_value;
                if (on_change_) on_change_(value_);
            }
        }

        void on_change(std::function<void(const T&)> callback) {
            on_change_ = std::move(callback);
        }

        // Operator overloads for convenience
        explicit operator const T&() const { return value_; }

        auto operator->() const { return &value_; }
    };

    // A component function that returns an element
    using ComponentFn = std::function<std::shared_ptr<Element>(Context*)>;

    // Creates a component with state
    template<typename T>
    ComponentFn stateful_component(T initial_state,
                                  std::function<std::shared_ptr<Element>(Context*, State<T>&)> render) {
        auto state = std::make_shared<State<T>>(std::move(initial_state));

        return [state, render](Context* cx) {
            return render(cx, *state);
        };
    }

    // For effects that run on component mount/unmount
    void use_effect(Context* cx,
                   std::function<void()> setup,
                   std::function<void()> cleanup = nullptr);


}