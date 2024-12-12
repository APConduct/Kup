#ifndef VIEW_H
#define VIEW_H

#include <raylib.h>
#include <memory>



class View{
    public:
    virtual ~View() = default;
    virtual void render() = 0;
    virtual void update() = 0;

    Vector2 origin{};
};

std::unique_ptr<View> createView();
std::unique_ptr<View> createView(Vector2 origin);

struct text_view : View {
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




struct quantum_view : View {

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
