//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <memory>
#include <vector>
#include <raylib.h>
#if defined(_WIN32)
#include <variant>
#endif
export module plastic.focus_manager;

import plastic.element;
import plastic.events;
import plastic.context;
import plastic.point;
import plastic.scrollable;

export namespace plastic
{

    class FocusManager {
        std::vector<std::weak_ptr<Element>> focus_stack_;

        void push_focus(std::shared_ptr<Element> element) {
            focus_stack_.push_back(element);
            element->set_focused(true);
        }

        void pop_focus() {
            if (auto element = focus_stack_.back().lock()) {
                element->set_focused(false);
            }
            focus_stack_.pop_back();

            if (auto new_focus = focus_stack_.back().lock()) {
                new_focus->set_focused(true);
            }
        }
    };


}