//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <string>
#include <chrono>
#include <vector>
#include <filesystem>
#include <fstream>
#include <map>
#include <thread>
#include <functional>

export module plastic.filesystem;

export namespace plastic
{
    struct FileInfo {
        std::string name;
        std::string path;
        std::string extension;
        bool is_directory{};
        size_t size{};
        std::filesystem::file_time_type last_modified;

        [[nodiscard]] bool is_hidden() const {
            // Simple check for hidden files
            return name.starts_with(".");
        }
    };

    class FileSystem {
    public:
        static std::vector<FileInfo> list_directory(const std::string& path) {
            std::vector<FileInfo> files;

            try {
                for (const auto& entry : std::filesystem::directory_iterator(path)) {
                    FileInfo info;
                    info.name = entry.path().filename().string();
                    info.path = entry.path().string();
                    info.extension = entry.path().extension().string();
                    info.is_directory = entry.is_directory();
                    info.size = entry.is_regular_file() ? entry.file_size() : 0;
                    info.last_modified = entry.last_write_time();

                    files.push_back(info);
                }
            } catch (const std::filesystem::filesystem_error&) {
                // TODO: Handle error - could return empty list or rethrow
            }

            return files;
        }

        static bool create_directory(const std::string& path) {
            try {
                return std::filesystem::create_directory(path);
            } catch (const std::filesystem::filesystem_error&) {
                return false;
            }
        }
        static bool remove_file(const std::string& path) {
            try {
                return std::filesystem::remove(path);
            } catch (const std::filesystem::filesystem_error&) {
                return false;
            }
        }

        static bool remove_directory(const std::string& path, bool recursive = false) {
            try {
                if (recursive) {
                    return std::filesystem::remove_all(path) > 0;
                } else {
                    return std::filesystem::remove(path);
                }
            } catch (const std::filesystem::filesystem_error&) {
                return false;
            }
        }

        static std::string read_text_file(const std::string& path) {
            std::ifstream file(path);
            if (!file.is_open()) {
                return "";
            }

            std::string content((std::istreambuf_iterator<char>(file)),
                              std::istreambuf_iterator<char>());
            return content;
        }

        static bool write_text_file(const std::string& path, const std::string& content) {
            std::ofstream file(path);
            if (!file.is_open()) {
                return false;
            }

            file << content;
            return file.good();
        }

        static bool copy_file(const std::string& source, const std::string& dest) {
            try {
                std::filesystem::copy_file(source, dest, std::filesystem::copy_options::overwrite_existing);
                return true;
            } catch (const std::filesystem::filesystem_error&) {
                return false;
            }
        }

        static bool move_file(const std::string& source, const std::string& dest) {
            try {
                std::filesystem::rename(source, dest);
                return true;
            } catch (const std::filesystem::filesystem_error&) {
                return false;
            }


        }

        static bool file_exists(const std::string& path) {
            return std::filesystem::exists(path) && std::filesystem::is_regular_file(path);
        }

        static bool directory_exists(const std::string& path) {
            return std::filesystem::exists(path) && std::filesystem::is_directory(path);
        }

        // Asynchronous file operations using callbacks
        static void read_file_async(const std::string& path,
                                   const std::function<void(bool, const std::string&)>& callback) {
            std::thread([path, callback]() {
                try {
                    std::string content = read_text_file(path);
                    callback(true, content);
                } catch (const std::exception&) {
                    callback(false, "");
                }
            }).detach();
        }

        static void write_file_async(const std::string& path,
                                    const std::string& content,
                                    const std::function<void(bool)>& callback) {
            std::thread([path, content, callback]() {
                try {
                    bool success = write_text_file(path, content);
                    callback(success);
                } catch (const std::exception&) {
                    callback(false);
                }
            }).detach();
        }
    };

    class FileWatcher {
    public:
        enum class FileChangeType { Added, Modified, Erased };

    private:
        std::string path_;
        std::chrono::milliseconds delay_{1000};
        std::thread watch_thread_;
        std::atomic<bool> running_{false};
        std::map<std::string, std::filesystem::file_time_type> files_;
        std::function<void(const std::string&, FileChangeType)> callback_;

    public:

        explicit FileWatcher(std::string path, std::function<void(const std::string&, FileChangeType)> callback)
            : path_(std::move(path)), callback_(std::move(callback)) {}

        ~FileWatcher() {
            stop();
        }

        void start() {
            if (running_) return;

            running_ = true;
            watch_thread_ = std::thread([this]() {
                // Initial file scan
                for (const auto& entry : std::filesystem::recursive_directory_iterator(path_)) {
                    files_[entry.path().string()] = entry.last_write_time();
                }

                while (running_) {
                    // Check for changes
                    std::this_thread::sleep_for(delay_);

                    auto it = files_.begin();
                    while (it != files_.end()) {
                        if (!std::filesystem::exists(it->first)) {
                            // File was deleted
                            callback_(it->first, FileChangeType::Erased);
                            it = files_.erase(it);
                        } else {
                            ++it;
                        }
                    }

                    // Check for new or modified files
                    for (const auto& entry : std::filesystem::recursive_directory_iterator(path_)) {
                        std::string path_str = entry.path().string();
                        auto last_write = entry.last_write_time();

                        if (!files_.contains(path_str)) {
                            // New file
                            files_[path_str] = last_write;
                            callback_(path_str, FileChangeType::Added);
                        } else if (files_[path_str] != last_write) {
                            // File was modified
                            files_[path_str] = last_write;
                            callback_(path_str, FileChangeType::Modified);
                        }
                    }
                }
            });
        }

        void stop() {
            running_ = false;
            if (watch_thread_.joinable()) {
                watch_thread_.join();
            }
        }

        void set_delay(std::chrono::milliseconds delay) {
            delay_ = delay;
        }
    };
}