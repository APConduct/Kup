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

#FetchContent_Declare(gtk GIT_REPOSITORY https://gitlab.gnome.org/GNOME/gtk.git GIT_TAG main)
#FetchContent_MakeAvailable(gtk)


find_package(PkgConfig REQUIRED)

include(FetchContent)

#pkg_check_modules(lua54 REQUIRED lua5.4)

#FetchContent_Populate(lua54 URL
#        https://www.lua.org/ftp/lua-5.4.7.tar.gz
#        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lua54)


set(EXECUTABLE_OUTPUT_PATH ../bin)
set(LIBRARY_OUTPUT_PATH  ../lib)
set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")


#pkg_check_modules(wxwidgets)


set(tinyfiledialogs_SRC src/ext/tfd)
add_library(tinyfiledialogs STATIC src/ext/tfd/tinyfiledialogs.c)
target_include_directories(tinyfiledialogs PUBLIC src/ext/tfd)

add_executable(Kup src/main.cpp
        src/TextArea.hpp)

target_link_libraries(Kup PUBLIC raylib liblua tinyfiledialogs)




target_include_directories(Kup PRIVATE
        lua54/src
        cmake-build-debug-msys-ucrt/_deps/raylib-src/examples/shapes
        ${tinyfiledialogs_SRC}
        luajit-2.1
        ${raylib_SOURCE_DIR}/examples/shapes
)
target_link_directories(Kup PRIVATE cmake-build-debug-msys-ucrt/_deps/raylib-src/examples/shapes)



