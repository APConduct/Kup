//
// Created by ajost1 on 1/29/2025.
//
module;
#include <memory>
#include <string>
#include <vector>
export module plastic.view;

import plastic.element;
import plastic.model;
import plastic.context;
import plastic.events;
import plastic.color;

export namespace plastic
{
    struct View {
    protected:
        Context* cx_{nullptr};
        std::shared_ptr<Element> root_element_;
        std::vector<std::shared_ptr<View>> children_;
        bool needs_layout_{true};
        bool needs_paint_{true};
        bool mounted_{false};
        std::string name_{"View"};
        Color background_color_{Color::rgb(30, 30, 30)};
    public:
        View() = default;
        virtual ~View() = default;

        virtual std::shared_ptr<Element> render(Context* cx) const = 0;

        virtual void update(float delta_time) {};

        virtual void handle_event(events::Event& event, Context* cx) {};

        virtual void mount(Context* cx) {
            cx_ = cx;
        }

        virtual void unmount(Context* cx) {
            cx_ = nullptr;
        }

        [[nodiscard]] Context* get_context() const { return cx_; }

        template <typename Self>
        struct Builder {
        protected:
            Self& self() { return *static_cast<Self*>(this); }
        };

        virtual void on_mount(Context* cx) {}

        explicit View(std::string name) : name_(std::move(name)) {}

    protected:
        // Lifecycle hooks that can be overridden
        virtual void on_mount() {}
        virtual void on_unmount() {}

        // Helper to create standard elements
        template<typename ElementType, typename... Args>
        std::shared_ptr<ElementType> create(Args&&... args) {
            auto element = std::make_shared<ElementType>(std::forward<Args>(args)...);
            return element;
        }

        void set_background_color(const Color& color) {
            background_color_ = color;
            invalidate_paint();
        }

        void invalidate_paint() {
            needs_paint_ = true;
            if (cx_) {
                cx_->request_paint();
            }
        }


        void invalidate_layout() {
            needs_layout_ = true;
            if (cx_) {
                cx_->request_layout();
            }
        }

        void add_child(const std::shared_ptr<View>& child) {
            children_.push_back(child);
            if (mounted_ && cx_) {
                child->mount(cx_);
            }
        }

        void remove_child(const std::shared_ptr<View>& child) {
            auto it = std::ranges::find(children_, child);
            if (it != children_.end()) {
                if (mounted_ && cx_) {
                    child->unmount(cx_);
                }
                children_.erase(it);
            }
        }

        const std::string& name() const { return name_; }



        const Color& background_color() const { return background_color_; }




    };
}
