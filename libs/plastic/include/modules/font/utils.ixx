//
// Created by Aidan Jost on 3/13/25.
//

export module plastic.font.utils;

import plastic.font_registry;
import plastic.font.weight;

export namespace plastic
{
    inline void ensure_default_font_is_rubik() {
        // This function can be called at application startup
        auto rubik = get_font("Rubik", font::Weight::Regular);
        if (rubik && rubik->is_valid()) {
            FontRegistry::set_global_default_font(rubik);
        }
    }
}

