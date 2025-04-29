//
// Created by Aidan Jost on 4/29/25.
//

module;
#include <functional>
#include <string>
#include <vector>
#include <optional>
#include <algorithm>
#include <filesystem>
#include <raylib.h>

export module keditor.ui.file_tree;

import plastic;
import keditor.core.types;

export namespace kdtr::ui
{
    struct FileNode {
    protected:
        std::string name_;
        std::string path_;
        bool is_directory_{false};
        bool is_expanded_{false};
        std::vector<FileNode> children_;

    public:
        [[nodiscard]] const std::string& name() const {
            return name_;
        }

        [[nodiscard]] const std::string& path() const {
            return path_;
        }

        [[nodiscard]] bool is_directory() const {
            return is_directory_;
        }

        [[nodiscard]] bool is_expanded() const {
            return is_expanded_;
        }

        [[nodiscard]] std::vector<FileNode>& children() const {
            return const_cast<std::vector<FileNode>&>(children_);
        }

        FileNode& name(const std::string& name) {
            name_ = name;
            return *this;
        }

        FileNode& path(const std::string& path) {
            path_ = path;
            return *this;
        }

        FileNode& directory(bool is_directory) {
            is_directory_ = is_directory;
            return *this;
        }

        FileNode& expanded(bool is_expanded) {
            is_expanded_ = is_expanded;
            return *this;
        }




        static FileNode from_path(const std::string& path) {
            FileNode node;
            node.path_ = path;
            node.name_ = std::filesystem::path(path).filename().string();
            node.is_directory_ = std::filesystem::is_directory(path);
            return node;
        }
    };

    class FileTree : public plastic::Element {
    protected:
        std::vector<FileNode> nodes_;
        float item_height_{24.0f};
        float indent_width_{20.0f};

        // Scroll state
        float scroll_offset_y_{0.0f};
        float max_scroll_{0.0f};

        // Visual state
        plastic::Color text_color_{plastic::Color::white()};
        plastic::Color folder_color_{plastic::Color::rgb(102, 187, 255)};
        plastic::Color file_color_{plastic::Color::rgb(220, 220, 220)};
        plastic::Color selected_bg_color_{plastic::Color::rgb(60, 80, 120)};

        // Selection state
        std::optional<std::string> selected_path_;

        // Callbacks
        std::function<void(const std::string&)> on_file_selected_;

        // Font settings
        std::shared_ptr<plastic::Font> font_;
        float font_size_{14.0f};

    public:
        FileTree() = default;

        void set_root(const std::string& path) {
            nodes_.clear();

            if (!std::filesystem::exists(path)) {
                return;
            }

            FileNode root_node = FileNode::from_path(path);
            root_node.path(path);
            root_node.directory(true);
            root_node.expanded(true);

            load_dir(path, root_node);
            nodes_.push_back(root_node);
            invalidate();
        }

        void set_on_file_selected(const std::function<void(const std::string&)>& callback) {
            on_file_selected_ = callback;
        }

        void layout(plastic::Context* cx) override {
            update_content_height();
        }

        void paint(plastic::Context* cx) const override {
            plastic::Rect<float> content_bounds = bounds;
            content_bounds.apply_scissor();
            float y_offset = bounds.y();
            for (const auto& node : nodes_) {
                render_node(
                    // cx
                    node, y_offset);
            }
            plastic::Rect<float>::stop_scissor();
        }

        bool process_event(const plastic::events::Event& event, plastic::Context* cx) override {
            return std::visit([this, cx](const auto& e) -> bool {
            return handle_event_impl(e, cx);
        }, event);
        }

        static bool handle_event_impl(const plastic::events::ThemeChangeEvent& event, plastic::Context* context) {
            // Implementation for handling theme change events
            return false; // Or implement actual handling logic
        }

        static bool handle_event_impl(const plastic::events::WindowMovedEvent& event, plastic::Context* context) {
            // Implementation for handling window moved events
            return false; // Or implement actual handling logic
        }

        static bool handle_event_impl(const plastic::events::WindowStateEvent& event, plastic::Context* context) {
            // Implementation for handling window state events
            return false; // Or implement actual handling logic
        }







        static void load_dir(const std::string& path, FileNode& node) {
            try {
                for (const auto& entry : std::filesystem::directory_iterator(path)) {
                    if (entry.path().filename().string().starts_with(".")) {
                        continue; // Skip hidden files/folders
                    }

                    FileNode child;
                    child.name(entry.path().filename().string());
                    child.path(entry.path().string());
                    child.directory(entry.is_directory());

                    if (child.is_directory()) {
                        // Preload directories, but don't expand them
                        load_dir(child.path(), child);
                    }

                    node.children().push_back(std::move(child));
                }

                // Sort: directories first, then files, both alphabetically
                std::ranges::sort(node.children().begin(), node.children().end(), [](const FileNode& a, const FileNode& b) {
                    if (a.is_directory() && !b.is_directory()) return true;
                    if (!a.is_directory() && b.is_directory()) return false;
                    return a.name() < b.name();
                });

            } catch (const std::exception& e) {
                // Handle exceptions (e.g., permission denied)
                plastic::errors::file_error("Error loading directory '" + path + "': " + e.what());
                // Optionally, you could log this error or show a message to the user
                node.children().clear(); // Clear children on error
                node.expanded(false); // Collapse the node on error
                // node.name("Error loading directory");
            }
        }

        void update_content_height() {
            float total_height = 0;
            for (const auto& node : nodes_) {
                total_height += calculate_node_height(node);
            }
            max_scroll_ = total_height - bounds.height();
        }

        float calculate_node_height(const FileNode& node) const {
            float height = item_height_;
            if (node.is_directory() && node.is_expanded()) {
                for (const auto& child : node.children()) {
                    height += calculate_node_height(child);
                }
            }
            return height;
        }

        void render_node(const FileNode& node, float& y_offset, int depth = 0) const {
        // Calculate screen position adjusted for scroll
        float screen_y = y_offset - scroll_offset_y_;

        // Skip if node is not visible
        if (screen_y + item_height_ < bounds.y() || screen_y > bounds.y() + bounds.height()) {
            // Still update y_offset for next nodes
            y_offset += item_height_;

            // Process children if expanded
            if (node.is_directory() && node.is_expanded()) {
                for (const auto& child : node.children()) {
                    render_node(child, y_offset, depth + 1);
                }
            }
            return;
        }

        // Calculate x position with indent
        float x = bounds.x() + (static_cast<float>(depth) * indent_width_);

        // Draw selection background if selected
        if (selected_path_ && *selected_path_ == node.path()) {
            DrawRectangle(
                static_cast<int>(bounds.x()),
                static_cast<int>(screen_y),
                static_cast<int>(bounds.width()),
                static_cast<int>(item_height_),
                selected_bg_color_.rl()
            );
        }

        // Draw expand/collapse indicator for directories
        if (node.is_directory()) {
            const char* indicator = node.is_expanded() ? "v" : ">";
            font_->draw_text(
                indicator,
                plastic::Point<float>(x + 5, screen_y + 2),
                font_size_,
                0,
                text_color_
            );
        }

        // Draw node name
        plastic::Color node_color = node.is_directory() ? folder_color_ : file_color_;
        font_->draw_text(
            node.name(),
            plastic::Point<float>(x + 25, screen_y + 2),
            font_size_,
            0,
            node_color
        );

        // Update y_offset for next node
        y_offset += item_height_;

        // Recursively render children if expanded
        if (node.is_directory() && node.is_expanded()) {
            for (const auto& child : node.children()) {
                render_node(child, y_offset, depth + 1);
            }
        }
    }

        bool handle_event_impl(const plastic::events::MouseButtonEvent& event, plastic::Context* cx) {
            if (event.pressed && event.button == MOUSE_LEFT_BUTTON) {
                // Check if click is within bounds
                plastic::Point<float> mouse_pos(event.position.width(), event.position.height());
                if (!bounds.contains(mouse_pos)) {
                    return false;
                }

                // Handle click
                float local_y = mouse_pos.y - bounds.y() + scroll_offset_y_;
                handle_click(mouse_pos.x, local_y);
                return true;
            }
            return false;
        }

        bool handle_event_impl(const plastic::events::MouseScrollEvent& event, plastic::Context* cx) {
            // Check if mouse is over component
            plastic::Point<float> mouse_pos(event.position.width(), event.position.height());
            if (!bounds.contains(mouse_pos)) {
                return false;
            }

            // Update scroll position
            scroll_offset_y_ = std::clamp(
                scroll_offset_y_ - event.delta.height() * 20.0f,
                0.0f,
                std::max(0.0f, max_scroll_)
            );

            invalidate();
            return true;
        }

        template <typename EventT>
        static bool handle_event_impl(const EventT&, plastic::Context*) {
            return false;
        }

        void handle_click(float x, float y) {
            int clicked_index = static_cast<int>(y / item_height_);
            if (clicked_index >= 0) {
                // Find node at this index
                if (FileNode* node = find_node_at_index(clicked_index)) {
                    if (node->is_directory()) {
                        // Toggle expansion state
                        node->expanded(!node->is_expanded());
                        update_content_height();
                    } else {
                        // Select file
                        selected_path_ = node->path();
                        if (on_file_selected_) {
                            on_file_selected_(node->path());
                        }
                    }
                    invalidate();
                }
            }
        }

        FileNode* find_node_at_index(int index) {
            int current_index = 0;

            std::function<FileNode*(FileNode&, int&)> find_node = [&](FileNode& node, int& current) -> FileNode* {
                if (current == index) return &node;
                current++;

                if (node.is_directory() && node.is_expanded()) {
                    for (auto& child : node.children()) {
                        if (auto* found = find_node(child, current)) return found;
                    }
                }
                return nullptr;
            };

            for (auto& node : nodes_) {
                if (auto* found = find_node(node, current_index)) return found;
            }
            return nullptr;
        }

        static bool handle_event_impl(const plastic::events::ContentChangeEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::LayoutRequestEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowCreatedEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowRestoreEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowMaximizeEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowActivationEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowFullscreenEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowDecorationsEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowTransparentEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::FocusEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::ResizeEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::KeyPressEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::MouseDragEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::MouseMoveEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::TextInputEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::MouseWheelEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::KeyReleaseEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowCloseEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

        static bool handle_event_impl(const plastic::events::WindowResizeEvent& event, plastic::Context* context) {
            // Handle the event or just return false if not handled
            return false;
        }

    };

    inline std::shared_ptr<FileTree> create_file_tree() {
        return std::make_shared<FileTree>();
    }



}
