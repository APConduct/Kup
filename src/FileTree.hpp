#ifndef FILETREE_HPP
#define FILETREE_HPP

#include <algorithm>
#include <functional>
#include <string>
#include <vector>
#include <raylib.h>
#include "view.hpp"



struct FileNode {
    std::string name;
    std::string path;
    bool is_directory{};
    bool is_expanded{false};
    std::vector<FileNode> children;
};

class FileTree : public View<FileTree> {
    // this might cause problems
    float width{0};
    float space_below{0};

public:
    Vector2 position{0,0};


    // Scroll state
    float scroll_offset_y{0};
    float max_scroll{0};
    float visible_height{static_cast<float>(GetScreenHeight()) - position.y - space_below};

    float max_width{0};
    float scroll_offset_x{0};


    // Callback for when a file is selected
    std::function<void(const std::string&)> on_file_selected;
    Font font;
    float font_size;
    float spacing;
    Color text_color{WHITE};
    float item_height;

    std::vector<FileNode> nodes;
    int selected_index{-1};



public:
    // Helper function to check if Mouse is over the file tree
    [[nodiscard]] bool is_mouse_over() const {
        auto [x, y] = GetMousePosition();
        return (
            x >= position.x &&
            x <= position.x + width &&
            y >= position.y &&
            y <= position.y + visible_height
        );
    }

    void update_dimensions() {
        // Calculate max width by checking all visible nodes' names
        max_width = 0;
        std::function<void(const FileNode&, int)> measure_node =
        [&](const FileNode& node, int depth) {
            const float indent = static_cast<float>(depth) * 20.0f;
            const float node_width = indent + 40 + MeasureTextEx(font, node.name.c_str(), font_size, spacing).x;
            max_width = std::max(max_width, node_width);

            if (node.is_directory && node.is_expanded) {
                for (const auto& child : node.children) {
                    measure_node(child, depth + 1
                    );
                }
            }
        };

        for (const auto& node : nodes) {
            measure_node(node, 0);
        }
    }

    // Scroll methods
    void handle_scroll(){
        // Only handle scroll if mouse is over the file tree
        if (!is_mouse_over()) return;

        // Get both verytical and horizontal scroll
        auto [x, y] = GetMouseWheelMoveV();
        if (x != 0  || y != 0){
            // Calculate max scroll before applying new scroll offset
            update_content_height();
            // Calculate maximum allowed scroll offset
            //
            // Vertical scroll
            const float max_scroll_y = std::max(0.0f, max_scroll - visible_height);

            // Apply scroll with har clamp at boundaries
            scroll_offset_y = std::clamp(
                scroll_offset_y - y * 40.0f,
                0.0f,               // Minimum
                max_scroll_y   // Maximum
            );

            // Horizontal scroll
            const float max_scroll_x = std::max(0.0f, max_width - width);
            scroll_offset_x = std::clamp(
                scroll_offset_x - x * 40.0f,
                0.0f,
                max_scroll_x
            );
        }
    }

    void update_content_height() {
        float total_height = 0;
        for (const auto& node : nodes) {
            total_height += calculate_node_height(node);
        }
        max_scroll = total_height ;
    }

    [[nodiscard]] float calculate_node_height(const FileNode& node) const {
        float height = item_height;
        if (node.is_directory && node.is_expanded) {
            for (const auto& child : node.children) {
                height += calculate_node_height(child);
            }
        }
        return height;
    }

    static void load_directory(const std::string& path, FileNode& node) {
        const FilePathList files = LoadDirectoryFiles(path.c_str());

        for (int i = 0; i < files.count; i++) {
            std::string name = GetFileName(files.paths[i]);
            if (name == "." || name == "..") continue;

            bool is_dir = DirectoryExists(files.paths[i]);
            FileNode child{
                .name = name,
                .path = files.paths[i],
                .is_directory = is_dir
            };

            if (is_dir) {
                load_directory(files.paths[i], child);
            }
            node.children.push_back(std::move(child));
        }
        UnloadDirectoryFiles(files);

    };
    void render_node(const FileNode& node, float& y_offset, int depth = 0) {
        // Skip rendering if node is outside of view
        if (y_offset + item_height < position.y - scroll_offset_y ||
            y_offset > position.y - scroll_offset_y + visible_height){
        // Update y_offset based on item height
            y_offset += item_height;
            if (node.is_directory && node.is_expanded){
                for (const auto& child : node.children){
                    render_node(child, y_offset, depth + 1);
                }
            }
            return;
        }

        float x = position.x + (static_cast<float>(depth) * 20.0f) - scroll_offset_x; // Indent based on depth

        // Draw expand/collapse indicator for directories
        if (node.is_directory) {
            const char* indicator = node.is_expanded ? "v" : ">";
            DrawTextEx(font, indicator, {x+10, y_offset+10}, font_size, spacing, text_color);
        }

        DrawTextEx(font, node.name.c_str(), {x+25, y_offset+10}, font_size, spacing, text_color);

        y_offset += item_height;


        // Recursively render children if expanded
        if (node.is_directory & node.is_expanded) {
            for (const auto& child : node.children) {
                render_node(child, y_offset, depth + 1);
            }
        }
    }

    FileNode* get_node_at_index(const int index) {
        int current_index = 0;

        std::function<FileNode*(FileNode&, int&)> find_node = [&](FileNode& node, int& current) -> FileNode* {
            if (current == index) return &node;
            current++;

            if (node.is_directory && node.is_expanded) {
                for (auto& child : node.children) {
                    if (auto* found = find_node(child, current)) return found;
                }
            }
            return nullptr;
        };

        for (auto& node : nodes) {
            if(auto* found = find_node(node, current_index)) return found;
        }
        return  nullptr;
    }

    FileTree(const Font& font, const float font_size, const float spacing, float width, float space_below)
        : width(width), space_below(space_below), font(font), font_size(font_size), spacing(spacing) {
            item_height = font_size + 6;
            this->origin.x = this->origin.y = 0;
    }

    FileTree(const Font& font, float font_size, float spacing, float width)
    : width(width), font(font), font_size(font_size), spacing(spacing){
        item_height = font_size + 6;
        this->origin.x = this->origin.y = 0;
    }



    void set_root(const std::string& path) {
        nodes.clear();

        // Create root node
        FileNode root;
        root.name = GetFileName(path.c_str());
        root.path = path;
        root.is_directory = true;
        root.is_expanded = true;

        load_directory(path, root);
        nodes.push_back(std::move(root));
    }

    void render() override {
        BeginScissorMode(
            static_cast<int>(position.x),
            static_cast<int>(position.y),
            static_cast<int>(width), static_cast<int>(visible_height - space_below)
        );

        float y_offset = position.y - scroll_offset_y;
        for (const auto& node : nodes) {
            render_node(node, y_offset, 0);
        }

        EndScissorMode();
    }

    void update(float delta_time) override {
        update_dimensions();

        // Update visible height based on window size
        // This is necessary because the window size can change
        visible_height = static_cast<float>(GetScreenHeight()) - position.y;

        handle_scroll();

        if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) {
            Vector2 mouse = GetMousePosition();
            if (mouse.x < width + this->origin.x && mouse.x > this->origin.x) handle_click(mouse);
        }
    }

    bool handle_click(Vector2 mouse_pos) {
        // Calculate which item was clicked based on position and item height
        // Adjust for scroll offset
        float local_y = mouse_pos.y - position.y + scroll_offset_y;
        int clicked_index = static_cast<int>(local_y / item_height);

        if (clicked_index >= 0) {
            toggle_node(clicked_index);
            if(selected_index == clicked_index && on_file_selected) {
                // If clicking the same node, and it's a file, trigger selection
                auto* node = get_node_at_index(clicked_index);
                if (node && !node->is_directory) {
                    on_file_selected(node->path);
                }
            }
            selected_index = clicked_index;
            return true;
        }
        return false;

    };
    void toggle_node(int index) {
        // Calculate which  node to toggle based on current view
        FileNode* target_node = nullptr;
        int current_index = 0;

        // Helper function to find node at index (using lamda)
        std::function<bool(FileNode&, int&)> find_node = [&](FileNode& node, int& current) -> bool {
            if (current == index) {
                target_node = &node;
                return true;
            }
            current++;

            if (node.is_directory && node.is_expanded) {
                for (auto& child : node.children) {
                    if (find_node(child, current)) return true;
                }
            }
            return false;
        };

        //Search through nodes
        for (auto& node : nodes) {
            if (find_node(node, current_index)) break;
        }

        // Toggle the found node
        if (target_node && target_node->is_directory) {
            target_node->is_expanded = !target_node->is_expanded;

            // Update content height after toggling
            update_content_height();

            // Adjust scroll offset to keep content in view
            float max_scroll_offset = std::max(0.0f, max_scroll - visible_height);
            scroll_offset_y = std::min(scroll_offset_y, max_scroll_offset);
        }
    }



    [[nodiscard]] std::string get_selected_path() const;
};

#endif //FILETREE_HPP
