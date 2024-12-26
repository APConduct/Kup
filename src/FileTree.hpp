#ifndef FILETREE_HPP
#define FILETREE_HPP

#include <functional>
#include <string>
#include <vector>
#include <raylib.h>
#include "view.hpp"

struct FileNode {
    std::string name;
    std::string path;
    bool is_directory;
    bool is_expanded{false};
    std::vector<FileNode> children;
};

template <typename T>
class FileTree : public View<T> {
public:
    std::function<void(const std::string&)> on_file_selected;
    Font font;
    float font_size;
    float spacing;
    Color text_color{WHITE};
    Vector2 position{10, 10};
    float item_height;

    std::vector<FileNode> nodes;
    int selected_index{-1};

    // this might cause problems
    float width{208};

public:
    void load_directory(const std::string& path, FileNode& node) {
        FilePathList files = LoadDirectoryFiles(path.c_str());

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
        float x = position.x + (static_cast<float>(depth) * 20.0f); // Indent based on depth

        // Draw expand/collapse indicator for directories
        if (node.is_directory) {
            const char* indicator = node.is_expanded ? "v" : ">";
            DrawTextEx(font, indicator, {x, y_offset}, font_size, spacing, text_color);
        }

        DrawTextEx(font, node.name.c_str(), {x+15, y_offset}, font_size, spacing, text_color);

        y_offset += item_height;


        // Recursively render children if expanded
        if (node.is_directory & node.is_expanded) {
            for (const auto& child : node.children) {
                render_node(child, y_offset, depth + 1);
            }
        }

    };
    FileNode* get_node_at_index(int index) {
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

    FileTree(const Font& font, float font_size, float spacing)
        : font(font), font_size(font_size), spacing(spacing){
            item_height = font_size + 6;
            this->origin.x = this->origin.y = 0;
    }

    FileTree(const Font& font, float font_size, float spacing, float width)
    : font(font), font_size(font_size), spacing(spacing), width(width){
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
        float y_offset = position.y;
        for (const auto& node : nodes) {
            render_node(node, y_offset, 0);
        }

    };
    void update(float delta_time) override {
        if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) {
            Vector2 mouse = GetMousePosition();
            if (mouse.x < width + this->origin.x && mouse.x > this->origin.x) handle_click(mouse);
        }
    };

    bool handle_click(Vector2 mouse_pos) {
        // Calculate which item was clicked based on position and item height
        float local_y = mouse_pos.y - position.y;
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
                    if (find_node(child, current)) return true;;
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
        }

    };
    [[nodiscard]] std::string get_selected_path() const;
};

#endif //FILETREE_HPP
