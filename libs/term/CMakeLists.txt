cmake_minimum_required(VERSION 3.28)
project(kupterm)

set(CMAKE_CXX_STANDARD 20)

add_library(kupterm INTERFACE)

target_sources(kupterm PRIVATE include/term/terminal.hpp)