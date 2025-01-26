cmake_minimum_required(VERSION 3.28)
project(kuplsp)

set(CMAKE_CXX_STANDARD 20)

add_library(kuplsp INTERFACE)

target_sources(krusty PRIVATE include/lsp.hpp)