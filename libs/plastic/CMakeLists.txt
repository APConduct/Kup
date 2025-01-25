cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

add_library(plastic STATIC src/plastic_prototype.cpp include/plastic/plastic_prototype.hpp
        include/plastic/basic_concurrent_window.hpp
        include/plastic/plastic.hpp
        include/plastic/rect.hpp
        include/plastic/point.hpp
        include/plastic/layout.hpp
        include/plastic/vertical_layout.hpp
        include/plastic/container.hpp
        include/plastic/events/event_system.hpp
        include/plastic/context.hpp
        include/plastic/element.hpp
        include/plastic/layout_properties.hpp
        include/plastic/component.hpp
        include/plastic/panel.hpp
        include/plastic/model.hpp
        include/plastic/view.hpp)

target_link_libraries(plastic PUBLIC raylib raygui glfw)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)