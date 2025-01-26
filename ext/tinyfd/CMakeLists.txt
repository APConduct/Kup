cmake_minimum_required(VERSION 3.28)
project(tinyfd)

set(CMAKE_CXX_STANDARD 20)

add_library(tinyfd STATIC)
target_sources(tinyfd PRIVATE tinyfd/tinyfiledialogs.c)

target_include_directories(tinyfd PUBLIC ${tinyfd_SRC})




