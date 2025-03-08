//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <algorithm>
#include <memory>
#include <ranges>

export module plastic.flex_layout;

import plastic.layout;
import plastic.point;
import plastic.layout_properties;
import plastic.element;
import plastic.rect;
import plastic.size;

export namespace plastic {
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

    struct FlexLayoutProperties : LayoutProperties {
        FlexDirection direction{FlexDirection::Row};
        FlexWrap wrap{FlexWrap::NoWrap};
        FlexAlign justify_content{FlexAlign::Start};
        FlexAlign align_items{FlexAlign::Start};
        FlexAlign align_content{FlexAlign::Start};
        float gap{0.0f};

        FlexLayoutProperties& with_direction(FlexDirection dir) {
            direction = dir;
            return *this;
        }

        FlexLayoutProperties& with_justify_content(FlexAlign align) {
            justify_content = align;
            return *this;
        }

        FlexLayoutProperties& with_align_items(FlexAlign align) {
            align_items = align;
            return *this;
        }

        FlexLayoutProperties& with_gap(float g) {
            gap = g;
            return *this;
        }
    };

    class FlexLayout : public Layout {
    private:
        FlexLayoutProperties props_;

    public:

        [[nodiscard]] FlexLayoutProperties props() const {
            return props_;
        }

        void set_props(FlexLayoutProperties props) {
            props_ = props;
        }
        explicit FlexLayout(const FlexLayoutProperties& props = {})
            : props_(props) {}

        void arrange(Element& element, const Rect<float>& bounds) override {
            const auto& children = element.get_children();
            if (children.empty()) return;

            // Determine if we're in a horizontal or vertical layout
            bool is_horizontal = (props_.direction == FlexDirection::Row || props_.direction == FlexDirection::RowReverse);
            bool is_reverse = (props_.direction == FlexDirection::RowReverse || props_.direction == FlexDirection::ColumnReverse);

            // Calculate total flex and fixed sizes
            float total_flex = 0.0f;
            float total_fixed_size = 0.0f;
            float total_gaps = props_.gap * std::max(0.0f, static_cast<float>(children.size() - 1));

            std::vector<Size<float>> sizes;
            sizes.reserve(children.size());

            std::vector<float> flex_grow_values;
            flex_grow_values.reserve(children.size());

            // First pass: measure children and calculate total flex
            for (const auto& child : children) {
                const auto& params = child->get_layout_properties();
                auto size = measure(*child);

                // Store measured size
                sizes.push_back(size);

                // Store flex grow value
                flex_grow_values.push_back(params.flex_grow);

                // If this child uses flex grow, add to total
                if (params.flex_grow > 0) {
                    total_flex += params.flex_grow;
                } else {
                    // Otherwise, add its fixed dimension to total
                    if (is_horizontal) {
                        total_fixed_size += size.width() + params.get_total_horizontal_space();
                    } else {
                        total_fixed_size += size.height() + params.get_total_vertical_space();
                    }
                }
            }

            // Calculate remaining space for flex items
            float main_axis_size = is_horizontal ? bounds.width() : bounds.height();
            float remaining_space = std::max(0.0f, main_axis_size - total_fixed_size - total_gaps);

            // Handle wrapping if enabled
            if (props_.wrap != FlexWrap::NoWrap) {
                arrange_wrapped(element, bounds, is_horizontal, is_reverse);
                return;
            }

            // Second pass: arrange children
            float position = is_horizontal ? bounds.x() : bounds.y();

            // Handle justify-content for initial position
            if (total_fixed_size + total_gaps + (total_flex > 0 ? 0 : remaining_space) < main_axis_size) {
                switch (props_.justify_content) {
                    case FlexAlign::Center:
                        position += (main_axis_size - (total_fixed_size + total_gaps)) / 2;
                        break;
                    case FlexAlign::End:
                        position += main_axis_size - (total_fixed_size + total_gaps);
                        break;
                    case FlexAlign::SpaceBetween:
                        // Space evenly, but not before first or after last
                        if (children.size() > 1) {
                            props_.gap = remaining_space / (static_cast<float>(children.size()) - 1);
                        }
                        break;
                    case FlexAlign::SpaceAround: {
                        // Space evenly, with half-size spaces at beginning and end
                        float space_per_item = remaining_space / static_cast<float>(children.size());
                        position += space_per_item / 2;
                        props_.gap += space_per_item;
                        break;
                    }
                    case FlexAlign::SpaceEvenly: {
                        // Space evenly, including before first and after last
                        float space_per_gap = remaining_space / static_cast<float>(children.size() + 1);
                        position += space_per_gap;
                        props_.gap += space_per_gap;
                        break;
                    }
                    case FlexAlign::Start:
                    default:
                        break;
                }
            }

            // If direction is reverse, adjust starting position
            if (is_reverse) {
                float content_size = total_fixed_size;
                if (total_flex > 0) {
                    content_size += remaining_space;
                }
                position = (is_horizontal ? bounds.x() : bounds.y()) +
                          main_axis_size - content_size - total_gaps;
            }

            // Iterate children in appropriate order
            if (is_reverse) {
                // Process in reverse order
                for (int i = static_cast<int>(children.size()) - 1; i >= 0; --i) {
                    const auto& child = children[i];
                    const auto& params = child->get_layout_properties();
                    const auto& size = sizes[i];

                    // Process child layout
                    process_child_layout(child, params, size, position, bounds, is_horizontal, remaining_space, total_flex);

                    // Advance position for next item
                    float main_size = get_main_size(child, params, size, is_horizontal, remaining_space, total_flex);
                    position += main_size + props_.gap;
                }
            } else {
                // Process in normal order
                for (size_t i = 0; i < children.size(); ++i) {
                    const auto& child = children[i];
                    const auto& params = child->get_layout_properties();
                    const auto& size = sizes[i];

                    // Process child layout
                    process_child_layout(child, params, size, position, bounds, is_horizontal, remaining_space, total_flex);

                    // Advance position for next item
                    float main_size = get_main_size(child, params, size, is_horizontal, remaining_space, total_flex);
                    position += main_size + props_.gap;
                }
            }
        }

    private:
        // Helper method to get the main axis size of an element
        static float get_main_size(const std::shared_ptr<Element>& child,
                           const LayoutProperties& params,
                           const Size<float>& size,
                           bool is_horizontal,
                           float remaining_space,
                           float total_flex) {
            // Calculate main axis dimension (width for row, height for column)
            float main_size;
            if (params.flex_grow > 0 && total_flex > 0) {
                main_size = (remaining_space * params.flex_grow) / total_flex;
            } else {
                main_size = is_horizontal ? size.width() : size.height();
            }

            // Apply margins
            main_size += is_horizontal ?
                params.get_total_horizontal_space() :
                params.get_total_vertical_space();

            return main_size;
        }

            void process_child_layout(const std::shared_ptr<Element>& child,
                             const LayoutProperties& params,
                             const Size<float>& size,
                             float position,
                             const Rect<float>& bounds,
                             bool is_horizontal,
                             float remaining_space,
                             float total_flex) const {
        // Calculate main axis dimension (width for row, height for column)
        float main_size;
        if (params.flex_grow > 0 && total_flex > 0) {
            main_size = (remaining_space * params.flex_grow) / total_flex;
        } else {
            main_size = is_horizontal ? size.width() : size.height();
        }

        // Apply margin to main size
        main_size += is_horizontal ?
            params.get_total_horizontal_space() :
            params.get_total_vertical_space();

        // Calculate cross axis dimension and position
        float cross_size = is_horizontal ? size.height() : size.width();
        float cross_position = is_horizontal ? bounds.y() : bounds.x();

        // Apply alignments for cross axis (align-items)
        switch (props_.align_items) {
            case FlexAlign::Center:
                cross_position += ((is_horizontal ? bounds.height() : bounds.width()) - cross_size) / 2;
                break;
            case FlexAlign::End:
                cross_position += (is_horizontal ? bounds.height() : bounds.width()) - cross_size;
                break;
            case FlexAlign::Start:
            default:
                break;
        }

        // Override with align-self if specified
        if (params.align_self != LayoutProperties::Alignment::Start) {
            switch (params.align_self) {
                case LayoutProperties::Alignment::Center:
                    cross_position = (is_horizontal ? bounds.y() : bounds.x()) +
                                   ((is_horizontal ? bounds.height() : bounds.width()) - cross_size) / 2;
                    break;
                case LayoutProperties::Alignment::End:
                    cross_position = (is_horizontal ? bounds.y() : bounds.x()) +
                                   (is_horizontal ? bounds.height() : bounds.width()) - cross_size;
                    break;
                case LayoutProperties::Alignment::Stretch:
                    cross_size = is_horizontal ? bounds.height() : bounds.width();
                    cross_position = is_horizontal ? bounds.y() : bounds.x();
                    break;
                default:
                    break;
            }
        }

        // Build the child's bounds rectangle
        Rect<float> child_bounds;
        if (is_horizontal) {
            child_bounds = Rect<float>{
                position + params.margin.left,
                cross_position + params.margin.top,
                main_size - params.get_total_horizontal_space(),
                cross_size - params.get_total_vertical_space()
            };
        } else {
            child_bounds = Rect<float>{
                cross_position + params.margin.left,
                position + params.margin.top,
                cross_size - params.get_total_horizontal_space(),
                main_size - params.get_total_vertical_space()
            };
        }

        // Apply the bounds to the child
        child->set_bounds(child_bounds);
    }



    public:


        Size<float> measure(const Element& element) override {
            const auto& children = element.get_children();
            if (children.empty()) return Size<float>{0, 0};

            bool is_horizontal = (props_.direction == FlexDirection::Row || props_.direction == FlexDirection::RowReverse);

            // For non-wrapping layout, measure is straightforward
            if (props_.wrap == FlexWrap::NoWrap) {
                float main_axis_size = 0;
                float cross_axis_size = 0;

                for (size_t i = 0; i < children.size(); ++i) {
                    const auto& child = children[i];
                    const auto& params = child->get_layout_properties();
                    auto size = child->get_preferred_size();

                    // Add spacing
                    size.width(size.width() + params.get_total_horizontal_space());
                    size.height(size.height() + params.get_total_vertical_space());

                    if (is_horizontal) {
                        main_axis_size += size.width();
                        cross_axis_size = std::max(cross_axis_size, size.height());
                    } else {
                        main_axis_size += size.height();
                        cross_axis_size = std::max(cross_axis_size, size.width());
                    }

                    // Add gap between elements (except for last element)
                    if (i < children.size() - 1) {
                        main_axis_size += props_.gap;
                    }
                }

                // Return size with proper orientation
                return is_horizontal ?
                    Size<float>{main_axis_size, cross_axis_size} :
                    Size<float>{cross_axis_size, main_axis_size};
            }

            // For wrapping layouts, we need to simulate the layout
            return measure_wrapped(element);
        }

    private:
                [[nodiscard]] Size<float> measure_wrapped(const Element& element) const {
            const auto& children = element.get_children();
            if (children.empty()) return Size<float>{0, 0};

            bool is_horizontal = (props_.direction == FlexDirection::Row || props_.direction == FlexDirection::RowReverse);

            float line_main_size = 0;    // current line width or height
            float total_cross_size = 0;  // total height or width
            float max_main_size = 0;     // max width or height of any line
            float line_cross_size = 0;   // current line height or width

            // Assume parent has infinite width/height for measurement
            float max_line_size = std::numeric_limits<float>::max();

            for (const auto& child : children) {
                const auto& params = child->get_layout_properties();
                auto size = child->get_preferred_size();

                // Add spacing
                size.width(size.width() + params.get_total_horizontal_space());
                size.height(size.height() + params.get_total_vertical_space());

                float item_main_size = is_horizontal ? size.width() : size.height();
                float item_cross_size = is_horizontal ? size.height() : size.width();

                // Check if this item needs to wrap
                if (line_main_size > 0 && line_main_size + props_.gap + item_main_size > max_line_size) {
                    // Wrap to new line
                    max_main_size = std::max(max_main_size, line_main_size);
                    total_cross_size += line_cross_size + props_.gap;
                    line_main_size = item_main_size;
                    line_cross_size = item_cross_size;
                } else {
                    // Add to current line
                    if (line_main_size > 0) line_main_size += props_.gap;
                    line_main_size += item_main_size;
                    line_cross_size = std::max(line_cross_size, item_cross_size);
                }
            }

            // Don't forget the last line
            max_main_size = std::max(max_main_size, line_main_size);
            total_cross_size += line_cross_size;

            // Return size with proper orientation
            return is_horizontal ?
                Size<float>{max_main_size, total_cross_size} :
                Size<float>{total_cross_size, max_main_size};
        }

        // Helper method to arrange wrapped layouts
        void arrange_wrapped(const Element& element, const Rect<float>& bounds, bool is_horizontal, bool is_reverse) {
                    const auto& children = element.get_children();
                    if (children.empty()) return;

                    float max_line_size = is_horizontal ? bounds.width() : bounds.height();

                    // First, collect lines of items
                    std::vector<std::vector<size_t>> lines;
                    std::vector<float> line_cross_sizes;

                    float line_main_size = 0;
                    float line_cross_size = 0;
                    std::vector<size_t> current_line;

                    // Group items into lines
                    for (size_t i = 0; i < children.size(); ++i) {
                        const auto& child = children[i];
                        const auto& params = child->get_layout_properties();
                        auto size = child->get_preferred_size();

                        // Add spacing
                        size.width(size.width() + params.get_total_horizontal_space());
                        size.height(size.height() + params.get_total_vertical_space());

                        float item_main_size = is_horizontal ? size.width() : size.height();
                        float item_cross_size = is_horizontal ? size.height() : size.width();

                        // Check if this item needs to wrap
                        if (line_main_size > 0 && line_main_size + props_.gap + item_main_size > max_line_size) {
                            // Wrap to new line
                            lines.push_back(current_line);
                            line_cross_sizes.push_back(line_cross_size);

                            current_line = {i};
                            line_main_size = item_main_size;
                            line_cross_size = item_cross_size;
                        } else {
                            // Add to current line
                            current_line.push_back(i);
                            if (line_main_size > 0) line_main_size += props_.gap;
                            line_main_size += item_main_size;
                            line_cross_size = std::max(line_cross_size, item_cross_size);
                        }


                    }

                    if (!current_line.empty()) {
                        lines.push_back(current_line);
                        line_cross_sizes.push_back(line_cross_size);
                    }

                    // Handle wrapping direction
                    if (props_.wrap == FlexWrap::WrapReverse) {
                        std::ranges::reverse(lines);
                        std::ranges::reverse(line_cross_sizes);
                    }

                    // Calculate total cross size and remaining space
                    float total_cross_size = 0;
                    for (float size : line_cross_sizes) {
                        total_cross_size += size;
                    }

                    float cross_axis_gaps = props_.gap * std::max(0.0f, static_cast<float>(lines.size() - 1));
                    float remaining_cross_space = (is_horizontal ? bounds.height() : bounds.width()) -
                                                total_cross_size - cross_axis_gaps;

                    // Determine starting cross position based on align-content
                    float cross_position = is_horizontal ? bounds.y() : bounds.x();

                    switch (props_.align_content) {
                        case FlexAlign::Center:
                            cross_position += remaining_cross_space / 2;
                        break;
                        case FlexAlign::End:
                            cross_position += remaining_cross_space;
                        break;
                        case FlexAlign::SpaceBetween:
                            if (lines.size() > 1) {
                                float extra_gap = remaining_cross_space / (static_cast<float>(lines.size()) - 1);
                                cross_axis_gaps += extra_gap;
                            }
                        break;
                        case FlexAlign::SpaceAround: {
                            float space_per_line = remaining_cross_space / static_cast<float>(lines.size());
                            cross_position += space_per_line / 2;
                            cross_axis_gaps += space_per_line;
                            break;
                        }
                        case FlexAlign::SpaceEvenly: {
                            float space_per_gap = remaining_cross_space / static_cast<float>(lines.size() + 1);
                            cross_position += space_per_gap;
                            cross_axis_gaps += space_per_gap;
                            break;
                        }
                        case FlexAlign::Start:
                            default:
                                break;
                    }
                                for (size_t line_idx = 0; line_idx < lines.size(); ++line_idx) {
                const auto& line = lines[line_idx];
                float line_main_size_local = 0;
                float line_flex_total = 0;

                // Calculate total main size for this line and flex total
                for (size_t idx : line) {
                    const auto& child = children[idx];
                    const auto& params = child->get_layout_properties();
                    auto size = child->get_preferred_size();

                    if (params.flex_grow > 0) {
                        line_flex_total += params.flex_grow;
                    } else {
                        float item_size = is_horizontal ? size.width() : size.height();
                        line_main_size_local += item_size +
                            (is_horizontal ? params.get_total_horizontal_space() : params.get_total_vertical_space());
                    }
                }

                // Add gaps between items
                line_main_size_local += props_.gap * std::max(0.0f, static_cast<float>(line.size() - 1));

                // Calculate remaining space for flex items
                float line_remaining_space = max_line_size - line_main_size_local;

                // Calculate main axis starting position based on justify-content
                float main_position = is_horizontal ? bounds.x() : bounds.y();

                if (line_flex_total == 0 && line_main_size_local < max_line_size) {
                    switch (props_.justify_content) {
                        case FlexAlign::Center:
                            main_position += (max_line_size - line_main_size_local) / 2;
                            break;
                        case FlexAlign::End:
                            main_position += max_line_size - line_main_size_local;
                            break;
                        case FlexAlign::SpaceBetween:
                            if (line.size() > 1) {
                                props_.gap += line_remaining_space / (static_cast<float>(line.size()) - 1);
                            }
                            break;
                        case FlexAlign::SpaceAround: {
                            float space_per_item = line_remaining_space / static_cast<float>(line.size());
                            main_position += space_per_item / 2;
                            props_.gap += space_per_item;
                            break;
                        }
                        case FlexAlign::SpaceEvenly: {
                            float space_per_gap = line_remaining_space / static_cast<float>(line.size() + 1);
                            main_position += space_per_gap;
                            props_.gap += space_per_gap;
                            break;
                        }
                        case FlexAlign::Start:
                        default:
                            break;
                    }
                }

                // Position items in this line
                if (is_reverse) {
                    // Reverse the order of items in this line
                    std::vector reversed_line(line.rbegin(), line.rend());

                    for (size_t idx : reversed_line) {
                        const auto& child = children[idx];
                        position_child_in_wrapped_layout(
                            child,
                            main_position,
                            cross_position,
                            line_cross_sizes[line_idx],
                            is_horizontal,
                            line_remaining_space,
                            line_flex_total
                        );

                        // Update main position
                        float main_size = calculate_child_main_size(
                            child,
                            is_horizontal,
                            line_remaining_space,
                            line_flex_total
                        );
                        main_position += main_size + props_.gap;
                    }
                } else {
                    for (size_t idx : line) {
                        const auto& child = children[idx];
                        position_child_in_wrapped_layout(
                            child,
                            main_position,
                            cross_position,
                            line_cross_sizes[line_idx],
                            is_horizontal,
                            line_remaining_space,
                            line_flex_total
                        );

                        // Update main position
                        float main_size = calculate_child_main_size(
                            child,
                            is_horizontal,
                            line_remaining_space,
                            line_flex_total
                        );
                        main_position += main_size + props_.gap;
                    }
                }

                // Advance cross position for next line
                cross_position += line_cross_sizes[line_idx] + cross_axis_gaps;
            }
        }

        void position_child_in_wrapped_layout(
            const std::shared_ptr<Element>& child,
            float main_position,
            float cross_position,
            float line_cross_size,
            bool is_horizontal,
            float line_remaining_space,
            float line_flex_total
        ) const {
            const auto& params = child->get_layout_properties();
            auto size = child->get_preferred_size();

            // Calculate main axis size
            float main_size;
            if (params.flex_grow > 0 && line_flex_total > 0) {
                main_size = (line_remaining_space * params.flex_grow) / line_flex_total;
                main_size += is_horizontal ? size.width() : size.height();
            } else {
                main_size = is_horizontal ? size.width() : size.height();
            }

            // Add margins
            main_size += is_horizontal ? params.get_total_horizontal_space() : params.get_total_vertical_space();

            // Calculate cross axis size and position
            float item_cross_size = is_horizontal ? size.height() : size.width();
            float item_cross_position = cross_position;

            // Apply align-items
            switch (props_.align_items) {
                case FlexAlign::Center:
                    item_cross_position += (line_cross_size - item_cross_size) / 2;
                    break;
                case FlexAlign::End:
                    item_cross_position += line_cross_size - item_cross_size;
                    break;
                case FlexAlign::Start:
                    // Already at start
                    break;
                default:
                    break;
            }

            // Override with align-self if specified
            if (params.align_self != LayoutProperties::Alignment::Start) {
                switch (params.align_self) {
                    case LayoutProperties::Alignment::Center:
                        item_cross_position = cross_position + (line_cross_size - item_cross_size) / 2;
                        break;
                    case LayoutProperties::Alignment::End:
                        item_cross_position = cross_position + line_cross_size - item_cross_size;
                        break;
                    case LayoutProperties::Alignment::Stretch:
                        item_cross_size = line_cross_size;
                        item_cross_position = cross_position;
                        break;
                    default:
                        break;
                }
            }

            // Build the child's bounds rectangle
            Rect<float> child_bounds;
            if (is_horizontal) {
                child_bounds = Rect<float>{
                    main_position + params.margin.left,
                    item_cross_position + params.margin.top,
                    main_size - params.get_total_horizontal_space(),
                    item_cross_size - params.get_total_vertical_space()
                };
            } else {
                child_bounds = Rect<float>{
                    item_cross_position + params.margin.left,
                    main_position + params.margin.top,
                    item_cross_size - params.get_total_horizontal_space(),
                    main_size - params.get_total_vertical_space()
                };
            }

            // Apply the bounds to the child
            child->set_bounds(child_bounds);
        }

        static float calculate_child_main_size(
            const std::shared_ptr<Element>& child,
            bool is_horizontal,
            float line_remaining_space,
            float line_flex_total
        ) {
                    const auto& params = child->get_layout_properties();
                    auto size = child->get_preferred_size();

                    // Calculate main axis size
                    float main_size;
                    if (params.flex_grow > 0 && line_flex_total > 0) {
                        main_size = (line_remaining_space * params.flex_grow) / line_flex_total;
                        main_size += is_horizontal ? size.width() : size.height();
                    } else {
                        main_size = is_horizontal ? size.width() : size.height();
                    }

                    // Add margins
                    main_size += is_horizontal ? params.get_total_horizontal_space() : params.get_total_vertical_space();

                    return main_size;
        }



    };
}
