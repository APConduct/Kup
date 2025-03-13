cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)

file(WRITE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bin2h.cmake "
file(READ \${FONT_FILE} CONTENT HEX)
string(REGEX REPLACE \"([0-9a-f][0-9a-f])\" \"0x\\\\1, \" CONTENT \"\${CONTENT}\")
string(REGEX REPLACE \", $\" \"\" CONTENT \"\${CONTENT}\")

file(SIZE \${FONT_FILE} FILE_SIZE)

# Format similar to xxd output with proper variable naming
string(TOUPPER \${VARIABLE_NAME} VARIABLE_NAME_UPPER)
set(FORMATTED_CONTENT \"\")
set(LINE_LENGTH 0)
set(INDEX 0)
foreach(HEX_BYTE \${CONTENT})
    if(\${LINE_LENGTH} EQUAL 0)
        string(APPEND FORMATTED_CONTENT \"\\n  \")
    endif()
    string(APPEND FORMATTED_CONTENT \"\${HEX_BYTE}\")
    math(EXPR LINE_LENGTH \"(\${LINE_LENGTH} + 1) % 12\")
    math(EXPR INDEX \"\${INDEX} + 1\")
endforeach()

file(WRITE \${OUTPUT_FILE} \"#pragma once\\ninline unsigned char \${VARIABLE_NAME}_ttf[] = {\${FORMATTED_CONTENT}\\n};\\ninline unsigned int \${VARIABLE_NAME}_ttf_len = \${FILE_SIZE};\\n\")
")

# Replace the existing function with this pure CMake version
function(add_font_header font_file output_file font_dir)
    # Get the font name without extension for variable naming
    get_filename_component(font_name ${font_file} NAME_WE)
    string(REPLACE "-" "_" variable_name ${font_name})
    string(TOLOWER ${variable_name} variable_name)

    add_custom_command(
            OUTPUT ${output_file}
            COMMAND ${CMAKE_COMMAND}
            -DFONT_FILE=${font_dir}/${font_file}
            -DOUTPUT_FILE=${output_file}
            -DVARIABLE_NAME=${variable_name}
            -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bin2h.cmake
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS ${font_dir}/${font_file} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bin2h.cmake
    )
endfunction()

add_font_header(
        Rubik-Regular.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_regular.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
)

add_font_header(
        Rubik-Medium.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_medium.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
)

add_font_header(
        Rubik-Light.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_light.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
)


add_font_header(
        Rubik-Bold.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_bold.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
)





add_font_header(
        Plasevka-Regular.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_regular.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
)

add_font_header(
        Plasevka-Medium.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_medium.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
)

add_font_header(
        Plasevka-Light.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_light.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
)

add_font_header(
        Plasevka-Bold.ttf
        ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_bold.h
        ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
)


add_library(plastic STATIC
        include/plastic/config.hpp


        src/gen/fonts/rubik/rubik_regular.h
        src/gen/fonts/rubik/rubik_medium.h
        src/gen/fonts/rubik/rubik_light.h
        src/gen/fonts/rubik/rubik_bold.h

        src/gen/fonts/plasevka/plasevka_regular.h
        src/gen/fonts/plasevka/plasevka_medium.h
        src/gen/fonts/plasevka/plasevka_light.h
        src/gen/fonts/plasevka/plasevka_bold.h
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
        include/modules/app_context.ixx
        include/modules/div.ixx
        include/modules/container.ixx
        include/modules/window/window.ixx
        include/modules/window_context.ixx
        include/modules/view_context.ixx
        include/modules/model_context.ixx
        include/modules/app.ixx
        include/modules/application.ixx
        include/modules/events.ixx
        include/modules/ref_count.ixx
        include/modules/events/event_handler_base.ixx
        include/modules/events/typed_event_handler.ixx
        include/modules/events/event_queue.ixx
        include/modules/events/event_dispatcher.ixx
        include/modules/events/event_visitor.ixx
        include/modules/events/event_listener.ixx
        include/modules/events/event_batcher.ixx
        include/modules/events/single_event_listener.ixx
        include/modules/events/event_system.ixx
        include/modules/vertical_layout.ixx
        include/modules/layout_properties.ixx
        include/modules/panel.ixx
        include/modules/component.ixx
        include/modules/entity_map.ixx
        include/modules/horizontal_layout.ixx
        include/modules/layout_container.ixx
        include/modules/stateful_view.ixx
        include/modules/layout/flex_direction.ixx
        include/modules/platform.ixx
        include/modules/window/window_options.ixx
        include/modules/window/window_base.ixx
        include/modules/window/window_builder.ixx
        include/modules/window/window_manager.ixx
        include/modules/font.ixx
        include/modules/audio/device.ixx
        include/modules/audio/wave.ixx
        include/modules/audio/sound.ixx
        include/modules/audio/stream.ixx
        include/modules/audio/music.ixx
        include/modules/audio/callback.ixx
        include/modules/audio/audio.ixx
        include/modules/layout/grid_layout.ixx
        include/modules/command.ixx
        include/modules/events/event_delegation.ixx
        include/modules/animation.ixx
        include/modules/component_registry.ixx
        include/modules/object_pool.ixx
        include/modules/text/rich/rich_text.ixx
        include/modules/theme.ixx
        include/modules/text/text_fmt.ixx
        include/modules/text/text_layout.ixx
        include/modules/text/rich_text.ixx
        include/modules/optimized_renderer.ixx
        include/modules/viewport_culling.ixx
        include/modules/fs/filesystem.ixx
        include/modules/history.ixx
        include/modules/plugin.ixx
        include/modules/events/event_broadcast.ixx
        include/modules/component_system.ixx
        include/modules/layout/flex_layout.ixx
        include/modules/router.ixx
        include/modules/scrollable.ixx
        include/modules/constraints.ixx
        include/modules/virtual_list.ixx
        include/modules/data_binding.ixx
        include/modules/focus_manager.ixx
        include/modules/events/focusable.ixx
        include/modules/scrollable_base.ixx
        include/modules/elements/tree_view.ixx
        include/modules/render_batch.ixx
        include/modules/gesture_recognizer.ixx
        include/modules/text_selection.ixx
        include/modules/window_lifecycle.ixx
        include/modules/window_events.ixx
        include/modules/elements/basic_elements.ixx
        include/modules/app_builder.ixx
        include/modules/raylib_platform.ixx
        include/modules/platform_interface.ixx
        include/modules/elements/containers.ixx
        include/modules/ui.ixx
        include/modules/view_wrapper.ixx
        include/modules/graphics.ixx
        include/modules/input.ixx
        include/modules/components.ixx
        include/modules/reactive.ixx
        include/modules/run.ixx
        include/modules/state.ixx
        include/modules/element_builder.ixx
        include/modules/app_helpers.ixx
        include/modules/app_runner.ixx
        include/modules/window/window_manager_interface.ixx
        include/modules/context_bridge.ixx
        include/modules/animation_base.ixx
        include/modules/spring_animation.ixx
        include/modules/animation_manager.ixx
        include/modules/animation/transition_property.ixx
        include/modules/font/key.ixx
        include/modules/font/weight.ixx

        include/modules/font/key/hash.ixx
        include/modules/font/font_registry.ixx

        include/modules/elements/styled_text.ixx
        include/modules/font/utils.ixx
        include/modules/window/glfw_window_raii.ixx









)


target_link_libraries(plastic PUBLIC raylib fs glfw)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include ${CMAKE_CURRENT_SOURCE_DIR}/src/gen)

add_subdirectory(examples)