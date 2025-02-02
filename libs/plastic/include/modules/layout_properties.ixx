//
// Created by ajost1 on 2/2/2025.
//

module;
#include <algorithm>
#include <cfloat>

export module plastic.layout_properties;
import plastic.size;

export namespace plastic
{
    struct LayoutConstraints {
        Size<float> min_size{0,0};
        Size<float> max_size{FLT_MAX, FLT_MAX};
        float aspect_ratio{0.0f}; // 0 means no constraint
        bool preserve_aspect_ratio{false};

        [[nodiscard]] Size<float> constrain(const Size<float>& size) const {
            Size result = size;

            // Apply min/max constraints
            result.width( std::clamp(result.width(), min_size.width(), max_size.width()));
            result.height(std::clamp(result.height(), min_size.height(), max_size.height()));

            // Apply aspect ratio constraint if needed
            if (preserve_aspect_ratio && aspect_ratio > 0) {
                if (const float current_ratio = result.width() / result.height(); current_ratio > aspect_ratio) {
                    result.width( result.height() * aspect_ratio);
                } else {
                    result.height( result.width() / aspect_ratio);
                }
            }
            return result;
        }
    };
}
