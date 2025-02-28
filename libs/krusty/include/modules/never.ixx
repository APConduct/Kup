//
// Created by ajost1 on 2/2/2025.
//
module;
#include <stdexcept>

export module krusty.never;

export namespace krusty
{
    struct Never {
        Never() = delete;
        ~Never() = delete;

        static void never() {
            throw std::runtime_error("This function should never be called");

        }
    };


}
