//
// Created by ajost1 on 1/13/2025.
//

#ifndef PLASTIC_HPP
#define PLASTIC_HPP

#include "config.hpp"
#include "../events/event_system.hpp"
#include "rect.hpp"
#include "point.hpp"
#include "context.hpp"
#include "element.hpp"


namespace plastic
{
    // Forward declarations
    struct Style;
    struct Context;
    struct Element;
    struct Component;
    struct Platform;

    struct Container;
    struct Layout;
    struct Text;
    struct App;
    template <typename T> struct Model;
    template <typename T> struct View;
    struct AnyModel;
    struct WindowModel;
    struct WindowView;
    struct AnyView;


    struct AppContext;
    template <typename T> struct ModelContext;
    template <typename T> struct ViewContext;
    struct WindowContext;
    struct Button;
    struct ButtonView;
    struct ButtonModel;

    struct Window;

    struct AnyElement;





}

#endif //PLASTIC_HPP
