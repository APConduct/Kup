//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <memory>
#include <functional>
#include <vector>
#include <unordered_map>
#include <string>
#include <any>

export module plastic.reactive;

export namespace plastic::reactive
{
    ///@brief Observable value that can be watched for changes
    template<typename T>
    class Observable {
    private:
        /// @brief The current value of the observable
        T value_;

        /// @brief A list of observers that will be notified when the value changes
        std::vector<std::function<void(const T&)>> observers_;

        /// @brief The name of the observable
        std::string name_;

    public:

        /// @brief Default constructor
        /// @param initial The initial value of the observable
        /// @param name The name of the observable
        explicit Observable(T initial, std::string name = "")
            : value_(std::move(initial)), name_(std::move(name)) {}

        /// @brief Copy constructor
        /// @return A reference to the current instance of the observable
        const T& get() const { return value_; }

        /// @brief set the value of the observable
        void set(T new_value) {
            if (value_ != new_value) {
                value_ = std::move(new_value);
                notify();
            }
        }

        /// @brief Notify all observers of the change
        void notify() const {
            for (const auto& observer : observers_) {
                observer(value_);
            }
        }

        /// @brief Observe the observable for changes
        /// @param observer The function to be called when the value changes
        void observe(std::function<void(const T&)> observer) {
            observers_.push_back(std::move(observer));
            // Call immediately with current value
            observers_.back()(value_);
        }

        // Operator overloads for convenience

        /// @brief Implicit conversion to the underlying type
        /// @return The current value of the observable
        explicit operator const T&() const { return value_; }

        // Assign new value

        /// @brief Assignment operator
        /// @param new_value The new value to be assigned
        Observable& operator=(const T& new_value) {
            set(new_value);
            return *this;
        }

        // Allow method access for class types

        /// @brief Access operator for class types
        template<typename U = T>
        std::enable_if_t<std::is_class_v<U>, const U*> operator->() const {
            return &value_;
        }

        /// @brief pretty getter for the name of the observable
        /// @return The name of the observable
        [[nodiscard]] const std::string& name() const { return name_; }
    };

    /// @brief Create an observable value
    /// @tparam T The type of the observable value
    /// @param initial The initial value of the observable
    /// @param name The name of the observable
    /// @return An observable object
    template<typename T>
    Observable<T> observe(T initial, const std::string& name = "") {
        return Observable<T>(std::move(initial), name);
    }

    // Computed value based on other observables

    /// @brief Computed property that depends on other observables
    /// @tparam T The type of the computed value
    /// @tparam Args The types of the observable dependencies
    template<typename T, typename... Args>
    class Computed {
    private:

        /// @brief The function that computes the value
        /// @param Args The types of the observable dependencies
        /// @return The computed value
        std::function<T(const Args&...)> compute_fn_;

        /// @brief The current value of the computed property
        /// @param Args The types of the observable dependencies
        /// @return The computed value
        Observable<T> result_;
        std::tuple<const Observable<Args>&...> deps_;

        /// @brief Set up dependencies and observe changes
        /// @tparam Is The index sequence for the dependencies
        template<std::size_t... Is>
        void setup_dependencies(std::index_sequence<Is...>) {
            auto update = [this]() {
                result_.set(compute_fn_(std::get<Is>(deps_).get()...));
            };

            (std::get<Is>(deps_).observe([update](const auto&) { update(); }), ...);

            // Initial computation
            update();
        }

    public:

        /// @brief Default constructor
        /// @param compute_fn The function that computes the value
        /// @param deps The observables that this computed property depends on
        explicit Computed(std::function<T(const Args&...)> compute_fn,
                const Observable<Args>&... deps)
            : compute_fn_(std::move(compute_fn)),
              result_(compute_fn_(deps.get()...)),
              deps_(deps...) {
            setup_dependencies(std::index_sequence_for<Args...>{});
        }

        /// @brief Copy constructor
        /// @return A reference to the current instance of the computed property
        const T& get() const { return result_.get(); }

        /// @brief Observe the computed property for changes
        /// @param observer The function to be called when the value changes
        /// @return A reference to the current instance of the computed property
        void observe(std::function<void(const T&)> observer) {
            result_.observe(std::move(observer));
        }

        /// @brief Implicit conversion to the underlying type
        /// @return The current value of the computed property
        explicit operator const T&() const { return get(); }
    };

    /// @brief Create a computed value
    /// @tparam Fn The type of the computed value
    /// @tparam Args The types of the observable dependencies
    /// @param fn The function that computes the value
    /// @param deps The observables that this computed property depends on
    /// @return A computed object
    template<typename Fn, typename... Args>
    auto computed(Fn&& fn, const Observable<Args>&... deps) {
        using ResultType = std::invoke_result_t<Fn, const Args&...>;
        return Computed<ResultType, Args...>(std::forward<Fn>(fn), deps...);
    }

    /// @brief Bind an observable to an element property
    /// @tparam T The type of the observable value
    /// @tparam ElementT The type of the element
    /// @param observable The observable to bind
    /// @param element The element to bind to
    /// @param setter The setter function of the element
    /// @return A reference to the current instance of the observable
    template<typename T, typename ElementT>
    void bind(const Observable<T>& observable,
             std::shared_ptr<ElementT> element,
             void (ElementT::*setter)(const T&)) {
        observable.observe([element, setter](const T& value) {
            (element.get()->*setter)(value);
        });
    }

    /// @brief A store for application state
    class Store {
    private:

        /// @brief The current value of the store
        std::unordered_map<std::string, std::any> values_;

        /// @brief A list of observers that will be notified when the value changes
        std::unordered_map<std::string, std::vector<std::function<void()>>> observers_;

    public:

        /// @brief set the value of the store
        /// @tparam T The type of the value
        /// @param key The key of the value
        /// @param value The value to be set
        /// @return A reference to the current instance of the store
        template<typename T>
        void set(const std::string& key, T value) {
            values_[key] = std::move(value);
            notify(key);
        }

        /// @brief get the value of the store
        /// @tparam T The type of the value
        /// @param key The key of the value
        /// @return The value of the store
        template<typename T>
        T get(const std::string& key) const {
            auto it = values_.find(key);
            if (it != values_.end()) {
                return std::any_cast<T>(it->second);
            }
            return T{};
        }

        /// @brief check if the store has a value
        /// @param key The key of the value
        /// @param observer The function to be called when the value changes
        /// @return true if the store has the value, false otherwise
        void observe(const std::string& key, std::function<void()> observer) {
            observers_[key].push_back(std::move(observer));
        }

        /// @brief check if the store has a value
        /// @param key The key of the value
        /// @return true if the store has the value, false otherwise
        void notify(const std::string& key) {
            auto it = observers_.find(key);
            if (it != observers_.end()) {
                for (const auto& observer : it->second) {
                    observer();
                }
            }
        }
    };
}