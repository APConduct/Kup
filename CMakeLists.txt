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
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

add_definitions(${GTK3_CFLAGS_OTHER})


include(FetchContent)

FetchContent_Declare(glfw GIT_REPOSITORY https://github.com/glfw/glfw.git GIT_TAG master)
FetchContent_Declare(glad GIT_REPOSITORY https://github.com/SasLuca/MyGlad.git GIT_TAG master)

set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(glfw)

FetchContent_MakeAvailable(glad)


FetchContent_Populate(imgui
        URL https://github.com/ocornut/imgui/archive/docking.zip
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/imgui
)

set(OpenGL_GL_PREFERENCE "LEGACY")
find_package(OpenGL 2 REQUIRED)
#find_package(glfw3 REQUIRED)

add_library(imgui_glfw STATIC
        imgui/imgui.cpp
        imgui/imgui_draw.cpp
        imgui/imgui_demo.cpp
        imgui/imgui_tables.cpp
        imgui/imgui_widgets.cpp

        imgui/backends/imgui_impl_glfw.cpp
        imgui/backends/imgui_impl_opengl2.cpp
)


FetchContent_Declare(ImGuiFileDialog GIT_REPOSITORY https://github.com/aiekick/ImGuiFileDialog.git GIT_TAG master)

FetchContent_MakeAvailable(ImGuiFileDialog)

target_link_libraries(imgui_glfw PUBLIC glfw ${OPENGL_LIBRARIES})

target_include_directories(imgui_glfw PUBLIC ${CMAKE_CURRENT_LIST_DIR}/imgui
        ${CMAKE_CURRENT_LIST_DIR}/imgui/backends)

target_link_libraries(ImGuiFileDialog PUBLIC imgui_glfw)


FetchContent_Populate(rlImGui
        URL
        https://github.com/raylib-extras/rlImGui/archive/refs/heads/main.tar.gz
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/rlImGui
)

add_library(rlimgui STATIC
            rlImGui/rlImGui.cpp)
target_link_libraries(rlimgui PUBLIC imgui_glfw)


pkg_check_modules(lua54 REQUIRED lua5.4)

FetchContent_Populate(lua54 URL
        https://www.lua.org/ftp/lua-5.4.7.tar.gz
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lua54)

file(GLOB lua54_SRC
        "*.h"
        "*.c"
)

#add_library(lua54 STATIC )



set(EXECUTABLE_OUTPUT_PATH ../bin)
set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")

add_executable(Kup src/main.cpp
        src/Button.hpp
        src/TextArea.cpp
        src/TextArea.hpp)

target_link_libraries(Kup PUBLIC raylib imgui_glfw rlimgui glfw)




target_include_directories(Kup PRIVATE
        cmake-build-debug-msys-ucrt/_deps/raylib-src/examples/shapes
        rlImGui
        imgui
)
target_link_directories(Kup PRIVATE cmake-build-debug-msys-ucrt/_deps/raylib-src/examples/shapes)



