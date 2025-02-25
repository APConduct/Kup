cmake_minimum_required(VERSION 3.28)
project(fs)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)


add_library(fs STATIC)

target_sources(fs
        PUBLIC
        FILE_SET CXX_MODULES
        FILES
        include/modules/fs.ixx
)





target_include_directories(fs PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

