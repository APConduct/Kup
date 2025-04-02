//
// Created by Aidan Jost on 4/2/25.
//

module;
#include <memory>
export module plastic.layout.builders;

import plastic.core.layout.base;
import plastic.element;
import plastic.layout_properties; // For EdgeInsets
import plastic.edge;

export namespace plastic::layout
{
    template<typename Derived>
    class Builder {
    protected:
        std::shared_ptr<Element> element_{};
        LayoutProperties layout_props_;

    public:
        explicit Builder(const std::shared_ptr<Element>& element)
            : element_(element){}

        // Layout configuration

        // Comon layout properties
        Derived& with_padding(const Edge<float>& padding) {
            layout_props_.padding = padding;
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        Derived& with_padding(float padding) {
            layout_props_.padding = Edge{padding, padding, padding, padding};
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        Derived& with_margin(float margin) {
            layout_props_.margin = Edge{margin, margin, margin, margin};
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        Derived& with_margin(const Edge<float>& margin) {
            layout_props_.margin = margin;
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        Derived& with_flex_grow(float grow) {
            layout_props_.flex_grow = grow;
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        Derived& with_flex_shrink(float shrink) {
            layout_props_.flex_shrink = shrink;
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        Derived& with_flex_bases(float basis) {
            layout_props_.flex_basis = basis;
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return static_cast<Derived&>(*this);
        }

        /// @brief Build the configured element
        std::shared_ptr<Element> build() {
            // Ensure final layout properties are applied
            if (element_) {
                element_->set_layout_properties(layout_props_);
            }
            return element_;
        }
    };
}
