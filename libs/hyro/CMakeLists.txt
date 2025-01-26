cmake_minimum_required(VERSION 3.28)
project(hyro)

set(CMAKE_CXX_STANDARD 20)

add_library(hyro INTERFACE)

target_sources(hyro PRIVATE include/hyro/hyro.hpp include/hyro/font.hpp)

target_link_libraries(hyro INTERFACE raylib raygui plastic glfw freetype)

target_include_directories(hyro PUBLIC INTERFACE include)

