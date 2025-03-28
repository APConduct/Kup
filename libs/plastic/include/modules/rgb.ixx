//
// Created by Aidan Jost on 3/28/25.
//
module;
#include <cstdint>
export module plastic.rgb;
import plastic.color;
import plastic.size;

export namespace plastic
{
    // Helper functions to match GPUI.rs style
    Color rgb(uint32_t hex) {
        uint8_t r = (hex >> 16) & 0xFF;
        uint8_t g = (hex >> 8) & 0xFF;
        uint8_t b = hex & 0xFF;
        return Color::rgb(r, g, b);
    }

    Color rgba(uint32_t hex, float alpha) {
        uint8_t r = (hex >> 16) & 0xFF;
        uint8_t g = (hex >> 8) & 0xFF;
        uint8_t b = hex & 0xFF;
        return Color::rgba(r, g, b, static_cast<uint8_t>(alpha * 255));
    }

    inline float px(float value) {
        return value;
    }

    inline Size<float> size(float width, float height) {
        return Size<float>{width, height};
    }

    namespace Colors {
        Color red() { return Color::rgb(0xff, 0, 0); }
        Color green() { return Color::rgb(0, 0xff, 0); }
        Color blue() { return Color::rgb(0, 0, 0xff); }
        Color yellow() { return Color::rgb(0xff, 0xff, 0); }
        Color black() { return Color::rgb(0, 0, 0); }
        Color white() { return Color::rgb(0xff, 0xff, 0xff); }
        Color gray() { return Color::rgb(0x80, 0x80, 0x80); }
        Color transparent() { return Color::transparent(); }
    }
}
