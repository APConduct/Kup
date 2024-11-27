//
// Created by ajost1 on 11/24/2024.
//

#ifndef INTERFACES_HPP
#define INTERFACES_HPP
#include <string>
#include <utility>
#include <vector>

namespace interfaces
{
    struct  Interface {
        std::string id;
        Interface() = default;
        template<typename T>;
        explicit Interface(std::string  id) : id(std::move(id)) {}

        template <template <typename>
        class Interface_Implementation>

        struct trait;
        const char *type_name{};
    };


    std::vector<std::pmr::string> get_interfaces();


}

#endif //INTERFACES_HPP
