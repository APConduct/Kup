cmake_minimum_required(VERSION 3.28)
project(Kup)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)
include(cmake/Dependencies.cmake)
include(cmake/fetch_glfw3.cmake)
message(module ${CMAKE_MODULE_PATH})

# UNCOMMENT ON INSTALL/RELEASE
# set(EXECUTABLE_OUTPUT_PATH ../bin)
# set(LIBRARY_OUTPUT_PATH  ../lib)
# set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(ext/tinyfd)

add_subdirectory(libs/plastic)
add_subdirectory(libs/hyro)
add_subdirectory(libs/solkup)
add_subdirectory(libs/krusty)
add_subdirectory(libs/lsp)
add_subdirectory(libs/plugin)
add_subdirectory(libs/term)
add_subdirectory(libs/editor)

set(tinyfiledialogs_SRC ext/tinyfd/tinyfd)
add_library(tinyfiledialogs STATIC)
target_sources(tinyfiledialogs PRIVATE ${PROJECT_SOURCE_DIR}/ext/tinyfd/tinyfd/tinyfiledialogs.c)
target_include_directories(tinyfiledialogs PUBLIC ${tinyfiledialogs_SCR})

add_executable(Kup src/main.cpp
        src/TextArea.hpp
        src/FileTree.cpp
        src/FileTree.hpp
        src/editor.hpp
        src/scroll_bar.hpp
        src/editor/buffer.hpp
        src/editor/text_view.hpp
        src/editor/editor_view.hpp
        src/editor/editor_state.hpp
)

target_link_libraries(Kup PRIVATE raylib
        tinyfd
        tinyfiledialogs
        plastic
        glfw
        freetype
        sol2
)

target_include_directories(Kup PRIVATE
        ${tinyfiledialogs_SRC}
        ${CMAKE_SOURCE_DIR}/src/../ext/raygui/src
        ${tinyfd_SRC}
)



