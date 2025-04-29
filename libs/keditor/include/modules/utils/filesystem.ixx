//
// Created by Aidan Jost on 4/29/25.
//

module;
#include <string>
#include <vector>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>

export module keditor.utils.filesystem;
import plastic.error;

export namespace keditor::fs
{
    inline std::string read_file(const std::string& path) {
        try {
            std::ifstream file(path, std::ios::binary | std::ios::ate);
            if (!file.is_open()) {
                throw std::runtime_error("Could not open file: " + path);
            }

            std::streamsize size = file.tellg();
            file.seekg(0, std::ios::beg);

            std::string buffer(size, '\0');
            if (!file.read(buffer.data(), size)) {
                throw std::runtime_error("Failed to read file: " + path);
            }

            return buffer;
        } catch (const std::exception& e) {
            // Log the error or handle it appropriately
            std::cerr << "Error reading file '" << path << "': " << e.what() << std::endl;
            return "";
        }


    }
    inline bool write_file(const std::string& path, const std::string& content) {
        try {
            std::ofstream file(path, std::ios::binary);
            if (!file.is_open()) {
                throw std::runtime_error("Failed to open file for writing: " + path);
            }

            file.write(content.data(), static_cast<std::streamsize>(content.size()));
            return true;
        } catch (const std::exception& e) {
            // Log the error or handle it appropriately
            // Placeholder for now...
            std::cerr << "Error writing file '" << path << "': " << e.what() << std::endl;
            // plastic::errors::file_error("Error writing file '" + path + "': " + e.what());
            return false;
        }
    }

    inline bool exists(const std::string& path) {
        return std::filesystem::exists(path);
    }

    inline bool is_dir(const std::string& path) {
        return std::filesystem::is_directory(path);
    }

    inline bool is_reg_file(const std::string& path) {
        return std::filesystem::is_regular_file(path);
    }

    inline std::string get_filename(const std::string& path) {
        return std::filesystem::path(path).filename().string();
    }

    inline std::string get_extension(const std::string& path) {
        return std::filesystem::path(path).extension().string();
    }

    inline std::vector<std::string> list_dir(const std::string& path) {
        std::vector<std::string> results;

        try {
            for (const auto& entry : std::filesystem::directory_iterator(path)) {
                results.push_back(entry.path().string());
            }
        } catch (const std::exception& e) {
            // Handle exception...
            // Placeholder for now...
            std::cerr << "Error listing directory '" << path << "': " << e.what() << std::endl;
        }
        return results;
    }
}
