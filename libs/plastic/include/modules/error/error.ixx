//
// Created by Aidan Jost on 4/2/25.
//

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
        enum class Severity
        {
            Debug,
            Info,
            Warning,
            Error,
            Critical,
        };

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

    struct Error {
    private:
        error::Code code_;
        error::Severity severity_;
        error::Category category_;
        std::string message_;

        std::source_location location_;
        std::chrono::system_clock::time_point timestamp_;
        std::vector<std::string> stack_trace_;
        std::unordered_map<std::string, std::string> context_;

    public:
        explicit Error(
            error::Code code, error::Severity severity,
            error::Category category, std::string message,
            std::source_location location = std::source_location::current())
        : code_(code), severity_(severity),
        category_(category), message_(std::move(message)),
        location_(location), timestamp_(std::chrono::system_clock::now()) {
            capture_stack_trace();
        }

        [[nodiscard]] error::Code code() const { return code_; }
        [[nodiscard]] error::Severity severity() const { return severity_; }
        [[nodiscard]] error::Category category() const { return category_; }
        [[nodiscard]] const std::string& message() const { return message_; }
        [[nodiscard]] const std::source_location& location() const { return location_; }
        [[nodiscard]] const auto& timestamp() const { return timestamp_; }
        [[nodiscard]] const auto& stack_trace() const { return stack_trace_; }
        [[nodiscard]] const auto& context() const { return context_; }


        // Add context information
        void add_context(std::string key, std::string value) {
            context_[std::move(key)] = std::move(value);
        }

        // Format error as string
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
        static void capture_stack_trace() {
            // This is a place-holder
            // TODO - implement stack trace
            std::cout << "Stack trace not implemented" << std::endl;

        }

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

        static const char* code_to_string(error::Code code) {
            // This is a placeholder
            // TODO - implement error code to string
            return "Unknown error code";
        }
    };

    namespace errors
    {
        Error layout_error(const std::string& message) {
            return Error(error::Code::LayoutFailed, error::Severity::Error, error::Category::Layout,message);
        }

        Error render_error(const std::string& message) {
            return Error(error::Code::RenderFailed, error::Severity::Error, error::Category::Rendering, message);
        }

        Error resource_error(const std::string& message) {
            return Error(error::Code::ResourceLoadFailed, error::Severity::Error, error::Category::Resource, message);
        }

        Error window_error(const std::string& message) {
            return Error(error::Code::WindowCreateFailed, error::Severity::Error, error::Category::Window, message);
        }

        Error event_error(const std::string& message) {
            return Error(error::Code::InvalidEventType, error::Severity::Error, error::Category::Event, message);
        }
    }

};