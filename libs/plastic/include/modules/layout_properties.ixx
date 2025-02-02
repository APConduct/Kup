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

    struct LayoutProperties {
        // How much element grows relavtive to siblings
        float flex_grow{0};
        // How much the element shrinks relative to siblings
        float flex_shrink{1};
        Size<float> preferred_size{0,0};
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

        bool fill_width{false};
        bool fill_height{false};
        float weight{1.0f}; // For weighted distributions

        // Helper methods
        [[nodiscard]] Size<float> constrain_size(const Size<float>& size) const {
            return constraints.constrain(size);
        }

        [[nodiscard]] float get_total_horizontal_space() const {
            return margin * 2 + padding * 2;
        }

        [[nodiscard]] float get_total_vertical_space() const {
            return margin * 2 + padding * 2;
        }
    };
}
