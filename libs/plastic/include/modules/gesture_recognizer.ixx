//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <vector>
#include <functional>
#include <raylib.h>
#if defined(_WIN32)
#include <cmath>
#endif
export module plastic.gensture_recognizer;

import plastic.point;
import plastic.events;
import plastic.rect;

export namespace plastic
{
    class GestureRecognizer {
    public:
        enum class GestureType {
            Tap, DoubleTap, LongPress, Pan, Pinch, Swipe
        };

        struct GestureEvent {
            GestureType type{};
            Point<float> position;
            Point<float> delta;
            float scale{};
            float rotation{};
        };

    private:
        std::vector<std::function<void(const GestureEvent&)>> handlers;

        // Gesture state tracking
        Point<float> initial_position;
        Point<float> last_position;
        float initial_distance{};
        float last_tap_time = {};
        bool tracking_gesture = false;

    public:
        void update() {
            // Check for gestures and fire events
            // This is a simplified implementation

            // Handle pan gesture
            if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) {
                auto pos = Point<float>::from_mouse_pos();

                if (!tracking_gesture) {
                    tracking_gesture = true;
                    initial_position = pos;
                    last_position = pos;
                } else {
                    auto delta = Point<float>{pos.x - last_position.x, pos.y - last_position.y};

                    if (std::abs(delta.x) > 5.0f || std::abs(delta.y) > 5.0f) {
                        GestureEvent event{
                            GestureType::Pan,
                            pos,
                            delta,
                            1.0f,
                            0.0f
                        };

                        for (const auto& handler : handlers) {
                            handler(event);
                        }
                    }

                    last_position = pos;
                }
            } else {
                tracking_gesture = false;
            }

            // Implement other gestures
        }

        void add_handler(std::function<void(const GestureEvent&)> handler) {
            handlers.push_back(std::move(handler));
        }
    };

}
