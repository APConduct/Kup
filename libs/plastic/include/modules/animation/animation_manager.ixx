//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <memory>
#include <vector>
#include <unordered_map>
#include <string>
#include <mutex>
#include <functional>
export module plastic.animation_manager;
import plastic.animation_base;

import plastic.animation;
import plastic.color;
import plastic.point;

export namespace plastic
{
    class AnimationManager {
    private:
        std::unordered_map<std::string, std::unique_ptr<AnimationBase>> animations_;
        std::mutex animations_mutex_;

    public:
        template<typename T>
        void animate(
            const std::string& id,
            T start,
            T end,
            float duration,
            std::function<void(const T&)> update,
            Animator::EasingFunction<T> easing = Animator::linear_interpolate<T>
        ) {
            std::lock_guard<std::mutex> guard(animations_mutex_);

            auto animation = std::make_unique<Animation<T>>(
                start, end, duration, std::move(update), std::move(easing)
            );

            animation->set_on_complete([this, id] {
                std::lock_guard<std::mutex> guard(animations_mutex_);
                animations_.erase(id);
            });

            animations_[id] = std::move(animation);
            animations_[id]->start();
        }

        void update(float delta_time) {
            std::lock_guard<std::mutex> guard(animations_mutex_);

            for (auto& [_, animation] : animations_) {
                animation->update(delta_time);
            }
        }

        void add_animation(const std::string& id, std::unique_ptr<AnimationBase> animation) {
            animations_.emplace(id, std::move(animation));
        }
    };
}
