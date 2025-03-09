//
// Created by Aidan Jost on 3/8/25.
//
import plastic;

using namespace plastic;

int main() {
    return ui::run("Hello Plastic", [](Context* ctx) {
        return ui::text("Hello, Plastic!");
    });
}