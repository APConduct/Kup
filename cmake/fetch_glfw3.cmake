set(GLFW_VERSION 3.3.8)



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
