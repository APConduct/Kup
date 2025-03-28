//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <memory>
#include <vector>
#include <algorithm>
#include <variant>
#include <raylib.h>
export module render_batch;

import plastic.rect;

export namespace plastic
{
    class RenderBatch {
    private:
        struct DrawCommand {
            enum Type { Rectangle, Text, Line, Image };
            Type type;
            std::variant<
                std::tuple<Rect<float>, Color>, // Rectangle
                std::tuple<std::string, Vector2, float, float, Color>, // Text
                std::tuple<Vector2, Vector2, float, Color>, // Line
                std::tuple<Texture2D, Rect<float>, Rect<float>, Vector2, float, Color> // Image
            > params;
        };

        std::vector<DrawCommand> commands;

    public:
        void draw_rectangle(const Rect<float>& rect, const Color& color) {
            commands.push_back({
                DrawCommand::Rectangle,
                std::make_tuple(rect, color)
            });
        }

        void draw_text(const std::string& text, Vector2 pos,
                       float font_size, float spacing, const Color& color) {
            commands.push_back({
                DrawCommand::Text,
                std::make_tuple(text, pos, font_size, spacing, color)
            });
        }

        // TODO - Add other drawing methods

        void flush() {
            // Sort commands by type for better performance
            std::ranges::sort(commands,
                              [](const DrawCommand& a, const DrawCommand& b) {
                                  return a.type < b.type;
                              });

            // Execute all batched commands
            for (const auto& cmd : commands) {
                switch (cmd.type) {
                    case DrawCommand::Rectangle: {
                        auto [rect, color] = std::get<0>(cmd.params);
                        DrawRectangleRec(rect.to_rl(), color);
                        break;
                    }
                    case DrawCommand::Text: {
                        auto [text, pos, font_size, spacing, color] =
                            std::get<1>(cmd.params);
                        DrawTextEx(GetFontDefault(), text.c_str(),
                                  pos, font_size, spacing, color);
                        break;
                    }
                    default: ;
                    // Handle other types
                }
            }

            commands.clear();
        }
    };
}