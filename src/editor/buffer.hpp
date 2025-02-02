#pragma once
#include <algorithm>
#include <cstddef>
#include <raylib.h>
#include <string>
#include "../piece_table.hpp"

namespace kup {
    struct BufferPosition {
        size_t row;
        size_t column;
        size_t index;
    };

    struct BufferRange {
        BufferPosition start;
        BufferPosition end;
    };

    struct Buffer {
    private:
        PieceTable content;
        std::string filepath;
        bool is_modified{false};

        // Cache for line offsets
        mutable std::vector<size_t> line_offsets;
        mutable bool cache_valid{false};

    public:
        explicit Buffer(std::string path = "") : filepath(std::move(path)) {
            if (!filepath.empty() && FileExists(filepath.c_str())) {
                if (const char* content = LoadFileText(filepath.c_str())) {
                    this->content = PieceTable(content);
                    UnloadFileText(const_cast<char*>(content));
                }
            }
        };

        void insert(size_t pos, const std::string& text){
            content.insert(pos, text);
            // cache_valid = false;
            is_modified = true;
            invalidate_cache();
        }

        void remove(size_t start, size_t end){
            content.remove(start, end);
            // cache_valid = false;
            is_modified = true;
            invalidate_cache();
        }

        [[nodiscard]] std::string get_text() const {
            return content.get_text();
        }

        [[nodiscard]] std::string get_line(size_t line_number) const {
            update_cache();
            if (line_number >= line_offsets.size()) {
                return "";
            }
            size_t start = line_offsets[line_number];
            size_t end = (line_number + 1 < line_offsets.size()) ? line_offsets[line_number + 1] - 1 : content.get_text().length();

            return content.get_text().substr(start, end - start);
        }

        [[nodiscard]] size_t line_count() const {
            update_cache();
            return line_offsets.size();
        }

        [[nodiscard]] BufferPosition index_to_position(size_t index) const {
            update_cache();
            auto it = std::upper_bound(line_offsets.begin(), line_offsets.end(), index);
            size_t line = std::distance(line_offsets.begin(), it) - 1;
            size_t column = index - line_offsets[line];
            return {line, column, index};
        }

        [[nodiscard]] size_t position_to_index(const BufferPosition& pos) const {
            update_cache();
            if (pos.row >= line_offsets.size()) return content.get_text().length();
            return line_offsets[pos.row] + pos.column;
        }

        bool save() {
                    if (!is_modified) return true;
                    if (filepath.empty()) return false;

                    const std::string& text = content.get_text();
                    if (!SaveFileText(filepath.c_str(), const_cast<char*>(text.data()))) {
                        return false;
                    }
                    is_modified = false;
                    return true;
                }

        private:
            void invalidate_cache() const {
                cache_valid = false;
            }

            void update_cache() const {
                if (cache_valid) return;
                line_offsets.clear();
                line_offsets.push_back(0);

                const std::string& text = content.get_text();
                for (size_t i = 0; i < text.length(); i++) {
                    if (text[i] == '\n') {
                        line_offsets.push_back(i + 1);
                    }
                }

                cache_valid = true;
            }

    };
}
