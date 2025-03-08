//
// Created by Aidan Jost on 3/7/25.
//


module;
#include <memory>
#include <algorithm>
#include <functional>
export module plastic.scrollable;

import plastic.scrollable_base;


import plastic.element;
import plastic.rect;
import plastic.events;
import plastic.animation;
import plastic.point;
import plastic.context;
import plastic.color;
import plastic.size;

export namespace plastic
{
    class Scrollable : public Element {
    private:
        float scroll_x_{0};
        float scroll_y_{0};
        float content_width_{0};
        float content_height_{0};
        bool show_scrollbars_{true};
        float scrollbar_width_{10.0f};
        bool dragging_horizontal_{false};
        bool dragging_vertical_{false};
        Point<float> drag_start_;
        float scroll_start_x_{0};
        float scroll_start_y_{0};
        Animation<float> momentum_x_{0, 0, 0.5f, [](const float&){}};
        Animation<float> momentum_y_{0, 0, 0.5f, [](const float&){}};
        float velocity_x_{0};
        float velocity_y_{0};
        bool enable_momentum_{true};

    public:
        void layout(Context* cx) override {
            // Layout children with virtual size
            for (const auto& child : get_children()) {
                child->layout(cx);

                // Update content size based on child bounds
                const auto& child_bounds = child->get_bounds();
                content_width_ = std::max(content_width_,
                                        child_bounds.x() + child_bounds.width() - bounds.x());
                content_height_ = std::max(content_height_,
                                         child_bounds.y() + child_bounds.height() - bounds.y());
            }

            // Constrain scroll position
            constrain_scroll();
        }

        void paint(Context* cx) const override {
            // Set up clipping to prevent content from rendering outside bounds
            bounds.apply_scissor();

            // Draw children with offset
            for (const auto& child : get_children()) {
                // Adjust child position based on scroll
                Rect<float> original_bounds = child->get_bounds();
                Rect<float> scrolled_bounds{
                    original_bounds.x() - scroll_x_,
                    original_bounds.y() - scroll_y_,
                    original_bounds.width(),
                    original_bounds.height()
                };

                // Only draw if visible
                if (bounds.intersects(scrolled_bounds)) {
                    child->paint(cx);
                }
            }

            Rect<float>::stop_scissor();

            // Draw scrollbars if needed
            if (show_scrollbars_) {
                draw_scrollbars();
            }
        }

                bool process_event(const events::Event& event, Context* cx) override {
            // Previous event handling...

            if (auto* move_event = std::get_if<events::MouseMoveEvent>(&event)) {
                Point<float> pos{move_event->position.x, move_event->position.y};

                // Handle dragging scrollbars
                if (dragging_vertical_) {
                    // Previous vertical scrollbar dragging logic...

                    // Track velocity for momentum
                    velocity_y_ = move_event->delta.y * 0.2f;

                    return true;
                } else if (dragging_horizontal_) {
                    float drag_ratio = (pos.x - drag_start_.x) / (bounds.width() - scrollbar_width_ * 2);
                    float scroll_delta = drag_ratio * content_width_;
                    scroll_x_ = scroll_start_x_ + scroll_delta;
                    constrain_scroll();
                    invalidate();

                    // Track velocity for momentum
                    velocity_x_ = move_event->delta.x * 0.2f;

                    return true;
                }
            }

            // Pass events to children with adjusted coordinates
            for (const auto& child : get_children()) {
                const auto& child_bounds = child->get_bounds();
                Rect visible_bounds{
                    child_bounds.x() - scroll_x_,
                    child_bounds.y() - scroll_y_,
                    child_bounds.width(),
                    child_bounds.height()
                };

                // Only pass event if child is visible and event is within bounds
                if (bounds.intersects(visible_bounds)) {
                    // Adjust event coordinates for scrolling
                    events::Event adjusted_event = adjust_event_for_scroll(event);

                    if (child->handle_event(adjusted_event, cx)) {
                        return true;
                    }
                }
            }

            return false;
        }

        void set_content_size(float width, float height) {
            content_width_ = width;
            content_height_ = height;
            constrain_scroll();
            invalidate();
        }

        void set_scroll_position(float x, float y) {
            scroll_x_ = x;
            scroll_y_ = y;
            constrain_scroll();
            invalidate();
        }

        void scroll_to_element(const std::shared_ptr<Element>& element, bool animate = true) {
            if (!element) return;

            const auto& element_bounds = element->get_bounds();
            float target_scroll_x = element_bounds.x() - bounds.x() + scroll_x_;
            float target_scroll_y = element_bounds.y() - bounds.y() + scroll_y_;

            // Adjust to center if possible
            target_scroll_x -= (bounds.width() - element_bounds.width()) / 2;
            target_scroll_y -= (bounds.height() - element_bounds.height()) / 2;

            if (animate) {
                animate_scroll_to(target_scroll_x, target_scroll_y);
            } else {
                scroll_x_ = target_scroll_x;
                scroll_y_ = target_scroll_y;
                constrain_scroll();
                invalidate();
            }
        }

        void set_show_scrollbars(bool show) {
            show_scrollbars_ = show;
            invalidate();
        }

    private:
        void constrain_scroll() {
            float max_scroll_x = std::max(0.0f, content_width_ - bounds.width());
            float max_scroll_y = std::max(0.0f, content_height_ - bounds.height());

            scroll_x_ = std::max(0.0f, std::min(scroll_x_, max_scroll_x));
            scroll_y_ = std::max(0.0f, std::min(scroll_y_, max_scroll_y));
        }

        void draw_scrollbars() const {
            // Only draw if content is larger than view
            if (content_width_ > bounds.width()) {
                // Calculate horizontal scrollbar metrics
                float view_ratio = bounds.width() / content_width_;
                float scrollbar_length = std::max(20.0f, view_ratio * bounds.width());
                float scrollbar_position = (scroll_x_ / content_width_) * bounds.width();

                // Draw horizontal scrollbar
                Rect<float> h_scrollbar{
                    bounds.x() + scrollbar_position,
                    bounds.y() + bounds.height() - scrollbar_width_,
                    scrollbar_length,
                    scrollbar_width_
                };

                h_scrollbar.fill(Color::rgba(150, 150, 150, 180));
            }

            if (content_height_ > bounds.height()) {
                // Calculate vertical scrollbar metrics
                float view_ratio = bounds.height() / content_height_;
                float scrollbar_length = std::max(20.0f, view_ratio * bounds.height());
                float scrollbar_position = (scroll_y_ / content_height_) * bounds.height();

                // Draw vertical scrollbar
                Rect<float> v_scrollbar{
                    bounds.x() + bounds.width() - scrollbar_width_,
                    bounds.y() + scrollbar_position,
                    scrollbar_width_,
                    scrollbar_length
                };

                v_scrollbar.fill(Color::rgba(150, 150, 150, 180));
            }
        }

        bool is_on_vertical_scrollbar(const Point<float>& pos) const {
            if (content_height_ <= bounds.height()) return false;

            float view_ratio = bounds.height() / content_height_;
            float scrollbar_length = std::max(20.0f, view_ratio * bounds.height());
            float scrollbar_position = (scroll_y_ / content_height_) * bounds.height();

            Rect<float> v_scrollbar{
                bounds.x() + bounds.width() - scrollbar_width_,
                bounds.y() + scrollbar_position,
                scrollbar_width_,
                scrollbar_length
            };

            return v_scrollbar.contains(pos);
        }

        bool is_on_horizontal_scrollbar(const Point<float>& pos) const {
            if (content_width_ <= bounds.width()) return false;

            float view_ratio = bounds.width() / content_width_;
            float scrollbar_length = std::max(20.0f, view_ratio * bounds.width());
            float scrollbar_position = (scroll_x_ / content_width_) * bounds.width();

            Rect<float> h_scrollbar{
                bounds.x() + scrollbar_position,
                bounds.y() + bounds.height() - scrollbar_width_,
                scrollbar_length,
                scrollbar_width_
            };

            return h_scrollbar.contains(pos);
        }

        events::Event adjust_event_for_scroll(const events::Event& event) const {
            // Clone event and adjust coordinates for scrolling
            events::Event result = event;

            std::visit([this]<typename T0>(T0& concrete_event) {
                using T = std::decay_t<T0>;

                if constexpr (std::is_same_v<T, events::MouseButtonEvent> ||
                            std::is_same_v<T, events::MouseMoveEvent> ||
                            std::is_same_v<T, events::MouseScrollEvent> ||
                            std::is_same_v<T, events::MouseDragEvent>) {
                    // Adjust mouse position for scrolling
                    if constexpr (std::is_same_v<T, events::MouseButtonEvent>) {
                        concrete_event.position = Size<float>{
                            concrete_event.position.width() + scroll_x_,
                            concrete_event.position.height() + scroll_y_
                        };
                    } else if constexpr (std::is_same_v<T, events::MouseMoveEvent>) {
                        concrete_event.position = Point<float>{
                            concrete_event.position.x + scroll_x_,
                            concrete_event.position.y + scroll_y_
                        };
                    }
                }
            }, result);

            return result;
        }

        void start_momentum_animation() {
            float target_x = scroll_x_ + velocity_x_ * 20.0f;
            float target_y = scroll_y_ + velocity_y_ * 20.0f;

            // Create animations with easing
            momentum_x_ = Animation<float>(
                scroll_x_, target_x, 0.5f,
                [this](const float& val) {
                    scroll_x_ = val;
                    constrain_scroll();
                    invalidate();
                },
                Animator::ease_out_elastic
            );

            momentum_y_ = Animation<float>(
                scroll_y_, target_y, 0.5f,
                [this](const float& val) {
                    scroll_y_ = val;
                    constrain_scroll();
                    invalidate();
                },
                Animator::ease_out_elastic
            );

            momentum_x_.start();
            momentum_y_.start();
        }

        void animate_scroll_to(float target_x, float target_y) {
            // Stop existing animations
            momentum_x_.stop();
            momentum_y_.stop();
            
            // Create smooth scroll animation
            momentum_x_ = Animation<float>(
                scroll_x_, target_x, 0.3f,
                [this](const float& val) {
                    scroll_x_ = val;
                    constrain_scroll();
                    invalidate();
                },
                Animator::ease_in_out_cubic
            );
            
            momentum_y_ = Animation<float>(
                scroll_y_, target_y, 0.3f,
                [this](const float& val) {
                    scroll_y_ = val;
                    constrain_scroll();
                    invalidate();
                },
                Animator::ease_in_out_cubic
            );
            
            momentum_x_.start();
            momentum_y_.start();
        }




    };
}