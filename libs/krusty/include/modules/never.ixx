//
// Created by ajost1 on 2/2/2025.
//

export module krusty.never;

export namespace krusty
{
    struct [[noreturn]] Never {
        Never() = delete;
        ~Never() = delete;
    };
}
