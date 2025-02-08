# Clear any existing content
set(FETCHCONTENT_UPDATES_DISCONNECTED ON) # Prevents CMake from trying to update already-downloaded content
set(FETCHCONTENT_QUIET OFF) # Makes FetchContent output more verbose for debugging

# Dependencies
set(RAYLIB_VERSION 5.5)
set(RAYGUI_VERSION 4.0)
#set(LUA_VERSION 5.1)
set(LUAJIT_VERSION 2.1)
set(GLFW_VERSION 3.3.8)
set(FREETYPE_VERSION 2.13.0)
set(sol2_VERSION 3.2.2)

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

include(FetchContent)

# Sol3
FetchContent_Declare(
        sol2
        GIT_REPOSITORY https://github.com/ThePhD/sol2.git
        GIT_TAG v${sol2_VERSION}
)
FetchContent_MakeAvailable(sol2)

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