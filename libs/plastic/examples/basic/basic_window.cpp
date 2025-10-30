import plastic;


int main() {
    return plastic::ui::run("Hello Plastic", [](plastic::Context*) { return plastic::ui::text("Hello, Plastic!"); });
}
