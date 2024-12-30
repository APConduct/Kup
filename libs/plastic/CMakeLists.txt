cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

add_library(plastic STATIC src/plastic.cpp include/plastic.hpp)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)