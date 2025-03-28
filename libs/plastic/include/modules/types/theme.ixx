//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <string>
#include <vector>
#include <functional>
#if defined(_WIN32)
#include <optional>
#endif
export module plastic.theme;

import plastic.style;
import plastic.color;

export namespace plastic
{
    struct Theme {
        std::string name;
        style::Style base_style;
        style::Style button_style;
        style::Style panel_style;
        style::Style input_style;

        Color primary_color;
        Color secondary_color;
        Color accent_color;
        Color background_color;
        Color text_color;
        Color error_color;
        Color success_color;

        static Theme dark_theme() {
            Theme theme;
            theme.name = "Dark";
            theme.primary_color = Color::rgb(30, 30, 30);
            theme.secondary_color = Color::rgb(50, 50, 50);
            theme.accent_color = Color::rgb(86, 156, 214);
            theme.background_color = Color::rgb(15,15,15);
            theme.text_color = Color::rgb(220,220,220);
            theme.error_color = Color::rgb(215, 58, 73);
            theme.success_color = Color::rgb(78, 201, 176);

            // Base style
            theme.base_style.background_color_normal = theme.background_color;
            theme.base_style.text_color_normal = theme.text_color;

            // Button style
            theme.button_style = theme.base_style;
            theme.button_style.background_color_normal = theme.secondary_color;
            theme.base_style.hover = theme.accent_color;

            return theme;
        }

        static Theme light_theme() {
            Theme theme;
            theme.name = "Light";
            theme.primary_color = Color::rgb(240, 240, 240);
            theme.secondary_color = Color::rgb(220, 220, 220);
            theme.accent_color = Color::rgb(0, 120, 215);
            theme.background_color = Color::rgb(255,255,255);
            theme.text_color = Color::rgb(33,33,33);
            theme.error_color = Color::rgb(232, 17, 35);
            theme.success_color = Color::rgb(16, 137, 62);

            // Setup styles
            theme.base_style.background_color_normal = theme.background_color;
            theme.base_style.text_color_normal = theme.text_color;

            return theme;
        }

    };

    class ThemeManager {
        static inline Theme current_theme_ { Theme::dark_theme()};
        static inline std::vector<std::function<void(const Theme&)>> observers_;

    public:
        static Theme current_theme() {
            return current_theme_;
        }

        static void set_theme(const Theme& theme) {
            current_theme_ = theme;
            notify_observers();
        }

        static inline void observe(const std::function<void(const Theme&)>& observer) {
            observers_.push_back(observer);
        }

        static inline void notify_observers() {
            for (const auto& observer : observers_) {
                observer(current_theme_);
            }
        }
    };
}