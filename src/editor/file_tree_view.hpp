//
// Created by Aidan Jost on 2/24/25.
//

#ifndef FILE_TREE_VIEW_HPP
#define FILE_TREE_VIEW_HPP

#include <string>
#include <vector>
#include <functional>
#include <optional>
#include <raylib.h>
#if defined(_WIN32)
#include <algorithm>
#include <variant>
#endif
import plastic;

namespace kup
{

    class FileTreeState {
    public:
            struct Node {
                std::string name;
                std::string path;
                bool is_directory{};
                bool is_expanded{false};
                std::vector<Node> children;
            };

            std::vector<Node> nodes;
            Font font{};
            float font_size{20.0f};
            float spacing{1.0f};
            float scroll_y{0.0f};
            float max_scroll_y{0};
            float scroll_x{0.0f};
            float max_scroll_x{0};
            float visible_height{0};
            float visible_width{0};
            float selected_index{-1};
            std::function<void(const std::string&)> on_select;

            void calculate_max_scroll(float window_width, float window_height) {
                float total_height = 0;
                float max_width = 0;
                for (const auto& node : nodes) {
                    total_height += calculate_node_height(node);
                    max_width += std::max(max_width, calculate_node_width(node));
                }
                max_scroll_y = std::max(0.0f, total_height - window_height);
                max_scroll_x = std::max(0.0f, max_width - window_width);
                visible_height = window_height;

            }

            [[nodiscard]] float calculate_node_height(const Node& node) const {
                float height = font_size + spacing;
                if (node.is_directory && node.is_expanded) {
                    for (const auto& child : node.children) {
                        height += calculate_node_height(child);
                    }
                }
                return height;
            }

            [[nodiscard]] float calculate_node_width(const Node& node) const {
                // Base width calculation (indent + icon + name)
                float width = MeasureTextEx(font, node.name.c_str(), font_size, spacing).x + 40;

                if (node.is_directory && node.is_expanded) {
                    for (const auto& child : node.children) {
                        width = std::max(width, calculate_node_width(child) + 20); // +20 for indentation
                    }
                }
                return width;
            }
        };;

    class FileTreeView : public plastic::StatefulView<FileTreeState>
    {
    public:

    private:
        class TreeElement : public plastic::Element {
            FileTreeState state;
            float item_height;

        public:
            explicit TreeElement(const FileTreeState& state) : state(state), item_height(state.font_size + state.spacing) {}

            void paint(plastic::Context* cx) const override {
                const auto& bounds = get_bounds();

                BeginScissorMode(
                    static_cast<int>(bounds.x()),
                    static_cast<int>(bounds.y()),
                    static_cast<int>(bounds.width()),
                    static_cast<int>(bounds.height())
                    );

                float y = bounds.y() - state.scroll_y;
                for (const auto& node : state.nodes) {
                    render_node(node, y, bounds.x(), 0);
                }

                EndScissorMode();
            };

            float estimate_subtree_height(const FileTreeState::Node& node) const {
                float height = item_height;
                if (node.is_directory && node.is_expanded) {
                    for (const auto& child : node.children) {
                        height += estimate_subtree_height(child);
                    }
                }
                return height;
            }

            void render_node(const FileTreeState::Node& node, float& y, float x, int depth) const {

                // Skip if we are out of view bounds
                if (y > get_bounds().y() + get_bounds().height()) {
                    // Skip this node and estimate the height for its children if expanded
                    if (node.is_directory && node.is_expanded) {
                        y += estimate_subtree_height(node);
                    } else {
                        y += item_height;
                    }
                    return;
                }

                const float indent = static_cast<float>(depth) * 20.0f;
                const float adjusted_x = x + indent - state.scroll_x;
                const bool in_view = (y + item_height >= get_bounds().y() &&
                    y <= get_bounds().y() + get_bounds().height() && adjusted_x < get_bounds().x() + get_bounds().width());

                if (in_view) {
                    // Draw node background
                    if (is_node_selected(node)) {
                        DrawRectangle(
                            static_cast<int>(get_bounds().x()),
                            static_cast<int>(y),
                            static_cast<int>(get_bounds().width()),
                            static_cast<int>(item_height),
                            //Fade(GREEN, 0.5f));
                            DARKGRAY);
                    }

                    // Draw expand/collapse indicator for directories
                    if (node.is_directory) {
                        DrawTextEx(
                           state.font,
                           node.is_expanded ? "v" : ">",
                           {adjusted_x + 5, y + 2},
                           state.font_size,
                           0,
                           WHITE);
                    }

                    // Draw node name
                    DrawTextEx(
                        state.font,
                        node.name.c_str(),
                        {adjusted_x + 25, y + 2},
                        state.font_size, 0, WHITE);
                }
                y += item_height;

                if (node.is_directory && node.is_expanded) {
                    for (const auto& child : node.children) {
                        render_node(child, y, x, depth + 1);
                    }
                }
            }

            bool is_node_selected(const FileTreeState::Node& node) const {
                return node.path == get_selected_path();
            }

            std::string get_selected_path() const {
                return find_path_at_index(static_cast<int>(state.selected_index));
            }

            std::string find_path_at_index(int index) const {
                int current = 0;
                for (const auto& node : state.nodes) {
                    if (auto path = find_path_in_node(node, index, current)) {
                        return *path;
                    }
                }
                return "";
            }

            static std::optional<std::string> find_path_in_node(const FileTreeState::Node& node, int target_index, int& current_index) {
                if (current_index == target_index) {
                    return node.path;
                }
                current_index++;

                if (node.is_directory && node.is_expanded) {
                    for (const auto& child : node.children) {
                        if (auto path = find_path_in_node(child, target_index, current_index)) {
                            return path;
                        }
                    }
                }
                return std::nullopt;
            }
            void layout(plastic::Context* cx) override {
                state.calculate_max_scroll(get_bounds().width(), get_bounds().height());
            }

            void handle_click(float mouse_x, float mouse_y) {
                float y = get_bounds().y() - state.scroll_y;
                int index = 0;
                for (FileTreeState::Node& node : state.nodes) {
                    if (handle_node_click(node, mouse_x, mouse_y, y, 0, index)) {
                        break;
                    }
                }
            }

            bool handle_node_click(FileTreeState::Node& node, float mouse_x, float mouse_y, float& y, int depth, int& index) {
                const float indent = static_cast<float>(depth) * 20.0f;
                const float node_y = y;
                y+= item_height;

                if (mouse_y >= node_y && mouse_y < node_y + item_height) {
                    // Handle collapse/expand for directories
                    if (node.is_directory && mouse_x >= get_bounds().x() + indent + 5 && mouse_x <= get_bounds().x() + indent + 25) {
                        node.is_expanded = !node.is_expanded;
                        return true;
                    }

                    // Handle selection
                    state.selected_index = static_cast<float>(index);
                    if (!node.is_directory && state.on_select) {
                        state.on_select(node.path);
                    }
                    return true;
                }
                index++;

                if (node.is_directory && node.is_expanded) {
                    for (auto& child : node.children) {
                        if (handle_node_click(child, mouse_x, mouse_y, y, depth + 1, index)) {
                            return true;
                        }
                    }
                }
                return false;
            }

            bool handle_mouse_wheel(const plastic::Point<float> delta) {
                bool changed = false;

                if (IsKeyDown(KEY_LEFT_SHIFT) || IsKeyDown(KEY_RIGHT_SHIFT)) {
                    // Horizontal scroll with shift+wheel
                    const float old_scroll_x = state.scroll_x;
                    state.scroll_x = std::clamp(
                        state.scroll_x - delta.y * 20.0f, 0.0f, state.max_scroll_x );

                    changed = old_scroll_x != state.scroll_x;
                } else {
                    // Vertical scroll
                    const float old_scroll_y = state.scroll_y;
                    state.scroll_y = std::clamp(
                        state.scroll_y - delta.y * 20.0f, 0.0f, state.max_scroll_y);

                    changed = old_scroll_y != state.scroll_y;

                    // Horizontal scroll with x wheel if available
                    if (delta.x != 0) {
                        const float old_scroll_x = state.scroll_x;
                        state.scroll_x = std::clamp(
                            state.scroll_x - delta.x * 20.0f, 0.0f, state.max_scroll_x);
                        changed = changed || old_scroll_x != state.scroll_x;
                    }
                }

                return changed;
            }
        };
    public:
        explicit FileTreeView(const FileTreeState& initial_state) : plastic::StatefulView<FileTreeState>(initial_state){}

        std::shared_ptr<plastic::Element> render(plastic::Context* cx)  override {
            auto element = std::make_shared<TreeElement>(get_state());
            element->set_style(create_tree_style());
            return element;
        }

        template<typename EventT>
        static void handle_event_impl(const EventT& event, plastic::Context* cx) {
            // Default implementation - silently ignore unhandled event types
            (void)event; // Prevent unused parameter warning
            (void)cx;    // Prevent unused parameter warning
        }

        void handle_event(plastic::events::Event& event, plastic::Context* cx) override {
            std::visit([this, cx](auto&& e) {
                handle_event_impl(e, cx);
            }, event);
        }

        void handle_event_impl(const plastic::events::MouseButtonEvent& event, plastic::Context* cx) {
            if (event.pressed && event.button == MOUSE_BUTTON_LEFT) {
                if (const auto element = std::dynamic_pointer_cast<TreeElement>(render(cx))) {
                    element->handle_click(event.position.width(), event.position.height());
                }
            }
        }

        void handle_event_impl(const plastic::events::MouseScrollEvent& event, plastic::Context* cx) {
            if (const auto element = std::dynamic_pointer_cast<TreeElement>(render(cx))) {
                if (element->handle_mouse_wheel(plastic::Point<float>(event.delta.width(), event.delta.height()))) {
                    cx->request_paint();
                }
            }
        }

        void load_directory(const std::string& path) {
            this->set_state([path](FileTreeState& state) {
                state.nodes.clear();

                FileTreeState::Node root;
                root.name = GetFileName(path.c_str());
                root.path = path;
                root.is_directory = true;
                root.is_expanded = true;

                load_directory(path, root);
                state.nodes.push_back(std::move(root));
            });
        }

    private:

        static void load_directory(const std::string& path, FileTreeState::Node& node) {
            if (!DirectoryExists(path.c_str())) {
                return;
            }
            const FilePathList files = LoadDirectoryFiles(path.c_str());

            try {
                for (int i = 0; i < files.count; i++) {
                    try {
                        std::string name = GetFileName(files.paths[i]);
                        if (name == "." || name == "..") continue;
                        if (name.starts_with(".")) continue;
                        bool is_dir = DirectoryExists(files.paths[i]);
                        FileTreeState::Node child{
                            .name = name,
                            .path = files.paths[i],
                            .is_directory = is_dir
                        };

                        if (is_dir) {
                            try {
                                load_directory(files.paths[i], child);
                            } catch (...) {
                                // Silently handle exceptions
                            }                }
                        node.children.push_back(std::move(child));
                    } catch (...) {
                        // Handle exceptions silently
                        continue;
                    }
                }
                UnloadDirectoryFiles(files);
            } catch (...) {
                // Handle exceptions silently
            }
        }

        [[nodiscard]] static plastic::style::Style create_tree_style() {
            plastic::style::Style style;
            style.background_color_normal.emplace(plastic::Color::rgb(30,30,30));
            style.layout_properties.with_flex_grow(1);
            return style;
        };

    public:
        class Builder : public View::Builder<Builder> {
            FileTreeState state{};
        public:
            Builder& with_font(const Font& font, float size, float spacing) {
                state.font = font;
                state.font_size = size;
                state.spacing = spacing;
                return *this;
            }

            Builder with_callback(std::function<void(const std::string&)> callback) {
                state.on_select = std::move(callback);
                return *this;
            }

            std::shared_ptr<FileTreeView> build() {
                return std::make_shared<FileTreeView>(state);
            }
        };
        static Builder create() { return {}; }
    };
};


#endif //FILE_TREE_VIEW_HPP
