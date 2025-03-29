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

    /// @brief Observable class for data binding
    /// @tparam T The type of the observable value
    /// @note This class allows you to create observable properties that can notify observers when their value changes.
    template <typename T>
    class Observable {
    private:
        /// @brief The current value of the observable
        T value_;

        /// @brief A list of observers that will be notified when the value changes
        mutable std::vector<std::function<void(const T&)>> observers_;

    public:

        /// @brief Default constructor
        explicit Observable(T initial_value) : value_(std::move(initial_value)) {}

        /// @brief Copy constructor
        /// @return A reference to the current instance of the observable
        const T& get() const { return value_; }

        /// @brief Get the current value of the observable
        /// @return The current value of the observable
        void set(const T& new_value) {
            if (value_ != new_value) {
                value_ = new_value;
                notify();
            }
        }

        /// @brief Notify all observers of the change
        /// @note This function is called when the value changes
        void notify() const {
            for (const auto& observer : observers_) {
                observer(value_);
            }
        }

        /// @brief Observe the observable for changes
        /// @param observer The function to be called when the value changes
        void observe(std::function<void(const T&)> observer) const {
            observers_.push_back(std::move(observer));
            observer(value_); // Initial notification
        }

        // Operators for more natural usage

        /// @brief Assignment operator
        /// @param new_value The new value to be assigned
        /// @return A reference to the current instance of the observable
        Observable& operator=(const T& new_value) {
            set(new_value);
            return *this;
        }

        /// @brief Implicit conversion to the underlying type
        /// @return The current value of the observable
        explicit operator const T&() const { return get(); }
    };

    /// @brief Computed property that depends on other observables
    /// @tparam T The type of the computed value
    template <typename T>
    class Computed {
    private:
        /// @brief The function that computes the value
        std::function<T()> compute_;

        /// @brief The current value of the computed property
        Observable<T> value_;

        /// @brief A list of dependencies that trigger recomputing
        std::vector<std::function<void()>> dependencies_;

    public:

        /// @brief Default constructor
        /// @param compute_fn The function that computes the value
        /// @param dependencies The observables that this computed property depends on
        template <typename F, typename... Args>
        explicit Computed(F compute_fn, const Observable<Args>&... dependencies)
            : compute_(compute_fn), value_(compute_fn()) {
            // Add dependencies
            (add_dependency(dependencies), ...);
        }

        /// @brief Copy constructor
        /// @return A reference to the current instance of the computed property
        const T& get() const { return value_.get(); }

        /// @brief observe the computed property for changes
        /// @param observer The function to be called when the value changes
        void observe(std::function<void(const T&)> observer) const {
            value_.observe(std::move(observer));
        }

        /// @brief implicit conversion to the underlying type
        /// @return The current value of the computed property
        explicit operator const T&() const { return get(); }

    private:

        /// @brief Add a dependency to the computed property
        /// @param dep The observable that this computed property depends on
        template <typename U>
        void add_dependency(const Observable<U>& dep) {
            dep.observe([this](const U&) {
                value_.set(compute_());
            });
        }
    };

    /// @brief Bind an observable to an element property
    /// @tparam T The type of the observable value
    /// @tparam ElementT The type of the element
    /// @param observable The observable to bind
    /// @param element The element to bind to
    /// @param setter The setter function of the element
    template <typename T, typename ElementT>
    void bind(const Observable<T>& observable,
             std::shared_ptr<ElementT> element,
             void (ElementT::*setter)(const T&)) {
        observable.observe([element, setter](const T& value) {
            (element.get()->*setter)(value);
        });
    }


    /// @brief Bind an observable to an element property in both directions
    /// @tparam T The type of the observable value
    /// @tparam ElementT The type of the element
    /// @param observable The observable to bind
    /// @param element The element to bind to
    /// @param setter The setter function of the element
    /// @param getter The getter function of the element
    /// @param on_change The function to be called when the observable changes
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

