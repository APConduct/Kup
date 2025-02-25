cmake_minimum_required(VERSION 3.28)
project(fs)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)


add_library(fs STATIC)

target_sources(fs PUBLIC include/fs/fs_config.hpp)

target_sources(fs
        PUBLIC
        FILE_SET CXX_MODULES
        FILES
        include/modules/config.ixx
        include/modules/path_list.ixx
        include/modules/fs.ixx
        include/modules/tree.ixx

)

target_link_libraries(fs PUBLIC
        raylib
        sol2
        ${PLATFORM_SPECIFIC_LIBS}
)





target_include_directories(fs PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

