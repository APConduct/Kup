//
// Created by ajost1 on 9/15/2024.
//

#ifndef BUTTON_HPP
#define BUTTON_HPP

#include <raylib.h>
#include <string>
#include "raygui.h"

class Button {

    public:

    Button(const int x, const int y, const int width, const int height)
    {
        this->pos = Vector2(static_cast<float>(x), static_cast<float>(y));
        this->size = Vector2(static_cast<float>(width), static_cast<float>(height));
        this->text = "";
    };
    Button(const int x, const int y, const int width, const int height, const std::string& text)
    {
        this->pos = Vector2(static_cast<float>(x), static_cast<float>(y));
        this->size = Vector2(static_cast<float>(width), static_cast<float>(height));
        this->text = text.c_str();
    };

    Button(const int x, const int y, const int width, const int height, const char *text)
    {
        this->pos = Vector2(static_cast<float>(x), static_cast<float>(y));
        this->size = Vector2(static_cast<float>(width), static_cast<float>(height));
        this->text = text;
    };
    Button(const float x, const float y, const float width, const float height, const char *text)
    {
        this->pos = Vector2((x), (y));
        this->size = Vector2((width), (height));
        this->text = text;
    };
    Button(const float x, const float y, const float width, const float height)
    {
        this->pos = Vector2((x), (y));
        this->size = Vector2((width), (height));
        this->text = "";
    };
    void SetText(const std::string& text)
    {
        this->text = text.c_str();
    };
    void SetText(const char* text)
    {
        this->text = text;
    };
    [[nodiscard]] const char* GetText() const
    {
        return this->text;
    };
    [[nodiscard]] std::string GetTextAsString() const
    {
        return this->text;
    };
    [[nodiscard]] Vector2 GetPos() const
    {
        return this->pos;
    };
    [[nodiscard]] Vector2 GetSize() const
    {
        return this->size;
    };

    void SetPos(const int x, const int y)
    {
        this->pos = Vector2(static_cast<float>(x), static_cast<float>(y));
    };

    void SetPos(const float x, const float y)
    {
        this->pos = Vector2((x), (y));
    };

    void SetSize(const int width, int height)
    {
        this->size = Vector2(static_cast<float>(width), static_cast<float>(height));
    };

    void SetSize(const float width, const float height)
    {
        this->size = Vector2(width, height);
    };

    [[nodiscard]] bool isPressed() const
    {
        if (const int result = GuiButton(Rectangle{
            this->pos.x, this->pos.y,this->size.x,
            this->size.y},this->text);result == 0)
            return false;
        return true;
    };

protected:
    Vector2 pos{};
    Vector2 size{};
    const char * text;


};



#endif //BUTTON_HPP
