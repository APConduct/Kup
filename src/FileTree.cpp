#include <functional>
#include <raylib.h>
#include <string>
#include <windef.h>
#include "FileTree.hpp"

void FileTree::toggle_node(int index) {
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
}


void FileTree::load_directory(const std::string& path, FileNode& node) {
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
}

void FileTree::render_node(const FileNode& node, float& y_offset, int depth) {
    float x = position.x + (static_cast<float>(depth) * 20.0f); // Indent based on depth

    // Draw expand/collapse indicator for directories
    if (node.is_directory) {
        const char* indicator = node.is_expanded ? "v" : ">";
        DrawTextEx(font, indicator, {x - 15, y_offset}, font_size, spacing, text_color);
    }

    DrawTextEx(font, node.name.c_str(), {x, y_offset}, font_size, spacing, text_color);

    y_offset += item_height;


    // Recursively render children if expanded
    if (node.is_directory & node.is_expanded) {
        for (const auto& child : node.children) {
            render_node(child, y_offset, depth + 1);
        }
    }
}

void FileTree::render() {
    float y_offset = position.y;
    for (const auto& node : nodes) {
        render_node(node, y_offset, 0);
    }
}

void FileTree::update() {
    if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) {
        Vector2 mouse = GetMousePosition();
        handle_click(mouse);
    }
}

bool FileTree::handle_click(Vector2 mouse_pos) {
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
}

FileNode* FileTree::get_node_at_index(int index) {
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

void FileTree::set_root(const std::string& path){
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
