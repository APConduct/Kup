//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <functional>
#include <vector>
#include <memory>
export module plastic.state;

import plastic.context;
import plastic.element;
import plastic.events;

export namespace plastic
{
    // A reactive state container
    template <typename T>
    class State {
    private:
        T value_;
        std::vector<std::function<void(const T&)>> listeners_;

    public:
        explicit State(T initial) : value_(std::move(initial)) {}

        const T& get() const { return value_; }

        void set(T new_value) {
            if (value_ != new_value) {
                value_ = std::move(new_value);
                notify();
            }
        }

        void update(std::function<void(T&)> updater) {
            updater(value_);
            notify();
        }

        void notify() {
            for (const auto& listener : listeners_) {
                listener(value_);
            }
        }

        void listen(std::function<void(const T&)> listener) {
            listeners_.push_back(std::move(listener));
            // Immediately call with current value
            listeners_.back()(value_);
        }

        // For use in expressions
        operator const T&() const { return value_; }

        // Allow method chaining for object types
        template <typename U = T>
        std::enable_if_t<std::is_class_v<U>, const U*> operator->() const {
            return &value_;
        }
    };

    // Create a state container
    template <typename T>
    inline State<T> state(T initial_value) {
        return State<T>(std::move(initial_value));
    }

    // Create a dynamic element that updates based on state
    template <typename T>
    inline std::shared_ptr<Element> watch(
        const State<T>& state,
        std::function<std::shared_ptr<Element>(const T&)> render_fn
    ) {
        class WatchElement : public Element {
        private:
            const State<T>& state_;
            std::function<std::shared_ptr<Element>(const T&)> render_fn_;
            std::shared_ptr<Element> current_element_;

        public:
            WatchElement(const State<T>& state,
                        std::function<std::shared_ptr<Element>(const T&)> render_fn)
                : state_(state), render_fn_(std::move(render_fn)) {

                // Create initial element
                update_element();

                // Listen for state changes
                state_.listen([this](const T&) {
                    update_element();
                    invalidate();
                });
            }

            void update_element() {
                current_element_ = render_fn_(state_.get());
            }

            void layout(Context* cx) override {
                if (current_element_) {
                    current_element_->layout(cx);
                    current_size = current_element_->get_current_size();
                }
            }

            void paint(Context* cx) const override {
                if (current_element_) {
                    current_element_->paint(cx);
                }
            }

            bool process_event(const events::Event& event, Context* cx) override {
                if (current_element_) {
                    return current_element_->handle_event(event, cx);
                }
                return false;
            }
        };

        return std::make_shared<WatchElement>(state, std::move(render_fn));
    }

    // Derived state that updates based on other state
    template <typename T, typename Fn>
    inline auto derived(const State<T>& state, Fn&& derive_fn) {
        using ResultType = decltype(derive_fn(std::declval<T>()));
        auto derived_state = State<ResultType>(derive_fn(state.get()));

        state.listen([derived_state, derive_fn](const T& value) {
            derived_state.set(derive_fn(value));
        });

        return derived_state;
    }

    // Combine two states into a pair
    template <typename T1, typename T2>
    inline auto state_pair(const State<T1>& s1, const State<T2>& s2) {
        auto combined = state(std::pair<T1, T2>(s1.get(), s2.get()));

        s1.listen([combined, &s2](const T1& v1) {
            combined.set(std::pair<T1, T2>(v1, s2.get()));
        });

        s2.listen([combined, &s1](const T2& v2) {
            combined.set(std::pair<T1, T2>(s1.get(), v2));
        });

        return combined;
    }

    // Combine three states
    template <typename T1, typename T2, typename T3>
    inline auto state_tuple(const State<T1>& s1, const State<T2>& s2, const State<T3>& s3) {
        auto combined = state(std::tuple<T1, T2, T3>(s1.get(), s2.get(), s3.get()));

        s1.listen([combined, &s2, &s3](const T1& v1) {
            combined.set(std::tuple<T1, T2, T3>(v1, s2.get(), s3.get()));
        });

        s2.listen([combined, &s1, &s3](const T2& v2) {
            combined.set(std::tuple<T1, T2, T3>(s1.get(), v2, s3.get()));
        });

        s3.listen([combined, &s1, &s2](const T3& v3) {
            combined.set(std::tuple<T1, T2, T3>(s1.get(), s2.get(), v3));
        });

        return combined;
    }

    // Map a collection of states
    template <typename T, typename Fn>
    inline auto map_state(const std::vector<State<T>>& states, Fn&& map_fn) {
        // Initial mapping
        std::vector<T> values;
        values.reserve(states.size());
        for (const auto& s : states) {
            values.push_back(s.get());
        }

        using ResultType = decltype(map_fn(values));
        auto result = state<ResultType>(map_fn(values));

        // Listen to all source states
        for (size_t i = 0; i < states.size(); i++) {
            states[i].listen([result, &states, map_fn, i](const T&) {
                std::vector<T> updated_values;
                updated_values.reserve(states.size());
                for (const auto& s : states) {
                    updated_values.push_back(s.get());
                }
                result.set(map_fn(updated_values));
            });
        }

        return result;
    }
}
