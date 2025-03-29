//
// Created by ajost1 on 2/2/2025.
//

module;
#include <functional>
export module plastic.component;
import plastic.state;

export namespace plastic
{

    struct Component {
        virtual ~Component() = default;

    protected:

        virtual void on_mount() {}
        virtual void on_unmount() {}
        virtual void on_update() {}
        virtual void on_props_changed() {}


        // State management

        /// @brief uses a state variable
        /// @tparam T The type of the state variable
        /// @param initial The initial value of the state variable
        /// @return A State object
         template<typename T = void>
         State<T> use_state(T initial) {
            return State<T>(initial);
        };

        // Effects

        /// @brief uses a void-returning effect function uses inner function to avoid being confused as static
        /// @param effect The effect function to be called
        /// @return A reference to the current instance of the component
        auto& do_fn(const std::function<void()>& effect) {
            // Call the effect function
            effect();
            return *this;
        }

        /// @brief uses a void-returning effect function uses inner function to avoid being confused as static
        /// @param effect The effect function to be called
        /// @return A reference to the current instance of the component
        void use_effect(const std::function<void()>& effect) {
            // Call the effect function
            do_fn(effect);
            // uses inner function to avoid being confused as static
        };


    };
}
