//
// Created by ajost1 on 1/29/2025.
//

module;

#include <raylib.h>

#if defined(__APPLE__)
#include <__algorithm/clamp.h>
#else
#include <bits/algorithmfwd.h>
#endif




export module plastic.color;

export  namespace plastic {
    struct Color {
        unsigned char r;        // Color red value
        unsigned char g;        // Color green value
        unsigned char b;        // Color blue value
        unsigned char a;        // Color alpha value

        Color() : r(0), g(0), b(0), a(255) {};
        Color(
            const unsigned char r,
            const unsigned char g,
            const unsigned char b,
            const unsigned char a
            )
            : r(r), g(g), b(b), a(a) {}

        Color(
            const unsigned char r,
            const unsigned char g,
            const unsigned char b
            )
            : r(r), g(g), b(b), a(255) {}

        [[nodiscard]] ::Color rl() const {
            return {r, g, b, a};
        };



        static Color from_rl(const ::Color& color) {
            return {color.r, color.g, color.b, color.a};
        }

        static Color rgb(const unsigned char r, const unsigned char g, const unsigned char b) {
            return {r, g, b};
        }

        static Color rgba(const unsigned char r, const unsigned char g, const unsigned char b, const unsigned char a) {
            return {r, g, b, a};
        }

        static Color rgb(const int hex) {
            return {static_cast<unsigned char>((hex >> 16) & 0xFF),
                    static_cast<unsigned char>((hex >> 8) & 0xFF),
                    static_cast<unsigned char>(hex & 0xFF)};
        }

        static Color rgba(const int hex) {
            return {static_cast<unsigned char>((hex >> 24) & 0xFF),
                    static_cast<unsigned char>((hex >> 16) & 0xFF),
                    static_cast<unsigned char>((hex >> 8) & 0xFF),
                    static_cast<unsigned char>(hex & 0xFF)};
        }
        static Color white() { return {255, 255, 255}; }
        static Color gray() { return {128, 128, 128}; }
        static Color light_gray() { return {200, 200, 200}; }
        static Color dark_gray() { return {80, 80, 80}; }

        static Color black() { return {0, 0, 0}; }
        static Color red() { return {255, 0, 0}; }
        static Color green() { return {0, 255, 0}; }
        static Color blue() { return {0, 0, 255}; }
        static Color yellow() { return {255, 255, 0}; }
        static Color magenta() { return {255, 0, 255}; }
        static Color cyan() { return {0, 255, 255}; }
        static Color transparent() { return {0, 0, 0, 0}; }
        explicit operator ::Color() const {
            return {r, g, b, a};
        }

        Color& alpha(const unsigned char a) {
            this->a = a;
            return *this;
        }
        Color& red(const unsigned char r) {
            this->r = r;
            return *this;
        }
        Color& green(const unsigned char g) {
            this->g = g;
            return *this;
        }
        Color& blue(const unsigned char b) {
            this->b = b;
            return *this;
        }
        bool operator==(const Color& other) const {
            return r == other.r && g == other.g && b == other.b && a == other.a;
        }
        bool operator!=(const Color& other) const {
            return !(*this == other);
        }
        [[nodiscard]] Color opposite() const {
            return {static_cast<unsigned char>(255 - r),
                    static_cast<unsigned char>(255 - g),
                    static_cast<unsigned char>(255 - b),
                    a};
        }
        Color negate() {
            r = 255 - r;
            g = 255 - g;
            b = 255 - b;
            return *this;
        }
        Color& operator+=(const Color& other) {
            r = std::clamp(r + other.r, 0, 255);
            g = std::clamp(g + other.g, 0, 255);
            b = std::clamp(b + other.b, 0, 255);
            a = std::clamp(a + other.a, 0, 255);
            return *this;
        }
        Color& operator-=(const Color& other) {
            r = std::clamp(r - other.r, 0, 255);
            g = std::clamp(g - other.g, 0, 255);
            b = std::clamp(b - other.b, 0, 255);
            a = std::clamp(a - other.a, 0, 255);
            return *this;
        }
        Color& operator*=(const Color& other) {
            r = std::clamp(r * other.r, 0, 255);
            g = std::clamp(g * other.g, 0, 255);
            b = std::clamp(b * other.b, 0, 255);
            a = std::clamp(a * other.a, 0, 255);
            return *this;
        }
        Color& operator/=(const Color& other) {
            r = std::clamp(r / other.r, 0, 255);
            g = std::clamp(g / other.g, 0, 255);
            b = std::clamp(b / other.b, 0, 255);
            a = std::clamp(a / other.a, 0, 255);
            return *this;
        }

        [[nodiscard]] Color between(const Color& other, const float amount = 1) const {
            return {
                static_cast<unsigned char>(static_cast<float>(r + (other.r - r)) * amount),
                static_cast<unsigned char>(static_cast<float>(g + (other.g - g)) * amount),
                static_cast<unsigned char>(static_cast<float>(b + (other.b - b)) * amount),
                static_cast<unsigned char>(static_cast<float>(a + (other.a - a)) * amount)
            };
        }
    };




}
