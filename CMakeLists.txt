cmake_minimum_required(VERSION 3.29)
project(Kup)


set(CMAKE_CXX_STANDARD 20)


# Dependencies
set(RAYLIB_VERSION 5.0)
find_package(raylib ${RAYLIB_VERSION} QUIET) # QUIET or REQUIRED


if (NOT raylib_FOUND) # If there's none, fetch and build raylib
    include(FetchContent)
    FetchContent_Declare(
            raylib
            DOWNLOAD_EXTRACT_TIMESTAMP OFF
            URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
    )
    FetchContent_GetProperties(raylib)
    if (NOT raylib_POPULATED) # Have we downloaded raylib yet?
        set(FETCHCONTENT_QUIET NO)
        FetchContent_Populate(raylib)
        set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE) # don't build the supplied examples
        add_subdirectory(${raylib_SOURCE_DIR} ${raylib_BINARY_DIR})
    endif()
endif()




find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

add_definitions(${GTK3_CFLAGS_OTHER})





add_executable(Kup src/main.cpp
        src/Button.hpp
        TextArea.cpp
        TextArea.hpp)

target_link_libraries(Kup raylib ${GTK3_LIBRARIES})
target_include_directories(Kup PRIVATE cmake-build-debug-msys-ucrt/_deps/raylib-src/examples/shapes)
target_link_directories(Kup PRIVATE cmake-build-debug-msys-ucrt/_deps/raylib-src/examples/shapes)


