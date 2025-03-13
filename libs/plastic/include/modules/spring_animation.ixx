//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <functional>
export module plastic.spring_animation;
import plastic.animation_base;

export namespace plastic
{
    template <typename T>
class SpringAnimation : public AnimationBase {
    private:
        T target_;
        T current_;
        T velocity_;
        float stiffness_{100.0f};
        float damping_{10.0f};
        float mass_{1.0f};
        std::function<void(T)> on_update_;
        bool active_{false};

    public:
        SpringAnimation(T initial, T target, std::function<void(T)> on_update)
            : AnimationBase(0), target_(target), current_(initial), velocity_{}, on_update_(std::move(on_update)) {
        }

        void set_target(T target) {
            target_ = target;
            active_ = true;
        }

        void update(float dt) override {
            if (!active_) return;

            // Spring physics
            T force = (target_ - current_) * stiffness_;
            T acceleration = force / mass_;
            velocity_ = velocity_ * (1.0f - damping_ * dt) + acceleration * dt;
            current_ = current_ + velocity_ * dt;

            on_update_(current_);

            // Check if spring has settled
            T delta = target_ - current_;
            if (std::abs(delta) < 0.01f && std::abs(velocity_) < 0.01f) {
                current_ = target_;
                velocity_ = T{};
                active_ = false;
                on_update_(current_);
                if (on_complete_) {
                    on_complete_();
                }
            }
        }

        void configure(float stiffness, float damping, float mass) {
            stiffness_ = stiffness;
            damping_ = damping;
            mass_ = mass;
        }
    };

}
