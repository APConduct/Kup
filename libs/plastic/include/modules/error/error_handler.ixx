//
// Created by Aidan Jost on 4/2/25.
//

module;
#include <mutex>
#include <queue>
export module plastic.error_handler;

import plastic.error;

export
    namespace plastic::error
    {
        struct Handler {
        private:
            static std::mutex mutex_;
            static std::queue<plastic::Error> error_queue_;
            static std::vector<std::function<void(Error&)>> handlers_;
            static inline bool throw_on_error_ = false;
            static inline  Severity min_severity_ = Severity::Warning;

        public:
            static void handle(const Error& error) {
                std::lock_guard<std::mutex> lock(mutex_);

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

            static void register_handler(const std::function<void(Error&)>& handler) {
                std::lock_guard lock(mutex_);
                handlers_.push_back(handler);
            }

            static void set_throw_on_error(bool enable = true) {
                throw_on_error_ = enable;
            }

            static void set_min_severity(Severity min_severity) {
                min_severity_ = min_severity;
            }

            static std::optional<Error> get_next_error() {
                std::lock_guard lock(mutex_);
                if (error_queue_.empty()) {
                    return std::nullopt;
                }
                auto error = error_queue_.front();
                error_queue_.pop();
                return error;
            }

            static void clear() {
                std::lock_guard lock(mutex_);
                std::queue<Error>().swap(error_queue_);
            }

        };
    }
