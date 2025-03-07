module;
#include <cstddef>
#include <vector>
#include <unordered_map>
#include <algorithm>
#include <raylib.h>

export module plastic.grid_layout;

import plastic.layout;
import plastic.layout_properties;
import plastic.element;
import plastic.rect;
import plastic.size;
import plastic.context;

export namespace plastic
{
    struct GridCell {
        int row;
        int col;
        int row_span{1};
        int col_span{1};

        GridCell() : row(0), col(0), row_span(1), col_span(1) {}

        GridCell(int r, int c) : row(r), col(c) {}

        GridCell(int r, int c, int rs, int cs) : row(r), col(c), row_span(rs), col_span(cs) {}

        [[nodiscard]] bool overlaps(const GridCell& other) const {
            return !(row + row_span <= other.row ||
            other.row + other.row_span <= row ||
                col + col_span <= other.col ||
                other.col + other.col_span <= col);
        }

        struct Hash {
            size_t operator()(const GridCell& cell) const {
                return std::hash<int>()(cell.row) ^ std::hash<int>()(cell.col);
            }
        };

        bool operator==(const GridCell& other) const {
            return row == other.row &&
            col == other.col &&
            row_span == other.row_span &&
            col_span == other.col_span;
        }
    };

    struct GridLayoutProperties : public plastic::LayoutProperties {
        float row_gap{5.0f};
        float col_gap{5.0f};

        explicit GridLayoutProperties(float row_gap = 5.0f, float col_gap = 5.0f)
            : row_gap(row_gap), col_gap(col_gap) {}

        GridLayoutProperties& with_row_gap( float gap) {
            row_gap = gap;
            return *this;
        }

        GridLayoutProperties& with_col_gap( float gap) {
            col_gap = gap;
            return *this;
        }

    };

    class GridLayout : public Layout {
    private:
        std::unordered_map<Element*, GridCell> cell_map;

        int rows_{0};
        int cols_{0};


        GridLayoutProperties props_;

        mutable std::vector<float> row_heights_;
        mutable std::vector<float> col_widths_;

        void update_dimensions() {
            rows_ = 0;
            cols_ = 0;

            for(const auto& [element, cell] : cell_map) {
                rows_ = std::max(rows_, cell.row + cell.row_span);
                cols_ = std::max(cols_, cell.col + cell.col_span);
            }

            row_heights_.resize(rows_);
            col_widths_.resize(cols_);
        }

        void calc_sizes(const Element& container) const {
            const auto& children = container.get_children();
            std::ranges::fill(row_heights_, 0.0f);
            std::ranges::fill(col_widths_, 0.0f);


            for (const auto& child : children) {
                auto it = cell_map.find(child.get());
                if (it == cell_map.end()) continue;

                const auto& cell = it->second;
                auto size = child->get_preferred_size();

                if (cell.row_span == 1 && cell.col_span == 1) {
                    row_heights_[cell.row] = std::max(row_heights_[cell.row], size.height());
                    col_widths_[cell.col] = std::max(col_widths_[cell.col], size.width());
                } else {
                    float cell_height = size.height() / static_cast<float>(cell.row_span);
                    float cell_width = size.width() / static_cast<float>(cell.col_span);

                    for (int r = 0; r < cell.row + cell.row_span; ++r) {
                        row_heights_[r] = std::max(row_heights_[r], cell_height);
                    }

                    for (int c = cell.col; c < cell.col + cell.col_span; ++c) {
                        col_widths_[c] = std::max(col_widths_[c], cell_width);
                    }
                }
            }



        }
    public:
        explicit GridLayout(GridLayoutProperties props = GridLayoutProperties())
            :  props_(props) {}



        // Place a child element in a specific cell
        void place(Element* element, int row, int column, int row_span = 1, int column_span = 1) {
            GridCell new_cell{row, column, row_span, column_span};

            // Check for overlaps
            for (const auto& [elem, cell] : cell_map) {
                if (elem != element && cell.overlaps(new_cell)) {
                    throw std::runtime_error("Cell placement overlaps with existing element");
                }
            }

            cell_map[element] = new_cell;
        }

        // Remove an element from the grid
        void remove(Element* element) {
            cell_map.erase(element);
        }

        // Layout implementation
        void arrange(Element& element, const Rect<float>& bounds) override {
            update_dimensions();
            calc_sizes(element);

            const auto& children = element.get_children();

            // Calculate total heights and widths with gaps
            float total_height = 0.0f;
            float total_width = 0.0f;

            for (float height : row_heights_) {
                total_height += height;
            }
            total_height += props_.row_gap * static_cast<float>(std::max(0, rows_ - 1));

            for (float width : col_widths_) {
                total_width += width;
            }
            total_width += props_.col_gap * static_cast<float>(std::max(0, cols_ - 1));

            // Calculate scaling factors if grid is larger than bounds
            float scale_x = 1.0f;
            float scale_y = 1.0f;

            if (total_width > bounds.width()) {
                scale_x = bounds.width() / total_width;
            }

            if (total_height > bounds.height()) {
                scale_y = bounds.height() / total_height;
            }

            // Scale row heights and column widths
            for (auto& height : row_heights_) {
                height *= scale_y;
            }

            for (auto& width : col_widths_) {
                width *= scale_x;
            }

            // Calculate row and column positions
            std::vector<float> row_positions(rows_);
            std::vector<float> column_positions(cols_);

            row_positions[0] = bounds.y();
            for (int i = 1; i < rows_; ++i) {
                row_positions[i] = row_positions[i-1] + row_heights_[i-1] + props_.row_gap * scale_y;
            }

            column_positions[0] = bounds.x();
            for (int i = 1; i < cols_; ++i) {
                column_positions[i] = column_positions[i-1] + col_widths_[i-1] + props_.col_gap * scale_x;
            }

            // Position each child element
            for (const auto& child : children) {
                auto it = cell_map.find(child.get());
                if (it == cell_map.end()) {
                    // If not explicitly placed, try to find the next available cell
                    continue;
                }

                const auto& cell = it->second;

                // Calculate cell bounds
                float x = column_positions[cell.col];
                float y = row_positions[cell.row];

                float width = 0.0f;
                for (int c = 0; c < cell.col_span; ++c) {
                    width += col_widths_[cell.col + c];
                }
                width += props_.col_gap * scale_x * static_cast<float>(cell.col_span - 1);

                float height = 0.0f;
                for (int r = 0; r < cell.row_span; ++r) {
                    height += row_heights_[cell.row + r];
                }
                height += props_.row_gap * scale_y * static_cast<float>(cell.row_span - 1);

                // Apply layout properties
                const auto& layout_props = child->get_layout_properties();

                // Apply margin
                x += layout_props.margin.left;
                y += layout_props.margin.top;
                width -= (layout_props.margin.left + layout_props.margin.right);
                height -= (layout_props.margin.top + layout_props.margin.bottom);

                // Position the child
                child->set_bounds(Rect<float>{x, y, width, height});
            }
        }

        // Measure implementation
        [[nodiscard]] Size<float> measure(const Element& element) override {
            update_dimensions();
            calc_sizes(element);

            float total_width = 0.0f;
            float total_height = 0.0f;

            for (float width : col_widths_) {
                total_width += width;
            }
            total_width += props_.col_gap * static_cast<float>(std::max(0, cols_ - 1));

            for (float height : row_heights_) {
                total_height += height;
            }
            total_height += props_.row_gap * static_cast<float>(std::max(0, rows_ - 1));

            return Size<float>{total_width, total_height};
        }

        GridLayoutProperties props() const {
            return props_;
        }

    };

        // GridContainer combines Element with GridLayout for convenience
    class GridContainer : public Element {
    private:
        std::shared_ptr<GridLayout> layout_;

    public:
        explicit GridContainer(GridLayoutProperties props = GridLayoutProperties()) {
            layout_ = std::make_shared<GridLayout>(props);
        }

        // Place a child in a specific cell
        void place(const std::shared_ptr<Element>& child, int row, int column, int row_span = 1, int column_span = 1) {
            add_child(child);
            layout_->place(child.get(), row, column, row_span, column_span);
            invalidate();
        }

        // Remove a child from the grid
        void remove(const std::shared_ptr<Element>& child) {
            // First remove from grid layout
            layout_->remove(child.get());
            remove_child(child);
        }

        void banish(const std::shared_ptr<Element>& child) const {
            // Remove from grid layout tracking
            layout_->remove(child.get());
            // Let parent class handle the actual removal from the children vector
            // This assumes Element has a protected/public method for this
            // For example: this->remove_child(child);
            // If not available, you'll need to implement the proper mechanism
        }


        // Layout implementation
        void layout(Context* cx) override {
            layout_->arrange(*this, get_bounds());
        }

        // Paint implementation
        void paint(Context* cx) const override {
            // Draw background if specified
            const auto& bounds = get_bounds();

            // Draw background if color is specified
            if (auto bg_color = get_style().background_color_normal) {
                DrawRectangleRec(
                    {bounds.x(), bounds.y(), bounds.width(), bounds.height()},
                    bg_color->rl()
                );
            }

            // Draw border if specified
            if (auto border_color = get_style().border) {
                DrawRectangleLinesEx(
                    {bounds.x(), bounds.y(), bounds.width(), bounds.height()},
                    1.0f,  // Border width
                    border_color->rl()
                );
            }

            // Paint all children
            for (const auto& child : get_children()) {
                child->paint(cx);
            }
        }

        // Get layout properties
        [[nodiscard]] GridLayoutProperties grid_properties() const {
            return layout_->props();
        }

        // Get preferred size
        [[nodiscard]] Size<float> get_preferred_size() const override {
            return layout_->measure(*this);
        }
    };
}

