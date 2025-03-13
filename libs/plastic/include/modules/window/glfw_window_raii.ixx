//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <GLFW/glfw3.h>
export module plastic.glfw_window_raii;

export namespace plastic::window
{
    class GLFWWindowRAII {
    private:
        GLFWwindow* window_;

    public:
        explicit GLFWWindowRAII(GLFWwindow* window) : window_(window) {}
        ~GLFWWindowRAII() {
            if (window_) {
                glfwDestroyWindow(window_);
            }
        }

        GLFWwindow* get() const { return window_; }

        // Prevent copying
        GLFWWindowRAII(const GLFWWindowRAII&) = delete;
        GLFWWindowRAII& operator=(const GLFWWindowRAII&) = delete;

        // Allow moving
        GLFWWindowRAII(GLFWWindowRAII&& other) noexcept : window_(other.window_) {
            other.window_ = nullptr;
        }

        GLFWWindowRAII& operator=(GLFWWindowRAII&& other) noexcept {
            if (this != &other) {
                if (window_) {
                    glfwDestroyWindow(window_);
                }
                window_ = other.window_;
                other.window_ = nullptr;
            }
            return *this;
        }
    };
}