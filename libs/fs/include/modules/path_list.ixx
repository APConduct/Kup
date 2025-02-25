//
// Created by Aidan Jost on 2/25/25.
//

module;
#include <raylib.h>
#include <vector>
#include <string>
#include <filesystem>
#include <optional>
export module fs.path_list;

import fs.config;

export namespace fs
{

    struct Path {

        auto operator==(const Path& other) const {
            return global_path == other.global_path &&
                   local_path == other.local_path &&
                   filename_ == other.filename_ &&
                   extension_ == other.extension_;
        };

        Path(Path&& other) noexcept
            : global_path(std::move(other.global_path)),
              local_path(std::move(other.local_path)),
              filename_(std::move(other.filename_)),
              extension_(std::move(other.extension_)),
              delimiter(other.delimiter),
              parent(std::move(other.parent)) {}

        std::string global_path; // Global path
        std::string local_path;  // Local path
        std::string filename_;    // Filename
        std::optional<std::string> extension_;   // File extension
        decltype(fs_file_path_delimiter) delimiter{fs_file_path_delimiter};   // Path delimiter
        //std::optional<decltype(fs_root_path)> root_path; // Root path
        std::unique_ptr<Path> parent; // Parent path




        explicit Path(std::string global_path,
             std::string local_path,
             std::string filename,
             std::optional<std::string> extension,
             decltype(fs_file_path_delimiter) delimiter)
            : global_path(std::move(global_path)),
              local_path(std::move(local_path)),
              filename_(std::move(filename)),
              extension_(std::move(extension)),
              delimiter(delimiter) {
        }

        explicit Path(std::string global_path,
            std::string local_path,
            std::string filename,
            decltype(fs_file_path_delimiter) delimiter)
           : global_path(std::move(global_path)),
             local_path(std::move(local_path)),
             filename_(std::move(filename)),
             delimiter(delimiter) {
            auto dot_pos = filename.find_last_of('.');
            if (dot_pos != std::string::npos) {
                extension_ = filename.substr(dot_pos + 1);
                auto delim_pos = filename.find_last_of(delimiter);
                filename_ = (delim_pos==std::string::npos)? filename.substr(0, dot_pos) : filename.substr(delim_pos + 1, dot_pos - delim_pos - 1);
            } else {
                extension_ = std::nullopt;
            }

        }

        static Path from(const std::string& path) {
            return Path(
                path,
                path,
                path,
                std::nullopt,
                fs_file_path_delimiter
            );
        }




        Path& operator=(Path&& other)  noexcept {
            if (this != &other) {
                global_path = std::move(other.global_path);
                local_path = std::move(other.local_path);
                filename_ = std::move(other.filename_);
                extension_ = std::move(other.extension_);
                delimiter = other.delimiter;
                parent = std::move((other.parent));
            }
            return *this;
        }

        // Delete copy constructor and copy assignment operator
        Path(const Path&) = delete;
        Path& operator=(const Path&) = delete;

        [[nodiscard]] bool is_system_root() const {
            return global_path == fs_root_path;
        }

        [[nodiscard]] bool is_file() const {
            return !is_directory();
        }

        [[nodiscard]] bool is_file_rl() const {
            return !is_dir_rl();
        }

        [[nodiscard]] bool is_empty_dir() const {
            return std::filesystem::is_empty(global_path);
        }

        [[nodiscard]] bool is_empty_dir_rl() const {
            return DirectoryExists(global_path.c_str());
        }
        [[nodiscard]] bool is_directory() const {
            return std::filesystem::is_directory(global_path);
        }

        [[nodiscard]] bool is_dir_rl() const {
            return DirectoryExists(global_path.c_str());
        }

        [[nodiscard]] bool is_empty() const {
            return global_path.empty();
        }

        [[nodiscard]] bool is_valid() const {
            return !global_path.empty();
        }

        [[nodiscard]] std::string get_name() const {
            return filename_;
        }

        [[nodiscard]] std::string get_extension() const {
            if (extension_) {
                return *extension_;
            }
            return "";
        }

        [[nodiscard]] std::string get_filename() const {
            return filename_;
        }

        [[nodiscard]] std::string get_local_path() const {
            return local_path;
        }

        [[nodiscard]] std::string get_global_path() const {
            return global_path;
        }

        [[nodiscard]] std::string ext() const {
            auto glob = std::filesystem::path(global_path);
            auto ext = glob.extension();
            if (ext.empty()) {
                return "";
            }
            return ext.string();
        }
    };

    struct CStylePathList {
        unsigned int capacity;          // Filepaths max entries
        unsigned int count;             // Filepaths entries count
        char **paths;// Filepaths entries

        [[nodiscard]] ::FilePathList rl() const {
            return ::FilePathList{
                .capacity = capacity,
                .count = count,
                .paths = paths
            };
        }

        static CStylePathList from(::FilePathList& path_list) {
            CStylePathList c_style_path_list{};
            c_style_path_list.capacity = path_list.capacity;
            c_style_path_list.count = path_list.count;
            c_style_path_list.paths = path_list.paths;
            return c_style_path_list;
        }
    };

    struct PathList {
        auto operator<=>(const PathList&) const {

        };
        unsigned int count;             // Filepaths entries count
        unsigned int capacity;          // Filepaths max entries
        std::vector<std::string> paths; // Filepaths entries
        std::optional<std::vector<std::string>> extensions; // Filepaths entries
        std::optional<std::vector<std::string>> filenames; // Filepaths entries
        std::optional<std::vector<std::string>> global_paths; // Filepaths entries

        [[nodiscard]] CStylePathList c_style() const {
            CStylePathList c_style_path_list{};
            c_style_path_list.capacity = capacity;
            c_style_path_list.count = count;
            c_style_path_list.paths = new char*[capacity];
            for (unsigned int i = 0; i < count; ++i) {
                c_style_path_list.paths[i] = new char[paths[i].size() + 1];
                std::strcpy(c_style_path_list.paths[i], paths[i].c_str());
            }
            return c_style_path_list;
        }

        [[nodiscard]] ::FilePathList rl() const {
            ::FilePathList c_style_path_list{};
            c_style_path_list.capacity = capacity;
            c_style_path_list.count = count;
            c_style_path_list.paths = new char*[capacity];
            for (unsigned int i = 0; i < count; ++i) {
                c_style_path_list.paths[i] = new char[paths[i].size() + 1];
                std::strcpy(c_style_path_list.paths[i], paths[i].c_str());
            }
            return c_style_path_list;
        }

        static PathList from(::FilePathList& path_list) {
            PathList path_list_obj{};
            path_list_obj.capacity = path_list.capacity;
            path_list_obj.count = path_list.count;
            path_list_obj.paths.reserve(path_list.count);
            for (unsigned int i = 0; i < path_list.count; ++i) {
                path_list_obj.paths.emplace_back(path_list.paths[i]);
            }
            return path_list_obj;
        }

        static PathList from(const ::FilePathList path_list) {
            PathList path_list_obj{};
            path_list_obj.capacity = path_list.capacity;
            path_list_obj.count = path_list.count;
            path_list_obj.paths.reserve(path_list.count);
            for (unsigned int i = 0; i < path_list.count; ++i) {
                path_list_obj.paths.emplace_back(path_list.paths[i]);
            }
            return path_list_obj;
        }

        static PathList from(const std::vector<std::string>& paths) {
            PathList path_list_obj{};
            path_list_obj.capacity = static_cast<unsigned int>(paths.size());
            path_list_obj.count = static_cast<unsigned int>(paths.size());
            path_list_obj.paths = paths;
            return path_list_obj;
        }

        static PathList from(CStylePathList& c_style_path_list) {
            PathList path_list_obj{};
            path_list_obj.capacity = c_style_path_list.capacity;
            path_list_obj.count = c_style_path_list.count;
            path_list_obj.paths.reserve(c_style_path_list.count);
            for (unsigned int i = 0; i < c_style_path_list.count; ++i) {
                path_list_obj.paths.emplace_back(c_style_path_list.paths[i]);
            }
            return path_list_obj;
        }



        static PathList home() {
            PathList path_list_obj{};
            path_list_obj.capacity = 1;
            path_list_obj.count = 1;
            path_list_obj.paths.emplace_back(fs_home_prefix);
            return path_list_obj;
        }

    };



    inline Path root_path() {
        auto path = Path(
            fs_root_path,
            fs_root_path,
            fs_root_path,
            "",
            fs_file_path_delimiter
        );
        path.parent = nullptr;
        return std::move(path);
    }

    inline Path home_path() {
        auto path = Path(
            fs_home_prefix,
            fs_home_prefix,
            fs_home_prefix,
            "",
            fs_file_path_delimiter
        );

        if (path.global_path == fs_root_path) {
            path.parent = nullptr;
        }else {
            auto parent_str = std::string(fs_home_prefix);
            parent_str += fs_file_path_delimiter;
            parent_str += "..";

            // Create a new uinique_ptr for the parent path
            path.parent = std::make_unique<Path>(Path::from(parent_str));
        }
        return std::move(path);
    }

    inline Path system_root_path() {
        auto path = Path(
            fs_root_path,
            fs_root_path,
            fs_root_path,
            "",
            fs_file_path_delimiter
        );
        path.parent = nullptr;
        return std::move(path);
    }

    inline PathList home_path_list() {
        PathList path_list_obj{};
        path_list_obj.capacity = 1;
        path_list_obj.count = 1;
        path_list_obj.paths.emplace_back(fs_home_prefix);
        return path_list_obj;
    }

    inline PathList system_root_path_list() {
        PathList path_list_obj{};
        path_list_obj.capacity = 1;
        path_list_obj.count = 1;
        path_list_obj.paths.emplace_back(fs_root_path);
        return path_list_obj;
    }

    inline PathList dir_contents(const Path& path)  {
        if (!DirectoryExists(path.global_path.c_str())) {
            throw std::runtime_error("Directory does not exist");
        }
        auto path_list_obj = PathList::from(LoadDirectoryFiles(path.global_path.c_str()));
        path_list_obj.extensions = std::vector<std::string>(path_list_obj.count);
        path_list_obj.filenames = std::vector<std::string>(path_list_obj.count);
        path_list_obj.global_paths = std::vector<std::string>(path_list_obj.count);
        for (unsigned int i = 0; i < path_list_obj.count; ++i) {
            path_list_obj.extensions->at(i) = GetFileExtension(path_list_obj.paths[i].c_str());
            path_list_obj.filenames->at(i) = GetFileName(path_list_obj.paths[i].c_str());
            path_list_obj.global_paths->at(i) = GetDirectoryPath(path_list_obj.paths[i].c_str());
        }
        return path_list_obj;
    }

    inline std::string file_text(const Path& path) {
        if (!FileExists(path.global_path.c_str())) {
            throw std::runtime_error("File does not exist");
        }
        const auto text = LoadFileText(path.global_path.c_str());
        return text;
    }

    inline unsigned char* file_data(const Path& path, int* data_size) {
        if (!FileExists(path.global_path.c_str())) {
            throw std::runtime_error("File does not exist");
        }
        unsigned char* data = LoadFileData(path.global_path.c_str(), data_size);
        return data;
    }



}


