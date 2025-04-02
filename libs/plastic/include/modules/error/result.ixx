
module;
#include <variant>
export module plastic.result;

import plastic.error;

export namespace plastic
{
    template<typename T>
    struct Result {
    private:
        std::variant<Error, T> value_;

    public:
        explicit Result(T value) : value_(std::move(value)) {}
        explicit Result(Error error) : value_(std::move(error)) {}

        [[nodiscard]] bool is_error() const {
            return std::holds_alternative<Error>(value_);
        }

        [[nodiscard]] bool is_ok() const {
            return std::holds_alternative<T>(value_);
        }

        const T& value() const {
            return std::get<T>(value_);
        }

        [[nodiscard]] const Error& error() const {
            return std::get<Error>(value_);
        }

        T value_or(T default_value) const {
            if (is_ok()) {
                return value();
            }
            return std::forward<T>(default_value);
        }

        template<typename F>
        auto and_then(F&& f) const -> Result<std::invoke_result<F, T>> {
            if (is_ok()) {
                return f(value());
            }
            return error();
        }

        template<typename F>
        auto or_else(F&& f) const -> Result<std::invoke_result<F, Error>> {
            if (is_error()) {
                return f(error());
            }
            return *this;
        }


        template<typename F>
        auto map(F&& f) const -> Result<std::invoke_result<F, T>> {
            if (is_ok()) {
                return Result<std::invoke_result<F, T>>(f(value()));
            }
            return error();
        }
    };
}


