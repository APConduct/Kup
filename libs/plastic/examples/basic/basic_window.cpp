//
// Created by Aidan Jost on 3/8/25.
//
import plastic;


int main() {
    return plastic::ui::run("Hello Plastic", [](plastic::Context*) {
        return plastic::ui::text("Hello, Plastic!");
    });
}