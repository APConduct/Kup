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

class FileTree : public View {
public:
    std::function<void(const std::string&)> on_file_selected;
    Font font;
    float font_size;
    float spacing;
    Color text_color{WHITE};
    Vector2 position{20, 20};
    float item_height;

    std::vector<FileNode> nodes;
    int selected_index{-1};

public:
    void load_directory(const std::string& path, FileNode& node);
    void render_node(const FileNode& node, float& y_offset, int depth = 0);
    FileNode* get_node_at_index(int index);

    FileTree(const Font& font, float font_size, float spacing)
        : font(font), font_size(font_size), spacing(spacing){
            item_height = font_size + 6;
    }

    void set_root(const std::string& path);
    void render() override;
    void update() override;

    bool handle_click(Vector2 mouse_pos);
    void toggle_node(int index);
    std::string get_selected_path() const;
};

#endif //FILETREE_HPP
