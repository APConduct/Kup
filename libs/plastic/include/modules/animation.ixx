//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <functional>

#if defined(_WIN32)
#include <cmath>
#include <memory>
#endif

export module plastic.animation;

import plastic.point;
import plastic.color;
import plastic.size;
import plastic.animation_base;

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
        class Animation : public AnimationBase {
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
            : AnimationBase(duration), start_value_(start), end_value_(end), duration_(duration), on_update_(on_update),
              easing_function_(std::move(easing)) {
        }

        void start() override {
            elapsed_time_ = 0;
            is_running_ = true;
        }

        void update(float delta_time) override {
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
        void set_on_complete(std::function<void()> on_complete) override {
            on_complete_ = std::move(on_complete);
        }

        void stop() override {
            is_running_ = false;
        }

        [[nodiscard]] bool is_running() const override {
            return is_running_;
        }
    };









}
