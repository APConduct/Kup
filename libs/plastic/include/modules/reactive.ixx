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

import plastic.element;

export namespace plastic::reactive
{
    // Observable value that can be watched for changes
    template<typename T>
    class Observable {
    private:
        T value_;
        std::vector<std::function<void(const T&)>> observers_;
        std::string name_;

    public:
        explicit Observable(T initial, std::string name = "")
            : value_(std::move(initial)), name_(std::move(name)) {}

        const T& get() const { return value_; }

        void set(T new_value) {
            if (value_ != new_value) {
                value_ = std::move(new_value);
                notify();
            }
        }

        void notify() const {
            for (const auto& observer : observers_) {
                observer(value_);
            }
        }

        void observe(std::function<void(const T&)> observer) {
            observers_.push_back(std::move(observer));
            // Call immediately with current value
            observers_.back()(value_);
        }

        // Operator overloads for convenience
        operator const T&() const { return value_; }

        // Assign new value
        Observable& operator=(const T& new_value) {
            set(new_value);
            return *this;
        }

        // Allow method access for class types
        template<typename U = T>
        typename std::enable_if<std::is_class<U>::value, const U*>::type operator->() const {
            return &value_;
        }

        const std::string& name() const { return name_; }
    };

    // Create an observable value
    template<typename T>
    Observable<T> observe(T initial, const std::string& name = "") {
        return Observable<T>(std::move(initial), name);
    }

    // Computed value based on other observables
    template<typename T, typename... Args>
    class Computed {
    private:
        std::function<T(const Args&...)> compute_fn_;
        Observable<T> result_;
        std::tuple<const Observable<Args>&...> deps_;

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
        Computed(std::function<T(const Args&...)> compute_fn,
                const Observable<Args>&... deps)
            : compute_fn_(std::move(compute_fn)),
              result_(compute_fn_(deps.get()...)),
              deps_(deps...) {
            setup_dependencies(std::index_sequence_for<Args...>{});
        }

        const T& get() const { return result_.get(); }

        void observe(std::function<void(const T&)> observer) {
            result_.observe(std::move(observer));
        }

        operator const T&() const { return get(); }
    };

    // Create a computed value
    template<typename Fn, typename... Args>
    auto computed(Fn&& fn, const Observable<Args>&... deps) {
        using ResultType = std::invoke_result_t<Fn, const Args&...>;
        return Computed<ResultType, Args...>(std::forward<Fn>(fn), deps...);
    }

    // Bind an observable to an element property
    template<typename T, typename ElementT>
    void bind(const Observable<T>& observable,
             std::shared_ptr<ElementT> element,
             void (ElementT::*setter)(const T&)) {
        observable.observe([element, setter](const T& value) {
            (element.get()->*setter)(value);
        });
    }

    // A store for application state
    class Store {
    private:
        std::unordered_map<std::string, std::any> values_;
        std::unordered_map<std::string, std::vector<std::function<void()>>> observers_;

    public:
        template<typename T>
        void set(const std::string& key, T value) {
            values_[key] = std::move(value);
            notify(key);
        }

        template<typename T>
        T get(const std::string& key) const {
            auto it = values_.find(key);
            if (it != values_.end()) {
                return std::any_cast<T>(it->second);
            }
            return T{};
        }

        void observe(const std::string& key, std::function<void()> observer) {
            observers_[key].push_back(std::move(observer));
        }

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