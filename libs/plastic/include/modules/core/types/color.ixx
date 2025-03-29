//
// Created by ajost1 on 1/29/2025.
//

module;

#include <raylib.h>
#include <algorithm>




export module plastic.color;

export  namespace plastic {

    /// @brief Color type. Represents a color in RGBA format.
    struct Color {
        unsigned char r;        // Color red value
        unsigned char g;        // Color green value
        unsigned char b;        // Color blue value
        unsigned char a;        // Color alpha value

        /// @brief Default constructor
        Color() : r(0), g(0), b(0), a(255) {};

        /// @brief Constructor with parameters
        /// @param r The red value
        /// @param g The green value
        /// @param b The blue value
        Color(
            const unsigned char r,
            const unsigned char g,
            const unsigned char b,
            const unsigned char a
            )
            : r(r), g(g), b(b), a(a) {}

        /// @brief Constructor without alpha
        /// @param r The red value
        /// @param g The green value
        /// @param b The blue value
        Color(
            const unsigned char r,
            const unsigned char g,
            const unsigned char b
            )
            : r(r), g(g), b(b), a(255) {}

        /// @brief helper function to convert to raylib Color
        [[nodiscard]] ::Color rl() const {
            return {r, g, b, a};
        };

        /// @brief helper function to convert from raylib Color
        /// @param color The raylib Color to convert
        /// @return The converted Color
        static Color from_rl(const ::Color& color) {
            return {color.r, color.g, color.b, color.a};
        }

        /// @brief specifys a color with red, green, blue and alpha values
        /// @param r The red value
        /// @param g The green value
        /// @param b The blue value
        /// @return The color
        static Color rgb(const unsigned char r, const unsigned char g, const unsigned char b) {
            return {r, g, b};
        }

        /// @brief specify a color as a hexidecimal value
        static Color rgb(const int hex) {
            return {static_cast<unsigned char>((hex >> 16) & 0xFF),
                    static_cast<unsigned char>((hex >> 8) & 0xFF),
                    static_cast<unsigned char>(hex & 0xFF)};
        }

        /// @brief specify a color as a hexidecimal value with alpha
        /// @param hex The hexidecimal value
        /// @return The color
        static Color rgba(const int hex) {
            return {static_cast<unsigned char>((hex >> 24) & 0xFF),
                    static_cast<unsigned char>((hex >> 16) & 0xFF),
                    static_cast<unsigned char>((hex >> 8) & 0xFF),
                    static_cast<unsigned char>(hex & 0xFF)};
        }

        static Color rgba(const unsigned char r,
                          const unsigned char g,
                          const unsigned char b,
                          const unsigned char a) {
            return {r, g, b, a};
        }

        /// @brief White color
        static Color white() { return {255, 255, 255}; }

        /// @brief the color gray
        static Color gray() { return {128, 128, 128}; }

        /// @brief the color light gray
        static Color light_gray() { return {200, 200, 200}; }

        /// @brief the color dark gray
        static Color dark_gray() { return {80, 80, 80}; }

        /// @brief the color black
        static Color black() { return {0, 0, 0}; }

        /// @brief the color red
        static Color red() { return {255, 0, 0}; }

        /// @brief the color green
        static Color green() { return {0, 255, 0}; }

        /// @brief the color blue
        static Color blue() { return {0, 0, 255}; }

        /// @brief the color yellow
        static Color yellow() { return {255, 255, 0}; }

        /// @brief the color magenta
        static Color magenta() { return {255, 0, 255}; }

        /// @brief the color cyan
        static Color cyan() { return {0, 255, 255}; }

        /// @brief transparency value
        static Color transparent() { return {0, 0, 0, 0}; }

        /// @brief helper function to convert to raylib Color
        explicit operator ::Color() const {
            return {r, g, b, a};
        }


        Color& alpha(const unsigned char a) {
            this->a = a;
            return *this;
        }

        /// @brief Chainable setters for specifying red value
        /// @param r The red value
        /// @return The color
        Color& red(const unsigned char r) {
            this->r = r;
            return *this;
        }

        /// @brief Chainable setters for specifying green value
        /// @param g The green value
        /// @return The color
        Color& green(const unsigned char g) {
            this->g = g;
            return *this;
        }

        /// @brief Chainable setters for specifying blue value
        /// @param b The blue value
        /// @return The color
        Color& blue(const unsigned char b) {
            this->b = b;
            return *this;
        }

        /// @brief I think you can guess what this does
        bool operator==(const Color& other) const {
            return r == other.r && g == other.g && b == other.b && a == other.a;
        }

        /// @brief does the opposite of what i think you can guess
        bool operator!=(const Color& other) const {
            return !(*this == other);
        }

        /// @brief Get the opposite color
        /// @return The opposite color
        [[nodiscard]] Color opposite() const {
            return {static_cast<unsigned char>(255 - r),
                    static_cast<unsigned char>(255 - g),
                    static_cast<unsigned char>(255 - b),
                    a};
        }

        /// @brief Negate the color
        /// @return The negated color
        Color negate() {
            r = 255 - r;
            g = 255 - g;
            b = 255 - b;
            return *this;
        }

        /// @brief Add two colors together
        /// @param other The other color
        /// @return The added color
        Color& operator+=(const Color& other) {
            r = std::clamp(r + other.r, 0, 255);
            g = std::clamp(g + other.g, 0, 255);
            b = std::clamp(b + other.b, 0, 255);
            a = std::clamp(a + other.a, 0, 255);
            return *this;
        }

        /// @brief Subtract two colors
        /// @param other The other color
        /// @return The subtracted color
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

        /// @brief Divide the color by another color
        /// @param other The other color
        /// @return The divided color
        Color& operator/=(const Color& other) {
            r = std::clamp(r / other.r, 0, 255);
            g = std::clamp(g / other.g, 0, 255);
            b = std::clamp(b / other.b, 0, 255);
            a = std::clamp(a / other.a, 0, 255);
            return *this;
        }

        /// @brief Interpolates between two colors
        /// @param other The other color
        /// @param amount The amount to interpolate (0.0 to 1.0)
        /// @return The interpolated color
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
