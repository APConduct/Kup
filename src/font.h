//
// Created by ajost1 on 10/24/2024.
//

#ifndef KFONT_H
#define KFONT_H

inline bool operator==(const Font& lhs, const Font& rhs){
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



#endif //KFONT_H
