//
// Created by Aidan Jost on 3/7/25.
//
/// @file scrollable_base.ixx
/// @brief Scrollable base class for scrollable elements

module;
#include <memory>
export module plastic.scrollable_base;
import plastic.element;

export namespace plastic
{
    class ScrollableBase {
    public:
        virtual ~ScrollableBase() = default;
        virtual void scroll_to_element(const std::shared_ptr<Element>& element) = 0;
    };

}
