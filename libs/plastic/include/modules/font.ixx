//
// Created by Aidan Jost on 2/25/25.
//
module;
#include <memory>
#include <raylib.h>
#include <string>
export module plastic.font;
import plastic.point;
import plastic.size;
import plastic.rect;




export namespace plastic
{

    struct Image {// Data format (PixelFormat type)

        ::Image rl_;

        static Image from(const ::Image& img) {
            return Image{img};
        }

        [[nodiscard]] ::Image rl() const {
            return rl_;
        }

        void resize(int w, int h) {
            ImageResize(&rl_, w, h);
        }

        void crop(const Rect<float> rec) {
            ImageCrop(&rl_, rec.to_rl());
        }

        [[nodiscard]] Image copy() const{
            return Image{::ImageCopy(rl_)};
        }

        static Image load(const std::string& fileName) {
            return Image{::LoadImage(fileName.c_str())};
        }

        [[nodiscard]] static Image from(Image img, Rect<float>) {
            Image ret = Image{img};
            int high = img.rl_.height;
            int wide = img.rl_.width;
            ret.resize(wide, high);
            return ret;

        }

        static Image from(const Font& font, const char *text, float font_size, float spacing, Color tint ) {
            return from(ImageTextEx(font, text, font_size, spacing, tint));
        }

        void save(const std::string& fileName) const {
            if (const bool res = ExportImage(rl(), fileName.c_str()); !res) {
                throw std::runtime_error("Failed to save image");
            }
        }

        void save_as_code(const std::string& filename) const {
            if (const bool res = ExportImageAsCode(rl(), filename.c_str()); !res) {
                throw std::runtime_error("Failed to save image");
            }
        }
    };
    ;

    struct Texture {
        unsigned int id;        // OpenGL texture id
        int width;              // Texture base width
        int height;             // Texture base height
        int mipmaps;            // Mipmap levels, 1 by default
        int format;             // Data format (PixelFormat type)

        [[nodiscard]] ::Texture2D rl() const {
            return ::Texture2D{id, width, height, mipmaps, format};
        }
    };

    struct GlyphInformation {
        int value;              // Character value (Unicode)
        int offsetX;            // Character offset X when drawing
        int offsetY;            // Character offset Y when drawing
        int advanceX;           // Character advance position X
        plastic::Image image;   // Character image data

        [[nodiscard]] ::GlyphInfo rl() const {
            return ::GlyphInfo{value, offsetX, offsetY, advanceX, image.rl()};
        }
    };

    struct Font : std::enable_shared_from_this<Font> {
        ::Font font_;
        [[nodiscard]] ::Font rl() const {
            return font_;
        }
    };
}