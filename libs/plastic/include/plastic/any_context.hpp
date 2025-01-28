//
// Created by ajost1 on 1/26/2025.
//

#ifndef ANY_CONTEXT_HPP
#define ANY_CONTEXT_HPP

#include <memory>
#include <optional>
#include <utility>

#include "context.hpp"

namespace plastic::ctx
{
    class AnyContext {
    private:
        class ContextBase {

            virtual ~ContextBase() = default;
            virtual Style& style() = 0;
            virtual void* data() = 0;
        };

        template <typename T, typename S>
        class ContextImpl : public ContextBase {
        private:
            std::unique_ptr<T> m_data;
            std::optional<S> m_style;

        public:
            explicit ContextImpl(T* data, std::optional<S> style = std::nullopt)
                : m_data(std::make_unique<T>(*data)), m_style(std::move(style)) {}

            Style& style() override {
                if (!m_style) {
                    throw std::runtime_error("No style set");
                }
                return *m_style;
            }

            void* data() override { return m_data.get(); }
        };

        std::unique_ptr<ContextBase> cx;

    public:
        template <typename T, typename S>
        explicit AnyContext(T* data, std::optional<Style> style = std::nullopt)
            : cx(std::make_unique<ContextImpl<T, S>>(data, std::move(style))) {}

        template <typename Func>
        decltype(auto) with(Func&& op) {
            return op(*this);
        }

        template <typename T>
        T* get() {
            return static_cast<T*>(cx->data());
        }

    };
}

#endif //ANY_CONTEXT_HPP
