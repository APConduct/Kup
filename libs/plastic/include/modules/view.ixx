//
// Created by ajost1 on 1/29/2025.
//

export module plastic.view;

import plastic.element;
import plastic.model;
import plastic.context;

export namespace plastic
{
    template <typename T>
    struct View : Element {
    protected:
        Model<T>& model;
    public:
        explicit View(Model<T>& model) : model(model) {}
        virtual void render(Context* cx) = 0;
    };
}
