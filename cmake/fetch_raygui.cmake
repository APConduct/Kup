set(RAYGUI_VERSION 4.0)


find_package(raygui ${RAYGUI_VERSION} QUIET)

if (NOT raygui_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            raygui
            URL https://github.com/raysan5/raygui/archive/refs/tags/${RAYGUI_VERSION}.tar.gz
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