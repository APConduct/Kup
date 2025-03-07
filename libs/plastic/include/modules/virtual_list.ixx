//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <vector>
#include <functional>
export module plastic.virtual_list;

import plastic.element;
import plastic.context;
import plastic.rect;
import plastic.size;
import plastic.events;

export namespace plastic {
    template <typename T>
    class VirtualizedList : public Element {
    public:
        using ItemRenderer = std::function<std::shared_ptr<Element>(const T&, size_t)>;

    private:
        std::vector<T> items_;
        ItemRenderer renderer_;
        float item_height_{40.0f};
        float scroll_position_{0};
        std::unordered_map<size_t, std::shared_ptr<Element>> visible_elements_;

    public:
        VirtualizedList(std::vector<T> items, ItemRenderer renderer, float item_height = 40.0f)
            : items_(std::move(items)), renderer_(std::move(renderer)), item_height_(item_height) {}

        void layout(Context* cx) override {
            update_visible_elements();
        }

        void paint(Context* cx) const override {
            for (const auto& [index, element] : visible_elements_) {
                element->paint(cx);
            }
        }

        bool process_event(const events::Event& event, Context* cx) override {
            // Handle scroll events to update scroll_position_
            if (auto* scroll = std::get_if<events::MouseScrollEvent>(&event)) {
                // Update scroll position
                float new_pos = scroll_position_ - scroll->delta.height() * 20.0f;
                set_scroll_position(new_pos);
                return true;
            }

            // Delegate events to visible children
            for (auto& [index, element] : visible_elements_) {
                if (element->handle_event(event, cx)) {
                    return true;
                }
            }

            return false;
        }

        void set_scroll_position(float position) {
            scroll_position_ = std::max(0.0f, std::min(position, max_scroll()));
            update_visible_elements();
            invalidate();
        }

        void set_items(std::vector<T> items) {
            items_ = std::move(items);
            update_visible_elements();
            invalidate();
        }

    private:
        void update_visible_elements() {
            visible_elements_.clear();

            const auto& bounds = get_bounds();
            float visible_start = scroll_position_;
            float visible_end = visible_start + bounds.height();

            auto start_idx = static_cast<size_t>(visible_start / item_height_);
            size_t end_idx = std::min(static_cast<size_t>(std::ceil(visible_end / item_height_)), items_.size());

            for (size_t i = start_idx; i < end_idx; ++i) {
                auto element = renderer_(items_[i], i);
                float y = static_cast<float>(i) * item_height_ - scroll_position_ + bounds.y();
                element->set_bounds(Rect<float>{
                    bounds.x(),
                    y,
                    bounds.width(),
                    item_height_
                });

                visible_elements_[i] = element;
            }
        }

        float max_scroll() const {
            return std::max(0.0f, static_cast<float>(items_.size()) * item_height_ - get_bounds().height());
        }
    };
}
