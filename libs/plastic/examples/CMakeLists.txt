# Find the library
add_executable(
        basic_window basic/basic_window.cpp
)

target_link_libraries(
        basic_window
        PRIVATE
        plastic
)