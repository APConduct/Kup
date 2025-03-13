//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <raylib.h>
#include <string>
#include <unordered_map>

#include "fonts/rubik/rubik_regular.h"
#include "fonts/rubik/rubik_medium.h"
#include "fonts/rubik/rubik_light.h"
#include "fonts/rubik/rubik_bold.h"
#include "fonts/plasevka/plasevka_regular.h"
#include "fonts/plasevka/plasevka_medium.h"
#include "fonts/plasevka/plasevka_light.h"
#include "fonts/plasevka/plasevka_bold.h"


export module plastic.font_registry;

import plastic.font;
import plastic.font.key;
import plastic.font.key.hash;
import plastic.font.weight;


export namespace plastic
{
    bool operator==(const std::string& lhs, const std::string& rhs) {
        return lhs.c_str() == rhs.c_str();
    };

    class FontRegistry {
        using FontKey = font::Key;
        using FontKeyHash = font::key::Hash;
        using FontWeight = font::Weight;

        std::unordered_map<FontKey, std::shared_ptr<Font>, FontKeyHash> fonts_;
        std::shared_ptr<Font> default_font_;

        static inline std::shared_ptr<Font> default_font_instance_ = nullptr;


        

    public:
        FontRegistry() {
            initialize_builtin_fonts();
        }

        static FontRegistry& instance() {
            static FontRegistry registry;
            return registry;
        }

        std::shared_ptr<Font> get_font(const std::string& family, FontWeight weight = FontWeight::Regular) {
            FontKey key{family, weight};
            if (auto it = fonts_.find(key); it != fonts_.end()) {
                return it->second;
            }

            // If exact weight not found, try to find closest weight in same family
            for (const auto& [k, font] : fonts_) {
                if (k.family == family) {
                    return font;
                }
            }

            // Return default font if family not found
            return default_font_;

        }

        std::shared_ptr<Font> get_default_font() {
            return default_font_;
        }

        // Set the global default font (this is used instead of Raylib's default)
        static void set_global_default_font(const std::shared_ptr<Font>& font) {
            default_font_instance_ = font;
        }

        // Get the global default font
        static std::shared_ptr<Font> get_global_default_font() {
            return default_font_instance_;
        }


        void register_font(const std::string& family, FontWeight weight, std::shared_ptr<Font> font) {
            fonts_[{family, weight}] = font;

            // If this is the first font registered, make it the default
            if (!default_font_) {
                default_font_ = font;
            }
        }

        std::shared_ptr<Font> load_font_from_memory(const std::string& family, FontWeight weight,
                                          const unsigned char* data, int data_size) {
            // Load font from memory using your Font class
            ::Font raylib_font = LoadFontFromMemory(".ttf", data, data_size, 100, nullptr, 0);

            // Check if font was successfully loaded
            if (raylib_font.texture.id == 0) {
                // Font failed to load
                TraceLog(LOG_ERROR, "Failed to load font from memory");
                return get_default_font(); // Return default font as fallback
            }


            auto font = std::make_shared<Font>(raylib_font);

            // Register the font
            register_font(family, weight, font);

            return font;
        }
    private:

        void initialize_builtin_fonts() {
            // Load embedded fonts
            load_font_from_memory("Rubik", FontWeight::Regular, rubik_regular_ttf, rubik_regular_ttf_len);
            load_font_from_memory("Rubik", FontWeight::Medium, rubik_medium_ttf, rubik_medium_ttf_len);
            load_font_from_memory("Rubik", FontWeight::Light, rubik_light_ttf, rubik_light_ttf_len);
            load_font_from_memory("Rubik", FontWeight::Bold, rubik_bold_ttf, rubik_bold_ttf_len);

            load_font_from_memory("Plasevka", FontWeight::Regular, plasevka_regular_ttf, plasevka_regular_ttf_len);
            load_font_from_memory("Plasevka", FontWeight::Medium, plasevka_medium_ttf, plasevka_medium_ttf_len);
            load_font_from_memory("Plasevka", FontWeight::Light, plasevka_light_ttf, plasevka_light_ttf_len);
            load_font_from_memory("Plasevka", FontWeight::Bold, plasevka_bold_ttf, plasevka_bold_ttf_len);

            // Set Rubik Regular as default
            default_font_ = fonts_[{"Rubik", FontWeight::Regular}];
            set_global_default_font(default_font_);
        }



    };

    // Helper functions for easy font access
    inline std::shared_ptr<Font> get_font(const std::string& family, font::Weight weight = font::Weight::Regular) {
        return FontRegistry::instance().get_font(family, weight);
    }

    inline std::shared_ptr<Font> get_default_font() {
        return FontRegistry::instance().get_default_font();
    }

    namespace font
    {
        inline std::shared_ptr<Font> get_default() {
            auto default_font = FontRegistry::get_global_default_font();
            if (!default_font || !default_font->is_valid()) {
                // If our custom default isn't set, fall back to Raylib's default
                return std::make_shared<Font>(GetFontDefault());
            }
            return default_font;
        }
    }



}
