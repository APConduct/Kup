//
// Created by Aidan Jost on 3/8/25.
//

module;
#include <functional>
export module plastic.graphics;

import plastic.color;
import plastic.rect;
import plastic.point;
import plastic.size;
import plastic.font;



export namespace plastic::graphics
{
    // Abstract drawing functions
    void draw_rectangle(const Rect<float>& rect, const Color& color);
    void draw_rectangle_outline(const Rect<float>& rect, float thickness, const Color& color);
    void draw_rounded_rectangle(const Rect<float>& rect, float radius, const Color& color);
    void draw_rounded_rectangle_outline(const Rect<float>& rect, float radius, float thickness, const Color& color);
    void draw_text(const std::string& text, const Point<float>& position, float font_size, const Color& color);
    void draw_text_ex(const std::string& text, const Point<float>& position, const Font& font, float font_size, float spacing, const Color& color);
    void draw_line(const Point<float>& start, const Point<float>& end, float thickness, const Color& color);
    void draw_circle(const Point<float>& center, float radius, const Color& color);
    void draw_circle_outline(const Point<float>& center, float radius, float thickness, const Color& color);

    // Texture loading and drawing
    struct Texture {
        void* handle{};
        Size<float> size;
    };

    Texture load_texture(const std::string& path);
    void unload_texture(const Texture& texture);
    void draw_texture(const Texture& texture, const Point<float>& position, const Color& tint = Color::white());
    void draw_texture_ex(const Texture& texture, const Rect<float>& source, const Rect<float>& dest, const Point<float>& origin, float rotation, const Color& tint = Color::white());

    // Clipping region
    void begin_scissor_mode(const Rect<float>& rect);
    void end_scissor_mode();

    // Higher-level drawing primitives
    void draw_panel(const Rect<float>& bounds, const Color& background, float corner_radius = 0, float border_width = 0, const Color& border_color = Color::transparent());

    // Font handling
    Font load_font(const std::string& path);
    Font default_font();
    Size<float> measure_text(const std::string& text, float font_size);
    Size<float> measure_text_ex(const std::string& text, const Font& font, float font_size, float spacing);

    // Simple rendering queue for optimizations
    class RenderQueue {
    public:
        void push_rectangle(const Rect<float>& rect, const Color& color);
        void push_text(const std::string& text, const Point<float>& position, float font_size, const Color& color);
        void push_texture(const Texture& texture, const Rect<float>& dest, const Color& tint = Color::white());
        void flush();
    };
}

