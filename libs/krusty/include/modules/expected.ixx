//
// Created by ajost1 on 2/2/2025.
//

module;
#include <stdexcept>
#include <variant>
#include <string>
export module krusty.expected;

export namespace krusty
{
    template<typename T>
    struct Expected {
    private:
        std::variant<T, std::string> data;

    public:
        explicit Expected(const T& value) : data(value) {}
        explicit Expected(const std::string& error) : data(error) {}
        explicit Expected(const char* error) : data(std::string(error)) {}

        [[nodiscard]] bool has_value() const {
            return std::holds_alternative<T>(data);
        }

        T value() const {
            if (has_value()) {
                return std::get<T>(data);
            }
            throw std::runtime_error(std::get<std::string>(data));
        }

        [[nodiscard]] std::string error() const {
            return has_value() ? "" : std::get<std::string>(data);
        }

        T value_or(const T& default_value) const {
            return has_value() ? std::get<T>(data) : default_value;
        }


    };
}