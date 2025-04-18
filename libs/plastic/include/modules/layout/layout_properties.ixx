//
// Created by ajost1 on 2/2/2025.
//

module;
#include <algorithm>
#include <cfloat>
export module plastic.layout_properties;
import plastic.size;
import plastic.edge;

export namespace plastic
{

    enum class FlexDirection {
        Row,
        Column,
        RowReverse,
        ColumnReverse
    };

    enum class FlexWrap {
        NoWrap,
        Wrap,
        WrapReverse
    };

    enum class FlexAlign {
        Start,
        Center,
        End,
        SpaceBetween,
        SpaceAround,
        SpaceEvenly,
        Stretch
    };

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

        float flex_basis{0}; // For flexbox layout

        Size<float> preferred_size{0,0};
        LayoutConstraints constraints;
        Edge<float> margin{0};
        Edge<float> padding{0};

        FlexDirection flex_direction_{FlexDirection::Row};
        FlexAlign align_items_{FlexAlign::Start};
        FlexAlign justify_content_{FlexAlign::Start};

        float gap{};



        enum class Alignment {
            Start,
            Center,
            End,
            Stretch
        };

        Alignment align_self{Alignment::Start};
        Alignment justify_self{Alignment::Start};

        bool fill_width{false};
        bool fill_height{false};
        float weight{1.0f}; // For weighted distributions

        // Helper methods
        [[nodiscard]] Size<float> constrain_size(const Size<float>& size) const {
            return constraints.constrain(size);
        }

        [[nodiscard]] float get_total_horizontal_space() const {
            return margin.left + margin.right + padding.left + padding.right;
        }

        [[nodiscard]] float get_total_vertical_space() const {
            return margin.top + margin.bottom + padding.top + padding.bottom;
        }

        bool operator==(const LayoutProperties& other) const {
            return flex_grow == other.flex_grow &&
                   flex_shrink == other.flex_shrink &&
                   preferred_size == other.preferred_size &&
                   constraints.min_size == other.constraints.min_size &&
                   constraints.max_size == other.constraints.max_size &&
                   constraints.aspect_ratio == other.constraints.aspect_ratio &&
                   constraints.preserve_aspect_ratio == other.constraints.preserve_aspect_ratio &&
                   margin == other.margin &&
                   padding == other.padding &&
                   align_self == other.align_self &&
                   fill_width == other.fill_width &&
                   fill_height == other.fill_height &&
                   weight == other.weight;
        }

        bool operator!=(const LayoutProperties& other) const {
            return !(*this == other);
        }

        float spacing{8};


        LayoutProperties& with_flex_grow(const float grow) {
            flex_grow = grow;
            return *this;
        }

        LayoutProperties& with_padding(const float padding) {
            this->padding = Edge{padding, padding, padding, padding};
            return *this;
        }

        LayoutProperties& with_fill_height(const bool fill) {
            fill_height = fill;
            return *this;
        }

        LayoutProperties& with_preferred_size(const Size<float> preferred_size) {
            this->preferred_size = preferred_size;
            return *this;
        }

        LayoutProperties& with_align_self(const Alignment align_self) {
            this->align_self = align_self;
            return *this;
        }

        LayoutProperties& with_fill_width(const bool fill) {
            this->fill_width = fill;
            return *this;
        }

        LayoutProperties& with_margin(const float margin) {
            this->margin = Edge{margin, margin, margin, margin};
            return *this;
        }

        LayoutProperties& with_spacing(const float spacing) {
            this->spacing = spacing;
            return *this;
        }
    };
}
