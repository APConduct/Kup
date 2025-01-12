//
// Created by ajost1 on 1/12/2025.
//

#ifndef CONCURRENT_WINDOW_HPP
#define CONCURRENT_WINDOW_HPP

#include <functional>

#include "raylib.h"
#include <thread>
#include <vector>

namespace plastic
{
    struct ConcurrentWindow {
    private:
        std::string title;
        int width;
        int height;
        std::thread window_thread;
        std::atomic<bool> is_running;
        std::mutex render_mutex;
        std::vector<std::function<void()>> render_callbacks;

        void window_loop() {
            InitWindow(width,height,title.c_str());
            SetTargetFPS(60);

            while (!WindowShouldClose() && is_running) {
                BeginDrawing();
                ClearBackground(RAYWHITE);

                // Execute all registered render callbacks
                std::lock_guard<std::mutex> lock(render_mutex);
                for (const auto& callback:render_callbacks) {
                    callback();
                }
                EndDrawing();
            }
            CloseWindow();
        }
    public:
        ConcurrentWindow(const std::string& window_title, int window_width, int window_height)
            : title(window_title), width(window_width), height(window_height), is_running(true){}

        ~ConcurrentWindow() {
            stop();
        }

        void start() {
            window_thread = std::thread(&ConcurrentWindow::window_loop, this);
        }

        void stop() {
            if (is_running) {
                is_running = false;
                if (window_thread.joinable()) {
                    window_thread.join();
                }
            }
        }

        void add_render_callback(std::function<void()> callback) {
            std::lock_guard<std::mutex> lock(render_mutex);
            render_callbacks.push_back(callback);
        }

        bool is_running() const {
            return is_running;
        }
    };

    class ConcurrentWindowManager {
    private:
        std::vector<std::unique_ptr<ConcurrentWindow>> windows;
        std::mutex windows_mutex;

    public:
        ConcurrentWindow* create_window(const std::string& title, int width, int height) {
            std::lock_guard<std::mutex> lock(windows_mutex);
            windows.push_back(std::make_unique<ConcurrentWindow>(title, width, height));
            auto* window = windows.back().get();
            window->start();
            return window;
        }

        void close_all_windows() {
            std::lock_guard<std::mutex> lock(windows_mutex);
            for (auto& window:windows) {
                window->stop();
            }
            windows.clear();
        }

        ~ConcurrentWindowManager() {
            close_all_windows();
        }
    };
}

#endif //CONCURRENT_WINDOW_HPP
