//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <vector>
#include <functional>
#if defined(_WIN32)
#include <memory>
#endif
export module plastic.data_binding;

export namespace plastic {
    template <typename T>
    class Observable {
    private:
        T value_;
        mutable std::vector<std::function<void(const T&)>> observers_;

    public:
        explicit Observable(T initial_value) : value_(std::move(initial_value)) {}

        const T& get() const { return value_; }

        void set(const T& new_value) {
            if (value_ != new_value) {
                value_ = new_value;
                notify();
            }
        }

        void notify() const {
            for (const auto& observer : observers_) {
                observer(value_);
            }
        }

        void observe(std::function<void(const T&)> observer) const {
            observers_.push_back(std::move(observer));
            observer(value_); // Initial notification
        }

        // Operators for more natural usage
        Observable& operator=(const T& new_value) {
            set(new_value);
            return *this;
        }

        explicit operator const T&() const { return get(); }
    };

    // Computed property that depends on other observables
    template <typename T>
    class Computed {
    private:
        std::function<T()> compute_;
        Observable<T> value_;
        std::vector<std::function<void()>> dependencies_;

    public:
        template <typename F, typename... Args>
        explicit Computed(F compute_fn, const Observable<Args>&... dependencies)
            : compute_(compute_fn), value_(compute_fn()) {
            // Add dependencies
            (add_dependency(dependencies), ...);
        }

        const T& get() const { return value_.get(); }

        void observe(std::function<void(const T&)> observer) const {
            value_.observe(std::move(observer));
        }

        explicit operator const T&() const { return get(); }

    private:
        template <typename U>
        void add_dependency(const Observable<U>& dep) {
            dep.observe([this](const U&) {
                value_.set(compute_());
            });
        }
    };

    // Bind an observable to an element property
    template <typename T, typename ElementT>
    void bind(const Observable<T>& observable,
             std::shared_ptr<ElementT> element,
             void (ElementT::*setter)(const T&)) {
        observable.observe([element, setter](const T& value) {
            (element.get()->*setter)(value);
        });
    }

    // Shorthand for two-way binding
    template <typename T, typename ElementT>
    void bind_two_way(Observable<T>& observable,
                     std::shared_ptr<ElementT> element,
                     void (ElementT::*setter)(const T&),
                     std::function<T(const ElementT&)> getter,
                     const std::function<void(std::function<void()>)>& on_change) {
        // One way: observable -> element
        bind(observable, element, setter);

        // Other way: element -> observable
        on_change([&observable, element, getter]() {
            observable.set(getter(*element));
        });
    }
}

