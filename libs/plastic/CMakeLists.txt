cmake_minimum_required(VERSION 3.28)
project(plastic)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_SCAN_FOR_MODULES ON)



add_library(plastic STATIC
        include/plastic/config.hpp


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
        include/modules/text/rich_text.ixx
        include/modules/theme.ixx
        include/modules/text/text_fmt.ixx
        include/modules/text/text_layout.ixx



)


target_link_libraries(plastic PUBLIC raylib fs)

target_include_directories(plastic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
