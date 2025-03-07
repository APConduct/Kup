cmake_minimum_required(VERSION 3.28)
project(Kup)

if (APPLE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -stdlib=libc++ -lc++abi")

    set(PLATFORM_SPECIFIC_LIBS c++ c++abi)
else ()
    set(PLATFORM_SPECIFIC_LIBS)
endif()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 20)

include(cmake/Dependencies.cmake)
message(module ${CMAKE_MODULE_PATH})

# UNCOMMENT ON INSTALL/RELEASE
# set(EXECUTABLE_OUTPUT_PATH ../bin)
# set(LIBRARY_OUTPUT_PATH  ../lib)
# set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(ext/tinyfd)

add_subdirectory(libs/fs)
add_subdirectory(libs/plastic)
add_subdirectory(libs/hyro)
add_subdirectory(libs/solkup)
add_subdirectory(libs/krusty)
add_subdirectory(libs/lsp)
add_subdirectory(libs/plugin)
add_subdirectory(libs/term)
add_subdirectory(libs/editor)

set(tinyfd_SRC ext/tinyfd/tinyfd)

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
        src/editor/file_tree_view.hpp
        src/editor/app.hpp
        src/editor/app.cpp
        src/editor/piece_table.hpp

)

target_link_libraries(Kup PRIVATE raylib
        tinyfd
        plastic
        freetype
        sol2
        ${PLATFORM_SPECIFIC_LIBS}
        kup_editor

)

target_include_directories(Kup PRIVATE
        ${tinyfd_SRC}
)
