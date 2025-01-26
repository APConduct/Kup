//
// Created by ajost1 on 1/26/2025.
//
#pragma once

export module hyro.font;

#include <raylib.h>

export namespace hyro::font {
    struct Font {
        int baseSize;           // Base size (default chars height)
        int glyphCount;         // Number of glyph characters
        int glyphPadding;       // Padding around the glyph characters
        Texture2D texture;      // Texture atlas containing the glyphs
        Rectangle *recs;        // Rectangles in texture for the glyphs
        GlyphInfo *glyphs;

        [[nodiscard]] ::Font to_rl() const {
            return ::Font{baseSize, glyphCount, glyphPadding, texture, recs, glyphs};
        }
    };





}


