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

struct text_view : View<std::string> {
    Font font;
    float fontSize;
    float fontScale;
    float spacing;
    std::string text;
    Color color;
    ~text_view() override;


    void render() override {
        DrawTextEx(font,text.c_str(), this->origin,fontSize,spacing,this->color);
    };
};

template <typename T>
struct quantum_view : View<T> {

    Color color;

    void render() override {
        enum struct types {
            pixel,
            line,
            rect,
            rectline,
            circ,
            circline,
            text,
            ray,
            image,
            texture,
            icon
        };
    }
};

#endif
