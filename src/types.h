//
// Created by ajost1 on 11/24/2024.
//

#ifndef TYPES_H
#define TYPES_H
#include <functional>
#include <string>
#include <vector>


    namespace kup::types
    {
        template <typename T>
        std::function<T> fn() {
            return std::bind(&T::operator(), std::placeholders::_1, std::placeholders::_2);
        };

        template <typename T,typename U>
        struct function_container : private std::function<T(U)>{};





        template<typename _data_type, typename _size_type>
        struct vec_impl {
            virtual ~vec_impl() = default;

            const _size_type size{2};
            std::vector<_data_type> data;

            explicit vec_impl(_size_type _size): size(_size) {}
        };

        template<typename T>
        struct func: std::function<T> {
            T operator()(T x) const { return x; }
        };

        template<typename T>
        struct named : std::pair<vec_impl<std::string, size_t>, std::vector<named<T>>> {
            std::vector<std::pair<std::string, T>> data;
        };


        inline const char* to_cstr(const std::string& str) {
            const char* r = str.c_str();
            return r ;
        }

        inline const char* to_cstr(const char& str) {
            const char* r = &str;
            return r = str();
        }


        typedef  std::vector<std::pair<std::string, std::string>> str_pair_vec;

    }


#endif //TYPES_H
