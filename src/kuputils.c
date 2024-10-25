#include "kuputils.h"
#include "kup.h"

inline float int_to_float(const int number)
{
    return static_cast<float>(number);
}

inline int float_to_int(const float number)
{
    return static_cast<int>(number);
}

inline Vector2 rect_pos(const Rectangle rect)
{
    return Vector2(rect.x, rect.y);
}

Vector2 rect_size(const Rectangle rect)
{
    return Vector2(rect.width, rect.height);
}


