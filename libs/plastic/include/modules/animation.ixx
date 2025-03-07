//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <functional>

export module plastic.animation;

import plastic.point;
import plastic.color;
import plastic.size;

export namespace plastic
{
    class Animator {
    public:
        template <typename T>
        using EasingFunction = std::function<T(T, T, float)>;

        template <typename T>
        static T linear_interpolate(const T& start, const T& end, float progress) {
            return start + (end - start) * progress;
        }

        static Color interpolate_color(const Color& start, const Color& end, float progress) {
            return {
                linear_interpolate<unsigned char>(start.r, end.r, progress),
                linear_interpolate<unsigned char>(start.g, end.g, progress),
                linear_interpolate<unsigned char>(start.b, end.b, progress),
                linear_interpolate<unsigned char>(start.a, end.a, progress)
            };
        }

        static Point<float> interpolate_point(const Point<float>& start, const Point<float>& end, float progress) {
            return Point<float>(
                linear_interpolate(start.x, end.x, progress),
                linear_interpolate(start.y, end.y, progress)
            );
        }

        static float ease_in_out_cubic(float start, float end, float progress) {
            progress = progress < 0.5f ? 4 * progress * progress * progress : static_cast<float>(1 - std::pow(-2 * progress + 2, 3) / 2);
            return start + (end - start) * progress;
        }

        static float ease_out_elastic(float start, float end, float progress) {
            constexpr float c4  = (2 * M_PI) / 3;
            float delta = end - start;

            return static_cast<float>(progress == 0? start : progress == 1? end : start + delta * (std::pow(2, -10 * progress) * std::sin(progress * 10 - 0.75) * c4) + 1);
        }


    };

    template <typename T>
        class Animation {
        T start_value_;
        T end_value_;
        float duration_;
        float elapsed_time_{0};
        bool is_running_{false};
        std::function<void(T&)> on_update_;
        std::function<void()> on_complete_;
        Animator::EasingFunction<T> easing_function_;

    public:
        Animation(T start, T end, float duration, std::function<void(const T&)> on_update,
            Animator::EasingFunction<T> easing = Animator::linear_interpolate<T>)
            : start_value_(start), end_value_(end), duration_(duration), on_update_(on_update), easing_function_(std::move(easing)) {}

        void start() {
            elapsed_time_ = 0;
            is_running_ = true;
        }

        void update(float delta_time) {
            if (!is_running_) return;

            elapsed_time_ += delta_time;
            float progress = std::min(elapsed_time_ / duration_, 1.0f);

            T current = easing_function_(start_value_, end_value_, progress);
            on_update_(current);

            if (progress >= 1.0f) {
                is_running_ = false;
                if (on_complete_) {
                    on_complete_();
                }
            }
        }
        void set_on_complete(std::function<void()> on_complete) {
            on_complete_ = std::move(on_complete);
        }

        void stop() {
            is_running_ = false;
        }

        [[nodiscard]] bool is_running() const {
            return is_running_;
        }
    };

    template <typename T>
    class SpringAnimation {
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
            : target_(target), current_(initial), velocity_{}, on_update_(std::move(on_update)) {}

        void set_target(T target) {
            target_ = target;
            active_ = true;
        }

        void update(float dt) {
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
            }
        }

        void configure(float stiffness, float damping, float mass) {
            stiffness_ = stiffness;
            damping_ = damping;
            mass_ = mass;
        }
    };

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

    template<typename T>
class TransitionProperty {
    private:
        T value_;
        Animation<T> animation_;

    public:
        explicit TransitionProperty(T initial, float duration = 0.3f)
            : value_(initial), animation_(initial, initial, duration, [this](const T& v) { value_ = v; }) {}

        void set(const T& target) {
            animation_.stop();
            animation_ = Animation<T>(value_, target, animation_.duration_,
                                     [this](const T& v) { value_ = v; });
            animation_.start();
        }

        const T& get() const { return value_; }
        explicit operator const T&() const { return value_; }
    };





}
