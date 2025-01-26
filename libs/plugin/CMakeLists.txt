cmake_minimum_required(VERSION 3.28)
project(kup_plugin)

set(CMAKE_CXX_STANDARD 20)

add_library(kup_plugin INTERFACE)

target_sources(kup_plugin PRIVATE include/plugin/plugin.hpp)