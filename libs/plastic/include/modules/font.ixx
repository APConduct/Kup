//
// Created by Aidan Jost on 2/25/25.
//
module;
#include <memory>
#include <raylib.h>
export module plastic.font;



export namespace plastic
{
    struct Font : std::enable_shared_from_this<Font> {
        int baseSize;           // Base size (default chars height)
        int glyphCount;         // Number of glyph characters
        int glyphPadding;       // Padding around the glyph characters
        Texture2D texture;      // Texture atlas containing the glyphs
        Rectangle *recs;        // Rectangles in texture for the glyphs
        GlyphInfo *glyphs;

        [[nodiscard]] ::Font rl() const {
            return ::Font{baseSize, glyphCount, glyphPadding, texture, recs, glyphs};
        }
    };
}