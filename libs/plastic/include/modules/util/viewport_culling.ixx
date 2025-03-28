//
// Created by Aidan Jost on 3/7/25.
//

module;

#include <memory>
#include <vector>

export module plastic.rendering.culling;

import plastic.rect;
import plastic.element;
import plastic.context;

export namespace plastic
{

    class ViewportCulling {
    private:
        Rect<float> viewport_;
        bool enabled_{true};
        std::vector<std::weak_ptr<Element>> tracked_elements_;

    public:
        explicit ViewportCulling(const Rect<float> &viewport) : viewport_(viewport) {}

        void set_viewport(const Rect<float> &viewport) {
            viewport_ = viewport;
        }

        void set_enabled(bool enabled) {
            enabled_ = enabled;
        }

        [[nodiscard]] bool should_render(const Element &element) const {
            if (!enabled_) return true;
            return elements_intersect(element.get_bounds(), viewport_);
        }

        template <typename C>
        void cull_elements(const C& elements, std::vector<std::shared_ptr<Element>>& visible) {
            if (!enabled_) {
                visible.assign(elements.begin(), elements.end());
                return;
            }
            for (const auto& element : elements) {
                if (elements_intersect(element->get_bounds(), viewport_)) {
                    visible.push_back(element);
                }
            }
        }

    private:
        static bool elements_intersect(const Rect<float>& a, const Rect<float>& b) {
            return !(a.x() + a.width() <= b.x() ||
                b.x() + b.width() <= a.x() ||
                a.y() + a.height() <= b.y() ||
                b.y() + b.height() <= a.y());
        }
    };

    class CullingDecorator {
    private:
        std::shared_ptr<Element> element_;
        ViewportCulling culling_;

    public:
        CullingDecorator(std::shared_ptr<Element> element, const Rect<float>& viewport)
            : element_(std::move(element)), culling_(viewport) {}

        void paint(Context* cx) const {
            if (culling_.should_render(*element_)) {
                element_->paint(cx);
            }
        }

        // Delegate other operations to the wrapped element
        [[nodiscard]] std::shared_ptr<Element> get_element() const {
            return element_;
        }

        void set_viewport(const Rect<float>& viewport) {
            culling_.set_viewport(viewport);
        }
    };

}
