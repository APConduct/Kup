//
// Created by ajost1 on 2/2/2025.
//
module;
#include <stdexcept>
#include <variant>
#include <vector>
export module krusty.try_chain;

export namespace krusty
{
    template<typename T>
    struct TryChain {
    private:
        std::variant<T, std::exception> data;
    public:
        explicit TryChain(const T& value) : data(value) {}

        template<typename F>
        TryChain& then(F&& func) {
            if (std::holds_alternative<T>(data)) {
                try {
                    data = func(std::get<T>(data));
                } catch (const std::exception& e) {
                    data = std::vector<std::string>{e.what()};
                }
            }
            return *this;
        }

        [[nodiscard]] bool is_success() const {
            return std::holds_alternative<T>(data);
        }

        [[nodiscard]] std::vector<std::string> errors() const {

            return is_success() ? std::vector<std::string>{} : std::get<std::vector<std::string>>(data);
        }

        T value() const {
            if (is_success()) {
                return std::get<T>(data);
            }
            throw std::runtime_error("Operation failed: " + errors()[0]);
        }

    };
}
