//
// Created by ajost1 on 10/24/2024.
//

#ifndef KFONT_H
#define KFONT_H

#include <raylib.h>
#include <vector>

typedef Font rl_font;



inline bool operator==(const rl_font& lhs, const rl_font& rhs){
    return (
        lhs.glyphs == rhs.glyphs &&
        lhs.recs == rhs.recs &&
        lhs.baseSize == rhs.baseSize &&
        lhs.glyphCount == rhs.glyphCount &&
        lhs.glyphPadding == rhs.glyphPadding &&
        lhs.texture.format == rhs.texture.format &&
        lhs.texture.width == rhs.texture.width &&
        lhs.texture.height == rhs.texture.height &&
        lhs.texture.id == rhs.texture.id &&
        lhs.texture.mipmaps == rhs.texture.mipmaps);
};

inline bool operator!=(const rl_font& lhs, const rl_font& rhs) {
    return !(lhs == rhs);
}

struct rl_glyph {
    int x;
    int y;
    int width;
    int height;
    int id;
};

struct rl_texture {
    int width;
    int height;
    int id;
};

struct FontSet {
    std::vector<rl_font> fonts;
};

#endif //KFONT_H
