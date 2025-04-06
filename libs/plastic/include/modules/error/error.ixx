//
// Created by Aidan Jost on 4/2/25.
//

/// @file error.ixx
/// @brief Error handling module for the Plastic UI framework
/// @details This module provides a structured way to handle errors.

module;
#include <string>
#include <source_location>
#include <unordered_map>
#include <vector>
#include <chrono>
#include <iostream>

export module plastic.error;

export namespace plastic
{
    namespace error
    {
        /// @brief Severity levels for errors
        /// @details Severity levels indicate the seriousness of the error.
        enum class Severity
        {
            Debug,
            Info,
            Warning,
            Error,
            Critical,
        };

        /// @brief Categories for errors
        /// @details Categories help in classifying errors based on their nature.
        enum class  Category {

            General,
            Layout,
            Rendering,
            Resource,
            Input,
            Window,
            Event,
            State,
            Network,
            Plugin,

            // Possible later categories
            // Animation,
            // Theme,
            // Font,
            // Style,
        };

        /// @brief Error codes for specific error types
        /// @details Error codes provide a more granular classification of errors.
        enum class  Code {
            // General errors
            None = 0,
            Unknown = 1,
            InvalidArgument = 2,
            InvalidState = 3,
            NotImplemented = 4,

            //` Layout errors
            LayoutFailed = 100,
            InvalidBounds = 101,
            CyclicDependency = 102,

            // Rendering errors
            RenderFailed = 200,
            InvalidTexture = 201,
            ShaderCompilationFailed = 202,

            // Resource errors
            ResourceNotFound = 300,
            ResourceLoadFailed = 301,
            ResourceCreateFailed = 302,

            // Window errors
            WindowCreateFailed = 400,
            WindowNotFound = 401,

            // Event errors
            InvalidEventType = 500,
            EventDispatchFailed = 501,

            // State errors
            InvalidStateTransition = 600,
            StateNotFound = 601,

        };
    }

    /// @brief Error class for handling errors in the Plastic UI framework
    /// @details This class encapsulates error information, including severity, category, and context.
    struct Error {
    private:

        /// @brief Error code
        error::Code code_;

        /// @brief Severity of the error
        error::Severity severity_;

        /// @brief Category of the error
        error::Category category_;

        /// @brief Error message
        std::string message_;

        /// @brief Source location of the error
        std::source_location location_;

        /// @brief Timestamp of the error
        std::chrono::system_clock::time_point timestamp_;

        /// @brief Stack trace of the error
        std::vector<std::string> stack_trace_;

        /// @brief Context information related to the error
        std::unordered_map<std::string, std::string> context_;

    public:

        /// @brief Constructor for the Error class
        explicit Error(
            error::Code code, error::Severity severity,
            error::Category category, std::string message,
            std::source_location location = std::source_location::current())
        : code_(code), severity_(severity),
        category_(category), message_(std::move(message)),
        location_(location), timestamp_(std::chrono::system_clock::now()) {
            capture_stack_trace();
        }

        /// @brief get the error code
        [[nodiscard]] error::Code code() const { return code_; }

        /// @brief get the severity of the error
        [[nodiscard]] error::Severity severity() const { return severity_; }

        /// @brief get the category of the error
        [[nodiscard]] error::Category category() const { return category_; }

        /// @brief get the error message
        [[nodiscard]] const std::string& message() const { return message_; }

        /// @brief get the source location of the error
        [[nodiscard]] const std::source_location& location() const { return location_; }

        /// @brief get the timestamp of the error
        [[nodiscard]] const auto& timestamp() const { return timestamp_; }

        /// @brief get the stack trace of the error
        [[nodiscard]] const auto& stack_trace() const { return stack_trace_; }

        /// @brief get the context information of the error
        [[nodiscard]] const auto& context() const { return context_; }


        /// @brief Add context information
        void add_context(std::string key, std::string value) {
            context_[std::move(key)] = std::move(value);
        }

        /// @brief Format error as string
        [[nodiscard]] std::string to_string() const {
            return std::format(
                "[{}] {} at {}:{}:{} - {}",
                severity_string(severity_),
                message_,
                location_.file_name(),
                location_.line(),
                location_.column(),
                code_to_string(code_)
                );
        }

    private:

        /// @brief Capture stack trace
        static void capture_stack_trace() {
            // This is a place-holder
            // TODO - implement stack trace
            std::cout << "Stack trace not implemented" << std::endl;

        }

        /// @brief Convert severity to string
        /// @param severity The severity level
        /// @return A string representation of the severity level
        static const char* severity_string(error::Severity severity) {
            switch (severity) {
                case error::Severity::Debug:
                    return "DEBUG";
                case error::Severity::Info:
                    return "INFO";
                case error::Severity::Warning:
                    return "WARNING";
                case error::Severity::Error:
                    return "ERROR";
                case error::Severity::Critical:
                    return "CRITICAL";
                default:
                    return "UNKNOWN";
            }
        }

        /// @brief Convert error code to string
        static const char* code_to_string(error::Code code) {
            // This is a placeholder
            // TODO - implement error code to string
            return "Unknown error code";
        }
    };

    namespace errors
    {
        /// @brief helper function to create a layout error
        /// @param message The error message
        /// @return An Error object with layout error details
        Error layout_error(const std::string& message) {
            return Error(error::Code::LayoutFailed, error::Severity::Error, error::Category::Layout,message);
        }

        /// @brief helper function to create a rendering error
        /// @param message The error message
        /// @return An Error object with rendering error details
        Error render_error(const std::string& message) {
            return Error(error::Code::RenderFailed, error::Severity::Error, error::Category::Rendering, message);
        }

        /// @brief helper function to create a resource error
        /// @param message The error message
        /// @return An Error object with resource error details
        Error resource_error(const std::string& message) {
            return Error(error::Code::ResourceLoadFailed, error::Severity::Error, error::Category::Resource, message);
        }

        /// @brief helper function to create a window error
        /// @param message The error message
        /// @return An Error object with window error details
        Error window_error(const std::string& message) {
            return Error(error::Code::WindowCreateFailed, error::Severity::Error, error::Category::Window, message);
        }

        /// @brief helper function to create a state error
        /// @param message The error message
        /// @return An Error object with state error details
        Error event_error(const std::string& message) {
            return Error(error::Code::InvalidEventType, error::Severity::Error, error::Category::Event, message);
        }
    }

};