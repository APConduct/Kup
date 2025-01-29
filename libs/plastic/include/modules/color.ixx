//
// Created by ajost1 on 1/29/2025.
//

module;

#include <raylib.h>

export module plastic.color;

export  namespace plastic {struct Color {
    unsigned char r;        // Color red value
    unsigned char g;        // Color green value
    unsigned char b;        // Color blue value
    unsigned char a;        // Color alpha value

    Color();
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
};}
