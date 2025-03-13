//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <functional>
export module plastic.animation_base;
export namespace plastic
{
    class AnimationBase {
    protected:
        float duration_{0};
        float elapsed_time_{0};
        bool is_running_{false};
        std::function<void()> on_complete_;

    public:
        explicit AnimationBase(float duration) : duration_(duration) {}
        virtual ~AnimationBase() = default;

        virtual void update(float delta_time) {
            if (!is_running_) return;

            elapsed_time_ += delta_time;
            if (elapsed_time_ >= duration_) {
                is_running_ = false;
                if (on_complete_) on_complete_();
            }
        }

        virtual void start() {
            elapsed_time_ = 0;
            is_running_ = true;
        }

        virtual void stop() { is_running_ = false; }

        [[nodiscard]] virtual bool is_running() const { return is_running_; }

        virtual void set_on_complete(std::function<void()> on_complete) {
            on_complete_ = std::move(on_complete);
        }
    };
}