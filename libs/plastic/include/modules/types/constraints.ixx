//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <memory>
#include <unordered_map>

export module plastic.constraints;

import plastic.element;
import plastic.rect;
import plastic.size;
import plastic.layout;
import plastic.constrain_anchor;
import plastic.constraint;


export import plastic.constraint;


export namespace plastic {




    class RelativeConstraint : public Constraint {
    private:
        std::weak_ptr<Element> target_;
        ConstraintAnchor target_anchor_;
        ConstraintAnchor source_anchor_;
        float offset_{0};
        float multiplier_{1.0f};

    public:
        RelativeConstraint(std::weak_ptr<Element> target,
                          ConstraintAnchor target_anchor,
                          ConstraintAnchor source_anchor,
                          float offset = 0,
                          float multiplier = 1.0f)
            : target_(std::move(target)), target_anchor_(target_anchor),
              source_anchor_(source_anchor), offset_(offset), multiplier_(multiplier) {}

        [[nodiscard]] float resolve(const Element& element, const Rect<float>& parent_bounds) const override {
            if (auto target = target_.lock()) {
                float anchor_value = get_anchor_value(*target, target_anchor_);
                return anchor_value * multiplier_ + offset_;
            }

            // Fallback to parent bounds
            switch (source_anchor_) {
                case ConstraintAnchor::Left: return parent_bounds.x();
                case ConstraintAnchor::Right: return parent_bounds.x() + parent_bounds.width();
                case ConstraintAnchor::Top: return parent_bounds.y();
                case ConstraintAnchor::Bottom: return parent_bounds.y() + parent_bounds.height();
                case ConstraintAnchor::CenterX: return parent_bounds.x() + parent_bounds.width() / 2;
                case ConstraintAnchor::CenterY: return parent_bounds.y() + parent_bounds.height() / 2;
                case ConstraintAnchor::Width: return parent_bounds.width() * multiplier_ + offset_;
                case ConstraintAnchor::Height: return parent_bounds.height() * multiplier_ + offset_;
                default: return 0;
            }
        }

    private:
        static float get_anchor_value(const Element& element, ConstraintAnchor anchor) {
            const auto& bounds = element.get_bounds();
            switch (anchor) {
                case ConstraintAnchor::Left: return bounds.x();
                case ConstraintAnchor::Right: return bounds.x() + bounds.width();
                case ConstraintAnchor::Top: return bounds.y();
                case ConstraintAnchor::Bottom: return bounds.y() + bounds.height();
                case ConstraintAnchor::CenterX: return bounds.x() + bounds.width() / 2;
                case ConstraintAnchor::CenterY: return bounds.y() + bounds.height() / 2;
                case ConstraintAnchor::Width: return bounds.width();
                case ConstraintAnchor::Height: return bounds.height();
                default: return 0;
            }
        }
    };

    class ConstraintLayout : public Layout {
    private:
        std::unordered_map<Element*, std::unordered_map<ConstraintAnchor, std::unique_ptr<Constraint>>> constraints_;

    public:
        void set_constraint(Element* element, ConstraintAnchor anchor, std::unique_ptr<Constraint> constraint) {
            constraints_[element][anchor] = std::move(constraint);
        }

        void arrange(Element& element, const Rect<float>& bounds) override {
            for (const auto& child : element.get_children()) {
                Rect<float> child_bounds = calculate_bounds(*child, bounds);
                child->set_bounds(child_bounds);
            }
        }

        [[nodiscard]] Size<float> measure(const Element& element) override {
            // Implementation to determine preferred size based on constraints
            return Size<float>{0, 0}; // Placeholder
        }

    private:
        // ReSharper disable once CppParameterMayBeConstPtrOrRef
        Rect<float> calculate_bounds(Element& element, const Rect<float>& parent_bounds) {
            auto it = constraints_.find(&element);
            if (it == constraints_.end()) return Rect<float>{};

            float left = parent_bounds.x();
            float top = parent_bounds.y();
            float width = element.get_preferred_size().width();
            float height = element.get_preferred_size().height();

            // Resolve constraints
            for (const auto& [anchor, constraint] : it->second) {
                float value = constraint->resolve(element, parent_bounds);

                switch (anchor) {
                    case ConstraintAnchor::Left: left = value; break;
                    case ConstraintAnchor::Top: top = value; break;
                    case ConstraintAnchor::Width: width = value; break;
                    case ConstraintAnchor::Height: height = value; break;
                    default: ;
                    // Handle other anchors...
                }
            }

            return Rect<float>{left, top, width, height};
        }
    };
}

