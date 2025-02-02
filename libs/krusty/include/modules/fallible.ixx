//
// Created by ajost1 on 2/2/2025.
//
module;
#include <optional>
#include <stdexcept>
export module krusty.fallible;

export namespace krusty
{
    template<typename T>
    struct Fallible {
    private:
        std::optional<T> data;
        bool failed = false;

    public:
        explicit Fallible(const T& value) : data(value), failed(false) {}

        static Fallible failure() {
            return Fallible(true);
        }

    private:
        explicit Fallible(const bool failed) : failed(failed) {}

    public:
        [[nodiscard]] bool is_success() const {
            return !failed && data.has_value();
        }

        [[nodiscard]] bool is_failure() const {
            return failed;
        }

        T value() const {
            if (is_success()) {
                return *data;
            }
            throw std::runtime_error("Called value on a failed Fallible");
        }

        T value_or(const T& default_value) const {
            return is_success() ? *data : default_value;
        }
    };
}
