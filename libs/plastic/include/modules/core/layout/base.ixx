//
// Created by Aidan Jost on 4/2/25.
//

module;
#include <string_view>

export module plastic.core.layout.base;

import plastic.rect;
import plastic.size;
import plastic.element;
import plastic.layout_properties;
import plastic.edge;

export namespace plastic::core::layout
{

    struct Constants {
        static constexpr float UNBOUNDED = std::numeric_limits<float>::infinity();
        static constexpr float MIN_SIZE = 0.0f;
    };

    struct Context {
        Size<float> available_size;
        Size<float> min_size;
        Size<float> max_size;
    };

    class Engine {
        virtual ~Engine() = default;

        // Measure pass
        virtual Size<float> measure(const Element& element, const Context& context) = 0;

        // Arrange pass
        virtual void arrange(const Element& element, const Rect<float>& bounds) = 0;

        // Optional layout pass
        virtual bool validate(const Element& element) {
            return true;
        };
    };

    struct  Registry {
        virtual ~Registry() = default;
        virtual void register_layout(std::string_view, std::unique_ptr<Engine> engine) = 0;
        virtual Engine* get_layout(std::string_view name) = 0;
    };

}
