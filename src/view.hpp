#ifndef VIEW_H
#define VIEW_H

#include <raylib.h>
#include <string>

template <typename T>
class View{
    public:
    virtual ~View() = default;
    virtual void render() = 0;
    virtual void update(float delta_ime) = 0;

    Vector2 origin{};
    Vector2 size{};

    [[nodiscard]] Rectangle get_bounds() const {
        return Rectangle{ origin.x, origin.y, size.x, size.y };
    };
};

#endif
