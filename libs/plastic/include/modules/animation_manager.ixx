//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <memory>
#include <vector>
export module plastic.animation_manager;

import plastic.animation;
import plastic.color;
import plastic.point;

export namespace plastic
{
    class AnimationManager {
        std::vector<std::unique_ptr<Animation<float>>> float_animations_;
        std::vector<std::unique_ptr<Animation<Color>>> color_animations_;
        std::vector<std::unique_ptr<Animation<Point<float>>>> point_animations_;

    public:
        void update(float delta_time) {
            // Update all animations and remove completed ones
            auto update_and_filter = [delta_time](auto& animations) {
                size_t write_index = 0;
                for (size_t i = 0; i < animations.size(); ++i) {
                    animations[i]->update(delta_time);
                    if (animations[i]->is_running()) {
                        if (i != write_index) {
                            animations[write_index] = std::move(animations[i]);
                        }
                        ++write_index;
                    }
                }
                animations.resize(write_index);
            };
            update_and_filter(float_animations_);
            update_and_filter(color_animations_);
            update_and_filter(point_animations_);
        }

        template <typename T>
        void add_animation(std::unique_ptr<Animation<T>> animation) {
            if constexpr (std::is_same_v<T, float>) {
                float_animations_.push_back(std::move(animation));
            } else if constexpr  (std::is_same_v<T, Color>) {
                color_animations_.push_back(animation);
            } else if constexpr (std::is_same_v<T, Point<float>>) {
                point_animations_.push_back(animation);
            }
        }
    };

}
