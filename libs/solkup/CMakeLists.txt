cmake_minimum_required(VERSION 3.28)
project(solkup)

set(CMAKE_CXX_STANDARD 20)

add_library(solkup INTERFACE)

target_sources(solkup PRIVATE include/solkup/solkup.hpp include/solkup/kup.hpp)