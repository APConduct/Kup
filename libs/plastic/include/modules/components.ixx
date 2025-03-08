//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <memory>
#include <string>
#include <functional>
export module plastic.components;


import plastic.element;
import plastic.color;
import plastic.size;
import plastic.context;
import plastic.elements.basic;
import plastic.elements.containers;
import plastic.ui;
import plastic.style;

export namespace plastic::components
{
    using namespace plastic::ui;
    // Card component with title, content and optional actions
    std::shared_ptr<Element> card(
        const std::string& title,
        std::shared_ptr<Element> content,
        std::shared_ptr<Element> actions = nullptr,
        Color bg_color = Color::rgb(50, 50, 50)
    );

    // Card component
    inline std::shared_ptr<Element> card(
        const std::shared_ptr<Element>& content,
        std::string title = "",
        const std::shared_ptr<Element>& actions = nullptr,
        Color bg_color = ui::colors::surface
    ) {
        auto container = ui::vstack(8);

        // Add title if provided
        if (!title.empty()) {
            container->add_child(
                ui::padding(
                    ui::text(title, 18, ui::colors::text),
                    16
                )
            );
        }

        // Add content with padding
        container->add_child(
            ui::padding(content, 16)
        );

        // Add actions if provided
        if (actions) {
            container->add_child(
                ui::padding(
                    ui::hstack(8, actions),
                    16
                )
            );
        }

        // Style the card container
        auto card_container = std::make_shared<FlexBox>();
        card_container->add_child(container);

        // Apply card styling
        card_container->set_style(
            style::Style()
                .bg(bg_color)
                .with_border(ui::colors::divider)
        );

        // Apply corner radius
        // (Assuming we add this to Style)

        return card_container;
    }

    // Dialog component
    inline std::shared_ptr<Element> dialog(
        const std::string& title,
        const std::string& message,
        std::function<void(bool)> on_result,
        bool show_cancel = true
    ) {
        // Create the dialog content
        auto content = vstack(16,
            text(title, 20, colors::text),
            text(message, 16, colors::text_secondary)
        );

        // Create dialog actions
        auto actions = hstack(8);

        if (show_cancel) {
            actions->add_child(
                button("Cancel", [on_result]() {
                    on_result(false);
                })
            );
        }

        actions->add_child(
            ui::button("OK", [on_result]() {
                on_result(true);
            })
        );

        // Create a centered modal overlay
        auto dialog_container = center(
            card(content, "", actions, colors::surface)
        );

        // Apply overlay styling
        // In a real implementation, this would be more complex
        // to handle the modal behavior and backdrop

        return dialog_container;
    }

    // Form field with label
    inline std::shared_ptr<Element> form_field(
        const std::string& label,
        std::shared_ptr<Element> input
    ) {
        return vstack(4,
            text(label, 14, colors::text_secondary),
            input
        );
    }

    inline std::shared_ptr<Element> icon_button(
        const std::string& icon_name,
        std::function<void()> on_click,
        float size = 24.0f,
        Color color = colors::text
    ) {
        auto btn = button(icon_name, std::move(on_click));

        // Apply icon button styling
        btn->set_style(
            style::Style()
                .with_text_color_normal(color)
                .with_preferred_size(Size<float>{size, size})
        );

        return btn;
    }

    // List component
    template<typename T>
    std::shared_ptr<Element> list(
        const std::vector<T>& items,
        std::function<std::shared_ptr<Element>(const T&)> item_renderer
    ) {
        auto list_container = std::make_shared<VStack>();
        list_container->with_spacing(5);

        for (const auto& item : items) {
            list_container->add_child(item_renderer(item));
        }

        return list_container;
    }

    // FormField component
    std::shared_ptr<Element> form_field(
        const std::string& label,
        std::shared_ptr<Element> input
    );

    // Tabs component
    struct Tab {
        std::string label;
        std::function<std::shared_ptr<Element>()> content_builder;
    };

    std::shared_ptr<Element> tabs(
        const std::vector<Tab>& tabs,
        size_t initial_tab = 0
    );

    // Progress indicator
    std::shared_ptr<Element> progress_bar(
        float value, // 0.0 to 1.0
        Color fill_color = Color::rgb(66, 133, 244),
        Color bg_color = Color::rgb(30, 30, 30)
    );

    // Toggle switch
    std::shared_ptr<Element> toggle_switch(
        bool initial_state,
        std::function<void(bool)> on_change
    );

    // Dropdown/select component
    template<typename T>
    std::shared_ptr<Element> dropdown(
        const std::vector<T>& items,
        const T& selected,
        std::function<void(const T&)> on_select,
        std::function<std::string(const T&)> item_to_string
    ) {
        // This implementation would be more complex, but here's the API interface
        auto container = std::make_shared<VStack>();
        // Implementation details would be hidden inside
        return container;
    }


    // Avatar component
    std::shared_ptr<Element> avatar(
        const std::string& image_path,
        float size = 40.0f,
        bool circular = true
    );

    // Badge component
    std::shared_ptr<Element> badge(
        std::shared_ptr<Element> content,
        const std::string& badge_text,
        Color badge_color = Color::rgb(244, 67, 54)
    );

    // Tooltip component
    std::shared_ptr<Element> tooltip(
        std::shared_ptr<Element> content,
        const std::string& tooltip_text
    );
}