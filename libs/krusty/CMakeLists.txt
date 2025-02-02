cmake_minimum_required(VERSION 3.28)
project(krusty)

set(CMAKE_CXX_STANDARD 20)

add_library(krusty STATIC

)

target_sources(krusty PRIVATE)

target_sources(krusty
        PUBLIC
        FILE_SET CXX_MODULES
        FILES
        include/modules/result.ixx
        include/modules/krusty.ixx
        include/modules/option.ixx
        include/modules/either.ixx
        include/modules/unit.ixx
        include/modules/never.ixx
        include/modules/expected.ixx
        include/modules/try_chain.ixx
        include/modules/fallible.ixx
)