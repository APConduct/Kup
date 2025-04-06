/// @file result.ixx
/// @brief Result type for the Plastic UI framework
/// @details This module provides a way to handle results and errors in a structured manner.

module;
#include <variant>
export module plastic.result;

import plastic.error;

export namespace plastic
{
    /// @brief Result type for handling success and error states
    template<typename T>
    struct Result {
    private:

        /// @brief Variant to hold either a value or an error
        std::variant<Error, T> value_;

    public:
        /// @brief Constructor for Result
        explicit Result(T value) : value_(std::move(value)) {}

        /// @brief Constructor for Result with error
        explicit Result(Error error) : value_(std::move(error)) {}

        /// @brief check if the result is an error
        /// @return true if the result is an error, false otherwise
        [[nodiscard]] bool is_error() const {
            return std::holds_alternative<Error>(value_);
        }

        /// @brief check if the result is successful
        /// @return true if the result is successful, false otherwise
        [[nodiscard]] bool is_ok() const {
            return std::holds_alternative<T>(value_);
        }

        /// @brief Get the value if successful
        /// @return The value if successful
        const T& value() const {
            return std::get<T>(value_);
        }

        /// @brief Get the error if an error occurred
        /// @return The error if an error occurred
        [[nodiscard]] const Error& error() const {
            return std::get<Error>(value_);
        }

        /// @brief Get the value or a default value if an error occurred
        /// @param default_value The default value to return if an error occurred
        /// @return The value if successful, otherwise the default value
        T value_or(T default_value) const {
            if (is_ok()) {
                return value();
            }
            return std::forward<T>(default_value);
        }

        /// @brief functional style "and then" for chaining operations
        /// @param f The function to call if the result is successful
        /// @return A new Result with the value from the function
        template<typename F>
        auto and_then(F&& f) const -> Result<std::invoke_result<F, T>> {
            if (is_ok()) {
                return f(value());
            }
            return error();
        }

        /// @brief Handle the error with a function
        /// @param f The function to handle the error
        /// @return A new Result with the error handled
        template<typename F>
        auto or_else(F&& f) const -> Result<std::invoke_result<F, Error>> {
            if (is_error()) {
                return f(error());
            }
            return *this;
        }

        /// @brief Map the value to another type
        /// @param f The function to map the value
        /// @return A new Result with the mapped value
        template<typename F>
        auto map(F&& f) const -> Result<std::invoke_result<F, T>> {
            if (is_ok()) {
                return Result<std::invoke_result<F, T>>(f(value()));
            }
            return error();
        }
    };
}


