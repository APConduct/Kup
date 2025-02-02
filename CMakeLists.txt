cmake_minimum_required(VERSION 3.28)
project(Kup)



list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)


# Clear any existing content
set(FETCHCONTENT_UPDATES_DISCONNECTED ON) # Prevents CMake from trying to update already-downloaded content
set(FETCHCONTENT_QUIET OFF) # Makes FetchContent output more verbose for debugging


message(module ${CMAKE_MODULE_PATH})

# UNCOMMENT ON INSTALL/RELEASE

# set(EXECUTABLE_OUTPUT_PATH ../bin)
# set(LIBRARY_OUTPUT_PATH  ../lib)
# set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


# Dependencies
set(RAYLIB_VERSION 5.0)
set(RAYGUI_VERSION 4.0)
set(LUA_VERSION 5.1)
set(LUAJIT_VERSION 2.1)
set(GLFW_VERSION 3.3.8)
set(FREETYPE_VERSION 2.13.0)
set(sol2_VERSION 3.2.2)

include(cmake/FindLua51.cmake)


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


find_package(raygui ${RAYGUI_VERSION} QUIET)

if (NOT raygui_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            raygui
            URL https://github.com/raysan5/raygui/archive/refs/tags/${RAYGUI_VERSION}.tar.gz
            SOURCE_DIR ${raygui_SOURCE_DIR}/projects/CMake
    )
    FetchContent_GetProperties(raygui)
    if (NOT raygui_populated)
        set(FETCHCONTENT_QUIET NO)
        FetchContent_MakeAvailable(raygui)
        set(RAYGUI_ROOT ${raygui_SOURCE_DIR})
        set(RAYGUI_SRC ${CMAKE_SOURCE_DIR}/ext/raygui/src)
        set(RAYGUI_EXAMPLES ${RAYGUI_ROOT}/examples)

        # raygui
        add_library(raygui INTERFACE)
        file(GLOB sources ${RAYGUI_SRC}/*.h)
        set(RAYGUI_HEADERS ${sources})
        install(FILES ${RAYGUI_HEADERS} DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/include)
        target_include_directories(raygui INTERFACE ${RAYGUI_SRC})
    endif ()
endif ()

# Sol3
FetchContent_Declare(
        sol2
        GIT_REPOSITORY https://github.com/ThePhD/sol2.git
        GIT_TAG v${sol2_VERSION}
)
FetchContent_MakeAvailable(sol2)

find_package(Lua51 REQUIRED)

if(NOT Lua51_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            Lua51
            URL https://github.com/lua/lua/archive/refs/tags/v${LUA_VERSION}.tar.gz
    )
    FetchContent_GetProperties(Lua51)
    if (NOT Lua51_populated)
        set(FETCHCONTENT_QUIET NO)
        FetchContent_MakeAvailable(Lua_51)
    endif ()
endif ()

find_package(glfw3 QUIET)

if (NOT glfw3_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            glfw
            GIT_REPOSITORY https://github.com/glfw/glfw.git
            GIT_TAG ${GLFW_VERSION}
    )
    FetchContent_GetProperties(glfw)
    if (NOT glfw_POPULATED)
        FetchContent_MakeAvailable(glfw)
    endif ()
endif ()


FetchContent_Declare(
        freetype
        GIT_REPOSITORY https://gitlab.freedesktop.org/freetype/freetype.git
        GIT_TAG VER-2-13-2
        GIT_SHALLOW ON    # Only fetch the specified revision
        GIT_PROGRESS ON   # Show progress during download
)

# Configure FreeType build options before making it available
set(FT_DISABLE_ZLIB ON CACHE BOOL "" FORCE)
set(FT_DISABLE_BZIP2 ON CACHE BOOL "" FORCE)
set(FT_DISABLE_PNG ON CACHE BOOL "" FORCE)
set(FT_DISABLE_HARFBUZZ ON CACHE BOOL "" FORCE)
set(FT_DISABLE_BROTLI ON CACHE BOOL "" FORCE)

# Error handling for FetchContent
message(STATUS "Downloading and configuring FreeType...")
FetchContent_MakeAvailable(freetype)

if(NOT freetype_POPULATED)
    message(FATAL_ERROR "Failed to populate FreeType")
endif()

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
        libs/hyro/include/hyro/hyro.hpp
        libs/hyro/include/hyro/font.hpp

        src/editor/buffer.hpp
        src/editor/text_view.hpp
)

target_link_libraries(Kup PRIVATE raylib
        tinyfd
        tinyfiledialogs
        raygui
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



