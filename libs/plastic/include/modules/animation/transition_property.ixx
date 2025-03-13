//
// Created by Aidan Jost on 3/13/25.
//

export module plastic.transition_property;
import plastic.animation;

export namespace plastic
{
    template<typename T>
class TransitionProperty {
    private:
        T value_;
        Animation<T> animation_{};

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