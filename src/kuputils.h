//
// Created by ajost1 on 10/24/2024.
//

#ifndef KUP_UTILS_H
#define KUP_UTILS_H

#include <raylib.h>
#include <vector>

float int_to_float(int number);
int float_to_int(float number);

// returns pos and size as a
inline std::vector<Vector2> rect_to_vec(const Rectangle rect)
{
    return {Vector2(rect.x,rect.y), Vector2(rect.width, rect.height)};
};

inline std::tuple<const Vector2*, const Vector2*> rect_to_vec_tuple(const Rectangle rect)
{
    const auto vectors = {Vector2(rect.x,rect.y), Vector2(rect.width, rect.height)};
    return std::make_tuple(vectors.begin(), vectors.end());
};
Vector2 rect_pos( Rectangle rect);
Vector2 rect_size( Rectangle rect);
#endif //KUP_UTILS_H
