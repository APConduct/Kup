//
// Created by ajost1 on 2/2/2025.
//
module;
#include <variant>
#include <stdexcept>
#include <optional>
#include <functional>
export module krusty.either;

export namespace krusty
{
    template<typename L, typename R>
    struct Either {
    private:
        std::variant<L, R> data;
    public:
        explicit Either(const L& left) : data(left) {}
        explicit Either(const R& right) : data(right) {}

        [[nodiscard]] bool is_left() const {
            return std::holds_alternative<L>(data);
        }

        [[nodiscard]] bool is_right() const {
            return std::holds_alternative<R>(data);
        }

        L unwrap_left() {
            if (is_left()) {
                return std::get<L>(data);
            }
            throw std::runtime_error("Called unwrap_left on a right Either");
        }

        R unwrap_right() {
            if (is_right()) {
                return std::get<R>(data);
            }
            throw std::runtime_error("Called unwrap_right on a left Either");
        }

        template<typename F>
        auto map_left(F&& func) const {
            if (is_left()) {
                return Either<std::invoke_result_t<F, L>, R>(func(std::get<L>(data)));
            }
            return Either<std::invoke_result_t<F, L>, R>(std::get<R>(data));
        }

        template<typename F>
        auto map_right(F&& func) const {
            if (is_right()) {
                return Either<L, std::invoke_result_t<F, R>>(func(std::get<R>(data)));
            }
            return Either<L, std::invoke_result_t<F, R>>(std::get<L>(data));
        }
    };
}
