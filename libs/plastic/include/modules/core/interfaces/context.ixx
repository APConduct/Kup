//
// Created by ajost1 on 1/29/2025.
//
//// @file context.ixx
/// @brief context interface

module;
export module plastic.context;
import plastic.events;


export namespace plastic
{

    /// @brief Context interface. Represents the context of the application.
    /// @note This interface is used to create a context for the application, allowing for layout and paint requests.
    struct Context {

        /// @brief virtual destructor
        virtual ~Context() = default;

        /// brief Request a layout update.
        virtual void request_layout() = 0;

        /// @brief Request a paint update.
        virtual void request_paint() = 0;

        /// @brief act as a dispatcher for events
        /// @param event The event to be dispatched (might change self)
        virtual void dispatch_event(const events::Event& event) = 0;
    };
}
