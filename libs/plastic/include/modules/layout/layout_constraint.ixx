//
// Created by Aidan Jost on 3/28/25.
//

module;
#include <functional>
export module plastic.layout_constraint;
import plastic.element;

export namespace plastic
{
    class LayoutConstraint {
    public:
        enum class Type {
            Equal,
            LessThan,
            GreaterThan
        };

    protected:
        std::weak_ptr<Element> source;
        std::weak_ptr<Element> target;
        Type type{};
        float multiplier{};
        float constant{};

        std::function<void(const std::shared_ptr<Element>&)> callback;

    public:
        void apply() const {
            if (auto s = source.lock()) {
                if (auto t = target.lock()) {
                    callback(s);
                }
            }
        }

        void set_apply_callback(std::function<void(const std::shared_ptr<Element>&)> cb) {
            callback = std::move(cb);
        }

        LayoutConstraint& with_apply_callback(std::function<void(const std::shared_ptr<Element>&)> cb) {
            set_apply_callback(std::move(cb));
            return *this;
        }
    };

}