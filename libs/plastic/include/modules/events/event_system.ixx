//
// Created by ajost1 on 2/2/2025.
//

export module plastic.event_system;

export import plastic.event_dispatcher;
export import plastic.event_queue;
export import plastic.events;
export import plastic.typed_event_handler;
export import plastic.event_base;
export import plastic.event_visitor;

#ifdef PLASTIC_DEBUG
    export struct EventDegugInfo {
        std::string event_type;
        double timestamp;
        std::string details;
    };

    export class EventLogger {
    public:
        static void log_event(const Event& event) {
            std::visit([](const auto& e) {
                EventDegugInfo info {
                    typeid(e).name(),
                    e.timestamp, get_event_details(e)
                };

                TraceLog(LOG_INFO, "Event: %s, Timestamp: %f, Details: %s",
                    info.event_type.c_str(), info.timestamp, info.details.c_str());
            }, event);
        }

    private:
        static std::string get_event_details(const MouseMoveEvent& e) {
            return std::format("Position: ({}, {}), Delta: ({}, {})", e.position.x, e.position.y, e.delta.x, e.delta.y);
        }

        static std::string get_event_details(const MouseButtonEvent& e) {
            return std::format("Button: {}, Position: ({}, {}), Pressed: {}",
                static_cast<int>(e.button), e.position.x, e.position.y, e.pressed ? "true" : "false");
        }

        static std::string get_event_details(const MouseScrollEvent& e) {
            return std::format("Position: ({}, {}), Delta: ({}, {})", e.position.x, e.position.y, e.delta.x, e.delta.y);
        }

        static std::string get_event_details(const MouseDragEvent& e) {
                    return std::format("Start: ({}, {}), Current: ({}, {}), Delta: ({}, {}), Button: {}",
                        e.start.x, e.start.y, e.current.x, e.current.y, e.delta.x, e.delta.y,
                        static_cast<int>(e.button));
                }

                static std::string get_event_details(const KeyPressEvent& e) {
                            return "Key: " + std::to_string(static_cast<int>(e.key)) +
                                   ", Pressed: " + (e.pressed ? "true" : "false") +
                                   ", Repeat: " + (e.repeat ? "true" : "false") +
                                   ", Shift: " + (e.shift ? "true" : "false") +
                                   ", Ctrl: " + (e.ctrl ? "true" : "false") +
                                   ", Alt: " + (e.alt ? "true" : "false");
                        }

        static std::string get_event_details(const TextInputEvent& e) {
            return std::format("Text: {}", e.text);
        }

        static std::string get_event_details(const ResizeEvent& e) {
            return std::format("Width: {}, Height: {}", e.width, e.height);
        }

        static std::string get_event_details(const FocusEvent& e) {
            return std::format("Gained: {}", e.gained);
        }
    };
#endif


