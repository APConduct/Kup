# Plastic Core Documentation :cookie:

## Overview

#### The Plastic Core module provides fundamental building blocks for the Plastic GUI library. It includes essential types, interfaces, and utilities needed for creating user interfaces.
#### Modules in the core directory should be as generic as possible and try to not depend on types in other modules, and if not, they should mingle in an inner directory, but using using interfaces is more understandable. :wood:
#### There are different types of core modules: types, utilities, dependency wrapping, interfaces, and other modules that are not specific to a particular module. :cookie:

## Core Components

### Interfaces

#### Command Interface
The command interface implements the Command pattern for undo/redo functionality.

```cpp
struct Command {
    virtual void execute() = 0;
    virtual void undo() = 0;
    virtual std::string name() const = 0;
};
```

#### Component Interface
The base class for UI components with lifecycle hooks.

```cpp
struct Component {
    virtual void on_mount();
    virtual void on_unmount();
    virtual void on_update();
    virtual void on_props_changed();
    
    template<typename T>
    State<T> use_state(T initial);
};
```

#### Context Interface
Manages the application context and event dispatching.

```cpp
struct Context {
    virtual void request_layout() = 0;
    virtual void request_paint() = 0;
    virtual void dispatch_event(const events::Event& event) = 0;
};
```

### Types

#### Color
Represents RGBA colors with various utility functions.

```cpp
struct Color {
    unsigned char r, g, b, a;
    
    static Color rgb(unsigned char r, unsigned char g, unsigned char b);
    static Color rgba(unsigned char r, unsigned char g, unsigned char b, unsigned char a);
};
```

#### Geometry Types

##### Point
Represents a 2D point in space.

```cpp
template <typename T>
struct Point {
    T x, y;
};
```

##### Rect
Represents a rectangle with position and size.

```cpp
template <typename T>
struct Rect {
    T x_, y_, width_, height_;
};
```

##### Size
Represents dimensions in 2D space.

```cpp
template <typename T>
struct Size {
    T width_, height_;
};
```

### Utilities

#### ObjectPool
Generic object pooling for efficient memory management.

```cpp
template <typename T>
class ObjectPool {
    std::shared_ptr<T> acquire();
    void release(T* obj);
};
```

#### RefCount
Reference counting implementation for memory management.

```cpp
struct RefCount {
    void increment_strong();
    void decrement_strong();
    void increment_weak();
    void decrement_weak();
};
```

## Dependencies

- RayLib: Used for rendering and window management
- C++20: Required for modules and modern C++ features

## Usage Examples

### Creating a Basic Component

```cpp
struct MyComponent : public plastic::Component {
    void on_mount() override {
        // Initialize component
    }
    
    void on_update() override {
        // Update logic
    }
};
```

### Using the Command Pattern

```cpp
struct MyCommand : public plastic::Command {
    void execute() override {
        // Execute action
    }
    
    void undo() override {
        // Undo action
    }
    
    std::string name() const override {
        return "MyCommand";
    }
};
```

## Best Practices

1. Always inherit from appropriate interfaces
2. Use RAII principles with reference counting
3. Implement proper cleanup in component lifecycle methods
4. Use type-safe geometry types instead of raw numbers
5. Leverage the object pool for frequently created/destroyed objects

## Architecture Guidelines

- Keep core modules independent of each other
- Use interfaces for cross-module communication
- Maintain type safety through templates
- Prefer composition over inheritance
