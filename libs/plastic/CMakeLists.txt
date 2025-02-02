cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)



add_library(plastic STATIC
        include/plastic/prototype/basic_concurrent_window.hpp
        include/plastic/prototype/plastic.hpp
        include/plastic/prototype/rect.hpp
        include/plastic/prototype/point.hpp
        include/plastic/prototype/layout.hpp
        include/plastic/prototype/vertical_layout.hpp
        include/plastic/prototype/container.hpp
        include/plastic/prototype/context.hpp
        include/plastic/prototype/element.hpp
        include/plastic/prototype/layout_properties.hpp
        include/plastic/prototype/component.hpp
        include/plastic/prototype/panel.hpp
        include/plastic/prototype/model.hpp
        include/plastic/prototype/view.hpp
        include/plastic/prototype/any_context.hpp

        include/plastic/events/event_system.hpp
        src/plastic.cpp
        include/plastic/point.hpp
        include/plastic/rect.hpp
        include/plastic/size.hpp


)

target_sources(plastic
        PUBLIC
        FILE_SET CXX_MODULES
        FILES
        include/modules/plastic.ixx
        include/modules/point.ixx
        include/modules/size.ixx
        include/modules/rect.ixx
        include/modules/edge.ixx
        include/modules/style.ixx
        include/modules/model.ixx
        include/modules/element.ixx
        include/modules/context.ixx
        include/modules/color.ixx
        include/modules/view.ixx
        include/modules/layout.ixx
        include/modules/layout.ixx
        include/modules/app_context.ixx
        include/modules/div.ixx
        include/modules/container.ixx
        include/modules/window.ixx
        include/modules/window_context.ixx
        include/modules/view_context.ixx
        include/modules/model_context.ixx
        include/modules/app.ixx
        include/modules/application.ixx
        include/modules/events.ixx


)


target_link_libraries(plastic PUBLIC raylib raygui glfw)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)