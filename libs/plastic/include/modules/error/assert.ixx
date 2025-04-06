//
// Created by Aidan Jost on 4/2/25.
//

/// @file assert.ixx
/// @brief Assertion macros for the Plastic UI framework

module;
export module plastic.assert;

import plastic.error;
import plastic.error_handler;

export namespace plastic
{
    #ifdef PLASTIC_DEBUG
            #define PLASTIC_ASSERT(condition, message) \
            do { \
                if (!(condition)) { \
                    plastic::Error error( \
                        plastic::ErrorCode::InvalidState, \
                        plastic::ErrorSeverity::Critical, \
                        plastic::ErrorCategory::General, \
                        "Assertion failed: " message, \
                        std::source_location::current() \
                    ); \
                    plastic::ErrorHandler::handle(error); \
                } \
            } while (0)

        #define PLASTIC_ASSERT_NOT_NULL(ptr) \
            PLASTIC_ASSERT(ptr != nullptr, "Null pointer check failed")

    #else
    #define PLASTIC_ASSERT(condition, message) ((void)0)
    #define PLASTIC_ASSERT_NOT_NULL(ptr) ((void)0)
    #endif
}
