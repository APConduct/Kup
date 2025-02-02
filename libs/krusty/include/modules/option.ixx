//
// Created by ajost1 on 2/2/2025.
//

module;
#include <optional>
#include <stdexcept>
export module krusty.option;

export namespace plastic
{

    template<typename T>
    struct Option {
    private:
        std::optional<T> data;
    public:
        Option() : data(std::nullopt) {}
        explicit Option(const T& value) : data(value) {}

        static Option none() {
            return Option();
        }

        static Option some(const T& value) {
            return Option(value);
        }

        [[nodiscard]] bool is_some() const {
            return data.has_value();
        }

        [[nodiscard]] bool is_none() const {
            return !data.has_value();
        }

        T unwrap() const {
            if (!data) {
                throw std::runtime_error("Called unwrap on an empty Option");
            }
            return *data;
        }

        T unwrap_or(const T& default_value) const {
            return data.value_or(default_value);
        }

        template<typename U, typename F>
        Option<U> map(F&& func) const {
            if (data) {
                return Option<U>(func(*data));
            }
            return Option<U>::None();
        }

        template<typename F>
        void and_then(F&& func) const {
            if (data) {
                func(*data);
            }
        }
    };

}