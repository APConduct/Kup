//
// Created by Aidan Jost on 2/25/25.
//

export module plastic.font;

#include <../../../../cmake-build-debug/_deps/raylib-src/src/raylib.h>

export namespace plastic
{
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