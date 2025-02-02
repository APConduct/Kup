//
// Created by ajost1 on 2/2/2025.
//


module;
#include <variant>
#include <stdexcept>
#include <optional>
#include <functional>
export module krusty.result;

export namespace krusty
{
    template<typename T, typename E>
    struct Result {
    private:
        std::variant<T, E> data;
    public:
        explicit Result(const T& value) : data(value) {}
        explicit Result(const E& error) : data(error) {}

        [[nodiscard]] bool is_ok() const {
            return std::holds_alternative<T>(data);
        }

        [[nodiscard]] bool is_err() const {
            return std::holds_alternative<E>(data);
        }

        T unwrap() {
            if (is_ok()) {
                return std::get<T>(data);
            }
            throw std::runtime_error("Called unwrap on an error Result");
        }

        E unwrap_err() {
            if (is_err()) {
                return std::get<E>(data);
            }
            throw std::runtime_error("Called unwrap_err on an ok Result");
        }

        T unwrap_or(const T& default_value) {
            if (is_ok()) {
                return std::get<T>(data);
            }
            return default_value;
        }

        std::optional<T> ok() const {
            if (is_ok()) {
                return std::get<T>(data);
            }
            return std::nullopt;
        }

        std::optional<E> err() const {
            if (is_err()) {
                return std::get<E>(data);
            }
            return std::nullopt;
        }

        // Map success value to another type
        template<typename U, typename F>
        Result<U, E> map(F&& func) {
            if (is_ok()) {
                return Result<U, E>(func(std::get<T>(data)));
            }
            return Result<U, E>(std::get<E>(data));
        }

        // Map error value to another type
        template<typename F>
        Result<T, std::invoke_result_t<F, E>> map_err(F&& func) {
            using NewError = std::invoke_result_t<F, E>;
            if (is_err()) {
                return Result<T, NewError>(func(std::get<E>(data)));
            }
            return Result<T, NewError>(std::get<T>(data));
        }
    };

    template<typename T, typename E>
    Result<T, E> ok(const T& value) {
        return Result<T, E>(value);
    }

    template<typename T, typename E>
    Result<T, E> err(const E& error) {
        return Result<T, E>(error);
    }
}


