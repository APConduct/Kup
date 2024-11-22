#ifndef VIEW_H
#define VIEW_H

enum view_quanta {
    Pixel,
    Line,
    Rectangle,
    RectangleLines,
    Circle,
    CircleLines,
    Text,
    Ray
};

struct View{
    virtual ~View() = default;
    virtual void render();
};

#endif
