cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

add_library(plastic STATIC src/plastic.cpp include/plastic/plastic.hpp
        include/plastic/basic_concurrent_window.hpp)

target_link_libraries(plastic PUBLIC raylib raygui glfw)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)