//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <memory>
#include <unordered_map>
#include <vector>
#include <raylib.h>
#include "GLFW/glfw3.h"
export module plastic.raylib_platform;

import plastic.platform;
import plastic.app_context;
import plastic.window_context;
import plastic.events;
import plastic.point;
import plastic.size;
import plastic.rect;
import plastic.color;
import plastic.context;
import plastic.font_registry;

export namespace plastic
{
    class RaylibWindowContext : public context::WindowContext {
    private:
        int window_id_;
        bool should_close_ = false;
        std::string title_;

    public:
        explicit RaylibWindowContext(int window_id, const std::shared_ptr<context::AppContext>& app_context)
            : WindowContext(app_context), window_id_(window_id) {}

        void make_current() override {
            if (window_id_ != GetCurrentMonitor()) {
                SetWindowMonitor(window_id_);
            }

            // After making window current, reapply stored settings
            if (!title_.empty()) {
                SetWindowTitle(title_.c_str());
            }
        }

        void process_events() override {
            // Handled by RaylibPlatform
        }

        [[nodiscard]] bool should_close() const override {
            return should_close_ || WindowShouldClose();
        }

        void request_close() override {
            should_close_ = true;
        }

        void set_title(const std::string& title) override {
            title_ = title;

            make_current();

            SetWindowTitle(title_.c_str());
        }

        void set_position(const Point<float>& position) override {
            SetWindowPosition(
                static_cast<int>(position.x),
                static_cast<int>(position.y)
            );
        }

        void set_size(const Size<float>& size) override {
            SetWindowSize(
                static_cast<int>(size.width()),
                static_cast<int>(size.height())
            );
        }

        [[nodiscard]] Point<float> get_position() const override {
            Vector2 pos = GetWindowPosition();
            return Point<float>{pos.x, pos.y};
        }

        [[nodiscard]] Size<float> get_size() const override {
            return Size<float>{
                static_cast<float>(GetScreenWidth()),
                static_cast<float>(GetScreenHeight())
            };
        }

        void set_fullscreen(bool fullscreen) override {
            if (fullscreen != IsWindowFullscreen()) {
                ToggleFullscreen();
            }
        }

        void maximize() override {
            MaximizeWindow();
        }

        void minimize() override {
            MinimizeWindow();
        }

        void restore() override {
            RestoreWindow();
        }

        void set_visible(bool visible) override {
            if (visible) {
                if(IsWindowHidden()) {
                    ClearWindowState(FLAG_WINDOW_HIDDEN);
                };
            } else {
                SetWindowState(FLAG_WINDOW_HIDDEN);
            }
        }

        void set_decorations(bool decorations) override {
            // Raylib has no direct API for this, but we can try
            #if defined(PLATFORM_DESKTOP)
            if (decorations) {
                ClearWindowState(FLAG_WINDOW_UNDECORATED);
            } else {
                SetWindowState(FLAG_WINDOW_UNDECORATED);
            }
            #endif
        }

        void set_transparent(bool transparent) override {
            #if defined(PLATFORM_DESKTOP)
            // This is a best effort, as Raylib doesn't fully support this
            if (transparent) {
                SetWindowState(FLAG_WINDOW_TRANSPARENT);
            } else {
                ClearWindowState(FLAG_WINDOW_TRANSPARENT);
            }
            #endif
        }

        void begin_render() override {
            BeginDrawing();
        }

        void end_render() override {
            EndDrawing();
        }

        void clear_background(const Color& color) override {
            ClearBackground({
                static_cast<unsigned char>(color.r),
                static_cast<unsigned char>(color.g),
                static_cast<unsigned char>(color.b),
                static_cast<unsigned char>(color.a)
            });
        }

        void set_vsync(bool vsync) override {
            SetConfigFlags(FLAG_VSYNC_HINT);
        }

        void set_target_fps(int fps) override {
            SetTargetFPS(fps);
        }

        [[nodiscard]] float get_frame_time() const override {
            return GetFrameTime();
        }

        void set_icon(const std::string& icon_path) override {
            // Implement icon setting using Raylib
            if (!icon_path.empty()) {
                Image image = LoadImage(icon_path.c_str());
                SetWindowIcon(image);
                UnloadImage(image);
            }
        }

        void set_always_on_top(bool always_on_top) override {
            // Raylib implementation for always on top setting
            if (always_on_top) {
                SetWindowState(FLAG_WINDOW_TOPMOST);
            } else {
                ClearWindowState(FLAG_WINDOW_TOPMOST);
            }
        }

        void set_opacity(float opacity) override {
            // Set window opacity if supported by Raylib
            #if defined(PLATFORM_DESKTOP)
            SetWindowOpacity(opacity);
            #endif
        }
    };

    class RaylibPlatform : public Platform {
    private:
        bool running_ = false;
        std::unordered_map<int, std::shared_ptr<RaylibWindowContext>> window_contexts_;
        int next_window_id_ = 0;
        bool vsync_enabled_ = true;
        int target_fps_ = 60;
        std::vector<events::Event> pending_events_{};

    public:
        explicit RaylibPlatform(std::shared_ptr<context::AppContext> app_context)
            : Platform(std::move(app_context)) {}

        bool initialize() override {
            if (initialized_) return true;

            // Set up configuration flags
            SetConfigFlags(FLAG_MSAA_4X_HINT | FLAG_WINDOW_RESIZABLE);
            if (vsync_enabled_) {
                SetConfigFlags(FLAG_VSYNC_HINT);
            }


            InitWindow(800, 600, "Initializing...");


            // Pre-warm resources for faster first render
            FontRegistry::instance();

            // Pre-warm resources for faster first render
            warm_up_resources();

            // Initialize audio if needed
            InitAudioDevice();

            // Set target FPS
            SetTargetFPS(target_fps_);

            initialized_ = true;
            running_ = true;
            return true;
        }

        static void warm_up_resources() {
            // Pre-load default font and other resources
            GetFontDefault();

            // Force text measurement system initialization
            MeasureText("Warmup text", 16);

            // Pre-initialize other commonly used resources
            Image dummy = GenImageColor(1, 1, ::WHITE);
            Texture2D tex = LoadTextureFromImage(dummy);
            UnloadTexture(tex);
            UnloadImage(dummy);
        }


        void shutdown() override {
            if (!initialized_) return;

            // Cleanup Raylib resources
            window_contexts_.clear();
            CloseAudioDevice();
            CloseWindow();

            initialized_ = false;
            running_ = false;
        }

        void update() override {
            if (!initialized_) return;

            // Process events and convert to our event system
            process_events();

            // Check for window close events from raylib
            if (WindowShouldClose()) {
                // Emit window close event for the current window
                events::WindowCloseEvent close_event{0, GetTime()};
                event_dispatcher_.emit(close_event);
            }
        }

        [[nodiscard]] bool supports_multiple_windows() const override {
            #if defined(PLATFORM_DESKTOP)
            return true;  // Only supported on desktop with specific Raylib builds
            #else
            return false;
            #endif
        }

        [[nodiscard]] bool supports_native_decorations() const override { return true; }
        [[nodiscard]] bool supports_resizing() const override { return true; }
        [[nodiscard]] bool supports_fullscreen() const override { return true; }
        [[nodiscard]] bool supports_minimizing() const override { return true; }
        [[nodiscard]] bool supports_maximizing() const override { return true; }
        [[nodiscard]] bool supports_vsync() const override { return true; }

        std::shared_ptr<context::WindowContext> create_window_context() override {
            if (!initialized_) {
                initialize();
            }

            int window_id = next_window_id_++;

            // If this is the first window, we'll use the default window
            if (window_contexts_.empty()) {
                // Set up the default window (make it visible if it was hidden)
                if (IsWindowHidden()) {
                    ClearWindowState(FLAG_WINDOW_HIDDEN);
                }

                auto context = std::make_shared<RaylibWindowContext>(window_id, app_context_);
                window_contexts_[window_id] = context;
                return context;
            }
            else if (supports_multiple_windows()) {
                // Create a new window (not fully supported in standard Raylib)
                // This is a placeholder that would need custom Raylib implementation
                auto context = std::make_shared<RaylibWindowContext>(window_id, app_context_);
                window_contexts_[window_id] = context;
                return context;
            }
            else {
                // Fall back to reusing the first window
                return window_contexts_.begin()->second;
            }
        }

        void set_vsync(bool vsync) override {
            vsync_enabled_ = vsync;
            if (initialized_) {
                // Raylib doesn't allow changing vsync at runtime easily
                // This is a best effort
                if (vsync) {
                    SetConfigFlags(FLAG_VSYNC_HINT);
                }
            }
        }

        void set_target_fps(int fps) override {
            target_fps_ = fps;
            if (initialized_) {
                SetTargetFPS(fps);
            }
        }

        [[nodiscard]] float get_primary_display_width() const override {
            return static_cast<float>(GetScreenWidth());
        }

        [[nodiscard]] float get_primary_display_height() const override {
            return static_cast<float>(GetScreenHeight());
        }

        void dispatch_event(const events::Event& event) override {
            // Process platform-specific events if needed
            Platform::dispatch_event(event);
        }

    private:
        void process_events() {
            // Clear pending events
            this->pending_events_.clear();

            // Mouse position for event processing
            Vector2 mouse_pos = GetMousePosition();
            Point<float> mouse_point = Point{mouse_pos.x, mouse_pos.y};

            // Process mouse button events
            process_mouse_button(MOUSE_LEFT_BUTTON, events::MouseButton::MOUSE_LEFT_BUTTON, mouse_point);
            process_mouse_button(MOUSE_RIGHT_BUTTON, events::MouseButton::MOUSE_RIGHT_BUTTON, mouse_point);
            process_mouse_button(MOUSE_MIDDLE_BUTTON, events::MouseButton::MOUSE_MIDDLE_BUTTON, mouse_point);

            // Process mouse movement
            if (GetMouseDelta().x ==  Vector2{0, 0}.x && GetMouseDelta().y == Vector2{0, 0}.y) {
                Vector2 delta = GetMouseDelta();
                events::MouseMoveEvent event{
                    mouse_point,
                    Point<float>{delta.x, delta.y},
                    GetTime()
                };
                event_dispatcher_.emit(event);
                pending_events_.push_back(event);
            }

            // Process mouse wheel
            float wheel = GetMouseWheelMove();
            if (wheel != 0.0f) {
                events::MouseWheelEvent event{
                    wheel,
                    mouse_point,
                    GetTime()
                };
                event_dispatcher_.emit(event);
                pending_events_.push_back(event);
            }

            // Process keyboard events
            for (int key = KEY_SPACE; key <= KEY_KB_MENU; key++) {
                if (IsKeyPressed(key)) {
                    events::KeyPressEvent event{
                        static_cast<events::KeyboardKey>(key),
                        true,
                        false,
                        // Simplified key info, would need to be enhanced for full implementation
                        0,
                        GetTime(),
                        IsKeyDown(KEY_LEFT_SHIFT) || IsKeyDown(KEY_RIGHT_SHIFT),
                        IsKeyDown(KEY_CAPS_LOCK),
                        IsKeyDown(KEY_NUM_LOCK),
                        IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL),
                        IsKeyDown(KEY_LEFT_SUPER) || IsKeyDown(KEY_RIGHT_SUPER),
                        IsKeyDown(KEY_LEFT_ALT) || IsKeyDown(KEY_RIGHT_ALT)
                    };
                    event_dispatcher_.emit(event);
                    pending_events_.push_back(event);
                }
                else if (IsKeyReleased(key)) {
                    events::KeyPressEvent event{
                        static_cast<events::KeyboardKey>(key),
                        false,
                        false,
                        // Simplified key info
                        0,
                        GetTime(),
                        IsKeyDown(KEY_LEFT_SHIFT) || IsKeyDown(KEY_RIGHT_SHIFT),
                        IsKeyDown(KEY_CAPS_LOCK),
                        IsKeyDown(KEY_NUM_LOCK),
                        IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL),
                        IsKeyDown(KEY_LEFT_SUPER) || IsKeyDown(KEY_RIGHT_SUPER),
                        IsKeyDown(KEY_LEFT_ALT) || IsKeyDown(KEY_RIGHT_ALT)
                    };
                    event_dispatcher_.emit(event);
                    pending_events_.push_back(event);
                }
            }

            // Process text input
            int key = GetCharPressed();
            while (key > 0) {
                char text[2] = {static_cast<char>(key), '\0'};
                events::TextInputEvent event{text, GetTime()};
                event_dispatcher_.emit(event);
                pending_events_.push_back(event);

                key = GetCharPressed();  // Get the next character
            }

            // Process window events
            if (IsWindowResized()) {
                events::ResizeEvent event{
                    Size<float>{
                        static_cast<float>(GetScreenWidth()),
                        static_cast<float>(GetScreenHeight())
                    },
                    GetTime()
                };
                event_dispatcher_.emit(event);
                pending_events_.push_back(event);
            }

            if (IsWindowFocused()) {
                events::FocusEvent event{true, GetTime()};
                event_dispatcher_.emit(event);
                pending_events_.push_back(event);
            }

            if (WindowShouldClose()) {
                events::WindowCloseEvent event{0, GetTime()};  // Using 0 as the default window ID
                event_dispatcher_.emit(event);

                for (auto& [id, context] : window_contexts_) {
                    context->request_close();
                }
            }
        }

        void process_mouse_button(int raylib_button, events::MouseButton our_button, const Point<float>& position) {
            if (IsMouseButtonPressed(raylib_button)) {
                events::MouseButtonEvent event{
                    Size<float>{position.x, position.y},
                    our_button,
                    true,
                    IsKeyDown(KEY_LEFT_SHIFT) || IsKeyDown(KEY_RIGHT_SHIFT),
                    IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL),
                    IsKeyDown(KEY_LEFT_ALT) || IsKeyDown(KEY_RIGHT_ALT),
                    GetTime()
                };
                this->event_dispatcher_.emit(event);
                pending_events_.push_back(event);
            }
            else if (IsMouseButtonReleased(raylib_button)) {
                events::MouseButtonEvent event{
                    Size<float>{position.x, position.y},
                    our_button,
                    false,
                    IsKeyDown(KEY_LEFT_SHIFT) || IsKeyDown(KEY_RIGHT_SHIFT),
                    IsKeyDown(KEY_LEFT_CONTROL) || IsKeyDown(KEY_RIGHT_CONTROL),
                    IsKeyDown(KEY_LEFT_ALT) || IsKeyDown(KEY_RIGHT_ALT),
                    GetTime()
                };
                event_dispatcher_.emit(event);
                pending_events_.push_back(event);
            }
        }


    };
}