//
// Created by Aidan Jost on 4/2/25.
//

/// @file error_handler.ixx
/// @brief Error handling module for the Plastic UI framework
/// @details This module provides a structured way to handle errors.

module;
#include <mutex>
#include <queue>
export module plastic.error_handler;

import plastic.error;

export namespace plastic::error
{
    /// @brief Error handler class
    /// @details This class provides a way to handle errors in the Plastic UI framework.
    struct Handler {
    private:
        /// @brief Mutex for thread safety
        static std::mutex mutex_;

        /// @brief Queue to store errors
        static std::queue<Error> error_queue_;

        /// @brief List of error handlers
        static std::vector<std::function<void(Error&)>> handlers_;

        /// @brief Flag to indicate if errors should be thrown
        static inline bool throw_on_error_ = false;

        /// @brief Minimum severity level for throwing errors
        static inline  Severity min_severity_ = Severity::Warning;

    public:

        /// @brief Handle an error
        static void handle(const Error& error) {
            std::lock_guard lock(mutex_);

            // Add error to the queue
            error_queue_.push(error);

            // Notify all handlers
            for (const auto& handler : handlers_) {
                handler(error_queue_.back());
            }

            if (throw_on_error_ && error.severity() >= min_severity_) {
                throw std::runtime_error(error.to_string());
            }
        }

        /// @brief Register a custom error handler
        static void register_handler(const std::function<void(Error&)>& handler) {
            std::lock_guard lock(mutex_);
            handlers_.push_back(handler);
        }

        /// @brief set the error handler to throw exceptions
        /// @param enable If true, errors will be thrown as exceptions
        /// @details This is useful for debugging and testing purposes.
        static void set_throw_on_error(bool enable = true) {
            throw_on_error_ = enable;
        }

        /// @brief set the minimum severity level for throwing errors
        /// @param min_severity The minimum severity level
        /// @details Errors with severity lower than this level will not be thrown.
        static void set_min_severity(Severity min_severity) {
            min_severity_ = min_severity;
        }

        /// @brief Get the next error from the queue
        /// @return An optional Error object
        static std::optional<Error> get_next_error() {
            std::lock_guard lock(mutex_);
            if (error_queue_.empty()) {
                return std::nullopt;
            }
            auto error = error_queue_.front();
            error_queue_.pop();
            return error;
        }

        /// @brief Clear the error queue
        static void clear() {
            std::lock_guard lock(mutex_);
            std::queue<Error>().swap(error_queue_);
        }


    };

    template<typename F>
    auto with_error_boundary(F&& f) {
        try {
            return f();
        } catch (const std::exception& e) {
            Handler::handle(Error(
                Code::Unknown,
                Severity::Error,
                Category::General,
                e.what()
            ));
            return std::remove_reference_t<decltype(f())>();
        }
    }

}
