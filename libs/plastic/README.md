# The GUI library for me and you
Plastic UI is a modern, flexible C++ UI library designed for creating rich and interactive user interfaces. Inspired by GPUI.rs, Raylib/Raygui, Neovim, and JavaFX, it offers a clean and intuitive API for building GUIs in C++ applications, with a particular focus on text editors and IDE-like applications.

## Features

- **Component-based architecture**: Build UIs using reusable, composable components
- **Flexible layouts**: FlexBox, Grid, and Stack layouts for responsive design
- **Reactive state management**: Create dynamic UIs that respond to state changes
- **Rich text rendering**: Format and style text with rich formatting options
- **Animation system**: Smooth transitions and effects with easing functions
- **Styling and theming**: Consistent styling with theme support
- **Event system**: Comprehensive event handling for user interactions
- **Custom components**: Easily extend with your own components
- **Cross-platform**: Works on Windows, macOS, and Linux

## Installation

### Requirements

- C++20 compatible compiler
- CMake 3.14 or higher
- Raylib (for rendering backend)

### Building from Source

```bash
# Clone the repository
git clone https://github.com/yourusername/plastic.git
cd plastic

# Create build directory
mkdir build && cd build

# Configure and build
cmake ..
make

# Install (optional)
make install
```

## Usage

### Basic Example

Creating a simple window with text:

```cpp
#include <plastic/plastic.h>
using namespace plastic;

int main() {
    return ui::run("Hello Plastic", [](Context* ctx) {
        return ui::text("Hello, Plastic!");
    });
}
```

### More Complex Example

Creating an interactive counter:

```cpp
#include <plastic/plastic.h>
using namespace plastic;

int main() {
    // Create a state for counter value
    auto count = state<int>(0);
    
    return ui::run("Counter Example", [&](Context* ctx) {
        return ui::v_stack(10,
            ui::text("Counter: " + std::to_string(count.get()), 24),
            
            ui::h_stack(10,
                ui::button("Increment", [&]{ count.set(count.get() + 1); }),
                ui::button("Decrement", [&]{ count.set(count.get() - 1); }),
                ui::button("Reset", [&]{ count.set(0); })
            )
        );
    });
}
```

## Core Concepts

### Elements

Elements are the basic building blocks of a UI. They represent visual components that can be rendered on screen.

```cpp
// Creating basic elements
auto text_element = ui::text("Hello, world", 16, ui::colors::primary);
auto button_element = ui::button("Click me", []{ std::cout << "Clicked!"; });
auto input_element = ui::textfield("Enter text", "Initial value");
```

### Layouts

Layouts determine how elements are arranged on the screen.

```cpp
// Vertical stack with 10px spacing between elements
auto v_stack = ui::v_stack(10,
    ui::text("Item 1"),
    ui::text("Item 2"),
    ui::text("Item 3")
);

// Horizontal stack
auto h_stack = ui::h_stack(10,
    ui::button("Left"),
    ui::spacer(), // Flexible spacer pushes next element to the right
    ui::button("Right")
);

// FlexBox for more complex layouts
auto flex_container = std::make_shared<FlexBox>();
flex_container
    ->with_direction(FlexDirection::Row)
    ->with_justify_content(FlexAlign::SpaceBetween)
    ->with_align_items(FlexAlign::Center);
flex_container->add_child(ui::text("Item 1"));
flex_container->add_child(ui::text("Item 2"));
```

### State Management

Plastic UI provides reactive state management to create dynamic UIs.

```cpp
// Create a state
auto name = state<std::string>("Guest");

// Use the state in UI elements
ui::text("Hello, " + name.get());

// Update the state
name.set("John");

// Listen for changes
name.listen([](const std::string& new_name) {
    std::cout << "Name changed to: " << new_name << std::endl;
});

// Create derived state
auto greeting = derived(name, [](const std::string& name) {
    return "Welcome, " + name + "!";
});
```

### Styling

Apply consistent styling to elements:

```cpp
// Create a style
auto button_style = style::Style()
    .bg(ui::colors::primary)
    .with_text_color_normal(ui::colors::white)
    .with_corner_radius(4.0f);

// Apply style to an element
ui::with_style(ui::button("Styled Button", []{}), button_style);

// Theme support
auto theme = Theme::dark_theme();
ThemeManager::set_theme(theme);
```

### Animation

Create smooth animations:

```cpp
// Simple animation
Animation<float> position_anim(
    100.0f, 300.0f, 1.0f,
    [](const float& val) { /* update something */ },
    Animator::ease_in_out_cubic
);
position_anim.start();

// Spring physics animation
SpringAnimation<float> spring(
    initial_position, target_position,
    [](float val) { /* update something */ }
);
spring.configure(100.0f, 10.0f, 1.0f);
```

## Advanced Features

### Custom Components

Create your own reusable components:

```cpp
class CustomButton : public Element {
private:
    std::string label_;
    std::function<void()> on_click_;

public:
    CustomButton(std::string label, std::function<void()> on_click)
        : label_(std::move(label)), on_click_(std::move(on_click)) {}

    void paint(Context* cx) const override {
        // Custom rendering
    }

    void layout(Context* cx) override {
        // Layout logic
    }

    bool process_event(const events::Event& event, Context* cx) override {
        // Event handling
        return false;
    }
};
```

### Rich Text

Format text with styles and decorations:

```cpp
// Create a text style
TextStyle style;
style.with_font_size(16)
    .with_color(ui::colors::text)
    .with_decoration(TextDecoration::Underline);

// Parse rich text markup
auto rich_text = RichTextParser::parse(
    "Regular text [b]bold text[/b] [color=red]colored text[/color]",
    TextStyle().with_font_size(16).with_color(Color::white())
);
```

### Window Management

Create and manage multiple windows:

```cpp
auto app = App("Multi-window App");

if (!app.init()) {
    return 1;
}

// Create windows with specific views
auto main_window = app.create_window<MainView>();
auto inspector_window = app.open_window<InspectorView>(
    WindowOptions().with_title("Inspector").with_size(Size<float>{400, 600})
);

app.run();
```