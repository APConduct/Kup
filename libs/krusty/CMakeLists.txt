cmake_minimum_required(VERSION 3.28)
project(krusty)

set(CMAKE_CXX_STANDARD 20)

add_library(krusty INTERFACE)

target_sources(krusty PRIVATE include/krusty.hpp include/result.hpp)