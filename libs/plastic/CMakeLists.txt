cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_regular.h
        COMMAND xxd -i Rubik-Regular.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_regular.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static/Rubik-Regular.ttf
)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_medium.h
        COMMAND xxd -i Rubik-Medium.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_medium.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static/Rubik-Medium.ttf
)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_light.h
        COMMAND xxd -i Rubik-Light.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_light.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static/Rubik-Light.ttf
)


add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_bold.h
        COMMAND xxd -i Rubik-Bold.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/rubik/rubik_bold.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Rubik/static/Rubik-Bold.ttf
)





add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_regular.h
        COMMAND xxd -i Plasevka-Regular.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_regular.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF/Plasevka-Regular.ttf
)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_medium.h
        COMMAND xxd -i Plasevka-Medium.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_medium.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF/Plasevka-Medium.ttf
)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_light.h
        COMMAND xxd -i Plasevka-Light.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_light.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF/Plasevka-Light.ttf
)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_bold.h
        COMMAND xxd -i Plasevka-Bold.ttf > ${CMAKE_CURRENT_SOURCE_DIR}/src/gen/fonts/plasevka/plasevka_bold.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/Plasevka/TTF/Plasevka-Bold.ttf
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
        include/modules/window/window_types.ixx
        include/modules/app_runner.ixx



)


target_link_libraries(plastic PUBLIC raylib fs)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include ${CMAKE_CURRENT_SOURCE_DIR}/src/gen)

add_subdirectory(examples)