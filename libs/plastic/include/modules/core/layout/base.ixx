//
// Created by Aidan Jost on 4/2/25.
//

module;
#include <string_view>
#include <unordered_map>
#include <string>


export module plastic.core.layout.base;

import plastic.rect;
import plastic.size;
import plastic.element;
import plastic.layout_properties;
import plastic.edge;

export namespace plastic::core::layout
{

    struct Constants {
        static constexpr float UNBOUNDED = std::numeric_limits<float>::infinity();
        static constexpr float MIN_SIZE = 0.0f;
    };

    struct Constraints {
        Size<float> min_size{0, 0};
        Size<float> max_size{Constants::UNBOUNDED, Constants::UNBOUNDED};
        bool tight_width {false};
        bool tight_height {false};

        [[nodiscard]] bool is_tight_width() const { return tight_width; }
        [[nodiscard]] bool is_tight_height() const { return tight_height; }
        [[nodiscard]] bool is_unbounded_width() const { return max_size.width() == Constants::UNBOUNDED; }
        [[nodiscard]] bool is_unbounded_height() const { return max_size.height() == Constants::UNBOUNDED; }
    };



    struct Context {
        Constraints constraints;
        Size<float> parent_size{0, 0};
        Edge<float> padding{0,0,0,0};
        Edge<float> margin{0,0,0,0};

        [[nodiscard]] Size<float> available_size() const {
            return Size<float>{
                parent_size.width() - padding.left - padding.right - margin.left - margin.right,
                parent_size.height() - padding.top - padding.bottom - margin.top - margin.bottom
            };
        }

        [[nodiscard]] Size<float> min_size() const {
            return Size<float>{
            constraints.min_size.width() + padding.left + padding.right + margin.left + margin.right,
                constraints.min_size.height() + padding.top + padding.bottom + margin.top + margin.bottom};
        }
    };

    class Engine {
    protected:
        LayoutProperties props_;

    public:
        virtual ~Engine() = default;

        // Measure pass
        virtual Size<float> measure(const Element& element, const Context& context) = 0;

        // Arrange pass
        virtual void arrange(const Element& element, const Rect<float>& bounds) = 0;

        virtual void set_properties(const LayoutProperties& props) {
            props_ = props;
        }

        [[nodiscard]] virtual  const LayoutProperties& get_properties() const {
            return props_;
        }

        // Optional layout pass
        [[nodiscard]] virtual bool validate(const Element& element) {
            return true;
        };

        // Helper methods for derived classes
    protected:
        [[nodiscard]] virtual Size<float> apply_constraints(
            const Size<float>& desired_size,
            const Constraints& constraints) const {
            return Size<float>{
            std::clamp(desired_size.width(), constraints.min_size.width(),constraints.max_size.width()), std::clamp(
                desired_size.height(), constraints.min_size.height(), constraints.max_size.height())};
        }

        [[nodiscard]] Rect<float> virtual  apply_alignment(
            const Rect<float>& bounds,
            const Size<float>& child_size,
            const LayoutProperties::Alignment align) const {
            float x = bounds.x();
            float y = bounds.y();

            switch (align) {
                case LayoutProperties::Alignment::Start:
                    break;
                case LayoutProperties::Alignment::Center:
                    x += (bounds.width() - child_size.width()) / 2;
                    y += (bounds.height() - child_size.height()) / 2;
                    break;
                case LayoutProperties::Alignment::End:
                    x += bounds.width() - child_size.width();
                    y += bounds.height() - child_size.height();
                    break;
                default: // Stretch
                    x += 0;
                    y += 0;
                    break;
            }
            return Rect{x, y, child_size.width(), child_size.height()};
        }

    };

    struct  Registry {
    private:
        std::unordered_map<std::string, std::unique_ptr<Engine>> layouts_;
        static Registry* instance_;

    public:
        static Registry& instance() {
            if (!instance_) {
                instance_ = new Registry;
            }
            return *instance_;
        }

        void register_layout( std::string_view name, std::unique_ptr<Engine> layout) {
            layouts_[std::string(name)] = std::move(layout);
        }

        Engine* get_layout(std::string_view name) {
            const auto it = layouts_.find(std::string(name));
            return it == layouts_.end() ? nullptr : it->second.get();
        }

        template<typename T, typename... Args>
        T* create_layout(std::string_view name, Args&&... args) {
            auto engine = std::make_unique<T>(std::forward<Args>(args)...);
            auto* ptr = engine.get();
            layouts_[std::string(name)] = std::move(engine);
            return ptr;
        }

    };

}
