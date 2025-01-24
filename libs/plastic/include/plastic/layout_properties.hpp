//
// Created by ajost1 on 1/23/2025.
//

#ifndef LAYOUT_PROPERTIES_HPP
#define LAYOUT_PROPERTIES_HPP

#include "plastic/rect.hpp"
#include <algorithm>
#include <cfloat>
namespace plastic {
    struct LayoutConstraints {
        Size min_size{0,0};
        Size max_size{FLT_MAX, FLT_MAX};
        float aspect_ratio{0.0f}; // 0 means no constraint
        bool preserve_aspect_ratio{false};

        [[nodiscard]] Size constrain(const Size& size) const {
            Size result = size;

            // Apply min/max constraints
            result.width = std::clamp(result.width, min_size.width, max_size.width);
            result.height = std::clamp(result.height, min_size.height, max_size.height);

            // Apply aspect ratio constraint if needed
            if (preserve_aspect_ratio && aspect_ratio > 0) {
                float current_ratio = result.width / result.height;
                if (current_ratio > aspect_ratio) {
                    result.width = result.height * aspect_ratio;
                } else {
                    result.height = result.width / aspect_ratio;
                }
            }
            return result;
        }
    };


    struct LayoutProperties {
        // How much element grows relavtive to siblings
        float flex_grow{0};
        // How much the element shrinks relative to siblings
        float flex_shrink{1};
        Size preferred_size{0,0};
        LayoutConstraints constraints;
        float margin{0};
        float padding{0};

        enum class Alignment {
            Start,
            Center,
            End,
            Stretch
        };

        Alignment align_self{Alignment::Start};
    };

}

#endif //LAYOUT_PROPERTIES_HPP
