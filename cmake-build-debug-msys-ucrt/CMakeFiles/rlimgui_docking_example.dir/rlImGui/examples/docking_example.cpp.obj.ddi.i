# 0 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp"
# 1 "C:\\Users\\ajost1\\CLionProjects\\Kup\\cmake-build-debug-msys-ucrt//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp"
# 13 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp"
# 1 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raylib.h" 1
# 82 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raylib.h"
# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdarg.h" 1 3 4
# 1 "C:/msys64/ucrt64/include/stdarg.h" 1 3 4
# 45 "C:/msys64/ucrt64/include/stdarg.h" 3 4

# 45 "C:/msys64/ucrt64/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 107 "C:/msys64/ucrt64/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 140 "C:/msys64/ucrt64/include/stdarg.h" 3 4
# 1 "C:/msys64/ucrt64/include/_mingw_stdarg.h" 1 3 4
# 14 "C:/msys64/ucrt64/include/_mingw_stdarg.h" 3 4
# 1 "C:/msys64/ucrt64/include/vadefs.h" 1 3 4
# 9 "C:/msys64/ucrt64/include/vadefs.h" 3 4
# 1 "C:/msys64/ucrt64/include/_mingw.h" 1 3 4
# 10 "C:/msys64/ucrt64/include/_mingw.h" 3 4
# 1 "C:/msys64/ucrt64/include/_mingw_mac.h" 1 3 4
# 98 "C:/msys64/ucrt64/include/_mingw_mac.h" 3 4
             
# 107 "C:/msys64/ucrt64/include/_mingw_mac.h" 3 4
             
# 316 "C:/msys64/ucrt64/include/_mingw_mac.h" 3 4
       
# 395 "C:/msys64/ucrt64/include/_mingw_mac.h" 3 4
       
# 11 "C:/msys64/ucrt64/include/_mingw.h" 2 3 4
# 1 "C:/msys64/ucrt64/include/_mingw_secapi.h" 1 3 4
# 44 "C:/msys64/ucrt64/include/_mingw_secapi.h" 3 4
extern "C++" {
template <bool __test, typename __dsttype>
  struct __if_array;
template <typename __dsttype>
  struct __if_array <true, __dsttype> {
    typedef __dsttype __type;
};
}
# 12 "C:/msys64/ucrt64/include/_mingw.h" 2 3 4
# 282 "C:/msys64/ucrt64/include/_mingw.h" 3 4
# 1 "C:/msys64/ucrt64/include/vadefs.h" 1 3 4
# 283 "C:/msys64/ucrt64/include/_mingw.h" 2 3 4
# 568 "C:/msys64/ucrt64/include/_mingw.h" 3 4
extern "C" {
# 580 "C:/msys64/ucrt64/include/_mingw.h" 3 4
void __attribute__((__cdecl__)) __debugbreak(void);
extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void __attribute__((__cdecl__)) __debugbreak(void)
{

  __asm__ __volatile__("int {$}3":);







}
# 601 "C:/msys64/ucrt64/include/_mingw.h" 3 4
void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) __fastfail(unsigned int code);
extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) __fastfail(unsigned int code)
{

  __asm__ __volatile__("int {$}0x29"::"c"(code));
# 615 "C:/msys64/ucrt64/include/_mingw.h" 3 4
  __builtin_unreachable();
}
# 641 "C:/msys64/ucrt64/include/_mingw.h" 3 4
const char *__mingw_get_crt_info (void);


}
# 661 "C:/msys64/ucrt64/include/_mingw.h" 3 4
# 1 "C:/msys64/ucrt64/include/sdks/_mingw_ddk.h" 1 3 4
# 662 "C:/msys64/ucrt64/include/_mingw.h" 2 3 4
# 10 "C:/msys64/ucrt64/include/vadefs.h" 2 3 4




#pragma pack(push,_CRT_PACKING)



extern "C" {
# 99 "C:/msys64/ucrt64/include/vadefs.h" 3 4
}



#pragma pack(pop)
# 15 "C:/msys64/ucrt64/include/_mingw_stdarg.h" 2 3 4
# 141 "C:/msys64/ucrt64/include/stdarg.h" 2 3 4
# 2 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdarg.h" 2 3 4
# 83 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raylib.h" 2
# 204 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raylib.h"

# 204 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raylib.h"
typedef struct Vector2 {
    float x;
    float y;
} Vector2;


typedef struct Vector3 {
    float x;
    float y;
    float z;
} Vector3;


typedef struct Vector4 {
    float x;
    float y;
    float z;
    float w;
} Vector4;


typedef Vector4 Quaternion;


typedef struct Matrix {
    float m0, m4, m8, m12;
    float m1, m5, m9, m13;
    float m2, m6, m10, m14;
    float m3, m7, m11, m15;
} Matrix;


typedef struct Color {
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;


typedef struct Rectangle {
    float x;
    float y;
    float width;
    float height;
} Rectangle;


typedef struct Image {
    void *data;
    int width;
    int height;
    int mipmaps;
    int format;
} Image;


typedef struct Texture {
    unsigned int id;
    int width;
    int height;
    int mipmaps;
    int format;
} Texture;


typedef Texture Texture2D;


typedef Texture TextureCubemap;


typedef struct RenderTexture {
    unsigned int id;
    Texture texture;
    Texture depth;
} RenderTexture;


typedef RenderTexture RenderTexture2D;


typedef struct NPatchInfo {
    Rectangle source;
    int left;
    int top;
    int right;
    int bottom;
    int layout;
} NPatchInfo;


typedef struct GlyphInfo {
    int value;
    int offsetX;
    int offsetY;
    int advanceX;
    Image image;
} GlyphInfo;


typedef struct Font {
    int baseSize;
    int glyphCount;
    int glyphPadding;
    Texture2D texture;
    Rectangle *recs;
    GlyphInfo *glyphs;
} Font;


typedef struct Camera3D {
    Vector3 position;
    Vector3 target;
    Vector3 up;
    float fovy;
    int projection;
} Camera3D;

typedef Camera3D Camera;


typedef struct Camera2D {
    Vector2 offset;
    Vector2 target;
    float rotation;
    float zoom;
} Camera2D;


typedef struct Mesh {
    int vertexCount;
    int triangleCount;


    float *vertices;
    float *texcoords;
    float *texcoords2;
    float *normals;
    float *tangents;
    unsigned char *colors;
    unsigned short *indices;


    float *animVertices;
    float *animNormals;
    unsigned char *boneIds;
    float *boneWeights;


    unsigned int vaoId;
    unsigned int *vboId;
} Mesh;


typedef struct Shader {
    unsigned int id;
    int *locs;
} Shader;


typedef struct MaterialMap {
    Texture2D texture;
    Color color;
    float value;
} MaterialMap;


typedef struct Material {
    Shader shader;
    MaterialMap *maps;
    float params[4];
} Material;


typedef struct Transform {
    Vector3 translation;
    Quaternion rotation;
    Vector3 scale;
} Transform;


typedef struct BoneInfo {
    char name[32];
    int parent;
} BoneInfo;


typedef struct Model {
    Matrix transform;

    int meshCount;
    int materialCount;
    Mesh *meshes;
    Material *materials;
    int *meshMaterial;


    int boneCount;
    BoneInfo *bones;
    Transform *bindPose;
} Model;


typedef struct ModelAnimation {
    int boneCount;
    int frameCount;
    BoneInfo *bones;
    Transform **framePoses;
    char name[32];
} ModelAnimation;


typedef struct Ray {
    Vector3 position;
    Vector3 direction;
} Ray;


typedef struct RayCollision {
    bool hit;
    float distance;
    Vector3 point;
    Vector3 normal;
} RayCollision;


typedef struct BoundingBox {
    Vector3 min;
    Vector3 max;
} BoundingBox;


typedef struct Wave {
    unsigned int frameCount;
    unsigned int sampleRate;
    unsigned int sampleSize;
    unsigned int channels;
    void *data;
} Wave;



typedef struct rAudioBuffer rAudioBuffer;
typedef struct rAudioProcessor rAudioProcessor;


typedef struct AudioStream {
    rAudioBuffer *buffer;
    rAudioProcessor *processor;

    unsigned int sampleRate;
    unsigned int sampleSize;
    unsigned int channels;
} AudioStream;


typedef struct Sound {
    AudioStream stream;
    unsigned int frameCount;
} Sound;


typedef struct Music {
    AudioStream stream;
    unsigned int frameCount;
    bool looping;

    int ctxType;
    void *ctxData;
} Music;


typedef struct VrDeviceInfo {
    int hResolution;
    int vResolution;
    float hScreenSize;
    float vScreenSize;
    float vScreenCenter;
    float eyeToScreenDistance;
    float lensSeparationDistance;
    float interpupillaryDistance;
    float lensDistortionValues[4];
    float chromaAbCorrection[4];
} VrDeviceInfo;


typedef struct VrStereoConfig {
    Matrix projection[2];
    Matrix viewOffset[2];
    float leftLensCenter[2];
    float rightLensCenter[2];
    float leftScreenCenter[2];
    float rightScreenCenter[2];
    float scale[2];
    float scaleIn[2];
} VrStereoConfig;


typedef struct FilePathList {
    unsigned int capacity;
    unsigned int count;
    char **paths;
} FilePathList;


typedef struct AutomationEvent {
    unsigned int frame;
    unsigned int type;
    int params[4];
} AutomationEvent;


typedef struct AutomationEventList {
    unsigned int capacity;
    unsigned int count;
    AutomationEvent *events;
} AutomationEventList;







typedef enum {
    FLAG_VSYNC_HINT = 0x00000040,
    FLAG_FULLSCREEN_MODE = 0x00000002,
    FLAG_WINDOW_RESIZABLE = 0x00000004,
    FLAG_WINDOW_UNDECORATED = 0x00000008,
    FLAG_WINDOW_HIDDEN = 0x00000080,
    FLAG_WINDOW_MINIMIZED = 0x00000200,
    FLAG_WINDOW_MAXIMIZED = 0x00000400,
    FLAG_WINDOW_UNFOCUSED = 0x00000800,
    FLAG_WINDOW_TOPMOST = 0x00001000,
    FLAG_WINDOW_ALWAYS_RUN = 0x00000100,
    FLAG_WINDOW_TRANSPARENT = 0x00000010,
    FLAG_WINDOW_HIGHDPI = 0x00002000,
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000,
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000,
    FLAG_MSAA_4X_HINT = 0x00000020,
    FLAG_INTERLACED_HINT = 0x00010000
} ConfigFlags;



typedef enum {
    LOG_ALL = 0,
    LOG_TRACE,
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
    LOG_NONE
} TraceLogLevel;




typedef enum {
    KEY_NULL = 0,

    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,

    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,

    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336,

    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25
} KeyboardKey;







typedef enum {
    MOUSE_BUTTON_LEFT = 0,
    MOUSE_BUTTON_RIGHT = 1,
    MOUSE_BUTTON_MIDDLE = 2,
    MOUSE_BUTTON_SIDE = 3,
    MOUSE_BUTTON_EXTRA = 4,
    MOUSE_BUTTON_FORWARD = 5,
    MOUSE_BUTTON_BACK = 6,
} MouseButton;


typedef enum {
    MOUSE_CURSOR_DEFAULT = 0,
    MOUSE_CURSOR_ARROW = 1,
    MOUSE_CURSOR_IBEAM = 2,
    MOUSE_CURSOR_CROSSHAIR = 3,
    MOUSE_CURSOR_POINTING_HAND = 4,
    MOUSE_CURSOR_RESIZE_EW = 5,
    MOUSE_CURSOR_RESIZE_NS = 6,
    MOUSE_CURSOR_RESIZE_NWSE = 7,
    MOUSE_CURSOR_RESIZE_NESW = 8,
    MOUSE_CURSOR_RESIZE_ALL = 9,
    MOUSE_CURSOR_NOT_ALLOWED = 10
} MouseCursor;


typedef enum {
    GAMEPAD_BUTTON_UNKNOWN = 0,
    GAMEPAD_BUTTON_LEFT_FACE_UP,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,
    GAMEPAD_BUTTON_RIGHT_FACE_UP,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,
    GAMEPAD_BUTTON_LEFT_TRIGGER_1,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,
    GAMEPAD_BUTTON_MIDDLE_LEFT,
    GAMEPAD_BUTTON_MIDDLE,
    GAMEPAD_BUTTON_MIDDLE_RIGHT,
    GAMEPAD_BUTTON_LEFT_THUMB,
    GAMEPAD_BUTTON_RIGHT_THUMB
} GamepadButton;


typedef enum {
    GAMEPAD_AXIS_LEFT_X = 0,
    GAMEPAD_AXIS_LEFT_Y = 1,
    GAMEPAD_AXIS_RIGHT_X = 2,
    GAMEPAD_AXIS_RIGHT_Y = 3,
    GAMEPAD_AXIS_LEFT_TRIGGER = 4,
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5
} GamepadAxis;


typedef enum {
    MATERIAL_MAP_ALBEDO = 0,
    MATERIAL_MAP_METALNESS,
    MATERIAL_MAP_NORMAL,
    MATERIAL_MAP_ROUGHNESS,
    MATERIAL_MAP_OCCLUSION,
    MATERIAL_MAP_EMISSION,
    MATERIAL_MAP_HEIGHT,
    MATERIAL_MAP_CUBEMAP,
    MATERIAL_MAP_IRRADIANCE,
    MATERIAL_MAP_PREFILTER,
    MATERIAL_MAP_BRDF
} MaterialMapIndex;





typedef enum {
    SHADER_LOC_VERTEX_POSITION = 0,
    SHADER_LOC_VERTEX_TEXCOORD01,
    SHADER_LOC_VERTEX_TEXCOORD02,
    SHADER_LOC_VERTEX_NORMAL,
    SHADER_LOC_VERTEX_TANGENT,
    SHADER_LOC_VERTEX_COLOR,
    SHADER_LOC_MATRIX_MVP,
    SHADER_LOC_MATRIX_VIEW,
    SHADER_LOC_MATRIX_PROJECTION,
    SHADER_LOC_MATRIX_MODEL,
    SHADER_LOC_MATRIX_NORMAL,
    SHADER_LOC_VECTOR_VIEW,
    SHADER_LOC_COLOR_DIFFUSE,
    SHADER_LOC_COLOR_SPECULAR,
    SHADER_LOC_COLOR_AMBIENT,
    SHADER_LOC_MAP_ALBEDO,
    SHADER_LOC_MAP_METALNESS,
    SHADER_LOC_MAP_NORMAL,
    SHADER_LOC_MAP_ROUGHNESS,
    SHADER_LOC_MAP_OCCLUSION,
    SHADER_LOC_MAP_EMISSION,
    SHADER_LOC_MAP_HEIGHT,
    SHADER_LOC_MAP_CUBEMAP,
    SHADER_LOC_MAP_IRRADIANCE,
    SHADER_LOC_MAP_PREFILTER,
    SHADER_LOC_MAP_BRDF
} ShaderLocationIndex;





typedef enum {
    SHADER_UNIFORM_FLOAT = 0,
    SHADER_UNIFORM_VEC2,
    SHADER_UNIFORM_VEC3,
    SHADER_UNIFORM_VEC4,
    SHADER_UNIFORM_INT,
    SHADER_UNIFORM_IVEC2,
    SHADER_UNIFORM_IVEC3,
    SHADER_UNIFORM_IVEC4,
    SHADER_UNIFORM_SAMPLER2D
} ShaderUniformDataType;


typedef enum {
    SHADER_ATTRIB_FLOAT = 0,
    SHADER_ATTRIB_VEC2,
    SHADER_ATTRIB_VEC3,
    SHADER_ATTRIB_VEC4
} ShaderAttributeDataType;



typedef enum {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,
    PIXELFORMAT_UNCOMPRESSED_R5G6B5,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8,
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,
    PIXELFORMAT_UNCOMPRESSED_R32,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,
    PIXELFORMAT_UNCOMPRESSED_R16,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,
    PIXELFORMAT_COMPRESSED_DXT1_RGB,
    PIXELFORMAT_COMPRESSED_DXT1_RGBA,
    PIXELFORMAT_COMPRESSED_DXT3_RGBA,
    PIXELFORMAT_COMPRESSED_DXT5_RGBA,
    PIXELFORMAT_COMPRESSED_ETC1_RGB,
    PIXELFORMAT_COMPRESSED_ETC2_RGB,
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,
    PIXELFORMAT_COMPRESSED_PVRT_RGB,
    PIXELFORMAT_COMPRESSED_PVRT_RGBA,
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA
} PixelFormat;




typedef enum {
    TEXTURE_FILTER_POINT = 0,
    TEXTURE_FILTER_BILINEAR,
    TEXTURE_FILTER_TRILINEAR,
    TEXTURE_FILTER_ANISOTROPIC_4X,
    TEXTURE_FILTER_ANISOTROPIC_8X,
    TEXTURE_FILTER_ANISOTROPIC_16X,
} TextureFilter;


typedef enum {
    TEXTURE_WRAP_REPEAT = 0,
    TEXTURE_WRAP_CLAMP,
    TEXTURE_WRAP_MIRROR_REPEAT,
    TEXTURE_WRAP_MIRROR_CLAMP
} TextureWrap;


typedef enum {
    CUBEMAP_LAYOUT_AUTO_DETECT = 0,
    CUBEMAP_LAYOUT_LINE_VERTICAL,
    CUBEMAP_LAYOUT_LINE_HORIZONTAL,
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE,
    CUBEMAP_LAYOUT_PANORAMA
} CubemapLayout;


typedef enum {
    FONT_DEFAULT = 0,
    FONT_BITMAP,
    FONT_SDF
} FontType;


typedef enum {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE,
    BLEND_MULTIPLIED,
    BLEND_ADD_COLORS,
    BLEND_SUBTRACT_COLORS,
    BLEND_ALPHA_PREMULTIPLY,
    BLEND_CUSTOM,
    BLEND_CUSTOM_SEPARATE
} BlendMode;



typedef enum {
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512
} Gesture;


typedef enum {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE,
    CAMERA_ORBITAL,
    CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON
} CameraMode;


typedef enum {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC
} CameraProjection;


typedef enum {
    NPATCH_NINE_PATCH = 0,
    NPATCH_THREE_PATCH_VERTICAL,
    NPATCH_THREE_PATCH_HORIZONTAL
} NPatchLayout;



typedef void (*TraceLogCallback)(int logLevel, const char *text, va_list args);
typedef unsigned char *(*LoadFileDataCallback)(const char *fileName, int *dataSize);
typedef bool (*SaveFileDataCallback)(const char *fileName, void *data, int dataSize);
typedef char *(*LoadFileTextCallback)(const char *fileName);
typedef bool (*SaveFileTextCallback)(const char *fileName, char *text);
# 950 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raylib.h"
extern "C" {



 void InitWindow(int width, int height, const char *title);
 void CloseWindow(void);
 bool WindowShouldClose(void);
 bool IsWindowReady(void);
 bool IsWindowFullscreen(void);
 bool IsWindowHidden(void);
 bool IsWindowMinimized(void);
 bool IsWindowMaximized(void);
 bool IsWindowFocused(void);
 bool IsWindowResized(void);
 bool IsWindowState(unsigned int flag);
 void SetWindowState(unsigned int flags);
 void ClearWindowState(unsigned int flags);
 void ToggleFullscreen(void);
 void ToggleBorderlessWindowed(void);
 void MaximizeWindow(void);
 void MinimizeWindow(void);
 void RestoreWindow(void);
 void SetWindowIcon(Image image);
 void SetWindowIcons(Image *images, int count);
 void SetWindowTitle(const char *title);
 void SetWindowPosition(int x, int y);
 void SetWindowMonitor(int monitor);
 void SetWindowMinSize(int width, int height);
 void SetWindowMaxSize(int width, int height);
 void SetWindowSize(int width, int height);
 void SetWindowOpacity(float opacity);
 void SetWindowFocused(void);
 void *GetWindowHandle(void);
 int GetScreenWidth(void);
 int GetScreenHeight(void);
 int GetRenderWidth(void);
 int GetRenderHeight(void);
 int GetMonitorCount(void);
 int GetCurrentMonitor(void);
 Vector2 GetMonitorPosition(int monitor);
 int GetMonitorWidth(int monitor);
 int GetMonitorHeight(int monitor);
 int GetMonitorPhysicalWidth(int monitor);
 int GetMonitorPhysicalHeight(int monitor);
 int GetMonitorRefreshRate(int monitor);
 Vector2 GetWindowPosition(void);
 Vector2 GetWindowScaleDPI(void);
 const char *GetMonitorName(int monitor);
 void SetClipboardText(const char *text);
 const char *GetClipboardText(void);
 void EnableEventWaiting(void);
 void DisableEventWaiting(void);


 void ShowCursor(void);
 void HideCursor(void);
 bool IsCursorHidden(void);
 void EnableCursor(void);
 void DisableCursor(void);
 bool IsCursorOnScreen(void);


 void ClearBackground(Color color);
 void BeginDrawing(void);
 void EndDrawing(void);
 void BeginMode2D(Camera2D camera);
 void EndMode2D(void);
 void BeginMode3D(Camera3D camera);
 void EndMode3D(void);
 void BeginTextureMode(RenderTexture2D target);
 void EndTextureMode(void);
 void BeginShaderMode(Shader shader);
 void EndShaderMode(void);
 void BeginBlendMode(int mode);
 void EndBlendMode(void);
 void BeginScissorMode(int x, int y, int width, int height);
 void EndScissorMode(void);
 void BeginVrStereoMode(VrStereoConfig config);
 void EndVrStereoMode(void);


 VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);
 void UnloadVrStereoConfig(VrStereoConfig config);



 Shader LoadShader(const char *vsFileName, const char *fsFileName);
 Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode);
 bool IsShaderReady(Shader shader);
 int GetShaderLocation(Shader shader, const char *uniformName);
 int GetShaderLocationAttrib(Shader shader, const char *attribName);
 void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);
 void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count);
 void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);
 void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture);
 void UnloadShader(Shader shader);


 Ray GetMouseRay(Vector2 mousePosition, Camera camera);
 Matrix GetCameraMatrix(Camera camera);
 Matrix GetCameraMatrix2D(Camera2D camera);
 Vector2 GetWorldToScreen(Vector3 position, Camera camera);
 Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);
 Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height);
 Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);


 void SetTargetFPS(int fps);
 float GetFrameTime(void);
 double GetTime(void);
 int GetFPS(void);





 void SwapScreenBuffer(void);
 void PollInputEvents(void);
 void WaitTime(double seconds);


 void SetRandomSeed(unsigned int seed);
 int GetRandomValue(int min, int max);
 int *LoadRandomSequence(unsigned int count, int min, int max);
 void UnloadRandomSequence(int *sequence);


 void TakeScreenshot(const char *fileName);
 void SetConfigFlags(unsigned int flags);
 void OpenURL(const char *url);



 void TraceLog(int logLevel, const char *text, ...);
 void SetTraceLogLevel(int logLevel);
 void *MemAlloc(unsigned int size);
 void *MemRealloc(void *ptr, unsigned int size);
 void MemFree(void *ptr);



 void SetTraceLogCallback(TraceLogCallback callback);
 void SetLoadFileDataCallback(LoadFileDataCallback callback);
 void SetSaveFileDataCallback(SaveFileDataCallback callback);
 void SetLoadFileTextCallback(LoadFileTextCallback callback);
 void SetSaveFileTextCallback(SaveFileTextCallback callback);


 unsigned char *LoadFileData(const char *fileName, int *dataSize);
 void UnloadFileData(unsigned char *data);
 bool SaveFileData(const char *fileName, void *data, int dataSize);
 bool ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName);
 char *LoadFileText(const char *fileName);
 void UnloadFileText(char *text);
 bool SaveFileText(const char *fileName, char *text);



 bool FileExists(const char *fileName);
 bool DirectoryExists(const char *dirPath);
 bool IsFileExtension(const char *fileName, const char *ext);
 int GetFileLength(const char *fileName);
 const char *GetFileExtension(const char *fileName);
 const char *GetFileName(const char *filePath);
 const char *GetFileNameWithoutExt(const char *filePath);
 const char *GetDirectoryPath(const char *filePath);
 const char *GetPrevDirectoryPath(const char *dirPath);
 const char *GetWorkingDirectory(void);
 const char *GetApplicationDirectory(void);
 bool ChangeDirectory(const char *dir);
 bool IsPathFile(const char *path);
 FilePathList LoadDirectoryFiles(const char *dirPath);
 FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs);
 void UnloadDirectoryFiles(FilePathList files);
 bool IsFileDropped(void);
 FilePathList LoadDroppedFiles(void);
 void UnloadDroppedFiles(FilePathList files);
 long GetFileModTime(const char *fileName);


 unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize);
 unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize);
 char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize);
 unsigned char *DecodeDataBase64(const unsigned char *data, int *outputSize);


 AutomationEventList LoadAutomationEventList(const char *fileName);
 void UnloadAutomationEventList(AutomationEventList *list);
 bool ExportAutomationEventList(AutomationEventList list, const char *fileName);
 void SetAutomationEventList(AutomationEventList *list);
 void SetAutomationEventBaseFrame(int frame);
 void StartAutomationEventRecording(void);
 void StopAutomationEventRecording(void);
 void PlayAutomationEvent(AutomationEvent event);






 bool IsKeyPressed(int key);
 bool IsKeyPressedRepeat(int key);
 bool IsKeyDown(int key);
 bool IsKeyReleased(int key);
 bool IsKeyUp(int key);
 int GetKeyPressed(void);
 int GetCharPressed(void);
 void SetExitKey(int key);


 bool IsGamepadAvailable(int gamepad);
 const char *GetGamepadName(int gamepad);
 bool IsGamepadButtonPressed(int gamepad, int button);
 bool IsGamepadButtonDown(int gamepad, int button);
 bool IsGamepadButtonReleased(int gamepad, int button);
 bool IsGamepadButtonUp(int gamepad, int button);
 int GetGamepadButtonPressed(void);
 int GetGamepadAxisCount(int gamepad);
 float GetGamepadAxisMovement(int gamepad, int axis);
 int SetGamepadMappings(const char *mappings);


 bool IsMouseButtonPressed(int button);
 bool IsMouseButtonDown(int button);
 bool IsMouseButtonReleased(int button);
 bool IsMouseButtonUp(int button);
 int GetMouseX(void);
 int GetMouseY(void);
 Vector2 GetMousePosition(void);
 Vector2 GetMouseDelta(void);
 void SetMousePosition(int x, int y);
 void SetMouseOffset(int offsetX, int offsetY);
 void SetMouseScale(float scaleX, float scaleY);
 float GetMouseWheelMove(void);
 Vector2 GetMouseWheelMoveV(void);
 void SetMouseCursor(int cursor);


 int GetTouchX(void);
 int GetTouchY(void);
 Vector2 GetTouchPosition(int index);
 int GetTouchPointId(int index);
 int GetTouchPointCount(void);




 void SetGesturesEnabled(unsigned int flags);
 bool IsGestureDetected(unsigned int gesture);
 int GetGestureDetected(void);
 float GetGestureHoldDuration(void);
 Vector2 GetGestureDragVector(void);
 float GetGestureDragAngle(void);
 Vector2 GetGesturePinchVector(void);
 float GetGesturePinchAngle(void);




 void UpdateCamera(Camera *camera, int mode);
 void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom);







 void SetShapesTexture(Texture2D texture, Rectangle source);


 void DrawPixel(int posX, int posY, Color color);
 void DrawPixelV(Vector2 position, Color color);
 void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
 void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
 void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
 void DrawLineStrip(Vector2 *points, int pointCount, Color color);
 void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
 void DrawCircle(int centerX, int centerY, float radius, Color color);
 void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
 void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
 void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
 void DrawCircleV(Vector2 center, float radius, Color color);
 void DrawCircleLines(int centerX, int centerY, float radius, Color color);
 void DrawCircleLinesV(Vector2 center, float radius, Color color);
 void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
 void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
 void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
 void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
 void DrawRectangle(int posX, int posY, int width, int height, Color color);
 void DrawRectangleV(Vector2 position, Vector2 size, Color color);
 void DrawRectangleRec(Rectangle rec, Color color);
 void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
 void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
 void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
 void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
 void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
 void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);
 void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
 void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color);
 void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
 void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
 void DrawTriangleFan(Vector2 *points, int pointCount, Color color);
 void DrawTriangleStrip(Vector2 *points, int pointCount, Color color);
 void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
 void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);
 void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color);


 void DrawSplineLinear(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineBasis(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineCatmullRom(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineBezierQuadratic(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineBezierCubic(Vector2 *points, int pointCount, float thick, Color color);
 void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color);
 void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color);
 void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color);
 void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color);
 void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color);


 Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t);
 Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);
 Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);
 Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t);
 Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t);


 bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
 bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
 bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
 bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
 bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
 bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);
 bool CheckCollisionPointPoly(Vector2 point, Vector2 *points, int pointCount);
 bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint);
 bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);
 Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);







 Image LoadImage(const char *fileName);
 Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);
 Image LoadImageSvg(const char *fileNameOrString, int width, int height);
 Image LoadImageAnim(const char *fileName, int *frames);
 Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize);
 Image LoadImageFromTexture(Texture2D texture);
 Image LoadImageFromScreen(void);
 bool IsImageReady(Image image);
 void UnloadImage(Image image);
 bool ExportImage(Image image, const char *fileName);
 unsigned char *ExportImageToMemory(Image image, const char *fileType, int *fileSize);
 bool ExportImageAsCode(Image image, const char *fileName);


 Image GenImageColor(int width, int height, Color color);
 Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end);
 Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
 Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer);
 Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
 Image GenImageWhiteNoise(int width, int height, float factor);
 Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);
 Image GenImageCellular(int width, int height, int tileSize);
 Image GenImageText(int width, int height, const char *text);


 Image ImageCopy(Image image);
 Image ImageFromImage(Image image, Rectangle rec);
 Image ImageText(const char *text, int fontSize, Color color);
 Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);
 void ImageFormat(Image *image, int newFormat);
 void ImageToPOT(Image *image, Color fill);
 void ImageCrop(Image *image, Rectangle crop);
 void ImageAlphaCrop(Image *image, float threshold);
 void ImageAlphaClear(Image *image, Color color, float threshold);
 void ImageAlphaMask(Image *image, Image alphaMask);
 void ImageAlphaPremultiply(Image *image);
 void ImageBlurGaussian(Image *image, int blurSize);
 void ImageResize(Image *image, int newWidth, int newHeight);
 void ImageResizeNN(Image *image, int newWidth,int newHeight);
 void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill);
 void ImageMipmaps(Image *image);
 void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);
 void ImageFlipVertical(Image *image);
 void ImageFlipHorizontal(Image *image);
 void ImageRotate(Image *image, int degrees);
 void ImageRotateCW(Image *image);
 void ImageRotateCCW(Image *image);
 void ImageColorTint(Image *image, Color color);
 void ImageColorInvert(Image *image);
 void ImageColorGrayscale(Image *image);
 void ImageColorContrast(Image *image, float contrast);
 void ImageColorBrightness(Image *image, int brightness);
 void ImageColorReplace(Image *image, Color color, Color replace);
 Color *LoadImageColors(Image image);
 Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount);
 void UnloadImageColors(Color *colors);
 void UnloadImagePalette(Color *colors);
 Rectangle GetImageAlphaBorder(Image image, float threshold);
 Color GetImageColor(Image image, int x, int y);



 void ImageClearBackground(Image *dst, Color color);
 void ImageDrawPixel(Image *dst, int posX, int posY, Color color);
 void ImageDrawPixelV(Image *dst, Vector2 position, Color color);
 void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color);
 void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);
 void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);
 void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);
 void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color);
 void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color);
 void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);
 void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);
 void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);
 void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);
 void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
 void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color);
 void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);



 Texture2D LoadTexture(const char *fileName);
 Texture2D LoadTextureFromImage(Image image);
 TextureCubemap LoadTextureCubemap(Image image, int layout);
 RenderTexture2D LoadRenderTexture(int width, int height);
 bool IsTextureReady(Texture2D texture);
 void UnloadTexture(Texture2D texture);
 bool IsRenderTextureReady(RenderTexture2D target);
 void UnloadRenderTexture(RenderTexture2D target);
 void UpdateTexture(Texture2D texture, const void *pixels);
 void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels);


 void GenTextureMipmaps(Texture2D *texture);
 void SetTextureFilter(Texture2D texture, int filter);
 void SetTextureWrap(Texture2D texture, int wrap);


 void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
 void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
 void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
 void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);
 void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint);
 void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint);


 Color Fade(Color color, float alpha);
 int ColorToInt(Color color);
 Vector4 ColorNormalize(Color color);
 Color ColorFromNormalized(Vector4 normalized);
 Vector3 ColorToHSV(Color color);
 Color ColorFromHSV(float hue, float saturation, float value);
 Color ColorTint(Color color, Color tint);
 Color ColorBrightness(Color color, float factor);
 Color ColorContrast(Color color, float contrast);
 Color ColorAlpha(Color color, float alpha);
 Color ColorAlphaBlend(Color dst, Color src, Color tint);
 Color GetColor(unsigned int hexValue);
 Color GetPixelColor(void *srcPtr, int format);
 void SetPixelColor(void *dstPtr, Color color, int format);
 int GetPixelDataSize(int width, int height, int format);






 Font GetFontDefault(void);
 Font LoadFont(const char *fileName);
 Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointCount);
 Font LoadFontFromImage(Image image, Color key, int firstChar);
 Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount);
 bool IsFontReady(Font font);
 GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount, int type);
 Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod);
 void UnloadFontData(GlyphInfo *glyphs, int glyphCount);
 void UnloadFont(Font font);
 bool ExportFontAsCode(Font font, const char *fileName);


 void DrawFPS(int posX, int posY);
 void DrawText(const char *text, int posX, int posY, int fontSize, Color color);
 void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);
 void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint);
 void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint);
 void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint);


 void SetTextLineSpacing(int spacing);
 int MeasureText(const char *text, int fontSize);
 Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);
 int GetGlyphIndex(Font font, int codepoint);
 GlyphInfo GetGlyphInfo(Font font, int codepoint);
 Rectangle GetGlyphAtlasRec(Font font, int codepoint);


 char *LoadUTF8(const int *codepoints, int length);
 void UnloadUTF8(char *text);
 int *LoadCodepoints(const char *text, int *count);
 void UnloadCodepoints(int *codepoints);
 int GetCodepointCount(const char *text);
 int GetCodepoint(const char *text, int *codepointSize);
 int GetCodepointNext(const char *text, int *codepointSize);
 int GetCodepointPrevious(const char *text, int *codepointSize);
 const char *CodepointToUTF8(int codepoint, int *utf8Size);



 int TextCopy(char *dst, const char *src);
 bool TextIsEqual(const char *text1, const char *text2);
 unsigned int TextLength(const char *text);
 const char *TextFormat(const char *text, ...);
 const char *TextSubtext(const char *text, int position, int length);
 char *TextReplace(char *text, const char *replace, const char *by);
 char *TextInsert(const char *text, const char *insert, int position);
 const char *TextJoin(const char **textList, int count, const char *delimiter);
 const char **TextSplit(const char *text, char delimiter, int *count);
 void TextAppend(char *text, const char *append, int *position);
 int TextFindIndex(const char *text, const char *find);
 const char *TextToUpper(const char *text);
 const char *TextToLower(const char *text);
 const char *TextToPascal(const char *text);
 int TextToInteger(const char *text);






 void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
 void DrawPoint3D(Vector3 position, Color color);
 void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
 void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);
 void DrawTriangleStrip3D(Vector3 *points, int pointCount, Color color);
 void DrawCube(Vector3 position, float width, float height, float length, Color color);
 void DrawCubeV(Vector3 position, Vector3 size, Color color);
 void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
 void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
 void DrawSphere(Vector3 centerPos, float radius, Color color);
 void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);
 void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);
 void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
 void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color);
 void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
 void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color);
 void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color);
 void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color);
 void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
 void DrawRay(Ray ray, Color color);
 void DrawGrid(int slices, float spacing);






 Model LoadModel(const char *fileName);
 Model LoadModelFromMesh(Mesh mesh);
 bool IsModelReady(Model model);
 void UnloadModel(Model model);
 BoundingBox GetModelBoundingBox(Model model);


 void DrawModel(Model model, Vector3 position, float scale, Color tint);
 void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
 void DrawModelWires(Model model, Vector3 position, float scale, Color tint);
 void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
 void DrawBoundingBox(BoundingBox box, Color color);
 void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint);
 void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint);
 void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint);


 void UploadMesh(Mesh *mesh, bool dynamic);
 void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset);
 void UnloadMesh(Mesh mesh);
 void DrawMesh(Mesh mesh, Material material, Matrix transform);
 void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances);
 bool ExportMesh(Mesh mesh, const char *fileName);
 BoundingBox GetMeshBoundingBox(Mesh mesh);
 void GenMeshTangents(Mesh *mesh);


 Mesh GenMeshPoly(int sides, float radius);
 Mesh GenMeshPlane(float width, float length, int resX, int resZ);
 Mesh GenMeshCube(float width, float height, float length);
 Mesh GenMeshSphere(float radius, int rings, int slices);
 Mesh GenMeshHemiSphere(float radius, int rings, int slices);
 Mesh GenMeshCylinder(float radius, float height, int slices);
 Mesh GenMeshCone(float radius, float height, int slices);
 Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);
 Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);
 Mesh GenMeshHeightmap(Image heightmap, Vector3 size);
 Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);


 Material *LoadMaterials(const char *fileName, int *materialCount);
 Material LoadMaterialDefault(void);
 bool IsMaterialReady(Material material);
 void UnloadMaterial(Material material);
 void SetMaterialTexture(Material *material, int mapType, Texture2D texture);
 void SetModelMeshMaterial(Model *model, int meshId, int materialId);


 ModelAnimation *LoadModelAnimations(const char *fileName, int *animCount);
 void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);
 void UnloadModelAnimation(ModelAnimation anim);
 void UnloadModelAnimations(ModelAnimation *animations, int animCount);
 bool IsModelAnimationValid(Model model, ModelAnimation anim);


 bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2);
 bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);
 bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);
 RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius);
 RayCollision GetRayCollisionBox(Ray ray, BoundingBox box);
 RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);
 RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
 RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4);




typedef void (*AudioCallback)(void *bufferData, unsigned int frames);


 void InitAudioDevice(void);
 void CloseAudioDevice(void);
 bool IsAudioDeviceReady(void);
 void SetMasterVolume(float volume);
 float GetMasterVolume(void);


 Wave LoadWave(const char *fileName);
 Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize);
 bool IsWaveReady(Wave wave);
 Sound LoadSound(const char *fileName);
 Sound LoadSoundFromWave(Wave wave);
 Sound LoadSoundAlias(Sound source);
 bool IsSoundReady(Sound sound);
 void UpdateSound(Sound sound, const void *data, int sampleCount);
 void UnloadWave(Wave wave);
 void UnloadSound(Sound sound);
 void UnloadSoundAlias(Sound alias);
 bool ExportWave(Wave wave, const char *fileName);
 bool ExportWaveAsCode(Wave wave, const char *fileName);


 void PlaySound(Sound sound);
 void StopSound(Sound sound);
 void PauseSound(Sound sound);
 void ResumeSound(Sound sound);
 bool IsSoundPlaying(Sound sound);
 void SetSoundVolume(Sound sound, float volume);
 void SetSoundPitch(Sound sound, float pitch);
 void SetSoundPan(Sound sound, float pan);
 Wave WaveCopy(Wave wave);
 void WaveCrop(Wave *wave, int initSample, int finalSample);
 void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels);
 float *LoadWaveSamples(Wave wave);
 void UnloadWaveSamples(float *samples);


 Music LoadMusicStream(const char *fileName);
 Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize);
 bool IsMusicReady(Music music);
 void UnloadMusicStream(Music music);
 void PlayMusicStream(Music music);
 bool IsMusicStreamPlaying(Music music);
 void UpdateMusicStream(Music music);
 void StopMusicStream(Music music);
 void PauseMusicStream(Music music);
 void ResumeMusicStream(Music music);
 void SeekMusicStream(Music music, float position);
 void SetMusicVolume(Music music, float volume);
 void SetMusicPitch(Music music, float pitch);
 void SetMusicPan(Music music, float pan);
 float GetMusicTimeLength(Music music);
 float GetMusicTimePlayed(Music music);


 AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels);
 bool IsAudioStreamReady(AudioStream stream);
 void UnloadAudioStream(AudioStream stream);
 void UpdateAudioStream(AudioStream stream, const void *data, int frameCount);
 bool IsAudioStreamProcessed(AudioStream stream);
 void PlayAudioStream(AudioStream stream);
 void PauseAudioStream(AudioStream stream);
 void ResumeAudioStream(AudioStream stream);
 bool IsAudioStreamPlaying(AudioStream stream);
 void StopAudioStream(AudioStream stream);
 void SetAudioStreamVolume(AudioStream stream, float volume);
 void SetAudioStreamPitch(AudioStream stream, float pitch);
 void SetAudioStreamPan(AudioStream stream, float pan);
 void SetAudioStreamBufferSizeDefault(int size);
 void SetAudioStreamCallback(AudioStream stream, AudioCallback callback);

 void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor);
 void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor);

 void AttachAudioMixedProcessor(AudioCallback processor);
 void DetachAudioMixedProcessor(AudioCallback processor);


}
# 14 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp" 2
# 1 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raymath.h" 1
# 158 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raymath.h"
typedef struct float3 {
    float v[3];
} float3;

typedef struct float16 {
    float v[16];
} float16;

# 1 "C:/msys64/ucrt64/include/c++/14.2.0/math.h" 1 3
# 36 "C:/msys64/ucrt64/include/c++/14.2.0/math.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 1 3
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
       
# 40 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3

# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/requires_hosted.h" 1 3
# 31 "C:/msys64/ucrt64/include/c++/14.2.0/bits/requires_hosted.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 1 3
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
       
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
# 308 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3

# 308 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
namespace std
{
  typedef long long unsigned int size_t;
  typedef long long int ptrdiff_t;


  typedef decltype(nullptr) nullptr_t;


#pragma GCC visibility push(default)


  extern "C++" __attribute__ ((__noreturn__, __always_inline__))
  inline void __terminate() noexcept
  {
    void terminate() noexcept __attribute__ ((__noreturn__,__cold__));
    terminate();
  }
#pragma GCC visibility pop
}
# 341 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
namespace std
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
namespace __gnu_cxx
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
# 534 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
namespace std
{
#pragma GCC visibility push(default)




  __attribute__((__always_inline__))
  constexpr inline bool
  __is_constant_evaluated() noexcept
  {





    return __builtin_is_constant_evaluated();



  }
#pragma GCC visibility pop
}
# 573 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
namespace std
{
#pragma GCC visibility push(default)

  extern "C++" __attribute__ ((__noreturn__))
  void
  __glibcxx_assert_fail
    (const char* __file, int __line, const char* __function,
     const char* __condition)
  noexcept;
#pragma GCC visibility pop
}
# 601 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
namespace std
{
  __attribute__((__always_inline__,__visibility__("default")))
  inline void
  __glibcxx_assert_fail()
  { }
}
# 680 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/os_defines.h" 1 3
# 681 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 2 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/cpu_defines.h" 1 3
# 684 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 2 3
# 825 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
namespace __gnu_cxx
{
  typedef __decltype(0.0bf16) __bfloat16_t;
}
# 887 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/pstl/pstl_config.h" 1 3
# 888 "C:/msys64/ucrt64/include/c++/14.2.0/x86_64-w64-mingw32/bits/c++config.h" 2 3
# 32 "C:/msys64/ucrt64/include/c++/14.2.0/bits/requires_hosted.h" 2 3
# 42 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 1 3
# 35 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
       
# 36 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
# 67 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
extern "C++" {

namespace std
{


  struct __true_type { };
  struct __false_type { };

  template<bool>
    struct __truth_type
    { typedef __false_type __type; };

  template<>
    struct __truth_type<true>
    { typedef __true_type __type; };



  template<class _Sp, class _Tp>
    struct __traitor
    {
      enum { __value = bool(_Sp::__value) || bool(_Tp::__value) };
      typedef typename __truth_type<__value>::__type __type;
    };


  template<typename, typename>
    struct __are_same
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __are_same<_Tp, _Tp>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_void
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_void<void>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_integer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };





  template<>
    struct __is_integer<bool>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };



  template<>
    struct __is_integer<char8_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };



  template<>
    struct __is_integer<char16_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char32_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 272 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
__extension__ template<> struct __is_integer<__int128> { enum { __value = 1 }; typedef __true_type __type; }; __extension__ template<> struct __is_integer<unsigned __int128> { enum { __value = 1 }; typedef __true_type __type; };
# 289 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
  template<typename _Tp>
    struct __is_floating
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };


  template<>
    struct __is_floating<float>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<long double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 366 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
  template<typename _Tp>
    struct __is_pointer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __is_pointer<_Tp*>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_arithmetic
    : public __traitor<__is_integer<_Tp>, __is_floating<_Tp> >
    { };




  template<typename _Tp>
    struct __is_scalar
    : public __traitor<__is_arithmetic<_Tp>, __is_pointer<_Tp> >
    { };




  template<typename _Tp>
    struct __is_char
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_char<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_char<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_byte
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_byte<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  enum class byte : unsigned char;

  template<>
    struct __is_byte<byte>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };



  template<>
    struct __is_byte<char8_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename> struct iterator_traits;


  template<typename _Tp>
    struct __is_nonvolatile_trivially_copyable
    {
      enum { __value = __is_trivially_copyable(_Tp) };
    };




  template<typename _Tp>
    struct __is_nonvolatile_trivially_copyable<volatile _Tp>
    {
      enum { __value = 0 };
    };


  template<typename _OutputIter, typename _InputIter>
    struct __memcpyable
    {
      enum { __value = 0 };
    };

  template<typename _Tp>
    struct __memcpyable<_Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };

  template<typename _Tp>
    struct __memcpyable<_Tp*, const _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };






  template<typename _Iter1, typename _Iter2>
    struct __memcmpable
    {
      enum { __value = 0 };
    };


  template<typename _Tp>
    struct __memcmpable<_Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };

  template<typename _Tp>
    struct __memcmpable<const _Tp*, _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };

  template<typename _Tp>
    struct __memcmpable<_Tp*, const _Tp*>
    : __is_nonvolatile_trivially_copyable<_Tp>
    { };







  template<typename _Tp, bool _TreatAsBytes =



 __is_byte<_Tp>::__value

    >
    struct __is_memcmp_ordered
    {
      static const bool __value = _Tp(-1) > _Tp(1);
    };

  template<typename _Tp>
    struct __is_memcmp_ordered<_Tp, false>
    {
      static const bool __value = false;
    };


  template<typename _Tp, typename _Up, bool = sizeof(_Tp) == sizeof(_Up)>
    struct __is_memcmp_ordered_with
    {
      static const bool __value = __is_memcmp_ordered<_Tp>::__value
 && __is_memcmp_ordered<_Up>::__value;
    };

  template<typename _Tp, typename _Up>
    struct __is_memcmp_ordered_with<_Tp, _Up, false>
    {
      static const bool __value = false;
    };
# 579 "C:/msys64/ucrt64/include/c++/14.2.0/bits/cpp_type_traits.h" 3
  template<>
    struct __is_memcmp_ordered_with<std::byte, std::byte, true>
    { static constexpr bool __value = true; };

  template<typename _Tp, bool _SameSize>
    struct __is_memcmp_ordered_with<_Tp, std::byte, _SameSize>
    { static constexpr bool __value = false; };

  template<typename _Up, bool _SameSize>
    struct __is_memcmp_ordered_with<std::byte, _Up, _SameSize>
    { static constexpr bool __value = false; };





  template<typename _Tp>
    struct __is_move_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };



  template<typename _Iterator>
    constexpr
    inline _Iterator
    __miter_base(_Iterator __it)
    { return __it; }


}
}
# 45 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/ext/type_traits.h" 1 3
# 32 "C:/msys64/ucrt64/include/c++/14.2.0/ext/type_traits.h" 3
       
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/ext/type_traits.h" 3




extern "C++" {

namespace __gnu_cxx
{



  template<bool, typename>
    struct __enable_if
    { };

  template<typename _Tp>
    struct __enable_if<true, _Tp>
    { typedef _Tp __type; };



  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct __conditional_type
    { typedef _Iftrue __type; };

  template<typename _Iftrue, typename _Iffalse>
    struct __conditional_type<false, _Iftrue, _Iffalse>
    { typedef _Iffalse __type; };



  template<typename _Tp>
    struct __add_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __add_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __add_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __add_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __add_unsigned<long long>
    { typedef unsigned long long __type; };


  template<>
    struct __add_unsigned<bool>;

  template<>
    struct __add_unsigned<wchar_t>;



  template<typename _Tp>
    struct __remove_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __remove_unsigned<char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned short>
    { typedef short __type; };

  template<>
    struct __remove_unsigned<unsigned int>
    { typedef int __type; };

  template<>
    struct __remove_unsigned<unsigned long>
    { typedef long __type; };

  template<>
    struct __remove_unsigned<unsigned long long>
    { typedef long long __type; };


  template<>
    struct __remove_unsigned<bool>;

  template<>
    struct __remove_unsigned<wchar_t>;



  template<typename _Type>
    constexpr
    inline bool
    __is_null_pointer(_Type* __ptr)
    { return __ptr == 0; }

  template<typename _Type>
    constexpr
    inline bool
    __is_null_pointer(_Type)
    { return false; }


  constexpr bool
  __is_null_pointer(std::nullptr_t)
  { return true; }




  template<typename _Tp, bool = std::__is_integer<_Tp>::__value>
    struct __promote
    { typedef double __type; };




  template<typename _Tp>
    struct __promote<_Tp, false>
    { };

  template<>
    struct __promote<long double>
    { typedef long double __type; };

  template<>
    struct __promote<double>
    { typedef double __type; };

  template<>
    struct __promote<float>
    { typedef float __type; };
# 225 "C:/msys64/ucrt64/include/c++/14.2.0/ext/type_traits.h" 3
  template<typename... _Tp>
    using __promoted_t = decltype((typename __promote<_Tp>::__type(0) + ...));



  template<typename _Tp, typename _Up>
    using __promote_2 = __promote<__promoted_t<_Tp, _Up>>;

  template<typename _Tp, typename _Up, typename _Vp>
    using __promote_3 = __promote<__promoted_t<_Tp, _Up, _Vp>>;

  template<typename _Tp, typename _Up, typename _Vp, typename _Wp>
    using __promote_4 = __promote<__promoted_t<_Tp, _Up, _Vp, _Wp>>;
# 269 "C:/msys64/ucrt64/include/c++/14.2.0/ext/type_traits.h" 3

}
}
# 46 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3

# 1 "C:/msys64/ucrt64/include/math.h" 1 3
# 10 "C:/msys64/ucrt64/include/math.h" 3
       
# 11 "C:/msys64/ucrt64/include/math.h" 3


# 1 "C:/msys64/ucrt64/include/crtdefs.h" 1 3
# 10 "C:/msys64/ucrt64/include/crtdefs.h" 3
# 1 "C:/msys64/ucrt64/include/corecrt.h" 1 3
# 10 "C:/msys64/ucrt64/include/corecrt.h" 3
# 1 "C:/msys64/ucrt64/include/_mingw.h" 1 3
# 11 "C:/msys64/ucrt64/include/corecrt.h" 2 3




#pragma pack(push,_CRT_PACKING)
# 35 "C:/msys64/ucrt64/include/corecrt.h" 3
__extension__ typedef unsigned long long size_t;
# 45 "C:/msys64/ucrt64/include/corecrt.h" 3
__extension__ typedef long long ssize_t;






typedef size_t rsize_t;
# 62 "C:/msys64/ucrt64/include/corecrt.h" 3
__extension__ typedef long long intptr_t;
# 75 "C:/msys64/ucrt64/include/corecrt.h" 3
__extension__ typedef unsigned long long uintptr_t;
# 88 "C:/msys64/ucrt64/include/corecrt.h" 3
__extension__ typedef long long ptrdiff_t;
# 106 "C:/msys64/ucrt64/include/corecrt.h" 3
typedef unsigned short wint_t;
typedef unsigned short wctype_t;





typedef int errno_t;




typedef long __time32_t;




__extension__ typedef long long __time64_t;
# 138 "C:/msys64/ucrt64/include/corecrt.h" 3
typedef __time64_t time_t;
# 430 "C:/msys64/ucrt64/include/corecrt.h" 3
struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct *pthreadlocinfo;
typedef struct threadmbcinfostruct *pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct {
  pthreadlocinfo locinfo;
  pthreadmbcinfo mbcinfo;
} _locale_tstruct,*_locale_t;



typedef struct tagLC_ID {
  unsigned short wLanguage;
  unsigned short wCountry;
  unsigned short wCodePage;
} LC_ID,*LPLC_ID;




typedef struct threadlocaleinfostruct {

  const unsigned short *_locale_pctype;
  int _locale_mb_cur_max;
  unsigned int _locale_lc_codepage;
# 482 "C:/msys64/ucrt64/include/corecrt.h" 3
} threadlocinfo;
# 501 "C:/msys64/ucrt64/include/corecrt.h" 3
#pragma pack(pop)
# 11 "C:/msys64/ucrt64/include/crtdefs.h" 2 3
# 14 "C:/msys64/ucrt64/include/math.h" 2 3

struct _exception;

#pragma pack(push,_CRT_PACKING)
# 75 "C:/msys64/ucrt64/include/math.h" 3
extern "C++" {
template <typename type1, typename type2> struct __mingw_types_compatible_p {
  static const bool result = false;
};

template <typename type1> struct __mingw_types_compatible_p<type1, type1> {
 static const bool result = true;
};

template <typename type1> struct __mingw_types_compatible_p<const type1, type1> {
  static const bool result = true;
};

template <typename type1> struct __mingw_types_compatible_p<type1, const type1> {
  static const bool result = true;
};
}
# 109 "C:/msys64/ucrt64/include/math.h" 3
extern "C" {







  typedef union __mingw_dbl_type_t {
    double x;
    unsigned long long val;
    __extension__ struct {
      unsigned int low, high;
    } lh;
  } __mingw_dbl_type_t;

  typedef union __mingw_flt_type_t {
    float x;
    unsigned int val;
  } __mingw_flt_type_t;

  typedef union __mingw_ldbl_type_t
  {
    long double x;
    __extension__ struct {
      unsigned int low, high;
      int sign_exponent : 16;
      int res1 : 16;
      int res0 : 32;
    } lh;
  } __mingw_ldbl_type_t;




  extern double * __imp__HUGE;
# 156 "C:/msys64/ucrt64/include/math.h" 3
  struct _exception {
    int type;
    const char *name;
    double arg1;
    double arg2;
    double retval;
  };

  void __mingw_raise_matherr (int typ, const char *name, double a1, double a2,
         double rslt);
  void __mingw_setusermatherr (int (__attribute__((__cdecl__)) *)(struct _exception *));
  __attribute__ ((__dllimport__)) void __setusermatherr(int (__attribute__((__cdecl__)) *)(struct _exception *));



  double __attribute__((__cdecl__)) sin(double _X);
  double __attribute__((__cdecl__)) cos(double _X);
  double __attribute__((__cdecl__)) tan(double _X);
  double __attribute__((__cdecl__)) sinh(double _X);
  double __attribute__((__cdecl__)) cosh(double _X);
  double __attribute__((__cdecl__)) tanh(double _X);
  double __attribute__((__cdecl__)) asin(double _X);
  double __attribute__((__cdecl__)) acos(double _X);
  double __attribute__((__cdecl__)) atan(double _X);
  double __attribute__((__cdecl__)) atan2(double _Y,double _X);
  double __attribute__((__cdecl__)) exp(double _X);
  double __attribute__((__cdecl__)) log(double _X);
  double __attribute__((__cdecl__)) log10(double _X);
  double __attribute__((__cdecl__)) pow(double _X,double _Y);
  double __attribute__((__cdecl__)) sqrt(double _X);
  double __attribute__((__cdecl__)) ceil(double _X);
  double __attribute__((__cdecl__)) floor(double _X);


  extern float __attribute__((__cdecl__)) fabsf (float x);
  extern long double __attribute__((__cdecl__)) fabsl (long double);
  extern double __attribute__((__cdecl__)) fabs (double _X);
# 231 "C:/msys64/ucrt64/include/math.h" 3
  double __attribute__((__cdecl__)) ldexp(double _X,int _Y);
  double __attribute__((__cdecl__)) frexp(double _X,int *_Y);
  double __attribute__((__cdecl__)) modf(double _X,double *_Y);
  double __attribute__((__cdecl__)) fmod(double _X,double _Y);

  void __attribute__((__cdecl__)) sincos (double __x, double *p_sin, double *p_cos);
  void __attribute__((__cdecl__)) sincosl (long double __x, long double *p_sin, long double *p_cos);
  void __attribute__((__cdecl__)) sincosf (float __x, float *p_sin, float *p_cos);



  int __attribute__((__cdecl__)) abs(int _X);
  long __attribute__((__cdecl__)) labs(long _X);



  double __attribute__((__cdecl__)) atof(const char *_String);
  double __attribute__((__cdecl__)) _atof_l(const char *_String,_locale_t _Locale);







  struct _complex {
    double x;
    double y;
  };


  double __attribute__((__cdecl__)) _cabs(struct _complex _ComplexA);
  double __attribute__((__cdecl__)) _hypot(double _X,double _Y);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _j0(double _X);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _j1(double _X);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _jn(int _X,double _Y);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _y0(double _X);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _y1(double _X);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _yn(int _X,double _Y);


  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _matherr (struct _exception *);
# 283 "C:/msys64/ucrt64/include/math.h" 3
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _chgsign (double _X);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _copysign (double _Number,double _Sign);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _logb (double);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _nextafter (double, double);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _scalb (double, long);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _finite (double);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fpclass (double);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _isnan (double);






__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) j0 (double) ;
__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) j1 (double) ;
__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) jn (int, double) ;
__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) y0 (double) ;
__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) y1 (double) ;
__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) yn (int, double) ;



__attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) chgsign (double);
# 315 "C:/msys64/ucrt64/include/math.h" 3
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) finite (double);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) fpclass (double);
# 359 "C:/msys64/ucrt64/include/math.h" 3
typedef float float_t;
typedef double double_t;
# 394 "C:/msys64/ucrt64/include/math.h" 3
  extern int __attribute__((__cdecl__)) __fpclassifyl (long double);
  extern int __attribute__((__cdecl__)) __fpclassifyf (float);
  extern int __attribute__((__cdecl__)) __fpclassify (double);
# 507 "C:/msys64/ucrt64/include/math.h" 3
  extern int __attribute__((__cdecl__)) __isnan (double);
  extern int __attribute__((__cdecl__)) __isnanf (float);
  extern int __attribute__((__cdecl__)) __isnanl (long double);
# 594 "C:/msys64/ucrt64/include/math.h" 3
  extern int __attribute__((__cdecl__)) __signbit (double);
  extern int __attribute__((__cdecl__)) __signbitf (float);
  extern int __attribute__((__cdecl__)) __signbitl (long double);
# 651 "C:/msys64/ucrt64/include/math.h" 3
  extern float __attribute__((__cdecl__)) sinf(float _X);
  extern long double __attribute__((__cdecl__)) sinl(long double);

  extern float __attribute__((__cdecl__)) cosf(float _X);
  extern long double __attribute__((__cdecl__)) cosl(long double);

  extern float __attribute__((__cdecl__)) tanf(float _X);
  extern long double __attribute__((__cdecl__)) tanl(long double);
  extern float __attribute__((__cdecl__)) asinf(float _X);
  extern long double __attribute__((__cdecl__)) asinl(long double);

  extern float __attribute__((__cdecl__)) acosf (float);
  extern long double __attribute__((__cdecl__)) acosl (long double);

  extern float __attribute__((__cdecl__)) atanf (float);
  extern long double __attribute__((__cdecl__)) atanl (long double);

  extern float __attribute__((__cdecl__)) atan2f (float, float);
  extern long double __attribute__((__cdecl__)) atan2l (long double, long double);


  extern float __attribute__((__cdecl__)) sinhf(float _X);



  extern long double __attribute__((__cdecl__)) sinhl(long double);

  extern float __attribute__((__cdecl__)) coshf(float _X);



  extern long double __attribute__((__cdecl__)) coshl(long double);

  extern float __attribute__((__cdecl__)) tanhf(float _X);



  extern long double __attribute__((__cdecl__)) tanhl(long double);



  extern double __attribute__((__cdecl__)) acosh (double);
  extern float __attribute__((__cdecl__)) acoshf (float);
  extern long double __attribute__((__cdecl__)) acoshl (long double);


  extern double __attribute__((__cdecl__)) asinh (double);
  extern float __attribute__((__cdecl__)) asinhf (float);
  extern long double __attribute__((__cdecl__)) asinhl (long double);


  extern double __attribute__((__cdecl__)) atanh (double);
  extern float __attribute__((__cdecl__)) atanhf (float);
  extern long double __attribute__((__cdecl__)) atanhl (long double);



  extern float __attribute__((__cdecl__)) expf(float _X);



  extern long double __attribute__((__cdecl__)) expl(long double);


  extern double __attribute__((__cdecl__)) exp2(double);
  extern float __attribute__((__cdecl__)) exp2f(float);
  extern long double __attribute__((__cdecl__)) exp2l(long double);



  extern double __attribute__((__cdecl__)) expm1(double);
  extern float __attribute__((__cdecl__)) expm1f(float);
  extern long double __attribute__((__cdecl__)) expm1l(long double);


  extern float frexpf(float _X,int *_Y);



  extern long double __attribute__((__cdecl__)) frexpl(long double,int *);




  extern int __attribute__((__cdecl__)) ilogb (double);
  extern int __attribute__((__cdecl__)) ilogbf (float);
  extern int __attribute__((__cdecl__)) ilogbl (long double);


  extern float __attribute__((__cdecl__)) ldexpf(float _X,int _Y);



  extern long double __attribute__((__cdecl__)) ldexpl (long double, int);


  extern float __attribute__((__cdecl__)) logf (float);
  extern long double __attribute__((__cdecl__)) logl(long double);


  extern float __attribute__((__cdecl__)) log10f (float);
  extern long double __attribute__((__cdecl__)) log10l(long double);


  extern double __attribute__((__cdecl__)) log1p(double);
  extern float __attribute__((__cdecl__)) log1pf(float);
  extern long double __attribute__((__cdecl__)) log1pl(long double);


  extern double __attribute__((__cdecl__)) log2 (double);
  extern float __attribute__((__cdecl__)) log2f (float);
  extern long double __attribute__((__cdecl__)) log2l (long double);


  extern double __attribute__((__cdecl__)) logb (double);
  extern float __attribute__((__cdecl__)) logbf (float);
  extern long double __attribute__((__cdecl__)) logbl (long double);
# 854 "C:/msys64/ucrt64/include/math.h" 3
  extern float __attribute__((__cdecl__)) modff (float, float*);
  extern long double __attribute__((__cdecl__)) modfl (long double, long double*);


  extern double __attribute__((__cdecl__)) scalbn (double, int);
  extern float __attribute__((__cdecl__)) scalbnf (float, int);
  extern long double __attribute__((__cdecl__)) scalbnl (long double, int);

  extern double __attribute__((__cdecl__)) scalbln (double, long);
  extern float __attribute__((__cdecl__)) scalblnf (float, long);
  extern long double __attribute__((__cdecl__)) scalblnl (long double, long);



  extern double __attribute__((__cdecl__)) cbrt (double);
  extern float __attribute__((__cdecl__)) cbrtf (float);
  extern long double __attribute__((__cdecl__)) cbrtl (long double);


  extern double __attribute__((__cdecl__)) hypot (double, double) ;
  extern float __attribute__((__cdecl__)) hypotf (float x, float y);



  extern long double __attribute__((__cdecl__)) hypotl (long double, long double);


  extern float __attribute__((__cdecl__)) powf(float _X,float _Y);



  extern long double __attribute__((__cdecl__)) powl (long double, long double);


  extern float __attribute__((__cdecl__)) sqrtf (float);
  extern long double sqrtl(long double);


  extern double __attribute__((__cdecl__)) erf (double);
  extern float __attribute__((__cdecl__)) erff (float);
  extern long double __attribute__((__cdecl__)) erfl (long double);


  extern double __attribute__((__cdecl__)) erfc (double);
  extern float __attribute__((__cdecl__)) erfcf (float);
  extern long double __attribute__((__cdecl__)) erfcl (long double);


  extern double __attribute__((__cdecl__)) lgamma (double);
  extern float __attribute__((__cdecl__)) lgammaf (float);
  extern long double __attribute__((__cdecl__)) lgammal (long double);

  extern int signgam;


  extern double __attribute__((__cdecl__)) tgamma (double);
  extern float __attribute__((__cdecl__)) tgammaf (float);
  extern long double __attribute__((__cdecl__)) tgammal (long double);


  extern float __attribute__((__cdecl__)) ceilf (float);
  extern long double __attribute__((__cdecl__)) ceill (long double);


  extern float __attribute__((__cdecl__)) floorf (float);
  extern long double __attribute__((__cdecl__)) floorl (long double);


  extern double __attribute__((__cdecl__)) nearbyint ( double);
  extern float __attribute__((__cdecl__)) nearbyintf (float);
  extern long double __attribute__((__cdecl__)) nearbyintl (long double);



extern double __attribute__((__cdecl__)) rint (double);
extern float __attribute__((__cdecl__)) rintf (float);
extern long double __attribute__((__cdecl__)) rintl (long double);


extern long __attribute__((__cdecl__)) lrint (double);
extern long __attribute__((__cdecl__)) lrintf (float);
extern long __attribute__((__cdecl__)) lrintl (long double);

__extension__ long long __attribute__((__cdecl__)) llrint (double);
__extension__ long long __attribute__((__cdecl__)) llrintf (float);
__extension__ long long __attribute__((__cdecl__)) llrintl (long double);
# 1021 "C:/msys64/ucrt64/include/math.h" 3
  extern double __attribute__((__cdecl__)) round (double);
  extern float __attribute__((__cdecl__)) roundf (float);
  extern long double __attribute__((__cdecl__)) roundl (long double);


  extern long __attribute__((__cdecl__)) lround (double);
  extern long __attribute__((__cdecl__)) lroundf (float);
  extern long __attribute__((__cdecl__)) lroundl (long double);
  __extension__ long long __attribute__((__cdecl__)) llround (double);
  __extension__ long long __attribute__((__cdecl__)) llroundf (float);
  __extension__ long long __attribute__((__cdecl__)) llroundl (long double);



  extern double __attribute__((__cdecl__)) trunc (double);
  extern float __attribute__((__cdecl__)) truncf (float);
  extern long double __attribute__((__cdecl__)) truncl (long double);


  extern float __attribute__((__cdecl__)) fmodf (float, float);
  extern long double __attribute__((__cdecl__)) fmodl (long double, long double);


  extern double __attribute__((__cdecl__)) remainder (double, double);
  extern float __attribute__((__cdecl__)) remainderf (float, float);
  extern long double __attribute__((__cdecl__)) remainderl (long double, long double);


  extern double __attribute__((__cdecl__)) remquo(double, double, int *);
  extern float __attribute__((__cdecl__)) remquof(float, float, int *);
  extern long double __attribute__((__cdecl__)) remquol(long double, long double, int *);


  extern double __attribute__((__cdecl__)) copysign (double, double);
  extern float __attribute__((__cdecl__)) copysignf (float, float);
  extern long double __attribute__((__cdecl__)) copysignl (long double, long double);
# 1078 "C:/msys64/ucrt64/include/math.h" 3
  extern double __attribute__((__cdecl__)) nan(const char *tagp);
  extern float __attribute__((__cdecl__)) nanf(const char *tagp);
  extern long double __attribute__((__cdecl__)) nanl(const char *tagp);
# 1089 "C:/msys64/ucrt64/include/math.h" 3
  extern double __attribute__((__cdecl__)) nextafter (double, double);
  extern float __attribute__((__cdecl__)) nextafterf (float, float);
  extern long double __attribute__((__cdecl__)) nextafterl (long double, long double);


  extern double __attribute__((__cdecl__)) nexttoward (double, long double);
  extern float __attribute__((__cdecl__)) nexttowardf (float, long double);
  extern long double __attribute__((__cdecl__)) nexttowardl (long double, long double);



  extern double __attribute__((__cdecl__)) fdim (double x, double y);
  extern float __attribute__((__cdecl__)) fdimf (float x, float y);
  extern long double __attribute__((__cdecl__)) fdiml (long double x, long double y);







  extern double __attribute__((__cdecl__)) fmax (double, double);
  extern float __attribute__((__cdecl__)) fmaxf (float, float);
  extern long double __attribute__((__cdecl__)) fmaxl (long double, long double);


  extern double __attribute__((__cdecl__)) fmin (double, double);
  extern float __attribute__((__cdecl__)) fminf (float, float);
  extern long double __attribute__((__cdecl__)) fminl (long double, long double);



  extern double __attribute__((__cdecl__)) fma (double, double, double);
  extern float __attribute__((__cdecl__)) fmaf (float, float, float);
  extern long double __attribute__((__cdecl__)) fmal (long double, long double, long double);
# 1172 "C:/msys64/ucrt64/include/math.h" 3
   __attribute__ ((__dllimport__)) float __attribute__((__cdecl__)) _copysignf (float _Number,float _Sign);
   __attribute__ ((__dllimport__)) float __attribute__((__cdecl__)) _chgsignf (float _X);
   __attribute__ ((__dllimport__)) float __attribute__((__cdecl__)) _logbf(float _X);
   __attribute__ ((__dllimport__)) float __attribute__((__cdecl__)) _nextafterf(float _X,float _Y);
   __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _finitef(float _X);
   __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _isnanf(float _X);
   __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _fpclassf(float _X);



   extern long double __attribute__((__cdecl__)) _chgsignl (long double);
# 1567 "C:/msys64/ucrt64/include/math.h" 3
}




#pragma pack(pop)
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3

# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/std_abs.h" 1 3
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/bits/std_abs.h" 3
       
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/bits/std_abs.h" 3




# 1 "C:/msys64/ucrt64/include/stdlib.h" 1 3
# 10 "C:/msys64/ucrt64/include/stdlib.h" 3
# 1 "C:/msys64/ucrt64/include/corecrt_wstdlib.h" 1 3
# 12 "C:/msys64/ucrt64/include/corecrt_wstdlib.h" 3
extern "C" {


  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _itow_s (int _Val,wchar_t *_DstBuf,size_t _SizeInWords,int _Radix);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _itow_s(int _Val, wchar_t (&_DstBuf)[__size], int _Radix) { return _itow_s(_Val, _DstBuf, __size, _Radix); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ltow_s (long _Val,wchar_t *_DstBuf,size_t _SizeInWords,int _Radix);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _ltow_s(long _Val, wchar_t (&_DstBuf)[__size], int _Radix) { return _ltow_s(_Val, _DstBuf, __size, _Radix); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ultow_s (unsigned long _Val,wchar_t *_DstBuf,size_t _SizeInWords,int _Radix);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _ultow_s(unsigned long _Val, wchar_t (&_DstBuf)[__size], int _Radix) { return _ultow_s(_Val, _DstBuf, __size, _Radix); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wgetenv_s(size_t *_ReturnSize,wchar_t *_DstBuf,size_t _DstSizeInWords,const wchar_t *_VarName);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wgetenv_s(size_t* _ReturnSize, wchar_t (&_DstBuf)[__size], const wchar_t* _VarName) { return _wgetenv_s(_ReturnSize, _DstBuf, __size, _VarName); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wdupenv_s(wchar_t **_Buffer,size_t *_BufferSizeInWords,const wchar_t *_VarName);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _i64tow_s(long long _Val,wchar_t *_DstBuf,size_t _SizeInWords,int _Radix);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ui64tow_s(unsigned long long _Val,wchar_t *_DstBuf,size_t _SizeInWords,int _Radix);

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wmakepath_s(wchar_t *_PathResult,size_t _SizeInWords,const wchar_t *_Drive,const wchar_t *_Dir,const wchar_t *_Filename,const wchar_t *_Ext);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wmakepath_s(wchar_t (&_PathResult)[__size], const wchar_t* _Drive, const wchar_t* _Dir, const wchar_t* _Filename, const wchar_t* _Ext) { return _wmakepath_s(_PathResult,__size,_Drive,_Dir,_Filename,_Ext); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wputenv_s(const wchar_t *_Name,const wchar_t *_Value);

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wsearchenv_s(const wchar_t *_Filename,const wchar_t *_EnvVar,wchar_t *_ResultPath,size_t _SizeInWords);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wsearchenv_s(const wchar_t* _Filename, const wchar_t* _EnvVar, wchar_t (&_ResultPath)[__size]) { return _wsearchenv_s(_Filename, _EnvVar, _ResultPath, __size); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wsplitpath_s(const wchar_t *_FullPath,wchar_t *_Drive,size_t _DriveSizeInWords,wchar_t *_Dir,size_t _DirSizeInWords,wchar_t *_Filename,size_t _FilenameSizeInWords,wchar_t *_Ext,size_t _ExtSizeInWords);
  extern "C++" { template <size_t __drive_size, size_t __dir_size, size_t __name_size, size_t __ext_size> inline errno_t __attribute__((__cdecl__)) _wsplitpath_s(const wchar_t *_Dest, wchar_t (&__drive)[__drive_size], wchar_t (&__dir)[__dir_size], wchar_t (&__name)[__name_size], wchar_t (&__ext)[__ext_size]) { return _wsplitpath_s(_Dest, __drive, __drive_size, __dir, __dir_size, __name, __name_size, __ext, __ext_size); } }


}
# 11 "C:/msys64/ucrt64/include/stdlib.h" 2 3
# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/limits.h" 1 3 4
# 34 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/limits.h" 3 4
# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/syslimits.h" 1 3 4






# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/limits.h" 1 3 4
# 210 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/limits.h" 3 4
# 1 "C:/msys64/ucrt64/include/limits.h" 1 3 4
# 211 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/limits.h" 2 3 4
# 8 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/syslimits.h" 2 3 4
# 35 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/limits.h" 2 3 4
# 12 "C:/msys64/ucrt64/include/stdlib.h" 2 3
# 26 "C:/msys64/ucrt64/include/stdlib.h" 3
#pragma pack(push,_CRT_PACKING)


extern "C" {
# 50 "C:/msys64/ucrt64/include/stdlib.h" 3
  typedef int (__attribute__((__cdecl__)) *_onexit_t)(void);
# 60 "C:/msys64/ucrt64/include/stdlib.h" 3
  typedef struct _div_t {
    int quot;
    int rem;
  } div_t;

  typedef struct _ldiv_t {
    long quot;
    long rem;
  } ldiv_t;





#pragma pack(4)
  typedef struct {
    unsigned char ld[10];
  } _LDOUBLE;
#pragma pack()



  typedef struct {
    double x;
  } _CRT_DOUBLE;

  typedef struct {
    float f;
  } _CRT_FLOAT;

       


  typedef struct {
    long double x;
  } _LONGDOUBLE;

       

#pragma pack(4)
  typedef struct {
    unsigned char ld12[12];
  } _LDBL12;
#pragma pack()
# 113 "C:/msys64/ucrt64/include/stdlib.h" 3
__attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) ___mb_cur_max_func(void);
# 135 "C:/msys64/ucrt64/include/stdlib.h" 3
  typedef void (__attribute__((__cdecl__)) *_purecall_handler)(void);

  __attribute__ ((__dllimport__)) _purecall_handler __attribute__((__cdecl__)) _set_purecall_handler(_purecall_handler _Handler);
  __attribute__ ((__dllimport__)) _purecall_handler __attribute__((__cdecl__)) _get_purecall_handler(void);

  typedef void (__attribute__((__cdecl__)) *_invalid_parameter_handler)(const wchar_t *,const wchar_t *,const wchar_t *,unsigned int,uintptr_t);
  __attribute__ ((__dllimport__)) _invalid_parameter_handler __attribute__((__cdecl__)) _set_invalid_parameter_handler(_invalid_parameter_handler _Handler);
  __attribute__ ((__dllimport__)) _invalid_parameter_handler __attribute__((__cdecl__)) _get_invalid_parameter_handler(void);



  __attribute__ ((__dllimport__)) extern int *__attribute__((__cdecl__)) _errno(void);

  errno_t __attribute__((__cdecl__)) _set_errno(int _Value);
  errno_t __attribute__((__cdecl__)) _get_errno(int *_Value);

  __attribute__ ((__dllimport__)) unsigned long *__attribute__((__cdecl__)) __doserrno(void);

  errno_t __attribute__((__cdecl__)) _set_doserrno(unsigned long _Value);
  errno_t __attribute__((__cdecl__)) _get_doserrno(unsigned long *_Value);
  __attribute__ ((__dllimport__)) char **__attribute__((__cdecl__)) __sys_errlist(void);
  __attribute__ ((__dllimport__)) int *__attribute__((__cdecl__)) __sys_nerr(void);



  __attribute__ ((__dllimport__)) char ***__attribute__((__cdecl__)) __p___argv(void);
  __attribute__ ((__dllimport__)) int *__attribute__((__cdecl__)) __p__fmode(void);
  __attribute__ ((__dllimport__)) int *__attribute__((__cdecl__)) __p___argc(void);
  __attribute__ ((__dllimport__)) wchar_t ***__attribute__((__cdecl__)) __p___wargv(void);
  __attribute__ ((__dllimport__)) char **__attribute__((__cdecl__)) __p__pgmptr(void);
  __attribute__ ((__dllimport__)) wchar_t **__attribute__((__cdecl__)) __p__wpgmptr(void);

  errno_t __attribute__((__cdecl__)) _get_pgmptr(char **_Value);
  errno_t __attribute__((__cdecl__)) _get_wpgmptr(wchar_t **_Value);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _set_fmode(int _Mode);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _get_fmode(int *_PMode);
# 221 "C:/msys64/ucrt64/include/stdlib.h" 3
  __attribute__ ((__dllimport__)) char ***__attribute__((__cdecl__)) __p__environ(void);
  __attribute__ ((__dllimport__)) wchar_t ***__attribute__((__cdecl__)) __p__wenviron(void);
# 235 "C:/msys64/ucrt64/include/stdlib.h" 3
  extern unsigned int * __imp__osplatform;




  extern unsigned int * __imp__osver;




  extern unsigned int * __imp__winver;




  extern unsigned int * __imp__winmajor;




  extern unsigned int * __imp__winminor;



  errno_t __attribute__((__cdecl__)) _get_osplatform(unsigned int *_Value);
  errno_t __attribute__((__cdecl__)) _get_osver(unsigned int *_Value);
  errno_t __attribute__((__cdecl__)) _get_winver(unsigned int *_Value);
  errno_t __attribute__((__cdecl__)) _get_winmajor(unsigned int *_Value);
  errno_t __attribute__((__cdecl__)) _get_winminor(unsigned int *_Value);




  extern "C++" {
    template <typename _CountofType,size_t _SizeOfArray> char (*__countof_helper( _CountofType (&_Array)[_SizeOfArray]))[_SizeOfArray];

  }





  void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) exit(int _Code) __attribute__ ((__noreturn__));
  void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _exit(int _Code) __attribute__ ((__noreturn__));

  void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) quick_exit(int _Code) __attribute__ ((__noreturn__));




  void __attribute__((__cdecl__)) _Exit(int) __attribute__ ((__noreturn__));






       

  void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) abort(void);
       



  __attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) _set_abort_behavior(unsigned int _Flags,unsigned int _Mask);







  __extension__ long long __attribute__((__cdecl__)) _abs64(long long);

  extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) long long __attribute__((__cdecl__)) _abs64(long long x) {
    return __builtin_llabs(x);
  }


  int __attribute__((__cdecl__)) atexit(void (__attribute__((__cdecl__)) *)(void));

  int __attribute__((__cdecl__)) at_quick_exit(void (__attribute__((__cdecl__)) *)(void));






  int __attribute__((__cdecl__)) atoi(const char *_Str);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atoi_l(const char *_Str,_locale_t _Locale);
  long __attribute__((__cdecl__)) atol(const char *_Str);
  __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _atol_l(const char *_Str,_locale_t _Locale);


  void *__attribute__((__cdecl__)) bsearch(const void *_Key,const void *_Base,size_t _NumOfElements,size_t _SizeOfElements,int (__attribute__((__cdecl__)) *_PtFuncCompare)(const void *,const void *));
  void __attribute__((__cdecl__)) qsort(void *_Base,size_t _NumOfElements,size_t _SizeOfElements,int (__attribute__((__cdecl__)) *_PtFuncCompare)(const void *,const void *));

  unsigned short __attribute__((__cdecl__)) _byteswap_ushort(unsigned short _Short);
  unsigned long __attribute__((__cdecl__)) _byteswap_ulong (unsigned long _Long);
  __extension__ unsigned long long __attribute__((__cdecl__)) _byteswap_uint64(unsigned long long _Int64);
  div_t __attribute__((__cdecl__)) div(int _Numerator,int _Denominator);
  char *__attribute__((__cdecl__)) getenv(const char *_VarName) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _itoa(int _Value,char *_Dest,int _Radix);
  __extension__ __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _i64toa(long long _Val,char *_DstBuf,int _Radix) ;
  __extension__ __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _ui64toa(unsigned long long _Val,char *_DstBuf,int _Radix) ;
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _atoi64(const char *_String);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _atoi64_l(const char *_String,_locale_t _Locale);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _strtoi64(const char *_String,char **_EndPtr,int _Radix);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _strtoi64_l(const char *_String,char **_EndPtr,int _Radix,_locale_t _Locale);
  __extension__ __attribute__ ((__dllimport__)) unsigned long long __attribute__((__cdecl__)) _strtoui64(const char *_String,char **_EndPtr,int _Radix);
  __extension__ __attribute__ ((__dllimport__)) unsigned long long __attribute__((__cdecl__)) _strtoui64_l(const char *_String,char **_EndPtr,int _Radix,_locale_t _Locale);
  ldiv_t __attribute__((__cdecl__)) ldiv(long _Numerator,long _Denominator);
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _ltoa(long _Value,char *_Dest,int _Radix) ;
  int __attribute__((__cdecl__)) mblen(const char *_Ch,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _mblen_l(const char *_Ch,size_t _MaxCount,_locale_t _Locale);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _mbstrlen(const char *_Str);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _mbstrlen_l(const char *_Str,_locale_t _Locale);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _mbstrnlen(const char *_Str,size_t _MaxCount);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _mbstrnlen_l(const char *_Str,size_t _MaxCount,_locale_t _Locale);
  int __attribute__((__cdecl__)) mbtowc(wchar_t * __restrict__ _DstCh,const char * __restrict__ _SrcCh,size_t _SrcSizeInBytes);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _mbtowc_l(wchar_t * __restrict__ _DstCh,const char * __restrict__ _SrcCh,size_t _SrcSizeInBytes,_locale_t _Locale);
  size_t __attribute__((__cdecl__)) mbstowcs(wchar_t * __restrict__ _Dest,const char * __restrict__ _Source,size_t _MaxCount);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _mbstowcs_l(wchar_t * __restrict__ _Dest,const char * __restrict__ _Source,size_t _MaxCount,_locale_t _Locale);
  int __attribute__((__cdecl__)) mkstemp(char *template_name);
  int __attribute__((__cdecl__)) rand(void);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _set_error_mode(int _Mode);
  void __attribute__((__cdecl__)) srand(unsigned int _Seed);
# 372 "C:/msys64/ucrt64/include/stdlib.h" 3
inline __attribute__((__cdecl__))
double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtod(const char * __restrict__ _Str,char ** __restrict__ _EndPtr)
{
  double __attribute__((__cdecl__)) __mingw_strtod (const char * __restrict__, char ** __restrict__);
  return __mingw_strtod( _Str, _EndPtr);
}

inline __attribute__((__cdecl__))
float __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtof(const char * __restrict__ _Str,char ** __restrict__ _EndPtr)
{
  float __attribute__((__cdecl__)) __mingw_strtof (const char * __restrict__, char ** __restrict__);
  return __mingw_strtof( _Str, _EndPtr);
}






  long double __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) strtold(const char * __restrict__ , char ** __restrict__ );


  extern double __attribute__((__cdecl__)) __attribute__ ((__nothrow__))
  __strtod (const char * __restrict__ , char ** __restrict__);







  float __attribute__((__cdecl__)) __mingw_strtof (const char * __restrict__, char ** __restrict__);
  double __attribute__((__cdecl__)) __mingw_strtod (const char * __restrict__, char ** __restrict__);
  long double __attribute__((__cdecl__)) __mingw_strtold(const char * __restrict__, char ** __restrict__);

  __attribute__ ((__dllimport__)) float __attribute__((__cdecl__)) _strtof_l(const char * __restrict__ _Str,char ** __restrict__ _EndPtr,_locale_t _Locale);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _strtod_l(const char * __restrict__ _Str,char ** __restrict__ _EndPtr,_locale_t _Locale);
  long __attribute__((__cdecl__)) strtol(const char * __restrict__ _Str,char ** __restrict__ _EndPtr,int _Radix);
  __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _strtol_l(const char * __restrict__ _Str,char ** __restrict__ _EndPtr,int _Radix,_locale_t _Locale);
  unsigned long __attribute__((__cdecl__)) strtoul(const char * __restrict__ _Str,char ** __restrict__ _EndPtr,int _Radix);
  __attribute__ ((__dllimport__)) unsigned long __attribute__((__cdecl__)) _strtoul_l(const char * __restrict__ _Str,char ** __restrict__ _EndPtr,int _Radix,_locale_t _Locale);


  int __attribute__((__cdecl__)) system(const char *_Command);

  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _ultoa(unsigned long _Value,char *_Dest,int _Radix) ;
  int __attribute__((__cdecl__)) wctomb(char *_MbCh,wchar_t _WCh) ;
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wctomb_l(char *_MbCh,wchar_t _WCh,_locale_t _Locale) ;
  size_t __attribute__((__cdecl__)) wcstombs(char * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _MaxCount) ;
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _wcstombs_l(char * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _MaxCount,_locale_t _Locale) ;



  void *__attribute__((__cdecl__)) calloc(size_t _NumOfElements,size_t _SizeOfElements);
  void __attribute__((__cdecl__)) free(void *_Memory);
  void *__attribute__((__cdecl__)) malloc(size_t _Size);
  void *__attribute__((__cdecl__)) realloc(void *_Memory,size_t _NewSize);
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _aligned_free(void *_Memory);
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _aligned_malloc(size_t _Size,size_t _Alignment);
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _aligned_offset_malloc(size_t _Size,size_t _Alignment,size_t _Offset);
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _aligned_realloc(void *_Memory,size_t _Size,size_t _Alignment);
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _aligned_offset_realloc(void *_Memory,size_t _Size,size_t _Alignment,size_t _Offset);

  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _recalloc(void *_Memory,size_t _Count,size_t _Size);
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _aligned_recalloc(void *_Memory,size_t _Count,size_t _Size,size_t _Alignment);
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _aligned_offset_recalloc(void *_Memory,size_t _Count,size_t _Size,size_t _Alignment,size_t _Offset);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _aligned_msize(void *_Memory,size_t _Alignment,size_t _Offset);






  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _itow(int _Value,wchar_t *_Dest,int _Radix) ;
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _ltow(long _Value,wchar_t *_Dest,int _Radix) ;
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _ultow(unsigned long _Value,wchar_t *_Dest,int _Radix) ;

  double __attribute__((__cdecl__)) __mingw_wcstod(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr);
  float __attribute__((__cdecl__)) __mingw_wcstof(const wchar_t * __restrict__ nptr, wchar_t ** __restrict__ endptr);
  long double __attribute__((__cdecl__)) __mingw_wcstold(const wchar_t * __restrict__, wchar_t ** __restrict__);
# 464 "C:/msys64/ucrt64/include/stdlib.h" 3
  double __attribute__((__cdecl__)) wcstod(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr);
  float __attribute__((__cdecl__)) wcstof(const wchar_t * __restrict__ nptr, wchar_t ** __restrict__ endptr);


  long double __attribute__((__cdecl__)) wcstold(const wchar_t * __restrict__, wchar_t ** __restrict__);

  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _wcstod_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,_locale_t _Locale);
  __attribute__ ((__dllimport__)) float __attribute__((__cdecl__)) _wcstof_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,_locale_t _Locale);
  long __attribute__((__cdecl__)) wcstol(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix);
  __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _wcstol_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix,_locale_t _Locale);
  unsigned long __attribute__((__cdecl__)) wcstoul(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix);
  __attribute__ ((__dllimport__)) unsigned long __attribute__((__cdecl__)) _wcstoul_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix,_locale_t _Locale);
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wgetenv(const wchar_t *_VarName) ;


  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wsystem(const wchar_t *_Command);

  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _wtof(const wchar_t *_Str);
  __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _wtof_l(const wchar_t *_Str,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wtoi(const wchar_t *_Str);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wtoi_l(const wchar_t *_Str,_locale_t _Locale);
  __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _wtol(const wchar_t *_Str);
  __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _wtol_l(const wchar_t *_Str,_locale_t _Locale);

  __extension__ __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _i64tow(long long _Val,wchar_t *_DstBuf,int _Radix) ;
  __extension__ __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _ui64tow(unsigned long long _Val,wchar_t *_DstBuf,int _Radix) ;
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wtoi64(const wchar_t *_Str);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wtoi64_l(const wchar_t *_Str,_locale_t _Locale);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wcstoi64(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix);
  __extension__ __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wcstoi64_l(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix,_locale_t _Locale);
  __extension__ __attribute__ ((__dllimport__)) unsigned long long __attribute__((__cdecl__)) _wcstoui64(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix);
  __extension__ __attribute__ ((__dllimport__)) unsigned long long __attribute__((__cdecl__)) _wcstoui64_l(const wchar_t *_Str ,wchar_t **_EndPtr,int _Radix,_locale_t _Locale);


  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _putenv(const char *_EnvString);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wputenv(const wchar_t *_EnvString);



  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _fullpath(char *_FullPath,const char *_Path,size_t _SizeInBytes);
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _ecvt(double _Val,int _NumOfDigits,int *_PtDec,int *_PtSign) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _fcvt(double _Val,int _NumOfDec,int *_PtDec,int *_PtSign) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _gcvt(double _Val,int _NumOfDigits,char *_DstBuf) ;
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atodbl(_CRT_DOUBLE *_Result,char *_Str);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atoldbl(_LDOUBLE *_Result,char *_Str);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atoflt(_CRT_FLOAT *_Result,char *_Str);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atodbl_l(_CRT_DOUBLE *_Result,char *_Str,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atoldbl_l(_LDOUBLE *_Result,char *_Str,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _atoflt_l(_CRT_FLOAT *_Result,char *_Str,_locale_t _Locale);
# 528 "C:/msys64/ucrt64/include/stdlib.h" 3
unsigned long __attribute__((__cdecl__)) _lrotl(unsigned long,int);
unsigned long __attribute__((__cdecl__)) _lrotr(unsigned long,int);





  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _makepath(char *_Path,const char *_Drive,const char *_Dir,const char *_Filename,const char *_Ext);
  _onexit_t __attribute__((__cdecl__)) _onexit(_onexit_t _Func);



  void __attribute__((__cdecl__)) perror(const char *_ErrMsg);

       
       


  __extension__ unsigned long long __attribute__((__cdecl__)) _rotl64(unsigned long long _Val,int _Shift);
  __extension__ unsigned long long __attribute__((__cdecl__)) _rotr64(unsigned long long Value,int Shift);
       
       
       
       


  unsigned int __attribute__((__cdecl__)) _rotr(unsigned int _Val,int _Shift);
  unsigned int __attribute__((__cdecl__)) _rotl(unsigned int _Val,int _Shift);
       
       
  __extension__ unsigned long long __attribute__((__cdecl__)) _rotr64(unsigned long long _Val,int _Shift);
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _searchenv(const char *_Filename,const char *_EnvVar,char *_ResultPath) ;
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _splitpath(const char *_FullPath,char *_Drive,char *_Dir,char *_Filename,char *_Ext) ;
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _swab(char *_Buf1,char *_Buf2,int _SizeInBytes);



  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wfullpath(wchar_t *_FullPath,const wchar_t *_Path,size_t _SizeInWords);
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wmakepath(wchar_t *_ResultPath,const wchar_t *_Drive,const wchar_t *_Dir,const wchar_t *_Filename,const wchar_t *_Ext);


  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wperror(const wchar_t *_ErrMsg);

  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wsearchenv(const wchar_t *_Filename,const wchar_t *_EnvVar,wchar_t *_ResultPath) ;
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wsplitpath(const wchar_t *_FullPath,wchar_t *_Drive,wchar_t *_Dir,wchar_t *_Filename,wchar_t *_Ext) ;


  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _beep(unsigned _Frequency,unsigned _Duration) __attribute__ ((__deprecated__));

  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _seterrormode(int _Mode) __attribute__ ((__deprecated__));
  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _sleep(unsigned long _Duration) __attribute__ ((__deprecated__));
# 599 "C:/msys64/ucrt64/include/stdlib.h" 3
  char *__attribute__((__cdecl__)) ecvt(double _Val,int _NumOfDigits,int *_PtDec,int *_PtSign) ;
  char *__attribute__((__cdecl__)) fcvt(double _Val,int _NumOfDec,int *_PtDec,int *_PtSign) ;
  char *__attribute__((__cdecl__)) gcvt(double _Val,int _NumOfDigits,char *_DstBuf) ;
  char *__attribute__((__cdecl__)) itoa(int _Val,char *_DstBuf,int _Radix) ;
  char *__attribute__((__cdecl__)) ltoa(long _Val,char *_DstBuf,int _Radix) ;
  int __attribute__((__cdecl__)) putenv(const char *_EnvString) ;



  void __attribute__((__cdecl__)) swab(char *_Buf1,char *_Buf2,int _SizeInBytes) ;


  char *__attribute__((__cdecl__)) ultoa(unsigned long _Val,char *_Dstbuf,int _Radix) ;
  _onexit_t __attribute__((__cdecl__)) onexit(_onexit_t _Func);





  typedef struct { __extension__ long long quot, rem; } lldiv_t;

  __extension__ lldiv_t __attribute__((__cdecl__)) lldiv(long long, long long);

  __extension__ long long __attribute__((__cdecl__)) llabs(long long);




  __extension__ long long __attribute__((__cdecl__)) strtoll(const char * __restrict__, char ** __restrict, int);
  __extension__ unsigned long long __attribute__((__cdecl__)) strtoull(const char * __restrict__, char ** __restrict__, int);


  __extension__ long long __attribute__((__cdecl__)) atoll (const char *);


  __extension__ long long __attribute__((__cdecl__)) wtoll (const wchar_t *);
  __extension__ char *__attribute__((__cdecl__)) lltoa (long long, char *, int);
  __extension__ char *__attribute__((__cdecl__)) ulltoa (unsigned long long , char *, int);
  __extension__ wchar_t *__attribute__((__cdecl__)) lltow (long long, wchar_t *, int);
  __extension__ wchar_t *__attribute__((__cdecl__)) ulltow (unsigned long long, wchar_t *, int);
# 653 "C:/msys64/ucrt64/include/stdlib.h" 3
}


#pragma pack(pop)

# 1 "C:/msys64/ucrt64/include/sec_api/stdlib_s.h" 1 3
# 9 "C:/msys64/ucrt64/include/sec_api/stdlib_s.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 1 3
# 30 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 3
# 1 "C:/msys64/ucrt64/include/stdlib.h" 1 3
# 31 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 2 3
# 10 "C:/msys64/ucrt64/include/sec_api/stdlib_s.h" 2 3


extern "C" {


  __attribute__ ((__dllimport__)) void * __attribute__((__cdecl__)) bsearch_s(const void *_Key,const void *_Base,rsize_t _NumOfElements,rsize_t _SizeOfElements,int (__attribute__((__cdecl__)) * _PtFuncCompare)(void *, const void *, const void *), void *_Context);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _dupenv_s(char **_PBuffer,size_t *_PBufferSizeInBytes,const char *_VarName);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) getenv_s(size_t *_ReturnSize,char *_DstBuf,rsize_t _DstSize,const char *_VarName);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) getenv_s(size_t * _ReturnSize, char (&_Dest)[__size], const char * _VarName) { return getenv_s(_ReturnSize, _Dest, __size, _VarName); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _itoa_s(int _Value,char *_DstBuf,size_t _Size,int _Radix);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _itoa_s(int _Value, char (&_Dest)[__size], int _Radix) { return _itoa_s(_Value, _Dest, __size, _Radix); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _i64toa_s(long long _Val,char *_DstBuf,size_t _Size,int _Radix);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ui64toa_s(unsigned long long _Val,char *_DstBuf,size_t _Size,int _Radix);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ltoa_s(long _Val,char *_DstBuf,size_t _Size,int _Radix);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _ltoa_s(long _Value, char (&_Dest)[__size], int _Radix) { return _ltoa_s(_Value, _Dest, __size, _Radix); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) mbstowcs_s(size_t *_PtNumOfCharConverted,wchar_t *_DstBuf,size_t _SizeInWords,const char *_SrcBuf,size_t _MaxCount);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) mbstowcs_s(size_t * _PtNumOfCharConverted, wchar_t (&_Dest)[__size], const char * _Source, size_t _MaxCount) { return mbstowcs_s(_PtNumOfCharConverted, _Dest, __size, _Source, _MaxCount); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _mbstowcs_s_l(size_t *_PtNumOfCharConverted,wchar_t *_DstBuf,size_t _SizeInWords,const char *_SrcBuf,size_t _MaxCount,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _mbstowcs_s_l(size_t * _PtNumOfCharConverted, wchar_t (&_Dest)[__size], const char * _Source, size_t _MaxCount, _locale_t _Locale) { return _mbstowcs_s_l(_PtNumOfCharConverted, _Dest, __size, _Source, _MaxCount, _Locale); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ultoa_s(unsigned long _Val,char *_DstBuf,size_t _Size,int _Radix);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _ultoa_s(unsigned long _Value, char (&_Dest)[__size], int _Radix) { return _ultoa_s(_Value, _Dest, __size, _Radix); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) wctomb_s(int *_SizeConverted,char *_MbCh,rsize_t _SizeInBytes,wchar_t _WCh);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wctomb_s_l(int *_SizeConverted,char *_MbCh,size_t _SizeInBytes,wchar_t _WCh,_locale_t _Locale);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) wcstombs_s(size_t *_PtNumOfCharConverted,char *_Dst,size_t _DstSizeInBytes,const wchar_t *_Src,size_t _MaxCountInBytes);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) wcstombs_s(size_t* _PtNumOfCharConverted, char (&_Dst)[__size], const wchar_t* _Src, size_t _MaxCountInBytes) { return wcstombs_s(_PtNumOfCharConverted, _Dst, __size, _Src, _MaxCountInBytes); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcstombs_s_l(size_t *_PtNumOfCharConverted,char *_Dst,size_t _DstSizeInBytes,const wchar_t *_Src,size_t _MaxCountInBytes,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcstombs_s_l(size_t* _PtNumOfCharConverted, char (&_Dst)[__size], const wchar_t* _Src, size_t _MaxCountInBytes, _locale_t _Locale) { return _wcstombs_s_l(_PtNumOfCharConverted, _Dst, __size, _Src, _MaxCountInBytes, _Locale); } }


  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _ecvt_s(char *_DstBuf,size_t _Size,double _Val,int _NumOfDights,int *_PtDec,int *_PtSign);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _fcvt_s(char *_DstBuf,size_t _Size,double _Val,int _NumOfDec,int *_PtDec,int *_PtSign);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _gcvt_s(char *_DstBuf,size_t _Size,double _Val,int _NumOfDigits);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _makepath_s(char *_PathResult,size_t _Size,const char *_Drive,const char *_Dir,const char *_Filename,const char *_Ext);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _makepath_s(char (&_PathResult)[__size], const char* _Drive, const char* _Dir, const char* _Filename, const char* _Ext) { return _makepath_s(_PathResult,__size,_Drive,_Dir,_Filename,_Ext); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _putenv_s(const char *_Name,const char *_Value);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _searchenv_s(const char *_Filename,const char *_EnvVar,char *_ResultPath,size_t _SizeInBytes);

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _splitpath_s(const char *_FullPath,char *_Drive,size_t _DriveSize,char *_Dir,size_t _DirSize,char *_Filename,size_t _FilenameSize,char *_Ext,size_t _ExtSize);
  extern "C++" { template <size_t __drive_size, size_t __dir_size, size_t __name_size, size_t __ext_size> inline errno_t __attribute__((__cdecl__)) _splitpath_s(const char *_Dest, char (&__drive)[__drive_size], char (&__dir)[__dir_size], char (&__name)[__name_size], char (&__ext)[__ext_size]) { return _splitpath_s(_Dest, __drive, __drive_size, __dir, __dir_size, __name, __name_size, __ext, __ext_size); } }



  __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) qsort_s(void *_Base,size_t _NumOfElements,size_t _SizeOfElements,int (__attribute__((__cdecl__)) *_PtFuncCompare)(void *,const void *,const void *),void *_Context);





}
# 659 "C:/msys64/ucrt64/include/stdlib.h" 2 3
# 1 "C:/msys64/ucrt64/include/malloc.h" 1 3
# 11 "C:/msys64/ucrt64/include/malloc.h" 3
#pragma pack(push,_CRT_PACKING)


extern "C" {
# 46 "C:/msys64/ucrt64/include/malloc.h" 3
  typedef struct _heapinfo {
    int *_pentry;
    size_t _size;
    int _useflag;
  } _HEAPINFO;



  __attribute__ ((__dllimport__)) unsigned int *__attribute__((__cdecl__)) __p__amblksiz(void);
# 78 "C:/msys64/ucrt64/include/malloc.h" 3
void * __mingw_aligned_malloc (size_t _Size, size_t _Alignment);
void __mingw_aligned_free (void *_Memory);
void * __mingw_aligned_offset_realloc (void *_Memory, size_t _Size, size_t _Alignment, size_t _Offset);
void * __mingw_aligned_realloc (void *_Memory, size_t _Size, size_t _Offset);



# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/mm_malloc.h" 1 3 4
# 27 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/mm_malloc.h" 3 4
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 1 3 4
# 28 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/mm_malloc.h" 2 3 4

# 1 "C:/msys64/ucrt64/include/errno.h" 1 3 4
# 12 "C:/msys64/ucrt64/include/errno.h" 3 4
extern "C" {
# 239 "C:/msys64/ucrt64/include/errno.h" 3 4
}
# 30 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/mm_malloc.h" 2 3 4


static __inline__ void *
_mm_malloc (size_t __size, size_t __align)
{
  void * __malloc_ptr;
  void * __aligned_ptr;


  if (__align & (__align - 1))
    {

      (*_errno()) = 22;

      return ((void *) 0);
    }

  if (__size == 0)
    return ((void *) 0);





    if (__align < 2 * sizeof (void *))
      __align = 2 * sizeof (void *);

  __malloc_ptr = malloc (__size + __align);
  if (!__malloc_ptr)
    return ((void *) 0);


  __aligned_ptr = (void *) (((size_t) __malloc_ptr + __align)
       & ~((size_t) (__align) - 1));


  ((void **) __aligned_ptr)[-1] = __malloc_ptr;

  return __aligned_ptr;
}

static __inline__ void
_mm_free (void *__aligned_ptr)
{
  if (__aligned_ptr)
    free (((void **) __aligned_ptr)[-1]);
}
# 86 "C:/msys64/ucrt64/include/malloc.h" 2 3





  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _resetstkoflw (void);

  __attribute__ ((__dllimport__)) unsigned long __attribute__((__cdecl__)) _set_malloc_crt_max_wait(unsigned long _NewValue);

  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _expand(void *_Memory,size_t _NewSize);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _msize(void *_Memory);






  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _get_sbh_threshold(void);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _set_sbh_threshold(size_t _NewValue);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _set_amblksiz(size_t _Value);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _get_amblksiz(size_t *_Value);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _heapadd(void *_Memory,size_t _Size);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _heapchk(void);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _heapmin(void);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _heapset(unsigned int _Fill);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _heapwalk(_HEAPINFO *_EntryInfo);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _heapused(size_t *_Used,size_t *_Commit);
  __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _get_heap_handle(void);
# 126 "C:/msys64/ucrt64/include/malloc.h" 3
  static __inline void *_MarkAllocaS(void *_Ptr,unsigned int _Marker) {
    if(_Ptr) {
      *((unsigned int*)_Ptr) = _Marker;
      _Ptr = (char*)_Ptr + 16;
    }
    return _Ptr;
  }
# 145 "C:/msys64/ucrt64/include/malloc.h" 3
  static __inline void __attribute__((__cdecl__)) _freea(void *_Memory) {
    unsigned int _Marker;
    if(_Memory) {
      _Memory = (char*)_Memory - 16;
      _Marker = *(unsigned int *)_Memory;
      if(_Marker==0xDDDD) {
 free(_Memory);
      }





    }
  }
# 188 "C:/msys64/ucrt64/include/malloc.h" 3
}


#pragma pack(pop)
# 660 "C:/msys64/ucrt64/include/stdlib.h" 2 3
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/bits/std_abs.h" 2 3







extern "C++"
{
namespace std
{


  using ::abs;


  inline long
  abs(long __i) { return __builtin_labs(__i); }



  inline long long
  abs(long long __x) { return __builtin_llabs (__x); }
# 70 "C:/msys64/ucrt64/include/c++/14.2.0/bits/std_abs.h" 3
  inline constexpr double
  abs(double __x)
  { return __builtin_fabs(__x); }

  inline constexpr float
  abs(float __x)
  { return __builtin_fabsf(__x); }

  inline constexpr long double
  abs(long double __x)
  { return __builtin_fabsl(__x); }



  __extension__ inline constexpr __int128
  abs(__int128 __x) { return __x >= 0 ? __x : -__x; }
# 135 "C:/msys64/ucrt64/include/c++/14.2.0/bits/std_abs.h" 3
  __extension__ inline constexpr
  __float128
  abs(__float128 __x)
  {






    return __builtin_signbit(__x) ? -__x : __x;

  }



}
}
# 50 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3






# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 57 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3
# 83 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
extern "C++"
{
namespace std
{


  using ::acos;


  inline constexpr float
  acos(float __x)
  { return __builtin_acosf(__x); }

  inline constexpr long double
  acos(long double __x)
  { return __builtin_acosl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    acos(_Tp __x)
    { return __builtin_acos(__x); }

  using ::asin;


  inline constexpr float
  asin(float __x)
  { return __builtin_asinf(__x); }

  inline constexpr long double
  asin(long double __x)
  { return __builtin_asinl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    asin(_Tp __x)
    { return __builtin_asin(__x); }

  using ::atan;


  inline constexpr float
  atan(float __x)
  { return __builtin_atanf(__x); }

  inline constexpr long double
  atan(long double __x)
  { return __builtin_atanl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    atan(_Tp __x)
    { return __builtin_atan(__x); }

  using ::atan2;


  inline constexpr float
  atan2(float __y, float __x)
  { return __builtin_atan2f(__y, __x); }

  inline constexpr long double
  atan2(long double __y, long double __x)
  { return __builtin_atan2l(__y, __x); }


  using ::ceil;


  inline constexpr float
  ceil(float __x)
  { return __builtin_ceilf(__x); }

  inline constexpr long double
  ceil(long double __x)
  { return __builtin_ceill(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    ceil(_Tp __x)
    { return __builtin_ceil(__x); }

  using ::cos;


  inline constexpr float
  cos(float __x)
  { return __builtin_cosf(__x); }

  inline constexpr long double
  cos(long double __x)
  { return __builtin_cosl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    cos(_Tp __x)
    { return __builtin_cos(__x); }

  using ::cosh;


  inline constexpr float
  cosh(float __x)
  { return __builtin_coshf(__x); }

  inline constexpr long double
  cosh(long double __x)
  { return __builtin_coshl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    cosh(_Tp __x)
    { return __builtin_cosh(__x); }

  using ::exp;


  inline constexpr float
  exp(float __x)
  { return __builtin_expf(__x); }

  inline constexpr long double
  exp(long double __x)
  { return __builtin_expl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    exp(_Tp __x)
    { return __builtin_exp(__x); }

  using ::fabs;


  inline constexpr float
  fabs(float __x)
  { return __builtin_fabsf(__x); }

  inline constexpr long double
  fabs(long double __x)
  { return __builtin_fabsl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    fabs(_Tp __x)
    { return __builtin_fabs(__x); }

  using ::floor;


  inline constexpr float
  floor(float __x)
  { return __builtin_floorf(__x); }

  inline constexpr long double
  floor(long double __x)
  { return __builtin_floorl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    floor(_Tp __x)
    { return __builtin_floor(__x); }

  using ::fmod;


  inline constexpr float
  fmod(float __x, float __y)
  { return __builtin_fmodf(__x, __y); }

  inline constexpr long double
  fmod(long double __x, long double __y)
  { return __builtin_fmodl(__x, __y); }


  using ::frexp;


  inline float
  frexp(float __x, int* __exp)
  { return __builtin_frexpf(__x, __exp); }

  inline long double
  frexp(long double __x, int* __exp)
  { return __builtin_frexpl(__x, __exp); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    frexp(_Tp __x, int* __exp)
    { return __builtin_frexp(__x, __exp); }

  using ::ldexp;


  inline constexpr float
  ldexp(float __x, int __exp)
  { return __builtin_ldexpf(__x, __exp); }

  inline constexpr long double
  ldexp(long double __x, int __exp)
  { return __builtin_ldexpl(__x, __exp); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    ldexp(_Tp __x, int __exp)
    { return __builtin_ldexp(__x, __exp); }

  using ::log;


  inline constexpr float
  log(float __x)
  { return __builtin_logf(__x); }

  inline constexpr long double
  log(long double __x)
  { return __builtin_logl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    log(_Tp __x)
    { return __builtin_log(__x); }

  using ::log10;


  inline constexpr float
  log10(float __x)
  { return __builtin_log10f(__x); }

  inline constexpr long double
  log10(long double __x)
  { return __builtin_log10l(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    log10(_Tp __x)
    { return __builtin_log10(__x); }

  using ::modf;


  inline float
  modf(float __x, float* __iptr)
  { return __builtin_modff(__x, __iptr); }

  inline long double
  modf(long double __x, long double* __iptr)
  { return __builtin_modfl(__x, __iptr); }


  using ::pow;


  inline constexpr float
  pow(float __x, float __y)
  { return __builtin_powf(__x, __y); }

  inline constexpr long double
  pow(long double __x, long double __y)
  { return __builtin_powl(__x, __y); }
# 400 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  using ::sin;


  inline constexpr float
  sin(float __x)
  { return __builtin_sinf(__x); }

  inline constexpr long double
  sin(long double __x)
  { return __builtin_sinl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sin(_Tp __x)
    { return __builtin_sin(__x); }

  using ::sinh;


  inline constexpr float
  sinh(float __x)
  { return __builtin_sinhf(__x); }

  inline constexpr long double
  sinh(long double __x)
  { return __builtin_sinhl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sinh(_Tp __x)
    { return __builtin_sinh(__x); }

  using ::sqrt;


  inline constexpr float
  sqrt(float __x)
  { return __builtin_sqrtf(__x); }

  inline constexpr long double
  sqrt(long double __x)
  { return __builtin_sqrtl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sqrt(_Tp __x)
    { return __builtin_sqrt(__x); }

  using ::tan;


  inline constexpr float
  tan(float __x)
  { return __builtin_tanf(__x); }

  inline constexpr long double
  tan(long double __x)
  { return __builtin_tanl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    tan(_Tp __x)
    { return __builtin_tan(__x); }

  using ::tanh;


  inline constexpr float
  tanh(float __x)
  { return __builtin_tanhf(__x); }

  inline constexpr long double
  tanh(long double __x)
  { return __builtin_tanhl(__x); }


  template<typename _Tp>
    inline constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    tanh(_Tp __x)
    { return __builtin_tanh(__x); }
# 1053 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  template<typename _Tp, typename _Up>
    inline constexpr
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    atan2(_Tp __y, _Up __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return atan2(__type(__y), __type(__x));
    }

  template<typename _Tp, typename _Up>
    inline constexpr
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmod(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmod(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    inline constexpr
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    pow(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return pow(__type(__x), __type(__y));
    }
# 1100 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  constexpr int
  fpclassify(float __x)
  { return __builtin_fpclassify(0x0100, (0x0100 | 0x0400), 0x0400,
    (0x0400 | 0x4000), 0x4000, __x); }

  constexpr int
  fpclassify(double __x)
  { return __builtin_fpclassify(0x0100, (0x0100 | 0x0400), 0x0400,
    (0x0400 | 0x4000), 0x4000, __x); }

  constexpr int
  fpclassify(long double __x)
  { return __builtin_fpclassify(0x0100, (0x0100 | 0x0400), 0x0400,
    (0x0400 | 0x4000), 0x4000, __x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              int>::__type
    fpclassify(_Tp __x)
    { return __x != 0 ? 0x0400 : 0x4000; }



  constexpr bool
  isfinite(float __x)
  { return __builtin_isfinite(__x); }

  constexpr bool
  isfinite(double __x)
  { return __builtin_isfinite(__x); }

  constexpr bool
  isfinite(long double __x)
  { return __builtin_isfinite(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isfinite(_Tp)
    { return true; }



  constexpr bool
  isinf(float __x)
  { return __builtin_isinf(__x); }





  constexpr bool
  isinf(double __x)
  { return __builtin_isinf(__x); }


  constexpr bool
  isinf(long double __x)
  { return __builtin_isinf(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isinf(_Tp)
    { return false; }



  constexpr bool
  isnan(float __x)
  { return __builtin_isnan(__x); }





  constexpr bool
  isnan(double __x)
  { return __builtin_isnan(__x); }


  constexpr bool
  isnan(long double __x)
  { return __builtin_isnan(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isnan(_Tp)
    { return false; }



  constexpr bool
  isnormal(float __x)
  { return __builtin_isnormal(__x); }

  constexpr bool
  isnormal(double __x)
  { return __builtin_isnormal(__x); }

  constexpr bool
  isnormal(long double __x)
  { return __builtin_isnormal(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    isnormal(_Tp __x)
    { return __x != 0 ? true : false; }




  constexpr bool
  signbit(float __x)
  { return __builtin_signbit(__x); }

  constexpr bool
  signbit(double __x)
  { return __builtin_signbit(__x); }

  constexpr bool
  signbit(long double __x)
  { return __builtin_signbit(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              bool>::__type
    signbit(_Tp __x)
    { return __x < 0 ? true : false; }



  constexpr bool
  isgreater(float __x, float __y)
  { return __builtin_isgreater(__x, __y); }

  constexpr bool
  isgreater(double __x, double __y)
  { return __builtin_isgreater(__x, __y); }

  constexpr bool
  isgreater(long double __x, long double __y)
  { return __builtin_isgreater(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isgreater(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isgreater(__type(__x), __type(__y));
    }



  constexpr bool
  isgreaterequal(float __x, float __y)
  { return __builtin_isgreaterequal(__x, __y); }

  constexpr bool
  isgreaterequal(double __x, double __y)
  { return __builtin_isgreaterequal(__x, __y); }

  constexpr bool
  isgreaterequal(long double __x, long double __y)
  { return __builtin_isgreaterequal(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isgreaterequal(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isgreaterequal(__type(__x), __type(__y));
    }



  constexpr bool
  isless(float __x, float __y)
  { return __builtin_isless(__x, __y); }

  constexpr bool
  isless(double __x, double __y)
  { return __builtin_isless(__x, __y); }

  constexpr bool
  isless(long double __x, long double __y)
  { return __builtin_isless(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isless(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isless(__type(__x), __type(__y));
    }



  constexpr bool
  islessequal(float __x, float __y)
  { return __builtin_islessequal(__x, __y); }

  constexpr bool
  islessequal(double __x, double __y)
  { return __builtin_islessequal(__x, __y); }

  constexpr bool
  islessequal(long double __x, long double __y)
  { return __builtin_islessequal(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    islessequal(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_islessequal(__type(__x), __type(__y));
    }



  constexpr bool
  islessgreater(float __x, float __y)
  { return __builtin_islessgreater(__x, __y); }

  constexpr bool
  islessgreater(double __x, double __y)
  { return __builtin_islessgreater(__x, __y); }

  constexpr bool
  islessgreater(long double __x, long double __y)
  { return __builtin_islessgreater(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    islessgreater(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_islessgreater(__type(__x), __type(__y));
    }



  constexpr bool
  isunordered(float __x, float __y)
  { return __builtin_isunordered(__x, __y); }

  constexpr bool
  isunordered(double __x, double __y)
  { return __builtin_isunordered(__x, __y); }

  constexpr bool
  isunordered(long double __x, long double __y)
  { return __builtin_isunordered(__x, __y); }



  template<typename _Tp, typename _Up>
    constexpr typename
    __gnu_cxx::__enable_if<(__is_arithmetic<_Tp>::__value
       && __is_arithmetic<_Up>::__value), bool>::__type
    isunordered(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return __builtin_isunordered(__type(__x), __type(__y));
    }
# 1820 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  using ::acosf;


  using ::acosl;



  using ::asinf;


  using ::asinl;



  using ::atanf;


  using ::atanl;



  using ::atan2f;


  using ::atan2l;



  using ::ceilf;


  using ::ceill;



  using ::cosf;


  using ::cosl;



  using ::coshf;


  using ::coshl;



  using ::expf;


  using ::expl;



  using ::fabsf;


  using ::fabsl;



  using ::floorf;


  using ::floorl;



  using ::fmodf;


  using ::fmodl;



  using ::frexpf;


  using ::frexpl;



  using ::ldexpf;


  using ::ldexpl;



  using ::logf;


  using ::logl;



  using ::log10f;


  using ::log10l;



  using ::modff;


  using ::modfl;



  using ::powf;


  using ::powl;



  using ::sinf;


  using ::sinl;



  using ::sinhf;


  using ::sinhl;



  using ::sqrtf;


  using ::sqrtl;



  using ::tanf;


  using ::tanl;



  using ::tanhf;


  using ::tanhl;
# 2085 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  using ::double_t;
  using ::float_t;



  using ::acosh;
  using ::acoshf;
  using ::acoshl;

  using ::asinh;
  using ::asinhf;
  using ::asinhl;

  using ::atanh;
  using ::atanhf;
  using ::atanhl;

  using ::cbrt;
  using ::cbrtf;
  using ::cbrtl;

  using ::copysign;
  using ::copysignf;
  using ::copysignl;

  using ::erf;
  using ::erff;
  using ::erfl;

  using ::erfc;
  using ::erfcf;
  using ::erfcl;

  using ::exp2;
  using ::exp2f;
  using ::exp2l;

  using ::expm1;
  using ::expm1f;
  using ::expm1l;

  using ::fdim;
  using ::fdimf;
  using ::fdiml;

  using ::fma;
  using ::fmaf;
  using ::fmal;

  using ::fmax;
  using ::fmaxf;
  using ::fmaxl;

  using ::fmin;
  using ::fminf;
  using ::fminl;

  using ::hypot;
  using ::hypotf;
  using ::hypotl;

  using ::ilogb;
  using ::ilogbf;
  using ::ilogbl;

  using ::lgamma;
  using ::lgammaf;
  using ::lgammal;


  using ::llrint;
  using ::llrintf;
  using ::llrintl;

  using ::llround;
  using ::llroundf;
  using ::llroundl;


  using ::log1p;
  using ::log1pf;
  using ::log1pl;

  using ::log2;
  using ::log2f;
  using ::log2l;

  using ::logb;
  using ::logbf;
  using ::logbl;

  using ::lrint;
  using ::lrintf;
  using ::lrintl;

  using ::lround;
  using ::lroundf;
  using ::lroundl;

  using ::nan;
  using ::nanf;
  using ::nanl;

  using ::nearbyint;
  using ::nearbyintf;
  using ::nearbyintl;

  using ::nextafter;
  using ::nextafterf;
  using ::nextafterl;

  using ::nexttoward;
  using ::nexttowardf;
  using ::nexttowardl;

  using ::remainder;
  using ::remainderf;
  using ::remainderl;

  using ::remquo;
  using ::remquof;
  using ::remquol;

  using ::rint;
  using ::rintf;
  using ::rintl;

  using ::round;
  using ::roundf;
  using ::roundl;

  using ::scalbln;
  using ::scalblnf;
  using ::scalblnl;

  using ::scalbn;
  using ::scalbnf;
  using ::scalbnl;

  using ::tgamma;
  using ::tgammaf;
  using ::tgammal;

  using ::trunc;
  using ::truncf;
  using ::truncl;



  constexpr float
  acosh(float __x)
  { return __builtin_acoshf(__x); }

  constexpr long double
  acosh(long double __x)
  { return __builtin_acoshl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    acosh(_Tp __x)
    { return __builtin_acosh(__x); }



  constexpr float
  asinh(float __x)
  { return __builtin_asinhf(__x); }

  constexpr long double
  asinh(long double __x)
  { return __builtin_asinhl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    asinh(_Tp __x)
    { return __builtin_asinh(__x); }



  constexpr float
  atanh(float __x)
  { return __builtin_atanhf(__x); }

  constexpr long double
  atanh(long double __x)
  { return __builtin_atanhl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    atanh(_Tp __x)
    { return __builtin_atanh(__x); }



  constexpr float
  cbrt(float __x)
  { return __builtin_cbrtf(__x); }

  constexpr long double
  cbrt(long double __x)
  { return __builtin_cbrtl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    cbrt(_Tp __x)
    { return __builtin_cbrt(__x); }



  constexpr float
  copysign(float __x, float __y)
  { return __builtin_copysignf(__x, __y); }

  constexpr long double
  copysign(long double __x, long double __y)
  { return __builtin_copysignl(__x, __y); }



  constexpr float
  erf(float __x)
  { return __builtin_erff(__x); }

  constexpr long double
  erf(long double __x)
  { return __builtin_erfl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    erf(_Tp __x)
    { return __builtin_erf(__x); }



  constexpr float
  erfc(float __x)
  { return __builtin_erfcf(__x); }

  constexpr long double
  erfc(long double __x)
  { return __builtin_erfcl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    erfc(_Tp __x)
    { return __builtin_erfc(__x); }



  constexpr float
  exp2(float __x)
  { return __builtin_exp2f(__x); }

  constexpr long double
  exp2(long double __x)
  { return __builtin_exp2l(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    exp2(_Tp __x)
    { return __builtin_exp2(__x); }



  constexpr float
  expm1(float __x)
  { return __builtin_expm1f(__x); }

  constexpr long double
  expm1(long double __x)
  { return __builtin_expm1l(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    expm1(_Tp __x)
    { return __builtin_expm1(__x); }



  constexpr float
  fdim(float __x, float __y)
  { return __builtin_fdimf(__x, __y); }

  constexpr long double
  fdim(long double __x, long double __y)
  { return __builtin_fdiml(__x, __y); }



  constexpr float
  fma(float __x, float __y, float __z)
  { return __builtin_fmaf(__x, __y, __z); }

  constexpr long double
  fma(long double __x, long double __y, long double __z)
  { return __builtin_fmal(__x, __y, __z); }



  constexpr float
  fmax(float __x, float __y)
  { return __builtin_fmaxf(__x, __y); }

  constexpr long double
  fmax(long double __x, long double __y)
  { return __builtin_fmaxl(__x, __y); }



  constexpr float
  fmin(float __x, float __y)
  { return __builtin_fminf(__x, __y); }

  constexpr long double
  fmin(long double __x, long double __y)
  { return __builtin_fminl(__x, __y); }



  constexpr float
  hypot(float __x, float __y)
  { return __builtin_hypotf(__x, __y); }

  constexpr long double
  hypot(long double __x, long double __y)
  { return __builtin_hypotl(__x, __y); }



  constexpr int
  ilogb(float __x)
  { return __builtin_ilogbf(__x); }

  constexpr int
  ilogb(long double __x)
  { return __builtin_ilogbl(__x); }



  template<typename _Tp>
    constexpr
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    int>::__type
    ilogb(_Tp __x)
    { return __builtin_ilogb(__x); }



  constexpr float
  lgamma(float __x)
  { return __builtin_lgammaf(__x); }

  constexpr long double
  lgamma(long double __x)
  { return __builtin_lgammal(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    lgamma(_Tp __x)
    { return __builtin_lgamma(__x); }



  constexpr long long
  llrint(float __x)
  { return __builtin_llrintf(__x); }

  constexpr long long
  llrint(long double __x)
  { return __builtin_llrintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long long>::__type
    llrint(_Tp __x)
    { return __builtin_llrint(__x); }



  constexpr long long
  llround(float __x)
  { return __builtin_llroundf(__x); }

  constexpr long long
  llround(long double __x)
  { return __builtin_llroundl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long long>::__type
    llround(_Tp __x)
    { return __builtin_llround(__x); }



  constexpr float
  log1p(float __x)
  { return __builtin_log1pf(__x); }

  constexpr long double
  log1p(long double __x)
  { return __builtin_log1pl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    log1p(_Tp __x)
    { return __builtin_log1p(__x); }




  constexpr float
  log2(float __x)
  { return __builtin_log2f(__x); }

  constexpr long double
  log2(long double __x)
  { return __builtin_log2l(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    log2(_Tp __x)
    { return __builtin_log2(__x); }



  constexpr float
  logb(float __x)
  { return __builtin_logbf(__x); }

  constexpr long double
  logb(long double __x)
  { return __builtin_logbl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    logb(_Tp __x)
    { return __builtin_logb(__x); }



  constexpr long
  lrint(float __x)
  { return __builtin_lrintf(__x); }

  constexpr long
  lrint(long double __x)
  { return __builtin_lrintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long>::__type
    lrint(_Tp __x)
    { return __builtin_lrint(__x); }



  constexpr long
  lround(float __x)
  { return __builtin_lroundf(__x); }

  constexpr long
  lround(long double __x)
  { return __builtin_lroundl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              long>::__type
    lround(_Tp __x)
    { return __builtin_lround(__x); }



  constexpr float
  nearbyint(float __x)
  { return __builtin_nearbyintf(__x); }

  constexpr long double
  nearbyint(long double __x)
  { return __builtin_nearbyintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    nearbyint(_Tp __x)
    { return __builtin_nearbyint(__x); }



  constexpr float
  nextafter(float __x, float __y)
  { return __builtin_nextafterf(__x, __y); }

  constexpr long double
  nextafter(long double __x, long double __y)
  { return __builtin_nextafterl(__x, __y); }



  constexpr float
  nexttoward(float __x, long double __y)
  { return __builtin_nexttowardf(__x, __y); }

  constexpr long double
  nexttoward(long double __x, long double __y)
  { return __builtin_nexttowardl(__x, __y); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    nexttoward(_Tp __x, long double __y)
    { return __builtin_nexttoward(__x, __y); }



  constexpr float
  remainder(float __x, float __y)
  { return __builtin_remainderf(__x, __y); }

  constexpr long double
  remainder(long double __x, long double __y)
  { return __builtin_remainderl(__x, __y); }



  inline float
  remquo(float __x, float __y, int* __pquo)
  { return __builtin_remquof(__x, __y, __pquo); }

  inline long double
  remquo(long double __x, long double __y, int* __pquo)
  { return __builtin_remquol(__x, __y, __pquo); }



  constexpr float
  rint(float __x)
  { return __builtin_rintf(__x); }

  constexpr long double
  rint(long double __x)
  { return __builtin_rintl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    rint(_Tp __x)
    { return __builtin_rint(__x); }



  constexpr float
  round(float __x)
  { return __builtin_roundf(__x); }

  constexpr long double
  round(long double __x)
  { return __builtin_roundl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    round(_Tp __x)
    { return __builtin_round(__x); }



  constexpr float
  scalbln(float __x, long __ex)
  { return __builtin_scalblnf(__x, __ex); }

  constexpr long double
  scalbln(long double __x, long __ex)
  { return __builtin_scalblnl(__x, __ex); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    scalbln(_Tp __x, long __ex)
    { return __builtin_scalbln(__x, __ex); }



  constexpr float
  scalbn(float __x, int __ex)
  { return __builtin_scalbnf(__x, __ex); }

  constexpr long double
  scalbn(long double __x, int __ex)
  { return __builtin_scalbnl(__x, __ex); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    scalbn(_Tp __x, int __ex)
    { return __builtin_scalbn(__x, __ex); }



  constexpr float
  tgamma(float __x)
  { return __builtin_tgammaf(__x); }

  constexpr long double
  tgamma(long double __x)
  { return __builtin_tgammal(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    tgamma(_Tp __x)
    { return __builtin_tgamma(__x); }



  constexpr float
  trunc(float __x)
  { return __builtin_truncf(__x); }

  constexpr long double
  trunc(long double __x)
  { return __builtin_truncl(__x); }



  template<typename _Tp>
    constexpr typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                              double>::__type
    trunc(_Tp __x)
    { return __builtin_trunc(__x); }
# 3674 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    copysign(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return copysign(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fdim(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fdim(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmax(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmax(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmin(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmin(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    hypot(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return hypot(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    nextafter(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return nextafter(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    constexpr typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    remainder(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return remainder(__type(__x), __type(__y));
    }

  template<typename _Tp, typename _Up>
    inline typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    remquo(_Tp __x, _Up __y, int* __pquo)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return remquo(__type(__x), __type(__y), __pquo);
    }

  template<typename _Tp, typename _Up, typename _Vp>
    constexpr typename __gnu_cxx::__promote_3<_Tp, _Up, _Vp>::__type
    fma(_Tp __x, _Up __y, _Vp __z)
    {
      typedef typename __gnu_cxx::__promote_3<_Tp, _Up, _Vp>::__type __type;
      return fma(__type(__x), __type(__y), __type(__z));
    }







  template<typename _Tp>
    inline _Tp
    __hypot3(_Tp __x, _Tp __y, _Tp __z)
    {
      __x = std::abs(__x);
      __y = std::abs(__y);
      __z = std::abs(__z);
      if (_Tp __a = __x < __y ? __y < __z ? __z : __y : __x < __z ? __z : __x)
 return __a * std::sqrt((__x / __a) * (__x / __a)
          + (__y / __a) * (__y / __a)
          + (__z / __a) * (__z / __a));
      else
 return {};
    }

  inline float
  hypot(float __x, float __y, float __z)
  { return std::__hypot3<float>(__x, __y, __z); }

  inline double
  hypot(double __x, double __y, double __z)
  { return std::__hypot3<double>(__x, __y, __z); }

  inline long double
  hypot(long double __x, long double __y, long double __z)
  { return std::__hypot3<long double>(__x, __y, __z); }

  template<typename _Tp, typename _Up, typename _Vp>
    __gnu_cxx::__promoted_t<_Tp, _Up, _Vp>
    hypot(_Tp __x, _Up __y, _Vp __z)
    {
      using __type = __gnu_cxx::__promoted_t<_Tp, _Up, _Vp>;
      return std::__hypot3<__type>(__x, __y, __z);
    }
# 3823 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3
  template<typename _Fp>
    constexpr _Fp
    __lerp(_Fp __a, _Fp __b, _Fp __t) noexcept
    {
      if ((__a <= 0 && __b >= 0) || (__a >= 0 && __b <= 0))
 return __t * __b + (1 - __t) * __a;

      if (__t == 1)
 return __b;



      const _Fp __x = __a + __t * (__b - __a);
      return (__t > 1) == (__b > __a)
 ? (__b < __x ? __x : __b)
 : (__b > __x ? __x : __b);
    }

  constexpr float
  lerp(float __a, float __b, float __t) noexcept
  { return std::__lerp(__a, __b, __t); }

  constexpr double
  lerp(double __a, double __b, double __t) noexcept
  { return std::__lerp(__a, __b, __t); }

  constexpr long double
  lerp(long double __a, long double __b, long double __t) noexcept
  { return std::__lerp(__a, __b, __t); }

  template<typename _Tp, typename _Up, typename _Vp>
    constexpr __gnu_cxx::__promoted_t<_Tp, _Up, _Vp>
    lerp(_Tp __x, _Up __y, _Vp __z) noexcept
    {
      using __type = __gnu_cxx::__promoted_t<_Tp, _Up, _Vp>;
      return std::__lerp<__type>(__x, __y, __z);
    }
# 3894 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 3

}


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 1 3
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 38 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3





# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 1 3
# 60 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/functexcept.h" 1 3
# 40 "C:/msys64/ucrt64/include/c++/14.2.0/bits/functexcept.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/exception_defines.h" 1 3
# 41 "C:/msys64/ucrt64/include/c++/14.2.0/bits/functexcept.h" 2 3

namespace std
{




  void
  __throw_bad_exception(void) __attribute__((__noreturn__));


  void
  __throw_bad_alloc(void) __attribute__((__noreturn__));

  void
  __throw_bad_array_new_length(void) __attribute__((__noreturn__));


  void
  __throw_bad_cast(void) __attribute__((__noreturn__,__cold__));

  void
  __throw_bad_typeid(void) __attribute__((__noreturn__,__cold__));


  void
  __throw_logic_error(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_domain_error(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_invalid_argument(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_length_error(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_out_of_range(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_out_of_range_fmt(const char*, ...) __attribute__((__noreturn__,__cold__))
    __attribute__((__format__(__gnu_printf__, 1, 2)));

  void
  __throw_runtime_error(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_range_error(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_overflow_error(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_underflow_error(const char*) __attribute__((__noreturn__,__cold__));


  void
  __throw_ios_failure(const char*) __attribute__((__noreturn__,__cold__));

  void
  __throw_ios_failure(const char*, int) __attribute__((__noreturn__,__cold__));


  void
  __throw_system_error(int) __attribute__((__noreturn__,__cold__));


  void
  __throw_future_error(int) __attribute__((__noreturn__,__cold__));


  void
  __throw_bad_function_call() __attribute__((__noreturn__,__cold__));
# 140 "C:/msys64/ucrt64/include/c++/14.2.0/bits/functexcept.h" 3

}
# 61 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 1 3
# 32 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 3
       
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 3




namespace __gnu_cxx
{

# 50 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 3
  template<typename _Tp>
    struct __is_integer_nonstrict
    : public std::__is_integer<_Tp>
    {
      using std::__is_integer<_Tp>::__value;


      enum { __width = __value ? sizeof(_Tp) * 8 : 0 };
    };

  template<typename _Value>
    struct __numeric_traits_integer
    {

      static_assert(__is_integer_nonstrict<_Value>::__value,
      "invalid specialization");




      static const bool __is_signed = (_Value)(-1) < 0;
      static const int __digits
 = __is_integer_nonstrict<_Value>::__width - __is_signed;


      static const _Value __max = __is_signed
 ? (((((_Value)1 << (__digits - 1)) - 1) << 1) + 1)
 : ~(_Value)0;
      static const _Value __min = __is_signed ? -__max - 1 : (_Value)0;
    };

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__min;

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__max;

  template<typename _Value>
    const bool __numeric_traits_integer<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_integer<_Value>::__digits;
# 137 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 3
  template<typename _Tp>
    using __int_traits = __numeric_traits_integer<_Tp>;
# 157 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_floating
    {

      static const int __max_digits10 = (2 + (std::__are_same<_Value, float>::__value ? 24 : std::__are_same<_Value, double>::__value ? 53 : 64) * 643L / 2136);


      static const bool __is_signed = true;
      static const int __digits10 = (std::__are_same<_Value, float>::__value ? 6 : std::__are_same<_Value, double>::__value ? 15 : 18);
      static const int __max_exponent10 = (std::__are_same<_Value, float>::__value ? 38 : std::__are_same<_Value, double>::__value ? 308 : 4932);
    };

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_digits10;

  template<typename _Value>
    const bool __numeric_traits_floating<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__digits10;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_exponent10;






  template<typename _Value>
    struct __numeric_traits
    : public __numeric_traits_integer<_Value>
    { };

  template<>
    struct __numeric_traits<float>
    : public __numeric_traits_floating<float>
    { };

  template<>
    struct __numeric_traits<double>
    : public __numeric_traits_floating<double>
    { };

  template<>
    struct __numeric_traits<long double>
    : public __numeric_traits_floating<long double>
    { };
# 238 "C:/msys64/ucrt64/include/c++/14.2.0/ext/numeric_traits.h" 3

}
# 64 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 1 3
# 60 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 1 3
# 32 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
       
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
# 63 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 64 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 2 3

namespace std
{


  template<typename _Tp>
    class reference_wrapper;
# 86 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp, _Tp __v>
    struct integral_constant
    {
      static constexpr _Tp value = __v;
      using value_type = _Tp;
      using type = integral_constant<_Tp, __v>;
      constexpr operator value_type() const noexcept { return value; }


      constexpr value_type operator()() const noexcept { return value; }

    };
# 106 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<bool __v>
    using __bool_constant = integral_constant<bool, __v>;



  using true_type = __bool_constant<true>;


  using false_type = __bool_constant<false>;




  template<bool __v>
    using bool_constant = __bool_constant<__v>;






  template<bool, typename _Tp = void>
    struct enable_if
    { };


  template<typename _Tp>
    struct enable_if<true, _Tp>
    { using type = _Tp; };


  template<bool _Cond, typename _Tp = void>
    using __enable_if_t = typename enable_if<_Cond, _Tp>::type;

  template<bool>
    struct __conditional
    {
      template<typename _Tp, typename>
 using type = _Tp;
    };

  template<>
    struct __conditional<false>
    {
      template<typename, typename _Up>
 using type = _Up;
    };


  template<bool _Cond, typename _If, typename _Else>
    using __conditional_t
      = typename __conditional<_Cond>::template type<_If, _Else>;


  template <typename _Type>
    struct __type_identity
    { using type = _Type; };

  template<typename _Tp>
    using __type_identity_t = typename __type_identity<_Tp>::type;

  namespace __detail
  {

    template<typename _Tp, typename...>
      using __first_t = _Tp;


    template<typename... _Bn>
      auto __or_fn(int) -> __first_t<false_type,
         __enable_if_t<!bool(_Bn::value)>...>;

    template<typename... _Bn>
      auto __or_fn(...) -> true_type;

    template<typename... _Bn>
      auto __and_fn(int) -> __first_t<true_type,
          __enable_if_t<bool(_Bn::value)>...>;

    template<typename... _Bn>
      auto __and_fn(...) -> false_type;
  }




  template<typename... _Bn>
    struct __or_
    : decltype(__detail::__or_fn<_Bn...>(0))
    { };

  template<typename... _Bn>
    struct __and_
    : decltype(__detail::__and_fn<_Bn...>(0))
    { };

  template<typename _Pp>
    struct __not_
    : __bool_constant<!bool(_Pp::value)>
    { };





  template<typename... _Bn>
    inline constexpr bool __or_v = __or_<_Bn...>::value;
  template<typename... _Bn>
    inline constexpr bool __and_v = __and_<_Bn...>::value;

  namespace __detail
  {
    template<typename , typename _B1, typename... _Bn>
      struct __disjunction_impl
      { using type = _B1; };

    template<typename _B1, typename _B2, typename... _Bn>
      struct __disjunction_impl<__enable_if_t<!bool(_B1::value)>, _B1, _B2, _Bn...>
      { using type = typename __disjunction_impl<void, _B2, _Bn...>::type; };

    template<typename , typename _B1, typename... _Bn>
      struct __conjunction_impl
      { using type = _B1; };

    template<typename _B1, typename _B2, typename... _Bn>
      struct __conjunction_impl<__enable_if_t<bool(_B1::value)>, _B1, _B2, _Bn...>
      { using type = typename __conjunction_impl<void, _B2, _Bn...>::type; };
  }


  template<typename... _Bn>
    struct conjunction
    : __detail::__conjunction_impl<void, _Bn...>::type
    { };

  template<>
    struct conjunction<>
    : true_type
    { };

  template<typename... _Bn>
    struct disjunction
    : __detail::__disjunction_impl<void, _Bn...>::type
    { };

  template<>
    struct disjunction<>
    : false_type
    { };

  template<typename _Pp>
    struct negation
    : __not_<_Pp>::type
    { };




  template<typename... _Bn>
    inline constexpr bool conjunction_v = conjunction<_Bn...>::value;

  template<typename... _Bn>
    inline constexpr bool disjunction_v = disjunction<_Bn...>::value;

  template<typename _Pp>
    inline constexpr bool negation_v = negation<_Pp>::value;





  template<typename>
    struct is_reference;
  template<typename>
    struct is_function;
  template<typename>
    struct is_void;
  template<typename>
    struct remove_cv;
  template<typename>
    struct is_const;


  template<typename>
    struct __is_array_unknown_bounds;




  template <typename _Tp, size_t = sizeof(_Tp)>
    constexpr true_type __is_complete_or_unbounded(__type_identity<_Tp>)
    { return {}; }

  template <typename _TypeIdentity,
      typename _NestedType = typename _TypeIdentity::type>
    constexpr typename __or_<
      is_reference<_NestedType>,
      is_function<_NestedType>,
      is_void<_NestedType>,
      __is_array_unknown_bounds<_NestedType>
    >::type __is_complete_or_unbounded(_TypeIdentity)
    { return {}; }


  template<typename _Tp>
    using __remove_cv_t = typename remove_cv<_Tp>::type;





  template<typename _Tp>
    struct is_void
    : public false_type { };

  template<>
    struct is_void<void>
    : public true_type { };

  template<>
    struct is_void<const void>
    : public true_type { };

  template<>
    struct is_void<volatile void>
    : public true_type { };

  template<>
    struct is_void<const volatile void>
    : public true_type { };


  template<typename>
    struct __is_integral_helper
    : public false_type { };

  template<>
    struct __is_integral_helper<bool>
    : public true_type { };

  template<>
    struct __is_integral_helper<char>
    : public true_type { };

  template<>
    struct __is_integral_helper<signed char>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned char>
    : public true_type { };




  template<>
    struct __is_integral_helper<wchar_t>
    : public true_type { };


  template<>
    struct __is_integral_helper<char8_t>
    : public true_type { };


  template<>
    struct __is_integral_helper<char16_t>
    : public true_type { };

  template<>
    struct __is_integral_helper<char32_t>
    : public true_type { };

  template<>
    struct __is_integral_helper<short>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned short>
    : public true_type { };

  template<>
    struct __is_integral_helper<int>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned int>
    : public true_type { };

  template<>
    struct __is_integral_helper<long>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned long>
    : public true_type { };

  template<>
    struct __is_integral_helper<long long>
    : public true_type { };

  template<>
    struct __is_integral_helper<unsigned long long>
    : public true_type { };




  __extension__
  template<>
    struct __is_integral_helper<__int128>
    : public true_type { };

  __extension__
  template<>
    struct __is_integral_helper<unsigned __int128>
    : public true_type { };
# 460 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct is_integral
    : public __is_integral_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename>
    struct __is_floating_point_helper
    : public false_type { };

  template<>
    struct __is_floating_point_helper<float>
    : public true_type { };

  template<>
    struct __is_floating_point_helper<double>
    : public true_type { };

  template<>
    struct __is_floating_point_helper<long double>
    : public true_type { };
# 513 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<>
    struct __is_floating_point_helper<__float128>
    : public true_type { };




  template<typename _Tp>
    struct is_floating_point
    : public __is_floating_point_helper<__remove_cv_t<_Tp>>::type
    { };



  template<typename _Tp>
    struct is_array
    : public __bool_constant<__is_array(_Tp)>
    { };
# 545 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename>
    struct __is_pointer_helper
    : public false_type { };

  template<typename _Tp>
    struct __is_pointer_helper<_Tp*>
    : public true_type { };


  template<typename _Tp>
    struct is_pointer
    : public __is_pointer_helper<__remove_cv_t<_Tp>>::type
    { };


  template<typename>
    struct is_lvalue_reference
    : public false_type { };

  template<typename _Tp>
    struct is_lvalue_reference<_Tp&>
    : public true_type { };


  template<typename>
    struct is_rvalue_reference
    : public false_type { };

  template<typename _Tp>
    struct is_rvalue_reference<_Tp&&>
    : public true_type { };



  template<typename _Tp>
    struct is_member_object_pointer
    : public __bool_constant<__is_member_object_pointer(_Tp)>
    { };
# 601 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct is_member_function_pointer
    : public __bool_constant<__is_member_function_pointer(_Tp)>
    { };
# 622 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct is_enum
    : public __bool_constant<__is_enum(_Tp)>
    { };


  template<typename _Tp>
    struct is_union
    : public __bool_constant<__is_union(_Tp)>
    { };


  template<typename _Tp>
    struct is_class
    : public __bool_constant<__is_class(_Tp)>
    { };



  template<typename _Tp>
    struct is_function
    : public __bool_constant<__is_function(_Tp)>
    { };
# 661 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct is_null_pointer
    : public false_type { };

  template<>
    struct is_null_pointer<std::nullptr_t>
    : public true_type { };

  template<>
    struct is_null_pointer<const std::nullptr_t>
    : public true_type { };

  template<>
    struct is_null_pointer<volatile std::nullptr_t>
    : public true_type { };

  template<>
    struct is_null_pointer<const volatile std::nullptr_t>
    : public true_type { };



  template<typename _Tp>
    struct __is_nullptr_t
    : public is_null_pointer<_Tp>
    { } __attribute__ ((__deprecated__ ("use '" "std::is_null_pointer" "' instead")));






  template<typename _Tp>
    struct is_reference
    : public __bool_constant<__is_reference(_Tp)>
    { };
# 715 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct is_arithmetic
    : public __or_<is_integral<_Tp>, is_floating_point<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_fundamental
    : public __or_<is_arithmetic<_Tp>, is_void<_Tp>,
     is_null_pointer<_Tp>>::type
    { };



  template<typename _Tp>
    struct is_object
    : public __bool_constant<__is_object(_Tp)>
    { };
# 741 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename>
    struct is_member_pointer;


  template<typename _Tp>
    struct is_scalar
    : public __or_<is_arithmetic<_Tp>, is_enum<_Tp>, is_pointer<_Tp>,
                   is_member_pointer<_Tp>, is_null_pointer<_Tp>>::type
    { };


  template<typename _Tp>
    struct is_compound
    : public __bool_constant<!is_fundamental<_Tp>::value> { };



  template<typename _Tp>
    struct is_member_pointer
    : public __bool_constant<__is_member_pointer(_Tp)>
    { };
# 779 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename, typename>
    struct is_same;


  template<typename _Tp, typename... _Types>
    using __is_one_of = __or_<is_same<_Tp, _Types>...>;


  __extension__
  template<typename _Tp>
    using __is_signed_integer = __is_one_of<__remove_cv_t<_Tp>,
   signed char, signed short, signed int, signed long,
   signed long long

   , signed __int128
# 804 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
   >;


  __extension__
  template<typename _Tp>
    using __is_unsigned_integer = __is_one_of<__remove_cv_t<_Tp>,
   unsigned char, unsigned short, unsigned int, unsigned long,
   unsigned long long

   , unsigned __int128
# 824 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
   >;


  template<typename _Tp>
    using __is_standard_integer
      = __or_<__is_signed_integer<_Tp>, __is_unsigned_integer<_Tp>>;


  template<typename...> using __void_t = void;





  template<typename>
    struct is_const
    : public false_type { };

  template<typename _Tp>
    struct is_const<_Tp const>
    : public true_type { };


  template<typename>
    struct is_volatile
    : public false_type { };

  template<typename _Tp>
    struct is_volatile<_Tp volatile>
    : public true_type { };


  template<typename _Tp>
    struct is_trivial
    : public __bool_constant<__is_trivial(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_copyable
    : public __bool_constant<__is_trivially_copyable(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_standard_layout
    : public __bool_constant<__is_standard_layout(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };






  template<typename _Tp>
    struct
    __attribute__ ((__deprecated__ ("use '" "is_standard_layout && is_trivial" "' instead")))
    is_pod
    : public __bool_constant<__is_pod(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };





  template<typename _Tp>
    struct
    [[__deprecated__]]
    is_literal_type
    : public __bool_constant<__is_literal_type(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_empty
    : public __bool_constant<__is_empty(_Tp)>
    { };


  template<typename _Tp>
    struct is_polymorphic
    : public __bool_constant<__is_polymorphic(_Tp)>
    { };




  template<typename _Tp>
    struct is_final
    : public __bool_constant<__is_final(_Tp)>
    { };



  template<typename _Tp>
    struct is_abstract
    : public __bool_constant<__is_abstract(_Tp)>
    { };


  template<typename _Tp,
    bool = is_arithmetic<_Tp>::value>
    struct __is_signed_helper
    : public false_type { };

  template<typename _Tp>
    struct __is_signed_helper<_Tp, true>
    : public __bool_constant<_Tp(-1) < _Tp(0)>
    { };



  template<typename _Tp>
    struct is_signed
    : public __is_signed_helper<_Tp>::type
    { };


  template<typename _Tp>
    struct is_unsigned
    : public __and_<is_arithmetic<_Tp>, __not_<is_signed<_Tp>>>::type
    { };


  template<typename _Tp, typename _Up = _Tp&&>
    _Up
    __declval(int);

  template<typename _Tp>
    _Tp
    __declval(long);


  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0));

  template<typename>
    struct remove_all_extents;


  template<typename _Tp>
    struct __is_array_known_bounds
    : public false_type
    { };

  template<typename _Tp, size_t _Size>
    struct __is_array_known_bounds<_Tp[_Size]>
    : public true_type
    { };

  template<typename _Tp>
    struct __is_array_unknown_bounds
    : public false_type
    { };

  template<typename _Tp>
    struct __is_array_unknown_bounds<_Tp[]>
    : public true_type
    { };
# 1006 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  struct __do_is_destructible_impl
  {
    template<typename _Tp, typename = decltype(declval<_Tp&>().~_Tp())>
      static true_type __test(int);

    template<typename>
      static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_destructible_impl
    : public __do_is_destructible_impl
    {
      using type = decltype(__test<_Tp>(0));
    };

  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_destructible_safe;

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, false>
    : public __is_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, true, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_destructible_safe<_Tp, false, true>
    : public true_type { };



  template<typename _Tp>
    struct is_destructible
    : public __is_destructible_safe<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };







  struct __do_is_nt_destructible_impl
  {
    template<typename _Tp>
      static __bool_constant<noexcept(declval<_Tp&>().~_Tp())>
      __test(int);

    template<typename>
      static false_type __test(...);
  };

  template<typename _Tp>
    struct __is_nt_destructible_impl
    : public __do_is_nt_destructible_impl
    {
      using type = decltype(__test<_Tp>(0));
    };

  template<typename _Tp,
           bool = __or_<is_void<_Tp>,
                        __is_array_unknown_bounds<_Tp>,
                        is_function<_Tp>>::value,
           bool = __or_<is_reference<_Tp>, is_scalar<_Tp>>::value>
    struct __is_nt_destructible_safe;

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, false>
    : public __is_nt_destructible_impl<typename
               remove_all_extents<_Tp>::type>::type
    { };

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, true, false>
    : public false_type { };

  template<typename _Tp>
    struct __is_nt_destructible_safe<_Tp, false, true>
    : public true_type { };



  template<typename _Tp>
    struct is_nothrow_destructible
    : public __is_nt_destructible_safe<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename... _Args>
    using __is_constructible_impl
      = __bool_constant<__is_constructible(_Tp, _Args...)>;



  template<typename _Tp, typename... _Args>
    struct is_constructible
      : public __is_constructible_impl<_Tp, _Args...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_default_constructible
    : public __is_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename = void>
    struct __add_lvalue_reference_helper
    { using type = _Tp; };

  template<typename _Tp>
    struct __add_lvalue_reference_helper<_Tp, __void_t<_Tp&>>
    { using type = _Tp&; };

  template<typename _Tp>
    using __add_lval_ref_t = typename __add_lvalue_reference_helper<_Tp>::type;



  template<typename _Tp>
    struct is_copy_constructible
    : public __is_constructible_impl<_Tp, __add_lval_ref_t<const _Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename = void>
    struct __add_rvalue_reference_helper
    { using type = _Tp; };

  template<typename _Tp>
    struct __add_rvalue_reference_helper<_Tp, __void_t<_Tp&&>>
    { using type = _Tp&&; };

  template<typename _Tp>
    using __add_rval_ref_t = typename __add_rvalue_reference_helper<_Tp>::type;



  template<typename _Tp>
    struct is_move_constructible
    : public __is_constructible_impl<_Tp, __add_rval_ref_t<_Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename... _Args>
    using __is_nothrow_constructible_impl
      = __bool_constant<__is_nothrow_constructible(_Tp, _Args...)>;



  template<typename _Tp, typename... _Args>
    struct is_nothrow_constructible
    : public __is_nothrow_constructible_impl<_Tp, _Args...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_default_constructible
    : public __is_nothrow_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_copy_constructible
    : public __is_nothrow_constructible_impl<_Tp, __add_lval_ref_t<const _Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_move_constructible
    : public __is_nothrow_constructible_impl<_Tp, __add_rval_ref_t<_Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename _Up>
    using __is_assignable_impl = __bool_constant<__is_assignable(_Tp, _Up)>;



  template<typename _Tp, typename _Up>
    struct is_assignable
    : public __is_assignable_impl<_Tp, _Up>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_copy_assignable
    : public __is_assignable_impl<__add_lval_ref_t<_Tp>,
      __add_lval_ref_t<const _Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_move_assignable
    : public __is_assignable_impl<__add_lval_ref_t<_Tp>, __add_rval_ref_t<_Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename _Up>
    using __is_nothrow_assignable_impl
      = __bool_constant<__is_nothrow_assignable(_Tp, _Up)>;



  template<typename _Tp, typename _Up>
    struct is_nothrow_assignable
    : public __is_nothrow_assignable_impl<_Tp, _Up>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_copy_assignable
    : public __is_nothrow_assignable_impl<__add_lval_ref_t<_Tp>,
       __add_lval_ref_t<const _Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_move_assignable
    : public __is_nothrow_assignable_impl<__add_lval_ref_t<_Tp>,
       __add_rval_ref_t<_Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename... _Args>
    using __is_trivially_constructible_impl
      = __bool_constant<__is_trivially_constructible(_Tp, _Args...)>;



  template<typename _Tp, typename... _Args>
    struct is_trivially_constructible
    : public __is_trivially_constructible_impl<_Tp, _Args...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_default_constructible
    : public __is_trivially_constructible_impl<_Tp>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    constexpr bool __is_implicitly_default_constructible_v
      = requires (void(&__f)(_Tp)) { __f({}); };

  template<typename _Tp>
    struct __is_implicitly_default_constructible
    : __bool_constant<__is_implicitly_default_constructible_v<_Tp>>
    { };
# 1351 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct is_trivially_copy_constructible
    : public __is_trivially_constructible_impl<_Tp, __add_lval_ref_t<const _Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_move_constructible
    : public __is_trivially_constructible_impl<_Tp, __add_rval_ref_t<_Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename _Up>
    using __is_trivially_assignable_impl
      = __bool_constant<__is_trivially_assignable(_Tp, _Up)>;



  template<typename _Tp, typename _Up>
    struct is_trivially_assignable
    : public __is_trivially_assignable_impl<_Tp, _Up>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_copy_assignable
    : public __is_trivially_assignable_impl<__add_lval_ref_t<_Tp>,
         __add_lval_ref_t<const _Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_move_assignable
    : public __is_trivially_assignable_impl<__add_lval_ref_t<_Tp>,
         __add_rval_ref_t<_Tp>>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_trivially_destructible
    : public __and_<__is_destructible_safe<_Tp>,
      __bool_constant<__has_trivial_destructor(_Tp)>>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };



  template<typename _Tp>
    struct has_virtual_destructor
    : public __bool_constant<__has_virtual_destructor(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };





  template<typename _Tp>
    struct alignment_of
    : public integral_constant<std::size_t, alignof(_Tp)>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename>
    struct rank
    : public integral_constant<std::size_t, 0> { };

  template<typename _Tp, std::size_t _Size>
    struct rank<_Tp[_Size]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };

  template<typename _Tp>
    struct rank<_Tp[]>
    : public integral_constant<std::size_t, 1 + rank<_Tp>::value> { };


  template<typename, unsigned _Uint = 0>
    struct extent
    : public integral_constant<size_t, 0> { };

  template<typename _Tp, size_t _Size>
    struct extent<_Tp[_Size], 0>
    : public integral_constant<size_t, _Size> { };

  template<typename _Tp, unsigned _Uint, size_t _Size>
    struct extent<_Tp[_Size], _Uint>
    : public extent<_Tp, _Uint - 1>::type { };

  template<typename _Tp>
    struct extent<_Tp[], 0>
    : public integral_constant<size_t, 0> { };

  template<typename _Tp, unsigned _Uint>
    struct extent<_Tp[], _Uint>
    : public extent<_Tp, _Uint - 1>::type { };






  template<typename _Tp, typename _Up>
    struct is_same
    : public __bool_constant<__is_same(_Tp, _Up)>
    { };
# 1491 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Base, typename _Derived>
    struct is_base_of
    : public __bool_constant<__is_base_of(_Base, _Derived)>
    { };


  template<typename _From, typename _To>
    struct is_convertible
    : public __bool_constant<__is_convertible(_From, _To)>
    { };
# 1540 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _ToElementType, typename _FromElementType>
    using __is_array_convertible
      = is_convertible<_FromElementType(*)[], _ToElementType(*)[]>;





  template<typename _From, typename _To>
    inline constexpr bool is_nothrow_convertible_v
      = __is_nothrow_convertible(_From, _To);


  template<typename _From, typename _To>
    struct is_nothrow_convertible
    : public bool_constant<is_nothrow_convertible_v<_From, _To>>
    { };
# 1603 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct remove_const
    { using type = _Tp; };

  template<typename _Tp>
    struct remove_const<_Tp const>
    { using type = _Tp; };


  template<typename _Tp>
    struct remove_volatile
    { using type = _Tp; };

  template<typename _Tp>
    struct remove_volatile<_Tp volatile>
    { using type = _Tp; };



  template<typename _Tp>
    struct remove_cv
    { using type = __remove_cv(_Tp); };
# 1644 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct add_const
    { using type = _Tp const; };


  template<typename _Tp>
    struct add_volatile
    { using type = _Tp volatile; };


  template<typename _Tp>
    struct add_cv
    { using type = _Tp const volatile; };



  template<typename _Tp>
    using remove_const_t = typename remove_const<_Tp>::type;


  template<typename _Tp>
    using remove_volatile_t = typename remove_volatile<_Tp>::type;


  template<typename _Tp>
    using remove_cv_t = typename remove_cv<_Tp>::type;


  template<typename _Tp>
    using add_const_t = typename add_const<_Tp>::type;


  template<typename _Tp>
    using add_volatile_t = typename add_volatile<_Tp>::type;


  template<typename _Tp>
    using add_cv_t = typename add_cv<_Tp>::type;






  template<typename _Tp>
    struct remove_reference
    { using type = __remove_reference(_Tp); };
# 1706 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct add_lvalue_reference
    { using type = __add_lval_ref_t<_Tp>; };


  template<typename _Tp>
    struct add_rvalue_reference
    { using type = __add_rval_ref_t<_Tp>; };



  template<typename _Tp>
    using remove_reference_t = typename remove_reference<_Tp>::type;


  template<typename _Tp>
    using add_lvalue_reference_t = typename add_lvalue_reference<_Tp>::type;


  template<typename _Tp>
    using add_rvalue_reference_t = typename add_rvalue_reference<_Tp>::type;







  template<typename _Unqualified, bool _IsConst, bool _IsVol>
    struct __cv_selector;

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, false>
    { using __type = _Unqualified; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, false, true>
    { using __type = volatile _Unqualified; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, false>
    { using __type = const _Unqualified; };

  template<typename _Unqualified>
    struct __cv_selector<_Unqualified, true, true>
    { using __type = const volatile _Unqualified; };

  template<typename _Qualified, typename _Unqualified,
    bool _IsConst = is_const<_Qualified>::value,
    bool _IsVol = is_volatile<_Qualified>::value>
    class __match_cv_qualifiers
    {
      using __match = __cv_selector<_Unqualified, _IsConst, _IsVol>;

    public:
      using __type = typename __match::__type;
    };


  template<typename _Tp>
    struct __make_unsigned
    { using __type = _Tp; };

  template<>
    struct __make_unsigned<char>
    { using __type = unsigned char; };

  template<>
    struct __make_unsigned<signed char>
    { using __type = unsigned char; };

  template<>
    struct __make_unsigned<short>
    { using __type = unsigned short; };

  template<>
    struct __make_unsigned<int>
    { using __type = unsigned int; };

  template<>
    struct __make_unsigned<long>
    { using __type = unsigned long; };

  template<>
    struct __make_unsigned<long long>
    { using __type = unsigned long long; };


  __extension__
  template<>
    struct __make_unsigned<__int128>
    { using __type = unsigned __int128; };
# 1819 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = __is_enum(_Tp)>
    class __make_unsigned_selector;

  template<typename _Tp>
    class __make_unsigned_selector<_Tp, true, false>
    {
      using __unsigned_type
 = typename __make_unsigned<__remove_cv_t<_Tp>>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };

  class __make_unsigned_selector_base
  {
  protected:
    template<typename...> struct _List { };

    template<typename _Tp, typename... _Up>
      struct _List<_Tp, _Up...> : _List<_Up...>
      { static constexpr size_t __size = sizeof(_Tp); };

    template<size_t _Sz, typename _Tp, bool = (_Sz <= _Tp::__size)>
      struct __select;

    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, true>
      { using __type = _Uint; };

    template<size_t _Sz, typename _Uint, typename... _UInts>
      struct __select<_Sz, _List<_Uint, _UInts...>, false>
      : __select<_Sz, _List<_UInts...>>
      { };
  };


  template<typename _Tp>
    class __make_unsigned_selector<_Tp, false, true>
    : __make_unsigned_selector_base
    {

      using _UInts = _List<unsigned char, unsigned short, unsigned int,
      unsigned long, unsigned long long>;

      using __unsigned_type = typename __select<sizeof(_Tp), _UInts>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __unsigned_type>::__type;
    };





  template<>
    struct __make_unsigned<wchar_t>
    {
      using __type
 = typename __make_unsigned_selector<wchar_t, false, true>::__type;
    };


  template<>
    struct __make_unsigned<char8_t>
    {
      using __type
 = typename __make_unsigned_selector<char8_t, false, true>::__type;
    };


  template<>
    struct __make_unsigned<char16_t>
    {
      using __type
 = typename __make_unsigned_selector<char16_t, false, true>::__type;
    };

  template<>
    struct __make_unsigned<char32_t>
    {
      using __type
 = typename __make_unsigned_selector<char32_t, false, true>::__type;
    };






  template<typename _Tp>
    struct make_unsigned
    { using type = typename __make_unsigned_selector<_Tp>::__type; };


  template<> struct make_unsigned<bool>;
  template<> struct make_unsigned<bool const>;
  template<> struct make_unsigned<bool volatile>;
  template<> struct make_unsigned<bool const volatile>;




  template<typename _Tp>
    struct __make_signed
    { using __type = _Tp; };

  template<>
    struct __make_signed<char>
    { using __type = signed char; };

  template<>
    struct __make_signed<unsigned char>
    { using __type = signed char; };

  template<>
    struct __make_signed<unsigned short>
    { using __type = signed short; };

  template<>
    struct __make_signed<unsigned int>
    { using __type = signed int; };

  template<>
    struct __make_signed<unsigned long>
    { using __type = signed long; };

  template<>
    struct __make_signed<unsigned long long>
    { using __type = signed long long; };


  __extension__
  template<>
    struct __make_signed<unsigned __int128>
    { using __type = __int128; };
# 1979 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp,
    bool _IsInt = is_integral<_Tp>::value,
    bool _IsEnum = __is_enum(_Tp)>
    class __make_signed_selector;

  template<typename _Tp>
    class __make_signed_selector<_Tp, true, false>
    {
      using __signed_type
 = typename __make_signed<__remove_cv_t<_Tp>>::__type;

    public:
      using __type
 = typename __match_cv_qualifiers<_Tp, __signed_type>::__type;
    };


  template<typename _Tp>
    class __make_signed_selector<_Tp, false, true>
    {
      using __unsigned_type = typename __make_unsigned_selector<_Tp>::__type;

    public:
      using __type = typename __make_signed_selector<__unsigned_type>::__type;
    };





  template<>
    struct __make_signed<wchar_t>
    {
      using __type
 = typename __make_signed_selector<wchar_t, false, true>::__type;
    };


  template<>
    struct __make_signed<char8_t>
    {
      using __type
 = typename __make_signed_selector<char8_t, false, true>::__type;
    };


  template<>
    struct __make_signed<char16_t>
    {
      using __type
 = typename __make_signed_selector<char16_t, false, true>::__type;
    };

  template<>
    struct __make_signed<char32_t>
    {
      using __type
 = typename __make_signed_selector<char32_t, false, true>::__type;
    };






  template<typename _Tp>
    struct make_signed
    { using type = typename __make_signed_selector<_Tp>::__type; };


  template<> struct make_signed<bool>;
  template<> struct make_signed<bool const>;
  template<> struct make_signed<bool volatile>;
  template<> struct make_signed<bool const volatile>;



  template<typename _Tp>
    using make_signed_t = typename make_signed<_Tp>::type;


  template<typename _Tp>
    using make_unsigned_t = typename make_unsigned<_Tp>::type;





  template<typename _Tp>
    struct remove_extent
    { using type = _Tp; };

  template<typename _Tp, std::size_t _Size>
    struct remove_extent<_Tp[_Size]>
    { using type = _Tp; };

  template<typename _Tp>
    struct remove_extent<_Tp[]>
    { using type = _Tp; };


  template<typename _Tp>
    struct remove_all_extents
    { using type = _Tp; };

  template<typename _Tp, std::size_t _Size>
    struct remove_all_extents<_Tp[_Size]>
    { using type = typename remove_all_extents<_Tp>::type; };

  template<typename _Tp>
    struct remove_all_extents<_Tp[]>
    { using type = typename remove_all_extents<_Tp>::type; };



  template<typename _Tp>
    using remove_extent_t = typename remove_extent<_Tp>::type;


  template<typename _Tp>
    using remove_all_extents_t = typename remove_all_extents<_Tp>::type;






  template<typename _Tp>
    struct remove_pointer
    { using type = __remove_pointer(_Tp); };
# 2124 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp, typename = void>
    struct __add_pointer_helper
    { using type = _Tp; };

  template<typename _Tp>
    struct __add_pointer_helper<_Tp, __void_t<_Tp*>>
    { using type = _Tp*; };


  template<typename _Tp>
    struct add_pointer
    : public __add_pointer_helper<_Tp>
    { };

  template<typename _Tp>
    struct add_pointer<_Tp&>
    { using type = _Tp*; };

  template<typename _Tp>
    struct add_pointer<_Tp&&>
    { using type = _Tp*; };



  template<typename _Tp>
    using remove_pointer_t = typename remove_pointer<_Tp>::type;


  template<typename _Tp>
    using add_pointer_t = typename add_pointer<_Tp>::type;


  template<std::size_t _Len>
    struct __aligned_storage_msa
    {
      union __type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__)) { } __align;
      };
    };
# 2179 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<std::size_t _Len, std::size_t _Align =
    __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    struct
   
    aligned_storage
    {
      union type
      {
 unsigned char __data[_Len];
 struct __attribute__((__aligned__((_Align)))) { } __align;
      };
    };

  template <typename... _Types>
    struct __strictest_alignment
    {
      static const size_t _S_alignment = 0;
      static const size_t _S_size = 0;
    };

  template <typename _Tp, typename... _Types>
    struct __strictest_alignment<_Tp, _Types...>
    {
      static const size_t _S_alignment =
        alignof(_Tp) > __strictest_alignment<_Types...>::_S_alignment
 ? alignof(_Tp) : __strictest_alignment<_Types...>::_S_alignment;
      static const size_t _S_size =
        sizeof(_Tp) > __strictest_alignment<_Types...>::_S_size
 ? sizeof(_Tp) : __strictest_alignment<_Types...>::_S_size;
    };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
# 2225 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template <size_t _Len, typename... _Types>
    struct
   
    aligned_union
    {
    private:
      static_assert(sizeof...(_Types) != 0, "At least one type is required");

      using __strictest = __strictest_alignment<_Types...>;
      static const size_t _S_len = _Len > __strictest::_S_size
 ? _Len : __strictest::_S_size;
    public:

      static const size_t alignment_value = __strictest::_S_alignment;

      using type = typename aligned_storage<_S_len, alignment_value>::type;
    };

  template <size_t _Len, typename... _Types>
    const size_t aligned_union<_Len, _Types...>::alignment_value;
#pragma GCC diagnostic pop





  template<typename _Up>
    struct __decay_selector
    : __conditional_t<is_const<const _Up>::value,
        remove_cv<_Up>,
        add_pointer<_Up>>
    { };

  template<typename _Up, size_t _Nm>
    struct __decay_selector<_Up[_Nm]>
    { using type = _Up*; };

  template<typename _Up>
    struct __decay_selector<_Up[]>
    { using type = _Up*; };




  template<typename _Tp>
    struct decay
    { using type = typename __decay_selector<_Tp>::type; };

  template<typename _Tp>
    struct decay<_Tp&>
    { using type = typename __decay_selector<_Tp>::type; };

  template<typename _Tp>
    struct decay<_Tp&&>
    { using type = typename __decay_selector<_Tp>::type; };




  template<typename _Tp>
    struct __strip_reference_wrapper
    {
      using __type = _Tp;
    };

  template<typename _Tp>
    struct __strip_reference_wrapper<reference_wrapper<_Tp> >
    {
      using __type = _Tp&;
    };


  template<typename _Tp>
    using __decay_t = typename decay<_Tp>::type;

  template<typename _Tp>
    using __decay_and_strip = __strip_reference_wrapper<__decay_t<_Tp>>;





  template<typename... _Cond>
    using _Require = __enable_if_t<__and_<_Cond...>::value>;


  template<typename _Tp>
    using __remove_cvref_t
     = typename remove_cv<typename remove_reference<_Tp>::type>::type;




  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct conditional
    { using type = _Iftrue; };


  template<typename _Iftrue, typename _Iffalse>
    struct conditional<false, _Iftrue, _Iffalse>
    { using type = _Iffalse; };


  template<typename... _Tp>
    struct common_type;
# 2340 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct __success_type
    { using type = _Tp; };

  struct __failure_type
  { };

  struct __do_common_type_impl
  {
    template<typename _Tp, typename _Up>
      using __cond_t
 = decltype(true ? std::declval<_Tp>() : std::declval<_Up>());



    template<typename _Tp, typename _Up>
      static __success_type<__decay_t<__cond_t<_Tp, _Up>>>
      _S_test(int);




    template<typename _Tp, typename _Up>
      static __success_type<__remove_cvref_t<__cond_t<const _Tp&, const _Up&>>>
      _S_test_2(int);


    template<typename, typename>
      static __failure_type
      _S_test_2(...);

    template<typename _Tp, typename _Up>
      static decltype(_S_test_2<_Tp, _Up>(0))
      _S_test(...);
  };


  template<>
    struct common_type<>
    { };


  template<typename _Tp0>
    struct common_type<_Tp0>
    : public common_type<_Tp0, _Tp0>
    { };


  template<typename _Tp1, typename _Tp2,
    typename _Dp1 = __decay_t<_Tp1>, typename _Dp2 = __decay_t<_Tp2>>
    struct __common_type_impl
    {


      using type = common_type<_Dp1, _Dp2>;
    };

  template<typename _Tp1, typename _Tp2>
    struct __common_type_impl<_Tp1, _Tp2, _Tp1, _Tp2>
    : private __do_common_type_impl
    {


      using type = decltype(_S_test<_Tp1, _Tp2>(0));
    };


  template<typename _Tp1, typename _Tp2>
    struct common_type<_Tp1, _Tp2>
    : public __common_type_impl<_Tp1, _Tp2>::type
    { };

  template<typename...>
    struct __common_type_pack
    { };

  template<typename, typename, typename = void>
    struct __common_type_fold;


  template<typename _Tp1, typename _Tp2, typename... _Rp>
    struct common_type<_Tp1, _Tp2, _Rp...>
    : public __common_type_fold<common_type<_Tp1, _Tp2>,
    __common_type_pack<_Rp...>>
    { };




  template<typename _CTp, typename... _Rp>
    struct __common_type_fold<_CTp, __common_type_pack<_Rp...>,
         __void_t<typename _CTp::type>>
    : public common_type<typename _CTp::type, _Rp...>
    { };


  template<typename _CTp, typename _Rp>
    struct __common_type_fold<_CTp, _Rp, void>
    { };

  template<typename _Tp, bool = __is_enum(_Tp)>
    struct __underlying_type_impl
    {
      using type = __underlying_type(_Tp);
    };

  template<typename _Tp>
    struct __underlying_type_impl<_Tp, false>
    { };



  template<typename _Tp>
    struct underlying_type
    : public __underlying_type_impl<_Tp>
    { };


  template<typename _Tp>
    struct __declval_protector
    {
      static const bool __stop = false;
    };






  template<typename _Tp>
    auto declval() noexcept -> decltype(__declval<_Tp>(0))
    {
      static_assert(__declval_protector<_Tp>::__stop,
      "declval() must not be used!");
      return __declval<_Tp>(0);
    }


  template<typename _Signature>
    struct result_of;




  struct __invoke_memfun_ref { };
  struct __invoke_memfun_deref { };
  struct __invoke_memobj_ref { };
  struct __invoke_memobj_deref { };
  struct __invoke_other { };


  template<typename _Tp, typename _Tag>
    struct __result_of_success : __success_type<_Tp>
    { using __invoke_type = _Tag; };


  struct __result_of_memfun_ref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      (std::declval<_Tp1>().*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_ref> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_ref
    : private __result_of_memfun_ref_impl
    {
      using type = decltype(_S_test<_MemPtr, _Arg, _Args...>(0));
    };


  struct __result_of_memfun_deref_impl
  {
    template<typename _Fp, typename _Tp1, typename... _Args>
      static __result_of_success<decltype(
      ((*std::declval<_Tp1>()).*std::declval<_Fp>())(std::declval<_Args>()...)
      ), __invoke_memfun_deref> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun_deref
    : private __result_of_memfun_deref_impl
    {
      using type = decltype(_S_test<_MemPtr, _Arg, _Args...>(0));
    };


  struct __result_of_memobj_ref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      std::declval<_Tp1>().*std::declval<_Fp>()
      ), __invoke_memobj_ref> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_ref
    : private __result_of_memobj_ref_impl
    {
      using type = decltype(_S_test<_MemPtr, _Arg>(0));
    };


  struct __result_of_memobj_deref_impl
  {
    template<typename _Fp, typename _Tp1>
      static __result_of_success<decltype(
      (*std::declval<_Tp1>()).*std::declval<_Fp>()
      ), __invoke_memobj_deref> _S_test(int);

    template<typename, typename>
      static __failure_type _S_test(...);
  };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj_deref
    : private __result_of_memobj_deref_impl
    {
      using type = decltype(_S_test<_MemPtr, _Arg>(0));
    };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_memobj;

  template<typename _Res, typename _Class, typename _Arg>
    struct __result_of_memobj<_Res _Class::*, _Arg>
    {
      using _Argval = __remove_cvref_t<_Arg>;
      using _MemPtr = _Res _Class::*;
      using type = typename __conditional_t<__or_<is_same<_Argval, _Class>,
        is_base_of<_Class, _Argval>>::value,
        __result_of_memobj_ref<_MemPtr, _Arg>,
        __result_of_memobj_deref<_MemPtr, _Arg>
      >::type;
    };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_memfun;

  template<typename _Res, typename _Class, typename _Arg, typename... _Args>
    struct __result_of_memfun<_Res _Class::*, _Arg, _Args...>
    {
      using _Argval = typename remove_reference<_Arg>::type;
      using _MemPtr = _Res _Class::*;
      using type = typename __conditional_t<is_base_of<_Class, _Argval>::value,
        __result_of_memfun_ref<_MemPtr, _Arg, _Args...>,
        __result_of_memfun_deref<_MemPtr, _Arg, _Args...>
      >::type;
    };






  template<typename _Tp, typename _Up = __remove_cvref_t<_Tp>>
    struct __inv_unwrap
    {
      using type = _Tp;
    };

  template<typename _Tp, typename _Up>
    struct __inv_unwrap<_Tp, reference_wrapper<_Up>>
    {
      using type = _Up&;
    };

  template<bool, bool, typename _Functor, typename... _ArgTypes>
    struct __result_of_impl
    {
      using type = __failure_type;
    };

  template<typename _MemPtr, typename _Arg>
    struct __result_of_impl<true, false, _MemPtr, _Arg>
    : public __result_of_memobj<__decay_t<_MemPtr>,
    typename __inv_unwrap<_Arg>::type>
    { };

  template<typename _MemPtr, typename _Arg, typename... _Args>
    struct __result_of_impl<false, true, _MemPtr, _Arg, _Args...>
    : public __result_of_memfun<__decay_t<_MemPtr>,
    typename __inv_unwrap<_Arg>::type, _Args...>
    { };


  struct __result_of_other_impl
  {
    template<typename _Fn, typename... _Args>
      static __result_of_success<decltype(
      std::declval<_Fn>()(std::declval<_Args>()...)
      ), __invoke_other> _S_test(int);

    template<typename...>
      static __failure_type _S_test(...);
  };

  template<typename _Functor, typename... _ArgTypes>
    struct __result_of_impl<false, false, _Functor, _ArgTypes...>
    : private __result_of_other_impl
    {
      using type = decltype(_S_test<_Functor, _ArgTypes...>(0));
    };


  template<typename _Functor, typename... _ArgTypes>
    struct __invoke_result
    : public __result_of_impl<
        is_member_object_pointer<
          typename remove_reference<_Functor>::type
        >::value,
        is_member_function_pointer<
          typename remove_reference<_Functor>::type
        >::value,
 _Functor, _ArgTypes...
      >::type
    { };


  template<typename _Fn, typename... _Args>
    using __invoke_result_t = typename __invoke_result<_Fn, _Args...>::type;


  template<typename _Functor, typename... _ArgTypes>
    struct result_of<_Functor(_ArgTypes...)>
    : public __invoke_result<_Functor, _ArgTypes...>
    { } __attribute__ ((__deprecated__ ("use '" "std::invoke_result" "' instead")));


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

  template<size_t _Len, size_t _Align =
     __alignof__(typename __aligned_storage_msa<_Len>::__type)>
    using aligned_storage_t = typename aligned_storage<_Len, _Align>::type;

  template <size_t _Len, typename... _Types>
    using aligned_union_t = typename aligned_union<_Len, _Types...>::type;
#pragma GCC diagnostic pop


  template<typename _Tp>
    using decay_t = typename decay<_Tp>::type;


  template<bool _Cond, typename _Tp = void>
    using enable_if_t = typename enable_if<_Cond, _Tp>::type;


  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    using conditional_t = typename conditional<_Cond, _Iftrue, _Iffalse>::type;


  template<typename... _Tp>
    using common_type_t = typename common_type<_Tp...>::type;


  template<typename _Tp>
    using underlying_type_t = typename underlying_type<_Tp>::type;


  template<typename _Tp>
    using result_of_t = typename result_of<_Tp>::type;




  template<typename...> using void_t = void;
# 2727 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Def, template<typename...> class _Op, typename... _Args>
    struct __detected_or
    {
      using type = _Def;
      using __is_detected = false_type;
    };


  template<typename _Def, template<typename...> class _Op, typename... _Args>
    requires requires { typename _Op<_Args...>; }
    struct __detected_or<_Def, _Op, _Args...>
    {
      using type = _Op<_Args...>;
      using __is_detected = true_type;
    };
# 2767 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Default, template<typename...> class _Op,
    typename... _Args>
    using __detected_or_t
      = typename __detected_or<_Default, _Op, _Args...>::type;
# 2786 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template <typename _Tp>
    struct __is_swappable;

  template <typename _Tp>
    struct __is_nothrow_swappable;

  template<typename>
    struct __is_tuple_like_impl : false_type
    { };


  template<typename _Tp>
    struct __is_tuple_like
    : public __is_tuple_like_impl<__remove_cvref_t<_Tp>>::type
    { };


  template<typename _Tp>
    constexpr
    inline
    _Require<__not_<__is_tuple_like<_Tp>>,
      is_move_constructible<_Tp>,
      is_move_assignable<_Tp>>
    swap(_Tp&, _Tp&)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>,
             is_nothrow_move_assignable<_Tp>>::value);

  template<typename _Tp, size_t _Nm>
    constexpr
    inline
    __enable_if_t<__is_swappable<_Tp>::value>
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value);


  namespace __swappable_details {
    using std::swap;

    struct __do_is_swappable_impl
    {
      template<typename _Tp, typename
               = decltype(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))>
        static true_type __test(int);

      template<typename>
        static false_type __test(...);
    };

    struct __do_is_nothrow_swappable_impl
    {
      template<typename _Tp>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp&>(), std::declval<_Tp&>()))
        > __test(int);

      template<typename>
        static false_type __test(...);
    };

  }

  template<typename _Tp>
    struct __is_swappable_impl
    : public __swappable_details::__do_is_swappable_impl
    {
      using type = decltype(__test<_Tp>(0));
    };

  template<typename _Tp>
    struct __is_nothrow_swappable_impl
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      using type = decltype(__test<_Tp>(0));
    };

  template<typename _Tp>
    struct __is_swappable
    : public __is_swappable_impl<_Tp>::type
    { };

  template<typename _Tp>
    struct __is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    { };






  template<typename _Tp>
    struct is_swappable
    : public __is_swappable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp>
    struct is_nothrow_swappable
    : public __is_nothrow_swappable_impl<_Tp>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };



  template<typename _Tp>
    inline constexpr bool is_swappable_v =
      is_swappable<_Tp>::value;


  template<typename _Tp>
    inline constexpr bool is_nothrow_swappable_v =
      is_nothrow_swappable<_Tp>::value;



  namespace __swappable_with_details {
    using std::swap;

    struct __do_is_swappable_with_impl
    {
      template<typename _Tp, typename _Up, typename
               = decltype(swap(std::declval<_Tp>(), std::declval<_Up>())),
               typename
               = decltype(swap(std::declval<_Up>(), std::declval<_Tp>()))>
        static true_type __test(int);

      template<typename, typename>
        static false_type __test(...);
    };

    struct __do_is_nothrow_swappable_with_impl
    {
      template<typename _Tp, typename _Up>
        static __bool_constant<
          noexcept(swap(std::declval<_Tp>(), std::declval<_Up>()))
          &&
          noexcept(swap(std::declval<_Up>(), std::declval<_Tp>()))
        > __test(int);

      template<typename, typename>
        static false_type __test(...);
    };

  }

  template<typename _Tp, typename _Up>
    struct __is_swappable_with_impl
    : public __swappable_with_details::__do_is_swappable_with_impl
    {
      using type = decltype(__test<_Tp, _Up>(0));
    };


  template<typename _Tp>
    struct __is_swappable_with_impl<_Tp&, _Tp&>
    : public __swappable_details::__do_is_swappable_impl
    {
      using type = decltype(__test<_Tp&>(0));
    };

  template<typename _Tp, typename _Up>
    struct __is_nothrow_swappable_with_impl
    : public __swappable_with_details::__do_is_nothrow_swappable_with_impl
    {
      using type = decltype(__test<_Tp, _Up>(0));
    };


  template<typename _Tp>
    struct __is_nothrow_swappable_with_impl<_Tp&, _Tp&>
    : public __swappable_details::__do_is_nothrow_swappable_impl
    {
      using type = decltype(__test<_Tp&>(0));
    };



  template<typename _Tp, typename _Up>
    struct is_swappable_with
    : public __is_swappable_with_impl<_Tp, _Up>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "first template argument must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Up>{}),
 "second template argument must be a complete class or an unbounded array");
    };


  template<typename _Tp, typename _Up>
    struct is_nothrow_swappable_with
    : public __is_nothrow_swappable_with_impl<_Tp, _Up>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "first template argument must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Up>{}),
 "second template argument must be a complete class or an unbounded array");
    };



  template<typename _Tp, typename _Up>
    inline constexpr bool is_swappable_with_v =
      is_swappable_with<_Tp, _Up>::value;


  template<typename _Tp, typename _Up>
    inline constexpr bool is_nothrow_swappable_with_v =
      is_nothrow_swappable_with<_Tp, _Up>::value;
# 3008 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Result, typename _Ret,
    bool = is_void<_Ret>::value, typename = void>
    struct __is_invocable_impl
    : false_type
    {
      using __nothrow_conv = false_type;
    };


  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                true,
          __void_t<typename _Result::type>>
    : true_type
    {
      using __nothrow_conv = true_type;
    };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"

  template<typename _Result, typename _Ret>
    struct __is_invocable_impl<_Result, _Ret,
                                false,
          __void_t<typename _Result::type>>
    {
    private:

      using _Res_t = typename _Result::type;



      static _Res_t _S_get() noexcept;


      template<typename _Tp>
 static void _S_conv(__type_identity_t<_Tp>) noexcept;


      template<typename _Tp,
        bool _Nothrow = noexcept(_S_conv<_Tp>(_S_get())),
        typename = decltype(_S_conv<_Tp>(_S_get())),

        bool _Dangle = __reference_converts_from_temporary(_Tp, _Res_t)



       >
 static __bool_constant<_Nothrow && !_Dangle>
 _S_test(int);

      template<typename _Tp, bool = false>
 static false_type
 _S_test(...);

    public:

      using type = decltype(_S_test<_Ret, true>(1));


      using __nothrow_conv = decltype(_S_test<_Ret>(1));
    };
#pragma GCC diagnostic pop

  template<typename _Fn, typename... _ArgTypes>
    struct __is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    { };

  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept((std::declval<_Up>().*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }

  template<typename _Fn, typename _Tp, typename... _Args>
    constexpr bool __call_is_nt(__invoke_memfun_deref)
    {
      return noexcept(((*std::declval<_Tp>()).*std::declval<_Fn>())(
     std::declval<_Args>()...));
    }

  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_ref)
    {
      using _Up = typename __inv_unwrap<_Tp>::type;
      return noexcept(std::declval<_Up>().*std::declval<_Fn>());
    }

  template<typename _Fn, typename _Tp>
    constexpr bool __call_is_nt(__invoke_memobj_deref)
    {
      return noexcept((*std::declval<_Tp>()).*std::declval<_Fn>());
    }

  template<typename _Fn, typename... _Args>
    constexpr bool __call_is_nt(__invoke_other)
    {
      return noexcept(std::declval<_Fn>()(std::declval<_Args>()...));
    }

  template<typename _Result, typename _Fn, typename... _Args>
    struct __call_is_nothrow
    : __bool_constant<
 std::__call_is_nt<_Fn, _Args...>(typename _Result::__invoke_type{})
      >
    { };

  template<typename _Fn, typename... _Args>
    using __call_is_nothrow_
      = __call_is_nothrow<__invoke_result<_Fn, _Args...>, _Fn, _Args...>;


  template<typename _Fn, typename... _Args>
    struct __is_nothrow_invocable
    : __and_<__is_invocable<_Fn, _Args...>,
             __call_is_nothrow_<_Fn, _Args...>>::type
    { };

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wctor-dtor-privacy"
  struct __nonesuchbase {};
  struct __nonesuch : private __nonesuchbase {
    ~__nonesuch() = delete;
    __nonesuch(__nonesuch const&) = delete;
    void operator=(__nonesuch const&) = delete;
  };
#pragma GCC diagnostic pop




  template<typename _Functor, typename... _ArgTypes>
    struct invoke_result
    : public __invoke_result<_Functor, _ArgTypes...>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Functor>{}),
 "_Functor must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
    };


  template<typename _Fn, typename... _Args>
    using invoke_result_t = typename invoke_result<_Fn, _Args...>::type;


  template<typename _Fn, typename... _ArgTypes>
    struct is_invocable
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
    };


  template<typename _Ret, typename _Fn, typename... _ArgTypes>
    struct is_invocable_r
    : __is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, _Ret>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Ret>{}),
 "_Ret must be a complete class or an unbounded array");
    };


  template<typename _Fn, typename... _ArgTypes>
    struct is_nothrow_invocable
    : __and_<__is_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, void>,
      __call_is_nothrow_<_Fn, _ArgTypes...>>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
    };





  template<typename _Result, typename _Ret>
    using __is_nt_invocable_impl
      = typename __is_invocable_impl<_Result, _Ret>::__nothrow_conv;



  template<typename _Ret, typename _Fn, typename... _ArgTypes>
    struct is_nothrow_invocable_r
    : __and_<__is_nt_invocable_impl<__invoke_result<_Fn, _ArgTypes...>, _Ret>,
             __call_is_nothrow_<_Fn, _ArgTypes...>>::type
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Fn>{}),
 "_Fn must be a complete class or an unbounded array");
      static_assert((std::__is_complete_or_unbounded(
 __type_identity<_ArgTypes>{}) && ...),
 "each argument type must be a complete class or an unbounded array");
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Ret>{}),
 "_Ret must be a complete class or an unbounded array");
    };
# 3236 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
template <typename _Tp>
  inline constexpr bool is_void_v = is_void<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_null_pointer_v = is_null_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_integral_v = is_integral<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_floating_point_v = is_floating_point<_Tp>::value;


template <typename _Tp>
  inline constexpr bool is_array_v = __is_array(_Tp);
# 3257 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
template <typename _Tp>
  inline constexpr bool is_pointer_v = is_pointer<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_lvalue_reference_v = false;
template <typename _Tp>
  inline constexpr bool is_lvalue_reference_v<_Tp&> = true;
template <typename _Tp>
  inline constexpr bool is_rvalue_reference_v = false;
template <typename _Tp>
  inline constexpr bool is_rvalue_reference_v<_Tp&&> = true;


template <typename _Tp>
  inline constexpr bool is_member_object_pointer_v =
    __is_member_object_pointer(_Tp);







template <typename _Tp>
  inline constexpr bool is_member_function_pointer_v =
    __is_member_function_pointer(_Tp);






template <typename _Tp>
  inline constexpr bool is_enum_v = __is_enum(_Tp);
template <typename _Tp>
  inline constexpr bool is_union_v = __is_union(_Tp);
template <typename _Tp>
  inline constexpr bool is_class_v = __is_class(_Tp);



template <typename _Tp>
  inline constexpr bool is_reference_v = __is_reference(_Tp);
# 3308 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
template <typename _Tp>
  inline constexpr bool is_arithmetic_v = is_arithmetic<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_fundamental_v = is_fundamental<_Tp>::value;


template <typename _Tp>
  inline constexpr bool is_object_v = __is_object(_Tp);





template <typename _Tp>
  inline constexpr bool is_scalar_v = is_scalar<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_compound_v = !is_fundamental_v<_Tp>;


template <typename _Tp>
  inline constexpr bool is_member_pointer_v = __is_member_pointer(_Tp);





template <typename _Tp>
  inline constexpr bool is_const_v = false;
template <typename _Tp>
  inline constexpr bool is_const_v<const _Tp> = true;


template <typename _Tp>
  inline constexpr bool is_function_v = __is_function(_Tp);
# 3351 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
template <typename _Tp>
  inline constexpr bool is_volatile_v = false;
template <typename _Tp>
  inline constexpr bool is_volatile_v<volatile _Tp> = true;

template <typename _Tp>
  inline constexpr bool is_trivial_v = __is_trivial(_Tp);
template <typename _Tp>
  inline constexpr bool is_trivially_copyable_v = __is_trivially_copyable(_Tp);
template <typename _Tp>
  inline constexpr bool is_standard_layout_v = __is_standard_layout(_Tp);
template <typename _Tp>
  __attribute__ ((__deprecated__ ("use '" "is_standard_layout_v && is_trivial_v" "' instead")))
  inline constexpr bool is_pod_v = __is_pod(_Tp);
template <typename _Tp>
  [[__deprecated__]]
  inline constexpr bool is_literal_type_v = __is_literal_type(_Tp);
template <typename _Tp>
  inline constexpr bool is_empty_v = __is_empty(_Tp);
template <typename _Tp>
  inline constexpr bool is_polymorphic_v = __is_polymorphic(_Tp);
template <typename _Tp>
  inline constexpr bool is_abstract_v = __is_abstract(_Tp);
template <typename _Tp>
  inline constexpr bool is_final_v = __is_final(_Tp);

template <typename _Tp>
  inline constexpr bool is_signed_v = is_signed<_Tp>::value;
template <typename _Tp>
  inline constexpr bool is_unsigned_v = is_unsigned<_Tp>::value;

template <typename _Tp, typename... _Args>
  inline constexpr bool is_constructible_v = __is_constructible(_Tp, _Args...);
template <typename _Tp>
  inline constexpr bool is_default_constructible_v = __is_constructible(_Tp);
template <typename _Tp>
  inline constexpr bool is_copy_constructible_v
    = __is_constructible(_Tp, __add_lval_ref_t<const _Tp>);
template <typename _Tp>
  inline constexpr bool is_move_constructible_v
    = __is_constructible(_Tp, __add_rval_ref_t<_Tp>);

template <typename _Tp, typename _Up>
  inline constexpr bool is_assignable_v = __is_assignable(_Tp, _Up);
template <typename _Tp>
  inline constexpr bool is_copy_assignable_v
    = __is_assignable(__add_lval_ref_t<_Tp>, __add_lval_ref_t<const _Tp>);
template <typename _Tp>
  inline constexpr bool is_move_assignable_v
    = __is_assignable(__add_lval_ref_t<_Tp>, __add_rval_ref_t<_Tp>);

template <typename _Tp>
  inline constexpr bool is_destructible_v = is_destructible<_Tp>::value;

template <typename _Tp, typename... _Args>
  inline constexpr bool is_trivially_constructible_v
    = __is_trivially_constructible(_Tp, _Args...);
template <typename _Tp>
  inline constexpr bool is_trivially_default_constructible_v
    = __is_trivially_constructible(_Tp);
template <typename _Tp>
  inline constexpr bool is_trivially_copy_constructible_v
    = __is_trivially_constructible(_Tp, __add_lval_ref_t<const _Tp>);
template <typename _Tp>
  inline constexpr bool is_trivially_move_constructible_v
    = __is_trivially_constructible(_Tp, __add_rval_ref_t<_Tp>);

template <typename _Tp, typename _Up>
  inline constexpr bool is_trivially_assignable_v
    = __is_trivially_assignable(_Tp, _Up);
template <typename _Tp>
  inline constexpr bool is_trivially_copy_assignable_v
    = __is_trivially_assignable(__add_lval_ref_t<_Tp>,
    __add_lval_ref_t<const _Tp>);
template <typename _Tp>
  inline constexpr bool is_trivially_move_assignable_v
    = __is_trivially_assignable(__add_lval_ref_t<_Tp>,
    __add_rval_ref_t<_Tp>);


template <typename _Tp>
  inline constexpr bool is_trivially_destructible_v = false;

template <typename _Tp>
  requires (!is_reference_v<_Tp>) && requires (_Tp& __t) { __t.~_Tp(); }
  inline constexpr bool is_trivially_destructible_v<_Tp>
    = __has_trivial_destructor(_Tp);
template <typename _Tp>
  inline constexpr bool is_trivially_destructible_v<_Tp&> = true;
template <typename _Tp>
  inline constexpr bool is_trivially_destructible_v<_Tp&&> = true;
template <typename _Tp, size_t _Nm>
  inline constexpr bool is_trivially_destructible_v<_Tp[_Nm]>
    = is_trivially_destructible_v<_Tp>;






template <typename _Tp, typename... _Args>
  inline constexpr bool is_nothrow_constructible_v
    = __is_nothrow_constructible(_Tp, _Args...);
template <typename _Tp>
  inline constexpr bool is_nothrow_default_constructible_v
    = __is_nothrow_constructible(_Tp);
template <typename _Tp>
  inline constexpr bool is_nothrow_copy_constructible_v
    = __is_nothrow_constructible(_Tp, __add_lval_ref_t<const _Tp>);
template <typename _Tp>
  inline constexpr bool is_nothrow_move_constructible_v
    = __is_nothrow_constructible(_Tp, __add_rval_ref_t<_Tp>);

template <typename _Tp, typename _Up>
  inline constexpr bool is_nothrow_assignable_v
    = __is_nothrow_assignable(_Tp, _Up);
template <typename _Tp>
  inline constexpr bool is_nothrow_copy_assignable_v
    = __is_nothrow_assignable(__add_lval_ref_t<_Tp>,
         __add_lval_ref_t<const _Tp>);
template <typename _Tp>
  inline constexpr bool is_nothrow_move_assignable_v
    = __is_nothrow_assignable(__add_lval_ref_t<_Tp>, __add_rval_ref_t<_Tp>);

template <typename _Tp>
  inline constexpr bool is_nothrow_destructible_v =
    is_nothrow_destructible<_Tp>::value;

template <typename _Tp>
  inline constexpr bool has_virtual_destructor_v
    = __has_virtual_destructor(_Tp);

template <typename _Tp>
  inline constexpr size_t alignment_of_v = alignment_of<_Tp>::value;

template <typename _Tp>
  inline constexpr size_t rank_v = 0;
template <typename _Tp, size_t _Size>
  inline constexpr size_t rank_v<_Tp[_Size]> = 1 + rank_v<_Tp>;
template <typename _Tp>
  inline constexpr size_t rank_v<_Tp[]> = 1 + rank_v<_Tp>;

template <typename _Tp, unsigned _Idx = 0>
  inline constexpr size_t extent_v = 0;
template <typename _Tp, size_t _Size>
  inline constexpr size_t extent_v<_Tp[_Size], 0> = _Size;
template <typename _Tp, unsigned _Idx, size_t _Size>
  inline constexpr size_t extent_v<_Tp[_Size], _Idx> = extent_v<_Tp, _Idx - 1>;
template <typename _Tp>
  inline constexpr size_t extent_v<_Tp[], 0> = 0;
template <typename _Tp, unsigned _Idx>
  inline constexpr size_t extent_v<_Tp[], _Idx> = extent_v<_Tp, _Idx - 1>;


template <typename _Tp, typename _Up>
  inline constexpr bool is_same_v = __is_same(_Tp, _Up);






template <typename _Base, typename _Derived>
  inline constexpr bool is_base_of_v = __is_base_of(_Base, _Derived);

template <typename _From, typename _To>
  inline constexpr bool is_convertible_v = __is_convertible(_From, _To);




template<typename _Fn, typename... _Args>
  inline constexpr bool is_invocable_v = is_invocable<_Fn, _Args...>::value;
template<typename _Fn, typename... _Args>
  inline constexpr bool is_nothrow_invocable_v
    = is_nothrow_invocable<_Fn, _Args...>::value;
template<typename _Ret, typename _Fn, typename... _Args>
  inline constexpr bool is_invocable_r_v
    = is_invocable_r<_Ret, _Fn, _Args...>::value;
template<typename _Ret, typename _Fn, typename... _Args>
  inline constexpr bool is_nothrow_invocable_r_v
    = is_nothrow_invocable_r<_Ret, _Fn, _Args...>::value;






  template<typename _Tp>
    struct has_unique_object_representations
    : bool_constant<__has_unique_object_representations(
      remove_cv_t<remove_all_extents_t<_Tp>>
      )>
    {
      static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
 "template argument must be a complete class or an unbounded array");
    };



  template<typename _Tp>
    inline constexpr bool has_unique_object_representations_v
      = has_unique_object_representations<_Tp>::value;






  template<typename _Tp>
    struct is_aggregate
    : bool_constant<__is_aggregate(remove_cv_t<_Tp>)>
    { };






  template<typename _Tp>
    inline constexpr bool is_aggregate_v = __is_aggregate(remove_cv_t<_Tp>);
# 3581 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct remove_cvref
    { using type = __remove_cvref(_Tp); };
# 3598 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    using remove_cvref_t = typename remove_cvref<_Tp>::type;
# 3608 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct type_identity { using type = _Tp; };

  template<typename _Tp>
    using type_identity_t = typename type_identity<_Tp>::type;
# 3621 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    struct unwrap_reference { using type = _Tp; };

  template<typename _Tp>
    struct unwrap_reference<reference_wrapper<_Tp>> { using type = _Tp&; };

  template<typename _Tp>
    using unwrap_reference_t = typename unwrap_reference<_Tp>::type;






  template<typename _Tp>
    struct unwrap_ref_decay { using type = unwrap_reference_t<decay_t<_Tp>>; };

  template<typename _Tp>
    using unwrap_ref_decay_t = typename unwrap_ref_decay<_Tp>::type;
# 3648 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    inline constexpr bool is_bounded_array_v = __is_bounded_array(_Tp);
# 3661 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp>
    inline constexpr bool is_unbounded_array_v = false;

  template<typename _Tp>
    inline constexpr bool is_unbounded_array_v<_Tp[]> = true;



  template<typename _Tp>
    struct is_bounded_array
    : public bool_constant<is_bounded_array_v<_Tp>>
    { };



  template<typename _Tp>
    struct is_unbounded_array
    : public bool_constant<is_unbounded_array_v<_Tp>>
    { };





  template<typename _Tp, typename _Up>
    struct is_layout_compatible
    : bool_constant<__is_layout_compatible(_Tp, _Up)>
    { };



  template<typename _Tp, typename _Up>
    constexpr bool is_layout_compatible_v
      = __is_layout_compatible(_Tp, _Up);







  template<typename _S1, typename _S2, typename _M1, typename _M2>
    constexpr bool
    is_corresponding_member(_M1 _S1::*__m1, _M2 _S2::*__m2) noexcept
    { return __builtin_is_corresponding_member(__m1, __m2); }







  template<typename _Base, typename _Derived>
    struct is_pointer_interconvertible_base_of
    : bool_constant<__is_pointer_interconvertible_base_of(_Base, _Derived)>
    { };



  template<typename _Base, typename _Derived>
    constexpr bool is_pointer_interconvertible_base_of_v
      = __is_pointer_interconvertible_base_of(_Base, _Derived);
# 3732 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  template<typename _Tp, typename _Mem>
    constexpr bool
    is_pointer_interconvertible_with_class(_Mem _Tp::*__mp) noexcept
    { return __builtin_is_pointer_interconvertible_with_class(__mp); }
# 3816 "C:/msys64/ucrt64/include/c++/14.2.0/type_traits" 3
  constexpr inline bool
  is_constant_evaluated() noexcept
  {



    return __builtin_is_constant_evaluated();

  }




  template<typename _From, typename _To>
    using __copy_cv = typename __match_cv_qualifiers<_From, _To>::__type;

  template<typename _Xp, typename _Yp>
    using __cond_res
      = decltype(false ? declval<_Xp(&)()>()() : declval<_Yp(&)()>()());

  template<typename _Ap, typename _Bp, typename = void>
    struct __common_ref_impl
    { };


  template<typename _Ap, typename _Bp>
    using __common_ref = typename __common_ref_impl<_Ap, _Bp>::type;


  template<typename _Xp, typename _Yp>
    using __condres_cvref
      = __cond_res<__copy_cv<_Xp, _Yp>&, __copy_cv<_Yp, _Xp>&>;


  template<typename _Xp, typename _Yp>
    struct __common_ref_impl<_Xp&, _Yp&, __void_t<__condres_cvref<_Xp, _Yp>>>
    : enable_if<is_reference_v<__condres_cvref<_Xp, _Yp>>,
  __condres_cvref<_Xp, _Yp>>
    { };


  template<typename _Xp, typename _Yp>
    using __common_ref_C = remove_reference_t<__common_ref<_Xp&, _Yp&>>&&;


  template<typename _Xp, typename _Yp>
    struct __common_ref_impl<_Xp&&, _Yp&&,
      _Require<is_convertible<_Xp&&, __common_ref_C<_Xp, _Yp>>,
        is_convertible<_Yp&&, __common_ref_C<_Xp, _Yp>>>>
    { using type = __common_ref_C<_Xp, _Yp>; };


  template<typename _Xp, typename _Yp>
    using __common_ref_D = __common_ref<const _Xp&, _Yp&>;


  template<typename _Xp, typename _Yp>
    struct __common_ref_impl<_Xp&&, _Yp&,
      _Require<is_convertible<_Xp&&, __common_ref_D<_Xp, _Yp>>>>
    { using type = __common_ref_D<_Xp, _Yp>; };


  template<typename _Xp, typename _Yp>
    struct __common_ref_impl<_Xp&, _Yp&&>
    : __common_ref_impl<_Yp&&, _Xp&>
    { };


  template<typename _Tp, typename _Up,
    template<typename> class _TQual, template<typename> class _UQual>
    struct basic_common_reference
    { };


  template<typename _Tp>
    struct __xref
    { template<typename _Up> using __type = __copy_cv<_Tp, _Up>; };

  template<typename _Tp>
    struct __xref<_Tp&>
    { template<typename _Up> using __type = __copy_cv<_Tp, _Up>&; };

  template<typename _Tp>
    struct __xref<_Tp&&>
    { template<typename _Up> using __type = __copy_cv<_Tp, _Up>&&; };

  template<typename _Tp1, typename _Tp2>
    using __basic_common_ref
      = typename basic_common_reference<remove_cvref_t<_Tp1>,
     remove_cvref_t<_Tp2>,
     __xref<_Tp1>::template __type,
     __xref<_Tp2>::template __type>::type;


  template<typename... _Tp>
    struct common_reference;

  template<typename... _Tp>
    using common_reference_t = typename common_reference<_Tp...>::type;


  template<>
    struct common_reference<>
    { };


  template<typename _Tp0>
    struct common_reference<_Tp0>
    { using type = _Tp0; };


  template<typename _Tp1, typename _Tp2, int _Bullet = 1, typename = void>
    struct __common_reference_impl
    : __common_reference_impl<_Tp1, _Tp2, _Bullet + 1>
    { };


  template<typename _Tp1, typename _Tp2>
    struct common_reference<_Tp1, _Tp2>
    : __common_reference_impl<_Tp1, _Tp2>
    { };


  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1&, _Tp2&, 1,
       void_t<__common_ref<_Tp1&, _Tp2&>>>
    { using type = __common_ref<_Tp1&, _Tp2&>; };

  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1&&, _Tp2&&, 1,
       void_t<__common_ref<_Tp1&&, _Tp2&&>>>
    { using type = __common_ref<_Tp1&&, _Tp2&&>; };

  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1&, _Tp2&&, 1,
       void_t<__common_ref<_Tp1&, _Tp2&&>>>
    { using type = __common_ref<_Tp1&, _Tp2&&>; };

  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1&&, _Tp2&, 1,
       void_t<__common_ref<_Tp1&&, _Tp2&>>>
    { using type = __common_ref<_Tp1&&, _Tp2&>; };


  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1, _Tp2, 2,
       void_t<__basic_common_ref<_Tp1, _Tp2>>>
    { using type = __basic_common_ref<_Tp1, _Tp2>; };


  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1, _Tp2, 3,
       void_t<__cond_res<_Tp1, _Tp2>>>
    { using type = __cond_res<_Tp1, _Tp2>; };


  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1, _Tp2, 4,
       void_t<common_type_t<_Tp1, _Tp2>>>
    { using type = common_type_t<_Tp1, _Tp2>; };


  template<typename _Tp1, typename _Tp2>
    struct __common_reference_impl<_Tp1, _Tp2, 5, void>
    { };


  template<typename _Tp1, typename _Tp2, typename... _Rest>
    struct common_reference<_Tp1, _Tp2, _Rest...>
    : __common_type_fold<common_reference<_Tp1, _Tp2>,
    __common_type_pack<_Rest...>>
    { };


  template<typename _Tp1, typename _Tp2, typename... _Rest>
    struct __common_type_fold<common_reference<_Tp1, _Tp2>,
         __common_type_pack<_Rest...>,
         void_t<common_reference_t<_Tp1, _Tp2>>>
    : public common_reference<common_reference_t<_Tp1, _Tp2>, _Rest...>
    { };







}
# 61 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 1 3
# 40 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 3
namespace std
{







  template<typename _Tp>
    inline constexpr _Tp*
    __addressof(_Tp& __r) noexcept
    { return __builtin_addressof(__r); }
# 67 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 3
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type& __t) noexcept
    { return static_cast<_Tp&&>(__t); }







  template<typename _Tp>
    [[__nodiscard__]]
    constexpr _Tp&&
    forward(typename std::remove_reference<_Tp>::type&& __t) noexcept
    {
      static_assert(!std::is_lvalue_reference<_Tp>::value,
   "std::forward must not be used to convert an rvalue to an lvalue");
      return static_cast<_Tp&&>(__t);
    }
# 123 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 3
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr typename std::remove_reference<_Tp>::type&&
    move(_Tp&& __t) noexcept
    { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }


  template<typename _Tp>
    struct __move_if_noexcept_cond
    : public __and_<__not_<is_nothrow_move_constructible<_Tp>>,
                    is_copy_constructible<_Tp>>::type { };
# 143 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 3
  template<typename _Tp>
    [[__nodiscard__]]
    constexpr
    __conditional_t<__move_if_noexcept_cond<_Tp>::value, const _Tp&, _Tp&&>
    move_if_noexcept(_Tp& __x) noexcept
    { return std::move(__x); }
# 159 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 3
  template<typename _Tp>
    [[__nodiscard__]]
    inline constexpr _Tp*
    addressof(_Tp& __r) noexcept
    { return std::__addressof(__r); }



  template<typename _Tp>
    const _Tp* addressof(const _Tp&&) = delete;


  template <typename _Tp, typename _Up = _Tp>
    constexpr
    inline _Tp
    __exchange(_Tp& __obj, _Up&& __new_val)
    {
      _Tp __old_val = std::move(__obj);
      __obj = std::forward<_Up>(__new_val);
      return __old_val;
    }
# 203 "C:/msys64/ucrt64/include/c++/14.2.0/bits/move.h" 3
  template<typename _Tp>
    constexpr
    inline

    typename enable_if<__and_<__not_<__is_tuple_like<_Tp>>,
         is_move_constructible<_Tp>,
         is_move_assignable<_Tp>>::value>::type



    swap(_Tp& __a, _Tp& __b)
    noexcept(__and_<is_nothrow_move_constructible<_Tp>, is_nothrow_move_assignable<_Tp>>::value)

    {




      _Tp __tmp = std::move(__a);
      __a = std::move(__b);
      __b = std::move(__tmp);
    }




  template<typename _Tp, size_t _Nm>
    constexpr
    inline

    typename enable_if<__is_swappable<_Tp>::value>::type



    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])
    noexcept(__is_nothrow_swappable<_Tp>::value)
    {
      for (size_t __n = 0; __n < _Nm; ++__n)
 swap(__a[__n], __b[__n]);
    }



}
# 62 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/utility.h" 1 3
# 36 "C:/msys64/ucrt64/include/c++/14.2.0/bits/utility.h" 3
       
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/bits/utility.h" 3






namespace std
{



  template<typename _Tp>
    struct tuple_size;





  template<typename _Tp,
    typename _Up = typename remove_cv<_Tp>::type,
    typename = typename enable_if<is_same<_Tp, _Up>::value>::type,
    size_t = tuple_size<_Tp>::value>
    using __enable_if_has_tuple_size = _Tp;

  template<typename _Tp>
    struct tuple_size<const __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };

  template<typename _Tp>
    struct tuple_size<volatile __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };

  template<typename _Tp>
    struct tuple_size<const volatile __enable_if_has_tuple_size<_Tp>>
    : public tuple_size<_Tp> { };


  template<typename _Tp>
    inline constexpr size_t tuple_size_v = tuple_size<_Tp>::value;



  template<size_t __i, typename _Tp>
    struct tuple_element;


  template<size_t __i, typename _Tp>
    using __tuple_element_t = typename tuple_element<__i, _Tp>::type;

  template<size_t __i, typename _Tp>
    struct tuple_element<__i, const _Tp>
    {
      using type = const __tuple_element_t<__i, _Tp>;
    };

  template<size_t __i, typename _Tp>
    struct tuple_element<__i, volatile _Tp>
    {
      using type = volatile __tuple_element_t<__i, _Tp>;
    };

  template<size_t __i, typename _Tp>
    struct tuple_element<__i, const volatile _Tp>
    {
      using type = const volatile __tuple_element_t<__i, _Tp>;
    };





  template<typename _Tp, typename... _Types>
    constexpr size_t
    __find_uniq_type_in_pack()
    {
      constexpr size_t __sz = sizeof...(_Types);
      constexpr bool __found[__sz] = { __is_same(_Tp, _Types) ... };
      size_t __n = __sz;
      for (size_t __i = 0; __i < __sz; ++__i)
 {
   if (__found[__i])
     {
       if (__n < __sz)
  return __sz;
       __n = __i;
     }
 }
      return __n;
    }
# 134 "C:/msys64/ucrt64/include/c++/14.2.0/bits/utility.h" 3
  template<size_t __i, typename _Tp>
    using tuple_element_t = typename tuple_element<__i, _Tp>::type;




  template<size_t... _Indexes> struct _Index_tuple { };


  template<size_t _Num>
    struct _Build_index_tuple
    {
# 154 "C:/msys64/ucrt64/include/c++/14.2.0/bits/utility.h" 3
      using __type = _Index_tuple<__integer_pack(_Num)...>;

    };




  template<typename _Tp, _Tp... _Idx>
    struct integer_sequence
    {

      static_assert(is_integral_v<_Tp>);

      typedef _Tp value_type;
      static constexpr size_t size() noexcept { return sizeof...(_Idx); }
    };


  template<typename _Tp, _Tp _Num>
    using make_integer_sequence



      = integer_sequence<_Tp, __integer_pack(_Num)...>;



  template<size_t... _Idx>
    using index_sequence = integer_sequence<size_t, _Idx...>;


  template<size_t _Num>
    using make_index_sequence = make_integer_sequence<size_t, _Num>;


  template<typename... _Types>
    using index_sequence_for = make_index_sequence<sizeof...(_Types)>;




  struct in_place_t {
    explicit in_place_t() = default;
  };

  inline constexpr in_place_t in_place{};

  template<typename _Tp> struct in_place_type_t
  {
    explicit in_place_type_t() = default;
  };

  template<typename _Tp>
    inline constexpr in_place_type_t<_Tp> in_place_type{};

  template<size_t _Idx> struct in_place_index_t
  {
    explicit in_place_index_t() = default;
  };

  template<size_t _Idx>
    inline constexpr in_place_index_t<_Idx> in_place_index{};

  template<typename>
    inline constexpr bool __is_in_place_type_v = false;

  template<typename _Tp>
    inline constexpr bool __is_in_place_type_v<in_place_type_t<_Tp>> = true;

  template<typename _Tp>
    using __is_in_place_type = bool_constant<__is_in_place_type_v<_Tp>>;

  template<typename>
    inline constexpr bool __is_in_place_index_v = false;

  template<size_t _Nm>
    inline constexpr bool __is_in_place_index_v<in_place_index_t<_Nm>> = true;




  template<size_t _Np, typename... _Types>
    struct _Nth_type
    { using type = __type_pack_element<_Np, _Types...>; };
# 276 "C:/msys64/ucrt64/include/c++/14.2.0/bits/utility.h" 3
  namespace ranges::__detail
  {
    template<typename _Range>
      inline constexpr bool __is_subrange = false;
  }



}
# 63 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 2 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 1 3
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3
       
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 2 3



# 1 "C:/msys64/ucrt64/include/c++/14.2.0/concepts" 1 3
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/concepts" 3
       
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/concepts" 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/concepts" 2 3
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/concepts" 3
namespace std
{




  namespace __detail
  {
    template<typename _Tp, typename _Up>
      concept __same_as = std::is_same_v<_Tp, _Up>;
  }


  template<typename _Tp, typename _Up>
    concept same_as
      = __detail::__same_as<_Tp, _Up> && __detail::__same_as<_Up, _Tp>;

  namespace __detail
  {
    template<typename _Tp, typename _Up>
      concept __different_from
 = !same_as<remove_cvref_t<_Tp>, remove_cvref_t<_Up>>;
  }


  template<typename _Derived, typename _Base>
    concept derived_from = __is_base_of(_Base, _Derived)
      && is_convertible_v<const volatile _Derived*, const volatile _Base*>;


  template<typename _From, typename _To>
    concept convertible_to = is_convertible_v<_From, _To>
      && requires { static_cast<_To>(std::declval<_From>()); };


  template<typename _Tp, typename _Up>
    concept common_reference_with
      = same_as<common_reference_t<_Tp, _Up>, common_reference_t<_Up, _Tp>>
      && convertible_to<_Tp, common_reference_t<_Tp, _Up>>
      && convertible_to<_Up, common_reference_t<_Tp, _Up>>;


  template<typename _Tp, typename _Up>
    concept common_with
      = same_as<common_type_t<_Tp, _Up>, common_type_t<_Up, _Tp>>
      && requires {
 static_cast<common_type_t<_Tp, _Up>>(std::declval<_Tp>());
 static_cast<common_type_t<_Tp, _Up>>(std::declval<_Up>());
      }
      && common_reference_with<add_lvalue_reference_t<const _Tp>,
          add_lvalue_reference_t<const _Up>>
      && common_reference_with<add_lvalue_reference_t<common_type_t<_Tp, _Up>>,
          common_reference_t<
     add_lvalue_reference_t<const _Tp>,
     add_lvalue_reference_t<const _Up>>>;



  template<typename _Tp>
    concept integral = is_integral_v<_Tp>;

  template<typename _Tp>
    concept signed_integral = integral<_Tp> && is_signed_v<_Tp>;

  template<typename _Tp>
    concept unsigned_integral = integral<_Tp> && !signed_integral<_Tp>;

  template<typename _Tp>
    concept floating_point = is_floating_point_v<_Tp>;

  namespace __detail
  {
    template<typename _Tp>
      using __cref = const remove_reference_t<_Tp>&;

    template<typename _Tp>
      concept __class_or_enum
 = is_class_v<_Tp> || is_union_v<_Tp> || is_enum_v<_Tp>;

    template<typename _Tp>
      constexpr bool __destructible_impl = false;
    template<typename _Tp>
      requires requires(_Tp& __t) { { __t.~_Tp() } noexcept; }
      constexpr bool __destructible_impl<_Tp> = true;

    template<typename _Tp>
      constexpr bool __destructible = __destructible_impl<_Tp>;
    template<typename _Tp>
      constexpr bool __destructible<_Tp&> = true;
    template<typename _Tp>
      constexpr bool __destructible<_Tp&&> = true;
    template<typename _Tp, size_t _Nm>
      constexpr bool __destructible<_Tp[_Nm]> = __destructible<_Tp>;

  }


  template<typename _Lhs, typename _Rhs>
    concept assignable_from
      = is_lvalue_reference_v<_Lhs>
      && common_reference_with<__detail::__cref<_Lhs>, __detail::__cref<_Rhs>>
      && requires(_Lhs __lhs, _Rhs&& __rhs) {
 { __lhs = static_cast<_Rhs&&>(__rhs) } -> same_as<_Lhs>;
      };


  template<typename _Tp>
    concept destructible = __detail::__destructible<_Tp>;


  template<typename _Tp, typename... _Args>
    concept constructible_from
      = destructible<_Tp> && is_constructible_v<_Tp, _Args...>;


  template<typename _Tp>
    concept default_initializable = constructible_from<_Tp>
      && requires
      {
 _Tp{};
 (void) ::new _Tp;
      };


  template<typename _Tp>
    concept move_constructible
    = constructible_from<_Tp, _Tp> && convertible_to<_Tp, _Tp>;


  template<typename _Tp>
    concept copy_constructible
      = move_constructible<_Tp>
      && constructible_from<_Tp, _Tp&> && convertible_to<_Tp&, _Tp>
      && constructible_from<_Tp, const _Tp&> && convertible_to<const _Tp&, _Tp>
      && constructible_from<_Tp, const _Tp> && convertible_to<const _Tp, _Tp>;



  namespace ranges
  {

    namespace __swap
    {
      template<typename _Tp> void swap(_Tp&, _Tp&) = delete;

      template<typename _Tp, typename _Up>
 concept __adl_swap
   = (std::__detail::__class_or_enum<remove_reference_t<_Tp>>
     || std::__detail::__class_or_enum<remove_reference_t<_Up>>)
   && requires(_Tp&& __t, _Up&& __u) {
     swap(static_cast<_Tp&&>(__t), static_cast<_Up&&>(__u));
   };

      struct _Swap
      {
      private:
 template<typename _Tp, typename _Up>
   static constexpr bool
   _S_noexcept()
   {
     if constexpr (__adl_swap<_Tp, _Up>)
       return noexcept(swap(std::declval<_Tp>(), std::declval<_Up>()));
     else
       return is_nothrow_move_constructible_v<remove_reference_t<_Tp>>
     && is_nothrow_move_assignable_v<remove_reference_t<_Tp>>;
   }

      public:
 template<typename _Tp, typename _Up>
   requires __adl_swap<_Tp, _Up>
   || (same_as<_Tp, _Up> && is_lvalue_reference_v<_Tp>
       && move_constructible<remove_reference_t<_Tp>>
       && assignable_from<_Tp, remove_reference_t<_Tp>>)
   constexpr void
   operator()(_Tp&& __t, _Up&& __u) const
   noexcept(_S_noexcept<_Tp, _Up>())
   {
     if constexpr (__adl_swap<_Tp, _Up>)
       swap(static_cast<_Tp&&>(__t), static_cast<_Up&&>(__u));
     else
       {
  auto __tmp = static_cast<remove_reference_t<_Tp>&&>(__t);
  __t = static_cast<remove_reference_t<_Tp>&&>(__u);
  __u = static_cast<remove_reference_t<_Tp>&&>(__tmp);
       }
   }

 template<typename _Tp, typename _Up, size_t _Num>
   requires requires(const _Swap& __swap, _Tp& __e1, _Up& __e2) {
     __swap(__e1, __e2);
   }
   constexpr void
   operator()(_Tp (&__e1)[_Num], _Up (&__e2)[_Num]) const
   noexcept(noexcept(std::declval<const _Swap&>()(*__e1, *__e2)))
   {
     for (size_t __n = 0; __n < _Num; ++__n)
       (*this)(__e1[__n], __e2[__n]);
   }
      };
    }


    inline namespace _Cpo {
      inline constexpr __swap::_Swap swap{};
    }
  }

  template<typename _Tp>
    concept swappable
      = requires(_Tp& __a, _Tp& __b) { ranges::swap(__a, __b); };

  template<typename _Tp, typename _Up>
    concept swappable_with = common_reference_with<_Tp, _Up>
      && requires(_Tp&& __t, _Up&& __u) {
 ranges::swap(static_cast<_Tp&&>(__t), static_cast<_Tp&&>(__t));
 ranges::swap(static_cast<_Up&&>(__u), static_cast<_Up&&>(__u));
 ranges::swap(static_cast<_Tp&&>(__t), static_cast<_Up&&>(__u));
 ranges::swap(static_cast<_Up&&>(__u), static_cast<_Tp&&>(__t));
      };



  template<typename _Tp>
    concept movable = is_object_v<_Tp> && move_constructible<_Tp>
      && assignable_from<_Tp&, _Tp> && swappable<_Tp>;

  template<typename _Tp>
    concept copyable = copy_constructible<_Tp> && movable<_Tp>
      && assignable_from<_Tp&, _Tp&> && assignable_from<_Tp&, const _Tp&>
      && assignable_from<_Tp&, const _Tp>;

  template<typename _Tp>
    concept semiregular = copyable<_Tp> && default_initializable<_Tp>;




  namespace __detail
  {
    template<typename _Tp>
      concept __boolean_testable_impl = convertible_to<_Tp, bool>;

    template<typename _Tp>
      concept __boolean_testable
 = __boolean_testable_impl<_Tp>
   && requires(_Tp&& __t)
   { { !static_cast<_Tp&&>(__t) } -> __boolean_testable_impl; };
  }



  namespace __detail
  {
    template<typename _Tp, typename _Up>
      concept __weakly_eq_cmp_with
 = requires(__detail::__cref<_Tp> __t, __detail::__cref<_Up> __u) {
   { __t == __u } -> __boolean_testable;
   { __t != __u } -> __boolean_testable;
   { __u == __t } -> __boolean_testable;
   { __u != __t } -> __boolean_testable;
 };
  }

  template<typename _Tp>
    concept equality_comparable = __detail::__weakly_eq_cmp_with<_Tp, _Tp>;

  template<typename _Tp, typename _Up>
    concept equality_comparable_with
      = equality_comparable<_Tp> && equality_comparable<_Up>
      && common_reference_with<__detail::__cref<_Tp>, __detail::__cref<_Up>>
      && equality_comparable<common_reference_t<__detail::__cref<_Tp>,
      __detail::__cref<_Up>>>
      && __detail::__weakly_eq_cmp_with<_Tp, _Up>;

  namespace __detail
  {
    template<typename _Tp, typename _Up>
      concept __partially_ordered_with
 = requires(const remove_reference_t<_Tp>& __t,
     const remove_reference_t<_Up>& __u) {
   { __t < __u } -> __boolean_testable;
   { __t > __u } -> __boolean_testable;
   { __t <= __u } -> __boolean_testable;
   { __t >= __u } -> __boolean_testable;
   { __u < __t } -> __boolean_testable;
   { __u > __t } -> __boolean_testable;
   { __u <= __t } -> __boolean_testable;
   { __u >= __t } -> __boolean_testable;
 };
  }


  template<typename _Tp>
    concept totally_ordered
      = equality_comparable<_Tp>
      && __detail::__partially_ordered_with<_Tp, _Tp>;

  template<typename _Tp, typename _Up>
    concept totally_ordered_with
      = totally_ordered<_Tp> && totally_ordered<_Up>
      && equality_comparable_with<_Tp, _Up>
      && totally_ordered<common_reference_t<__detail::__cref<_Tp>,
         __detail::__cref<_Up>>>
      && __detail::__partially_ordered_with<_Tp, _Up>;

  template<typename _Tp>
    concept regular = semiregular<_Tp> && equality_comparable<_Tp>;




  template<typename _Fn, typename... _Args>
    concept invocable = is_invocable_v<_Fn, _Args...>;


  template<typename _Fn, typename... _Args>
    concept regular_invocable = invocable<_Fn, _Args...>;


  template<typename _Fn, typename... _Args>
    concept predicate = regular_invocable<_Fn, _Args...>
      && __detail::__boolean_testable<invoke_result_t<_Fn, _Args...>>;


  template<typename _Rel, typename _Tp, typename _Up>
    concept relation
      = predicate<_Rel, _Tp, _Tp> && predicate<_Rel, _Up, _Up>
      && predicate<_Rel, _Tp, _Up> && predicate<_Rel, _Up, _Tp>;


  template<typename _Rel, typename _Tp, typename _Up>
    concept equivalence_relation = relation<_Rel, _Tp, _Up>;


  template<typename _Rel, typename _Tp, typename _Up>
    concept strict_weak_order = relation<_Rel, _Tp, _Up>;


}
# 41 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 2 3

namespace std
{


  namespace __cmp_cat
  {
    using type = signed char;

    enum class _Ord : type { equivalent = 0, less = -1, greater = 1 };

    enum class _Ncmp : type { _Unordered = 2 };

    struct __unspec
    {
      consteval __unspec(__unspec*) noexcept { }
    };
  }

  class partial_ordering
  {

    __cmp_cat::type _M_value;

    constexpr explicit
    partial_ordering(__cmp_cat::_Ord __v) noexcept
    : _M_value(__cmp_cat::type(__v))
    { }

    constexpr explicit
    partial_ordering(__cmp_cat::_Ncmp __v) noexcept
    : _M_value(__cmp_cat::type(__v))
    { }

    friend class weak_ordering;
    friend class strong_ordering;

  public:

    static const partial_ordering less;
    static const partial_ordering equivalent;
    static const partial_ordering greater;
    static const partial_ordering unordered;


    [[nodiscard]]
    friend constexpr bool
    operator==(partial_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value == 0; }

    [[nodiscard]]
    friend constexpr bool
    operator==(partial_ordering, partial_ordering) noexcept = default;

    [[nodiscard]]
    friend constexpr bool
    operator< (partial_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value == -1; }

    [[nodiscard]]
    friend constexpr bool
    operator> (partial_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value == 1; }

    [[nodiscard]]
    friend constexpr bool
    operator<=(partial_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value <= 0; }

    [[nodiscard]]
    friend constexpr bool
    operator>=(partial_ordering __v, __cmp_cat::__unspec) noexcept
    { return __cmp_cat::type(__v._M_value & 1) == __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator< (__cmp_cat::__unspec, partial_ordering __v) noexcept
    { return __v._M_value == 1; }

    [[nodiscard]]
    friend constexpr bool
    operator> (__cmp_cat::__unspec, partial_ordering __v) noexcept
    { return __v._M_value == -1; }

    [[nodiscard]]
    friend constexpr bool
    operator<=(__cmp_cat::__unspec, partial_ordering __v) noexcept
    { return __cmp_cat::type(__v._M_value & 1) == __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator>=(__cmp_cat::__unspec, partial_ordering __v) noexcept
    { return 0 >= __v._M_value; }

    [[nodiscard]]
    friend constexpr partial_ordering
    operator<=>(partial_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v; }

    [[nodiscard]]
    friend constexpr partial_ordering
    operator<=>(__cmp_cat::__unspec, partial_ordering __v) noexcept
    {
      if (__v._M_value & 1)
 return partial_ordering(__cmp_cat::_Ord(-__v._M_value));
      else
 return __v;
    }
  };


  inline constexpr partial_ordering
  partial_ordering::less(__cmp_cat::_Ord::less);

  inline constexpr partial_ordering
  partial_ordering::equivalent(__cmp_cat::_Ord::equivalent);

  inline constexpr partial_ordering
  partial_ordering::greater(__cmp_cat::_Ord::greater);

  inline constexpr partial_ordering
  partial_ordering::unordered(__cmp_cat::_Ncmp::_Unordered);

  class weak_ordering
  {
    __cmp_cat::type _M_value;

    constexpr explicit
    weak_ordering(__cmp_cat::_Ord __v) noexcept : _M_value(__cmp_cat::type(__v))
    { }

    friend class strong_ordering;

  public:

    static const weak_ordering less;
    static const weak_ordering equivalent;
    static const weak_ordering greater;

    [[nodiscard]]
    constexpr operator partial_ordering() const noexcept
    { return partial_ordering(__cmp_cat::_Ord(_M_value)); }


    [[nodiscard]]
    friend constexpr bool
    operator==(weak_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value == 0; }

    [[nodiscard]]
    friend constexpr bool
    operator==(weak_ordering, weak_ordering) noexcept = default;

    [[nodiscard]]
    friend constexpr bool
    operator< (weak_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value < 0; }

    [[nodiscard]]
    friend constexpr bool
    operator> (weak_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value > 0; }

    [[nodiscard]]
    friend constexpr bool
    operator<=(weak_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value <= 0; }

    [[nodiscard]]
    friend constexpr bool
    operator>=(weak_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value >= 0; }

    [[nodiscard]]
    friend constexpr bool
    operator< (__cmp_cat::__unspec, weak_ordering __v) noexcept
    { return 0 < __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator> (__cmp_cat::__unspec, weak_ordering __v) noexcept
    { return 0 > __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator<=(__cmp_cat::__unspec, weak_ordering __v) noexcept
    { return 0 <= __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator>=(__cmp_cat::__unspec, weak_ordering __v) noexcept
    { return 0 >= __v._M_value; }

    [[nodiscard]]
    friend constexpr weak_ordering
    operator<=>(weak_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v; }

    [[nodiscard]]
    friend constexpr weak_ordering
    operator<=>(__cmp_cat::__unspec, weak_ordering __v) noexcept
    { return weak_ordering(__cmp_cat::_Ord(-__v._M_value)); }
  };


  inline constexpr weak_ordering
  weak_ordering::less(__cmp_cat::_Ord::less);

  inline constexpr weak_ordering
  weak_ordering::equivalent(__cmp_cat::_Ord::equivalent);

  inline constexpr weak_ordering
  weak_ordering::greater(__cmp_cat::_Ord::greater);

  class strong_ordering
  {
    __cmp_cat::type _M_value;

    constexpr explicit
    strong_ordering(__cmp_cat::_Ord __v) noexcept
    : _M_value(__cmp_cat::type(__v))
    { }

  public:

    static const strong_ordering less;
    static const strong_ordering equal;
    static const strong_ordering equivalent;
    static const strong_ordering greater;

    [[nodiscard]]
    constexpr operator partial_ordering() const noexcept
    { return partial_ordering(__cmp_cat::_Ord(_M_value)); }

    [[nodiscard]]
    constexpr operator weak_ordering() const noexcept
    { return weak_ordering(__cmp_cat::_Ord(_M_value)); }


    [[nodiscard]]
    friend constexpr bool
    operator==(strong_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value == 0; }

    [[nodiscard]]
    friend constexpr bool
    operator==(strong_ordering, strong_ordering) noexcept = default;

    [[nodiscard]]
    friend constexpr bool
    operator< (strong_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value < 0; }

    [[nodiscard]]
    friend constexpr bool
    operator> (strong_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value > 0; }

    [[nodiscard]]
    friend constexpr bool
    operator<=(strong_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value <= 0; }

    [[nodiscard]]
    friend constexpr bool
    operator>=(strong_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v._M_value >= 0; }

    [[nodiscard]]
    friend constexpr bool
    operator< (__cmp_cat::__unspec, strong_ordering __v) noexcept
    { return 0 < __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator> (__cmp_cat::__unspec, strong_ordering __v) noexcept
    { return 0 > __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator<=(__cmp_cat::__unspec, strong_ordering __v) noexcept
    { return 0 <= __v._M_value; }

    [[nodiscard]]
    friend constexpr bool
    operator>=(__cmp_cat::__unspec, strong_ordering __v) noexcept
    { return 0 >= __v._M_value; }

    [[nodiscard]]
    friend constexpr strong_ordering
    operator<=>(strong_ordering __v, __cmp_cat::__unspec) noexcept
    { return __v; }

    [[nodiscard]]
    friend constexpr strong_ordering
    operator<=>(__cmp_cat::__unspec, strong_ordering __v) noexcept
    { return strong_ordering(__cmp_cat::_Ord(-__v._M_value)); }
  };


  inline constexpr strong_ordering
  strong_ordering::less(__cmp_cat::_Ord::less);

  inline constexpr strong_ordering
  strong_ordering::equal(__cmp_cat::_Ord::equivalent);

  inline constexpr strong_ordering
  strong_ordering::equivalent(__cmp_cat::_Ord::equivalent);

  inline constexpr strong_ordering
  strong_ordering::greater(__cmp_cat::_Ord::greater);



  [[nodiscard]]
  constexpr bool
  is_eq(partial_ordering __cmp) noexcept
  { return __cmp == 0; }

  [[nodiscard]]
  constexpr bool
  is_neq(partial_ordering __cmp) noexcept
  { return __cmp != 0; }

  [[nodiscard]]
  constexpr bool
  is_lt (partial_ordering __cmp) noexcept
  { return __cmp < 0; }

  [[nodiscard]]
  constexpr bool
  is_lteq(partial_ordering __cmp) noexcept
  { return __cmp <= 0; }

  [[nodiscard]]
  constexpr bool
  is_gt (partial_ordering __cmp) noexcept
  { return __cmp > 0; }

  [[nodiscard]]
  constexpr bool
  is_gteq(partial_ordering __cmp) noexcept
  { return __cmp >= 0; }

  namespace __detail
  {
    template<typename _Tp>
      inline constexpr unsigned __cmp_cat_id = 1;
    template<>
      inline constexpr unsigned __cmp_cat_id<partial_ordering> = 2;
    template<>
      inline constexpr unsigned __cmp_cat_id<weak_ordering> = 4;
    template<>
      inline constexpr unsigned __cmp_cat_id<strong_ordering> = 8;

    template<typename... _Ts>
      constexpr auto __common_cmp_cat()
      {
 constexpr unsigned __cats = (__cmp_cat_id<_Ts> | ...);

 if constexpr (__cats & 1)
   return;


 else if constexpr (bool(__cats & __cmp_cat_id<partial_ordering>))
   return partial_ordering::equivalent;


 else if constexpr (bool(__cats & __cmp_cat_id<weak_ordering>))
   return weak_ordering::equivalent;

 else
   return strong_ordering::equivalent;
      }
  }


  template<typename... _Ts>
    struct common_comparison_category
    {
      using type = decltype(__detail::__common_cmp_cat<_Ts...>());
    };



  template<typename _Tp>
    struct common_comparison_category<_Tp>
    { using type = void; };

  template<>
    struct common_comparison_category<partial_ordering>
    { using type = partial_ordering; };

  template<>
    struct common_comparison_category<weak_ordering>
    { using type = weak_ordering; };

  template<>
    struct common_comparison_category<strong_ordering>
    { using type = strong_ordering; };

  template<>
    struct common_comparison_category<>
    { using type = strong_ordering; };

  template<typename... _Ts>
    using common_comparison_category_t
      = typename common_comparison_category<_Ts...>::type;



  namespace __detail
  {
    template<typename _Tp, typename _Cat>
      concept __compares_as
 = same_as<common_comparison_category_t<_Tp, _Cat>, _Cat>;
  }


  template<typename _Tp, typename _Cat = partial_ordering>
    concept three_way_comparable
      = __detail::__weakly_eq_cmp_with<_Tp, _Tp>
      && __detail::__partially_ordered_with<_Tp, _Tp>
      && requires(const remove_reference_t<_Tp>& __a,
    const remove_reference_t<_Tp>& __b)
      {
 { __a <=> __b } -> __detail::__compares_as<_Cat>;
      };

  template<typename _Tp, typename _Up, typename _Cat = partial_ordering>
    concept three_way_comparable_with
      = three_way_comparable<_Tp, _Cat>
      && three_way_comparable<_Up, _Cat>
      && common_reference_with<const remove_reference_t<_Tp>&,
          const remove_reference_t<_Up>&>
      && three_way_comparable<
   common_reference_t<const remove_reference_t<_Tp>&,
        const remove_reference_t<_Up>&>, _Cat>
      && __detail::__weakly_eq_cmp_with<_Tp, _Up>
      && __detail::__partially_ordered_with<_Tp, _Up>
      && requires(const remove_reference_t<_Tp>& __t,
    const remove_reference_t<_Up>& __u)
      {
 { __t <=> __u } -> __detail::__compares_as<_Cat>;
 { __u <=> __t } -> __detail::__compares_as<_Cat>;
      };

  namespace __detail
  {
    template<typename _Tp, typename _Up>
      using __cmp3way_res_t
 = decltype(std::declval<_Tp>() <=> std::declval<_Up>());






    template<typename _Tp, typename _Up>
      struct __cmp3way_res_impl
      { };

    template<typename _Tp, typename _Up>
      requires requires { typename __cmp3way_res_t<__cref<_Tp>, __cref<_Up>>; }
      struct __cmp3way_res_impl<_Tp, _Up>
      {
 using type = __cmp3way_res_t<__cref<_Tp>, __cref<_Up>>;
      };
  }


  template<typename _Tp, typename _Up = _Tp>
    struct compare_three_way_result
    : __detail::__cmp3way_res_impl<_Tp, _Up>
    { };


  template<typename _Tp, typename _Up = _Tp>
    using compare_three_way_result_t
      = typename __detail::__cmp3way_res_impl<_Tp, _Up>::type;

  namespace __detail
  {




    template<typename _Tp, typename _Up>
      concept __3way_builtin_ptr_cmp
 = requires(_Tp&& __t, _Up&& __u)
   { static_cast<_Tp&&>(__t) <=> static_cast<_Up&&>(__u); }
   && convertible_to<_Tp, const volatile void*>
   && convertible_to<_Up, const volatile void*>
   && ! requires(_Tp&& __t, _Up&& __u)
   { operator<=>(static_cast<_Tp&&>(__t), static_cast<_Up&&>(__u)); }
   && ! requires(_Tp&& __t, _Up&& __u)
   { static_cast<_Tp&&>(__t).operator<=>(static_cast<_Up&&>(__u)); };
  }





  struct compare_three_way
  {
    template<typename _Tp, typename _Up>
      requires three_way_comparable_with<_Tp, _Up>
      constexpr auto
      operator() [[nodiscard]] (_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Tp>() <=> std::declval<_Up>()))
      {
 if constexpr (__detail::__3way_builtin_ptr_cmp<_Tp, _Up>)
   {
     auto __pt = static_cast<const volatile void*>(__t);
     auto __pu = static_cast<const volatile void*>(__u);
     if (std::__is_constant_evaluated())
       return __pt <=> __pu;
     auto __it = reinterpret_cast<long long unsigned int>(__pt);
     auto __iu = reinterpret_cast<long long unsigned int>(__pu);
     return __it <=> __iu;
   }
 else
   return static_cast<_Tp&&>(__t) <=> static_cast<_Up&&>(__u);
      }

    using is_transparent = void;
  };



  namespace __compare
  {
    template<floating_point _Tp>
      constexpr weak_ordering
      __fp_weak_ordering(_Tp __e, _Tp __f)
      {


 auto __cat = [](_Tp __fp) -> int {
   const int __sign = __builtin_signbit(__fp) ? -1 : 1;
   if (__builtin_isnormal(__fp))
     return (__fp == 0 ? 1 : 3) * __sign;
   if (__builtin_isnan(__fp))
     return 5 * __sign;
   if (int __inf = __builtin_isinf_sign(__fp))
     return 4 * __inf;
   return 2 * __sign;
 };

 auto __po = __e <=> __f;
 if (is_lt(__po))
   return weak_ordering::less;
 else if (is_gt(__po))
   return weak_ordering::greater;
 else if (__po == partial_ordering::equivalent)
   return weak_ordering::equivalent;
 else
   {

     auto __isnan_sign = [](_Tp __fp) -> int {
       return __builtin_isnan(__fp)
  ? __builtin_signbit(__fp) ? -1 : 1
  : 0;
     };
     auto __ord = __isnan_sign(__e) <=> __isnan_sign(__f);
     if (is_eq(__ord))
       return weak_ordering::equivalent;
     else if (is_lt(__ord))
       return weak_ordering::less;
     else
       return weak_ordering::greater;
   }
      }

    void strong_order() = delete;

    template<typename _Tp, typename _Up>
      concept __adl_strong = requires(_Tp&& __t, _Up&& __u)
 {
   strong_ordering(strong_order(static_cast<_Tp&&>(__t),
           static_cast<_Up&&>(__u)));
 };

    void weak_order() = delete;

    template<typename _Tp, typename _Up>
      concept __adl_weak = requires(_Tp&& __t, _Up&& __u)
 {
   weak_ordering(weak_order(static_cast<_Tp&&>(__t),
       static_cast<_Up&&>(__u)));
 };

    void partial_order() = delete;

    template<typename _Tp, typename _Up>
      concept __adl_partial = requires(_Tp&& __t, _Up&& __u)
 {
   partial_ordering(partial_order(static_cast<_Tp&&>(__t),
      static_cast<_Up&&>(__u)));
 };

    template<typename _Ord, typename _Tp, typename _Up>
      concept __cmp3way = requires(_Tp&& __t, _Up&& __u, compare_three_way __c)
 {
   _Ord(__c(static_cast<_Tp&&>(__t), static_cast<_Up&&>(__u)));
 };

    template<typename _Tp, typename _Up>
      concept __strongly_ordered
 = __adl_strong<_Tp, _Up>
   || floating_point<remove_reference_t<_Tp>>
   || __cmp3way<strong_ordering, _Tp, _Up>;

    template<typename _Tp, typename _Up>
      concept __decayed_same_as = same_as<decay_t<_Tp>, decay_t<_Up>>;

    class _Strong_order
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (floating_point<decay_t<_Tp>>)
     return true;
   else if constexpr (__adl_strong<_Tp, _Up>)
     return noexcept(strong_ordering(strong_order(std::declval<_Tp>(),
        std::declval<_Up>())));
   else if constexpr (__cmp3way<strong_ordering, _Tp, _Up>)
     return noexcept(compare_three_way()(std::declval<_Tp>(),
      std::declval<_Up>()));
 }

      friend class _Weak_order;
      friend class _Strong_fallback;


      enum class _Fp_fmt
      {
 _Binary16, _Binary32, _Binary64, _Binary128,
 _X86_80bit,
 _M68k_80bit,
 _Dbldbl,
 _Bfloat16,
      };
# 699 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3
      template<typename _Tp>
 static consteval _Fp_fmt
 _S_fp_fmt() noexcept
 {

   using enum _Fp_fmt;
# 719 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3
   if constexpr (__is_same(_Tp, long double))
     return (-16381) == -16381 ? _X86_80bit : _M68k_80bit;


   if constexpr (__is_same(_Tp, __float80))
     return _X86_80bit;






   constexpr int __width = sizeof(_Tp) * 8;

   if constexpr (__width == 16)
     return _Binary16;
   else if constexpr (__width == 32)
     return _Binary32;
   else if constexpr (__width == 64)
     return _Binary64;
   else if constexpr (__width == 128)
     return _Binary128;
 }


      using int64_t = long long int;
      using int32_t = int;
      using int16_t = short int;
      using uint64_t = long long unsigned int;
      using uint16_t = short unsigned int;


      template<typename _Tp>
 struct _Int
 {

   uint64_t _M_lo;
   _Tp _M_hi;





   constexpr explicit
   _Int(_Tp __hi, uint64_t __lo) noexcept : _M_hi(__hi)
   { _M_lo = __lo; }

   constexpr explicit
   _Int(uint64_t __lo) noexcept : _M_hi(0)
   { _M_lo = __lo; }

   constexpr bool operator==(const _Int&) const = default;
# 781 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3
   constexpr _Int&
   operator^=(const _Int& __rhs) noexcept
   {
     _M_hi ^= __rhs._M_hi;
     _M_lo ^= __rhs._M_lo;
     return *this;
   }

   constexpr strong_ordering
   operator<=>(const _Int& __rhs) const noexcept
   {
     strong_ordering __cmp = _M_hi <=> __rhs._M_hi;
     if (__cmp != strong_ordering::equal)
       return __cmp;
     return _M_lo <=> __rhs._M_lo;
   }
 };

      template<typename _Tp>
 static constexpr _Tp
 _S_compl(_Tp __t) noexcept
 {
   constexpr int __width = sizeof(_Tp) * 8;

   make_unsigned_t<_Tp> __sign = __t >> (__width - 1);


   return __t ^ (__sign >> 1);
 }


      template<typename _Tp>
 static constexpr _Int<_Tp>
 _S_compl(_Int<_Tp> __t) noexcept
 {
   constexpr int __width = sizeof(_Tp) * 8;
   make_unsigned_t<_Tp> __sign = __t._M_hi >> (__width - 1);
   __t._M_hi ^= (__sign >> 1 );
   uint64_t __sign64 = (_Tp)__sign;
   __t._M_lo ^= __sign64;
   return __t;
 }


      template<typename _Tp>
 constexpr static auto
 _S_fp_bits(_Tp __val) noexcept
 {
   if constexpr (sizeof(_Tp) == sizeof(int64_t))
     return __builtin_bit_cast(int64_t, __val);
   else if constexpr (sizeof(_Tp) == sizeof(int32_t))
     return __builtin_bit_cast(int32_t, __val);
   else if constexpr (sizeof(_Tp) == sizeof(int16_t))
     return __builtin_bit_cast(int16_t, __val);
   else
     {

       using enum _Fp_fmt;

       constexpr auto __fmt = _S_fp_fmt<_Tp>();
       if constexpr (__fmt == _X86_80bit || __fmt == _M68k_80bit)
  {
    if constexpr (sizeof(_Tp) == 3 * sizeof(int32_t))
      {
        auto __ival = __builtin_bit_cast(_Int<int32_t>, __val);
        return _Int<int16_t>(__ival._M_hi, __ival._M_lo);
      }
    else
      {
        auto __ival = __builtin_bit_cast(_Int<int64_t>, __val);
        return _Int<int16_t>(__ival._M_hi, __ival._M_lo);
      }
  }
       else if constexpr (sizeof(_Tp) == 2 * sizeof(int64_t))
  {

    return __builtin_bit_cast(__int128, __val);



  }
       else
  static_assert(sizeof(_Tp) == sizeof(int64_t),
         "unsupported floating-point type");
     }
 }

      template<typename _Tp>
 static constexpr strong_ordering
 _S_fp_cmp(_Tp __x, _Tp __y) noexcept
 {
# 885 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3
   auto __ix = _S_fp_bits(__x);
   auto __iy = _S_fp_bits(__y);

   if (__ix == __iy)
     return strong_ordering::equal;


   using enum _Fp_fmt;

   constexpr auto __fmt = _S_fp_fmt<_Tp>();

   if constexpr (__fmt == _Dbldbl)
     {


       struct _Unpacked { double _M_hi; int64_t _M_lo; };
       auto __x2 = __builtin_bit_cast(_Unpacked, __x);
       auto __y2 = __builtin_bit_cast(_Unpacked, __y);


       auto __cmp = _S_fp_cmp(__x2._M_hi, __y2._M_hi);
       if (__cmp != strong_ordering::equal)
  return __cmp;



       if (__builtin_isnan(__x2._M_hi))
  return strong_ordering::equal;


       if (((__x2._M_lo | __y2._M_lo) & 0x7fffffffffffffffULL) == 0)
  return strong_ordering::equal;


       return _S_compl(__x2._M_lo) <=> _S_compl(__y2._M_lo);
     }
   else
     {
       if constexpr (__fmt == _M68k_80bit)
  {



    constexpr uint16_t __maxexp = 0x7fff;
    if ((__ix._M_hi & __maxexp) == __maxexp)
      __ix._M_lo |= 1ull << 63;
    if ((__iy._M_hi & __maxexp) == __maxexp)
      __iy._M_lo |= 1ull << 63;
  }
       else
  {
# 952 "C:/msys64/ucrt64/include/c++/14.2.0/compare" 3
  }
       return _S_compl(__ix) <=> _S_compl(__iy);
     }
 }

    public:
      template<typename _Tp, __decayed_same_as<_Tp> _Up>
 requires __strongly_ordered<_Tp, _Up>
 constexpr strong_ordering
 operator() [[nodiscard]] (_Tp&& __e, _Up&& __f) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (floating_point<decay_t<_Tp>>)
     return _S_fp_cmp(__e, __f);
   else if constexpr (__adl_strong<_Tp, _Up>)
     return strong_ordering(strong_order(static_cast<_Tp&&>(__e),
      static_cast<_Up&&>(__f)));
   else if constexpr (__cmp3way<strong_ordering, _Tp, _Up>)
     return compare_three_way()(static_cast<_Tp&&>(__e),
           static_cast<_Up&&>(__f));
 }
    };

    template<typename _Tp, typename _Up>
      concept __weakly_ordered
 = floating_point<remove_reference_t<_Tp>>
   || __adl_weak<_Tp, _Up>
   || __cmp3way<weak_ordering, _Tp, _Up>
   || __strongly_ordered<_Tp, _Up>;

    class _Weak_order
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (floating_point<decay_t<_Tp>>)
     return true;
   else if constexpr (__adl_weak<_Tp, _Up>)
     return noexcept(weak_ordering(weak_order(std::declval<_Tp>(),
           std::declval<_Up>())));
   else if constexpr (__cmp3way<weak_ordering, _Tp, _Up>)
     return noexcept(compare_three_way()(std::declval<_Tp>(),
      std::declval<_Up>()));
   else if constexpr (__strongly_ordered<_Tp, _Up>)
     return _Strong_order::_S_noexcept<_Tp, _Up>();
 }

      friend class _Partial_order;
      friend class _Weak_fallback;

    public:
      template<typename _Tp, __decayed_same_as<_Tp> _Up>
 requires __weakly_ordered<_Tp, _Up>
 constexpr weak_ordering
 operator() [[nodiscard]] (_Tp&& __e, _Up&& __f) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (floating_point<decay_t<_Tp>>)
     return __compare::__fp_weak_ordering(__e, __f);
   else if constexpr (__adl_weak<_Tp, _Up>)
     return weak_ordering(weak_order(static_cast<_Tp&&>(__e),
         static_cast<_Up&&>(__f)));
   else if constexpr (__cmp3way<weak_ordering, _Tp, _Up>)
     return compare_three_way()(static_cast<_Tp&&>(__e),
           static_cast<_Up&&>(__f));
   else if constexpr (__strongly_ordered<_Tp, _Up>)
     return _Strong_order{}(static_cast<_Tp&&>(__e),
       static_cast<_Up&&>(__f));
 }
    };

    template<typename _Tp, typename _Up>
      concept __partially_ordered
 = __adl_partial<_Tp, _Up>
 || __cmp3way<partial_ordering, _Tp, _Up>
 || __weakly_ordered<_Tp, _Up>;

    class _Partial_order
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (__adl_partial<_Tp, _Up>)
     return noexcept(partial_ordering(partial_order(std::declval<_Tp>(),
        std::declval<_Up>())));
   else if constexpr (__cmp3way<partial_ordering, _Tp, _Up>)
     return noexcept(compare_three_way()(std::declval<_Tp>(),
      std::declval<_Up>()));
   else if constexpr (__weakly_ordered<_Tp, _Up>)
     return _Weak_order::_S_noexcept<_Tp, _Up>();
 }

      friend class _Partial_fallback;

    public:
      template<typename _Tp, __decayed_same_as<_Tp> _Up>
 requires __partially_ordered<_Tp, _Up>
 constexpr partial_ordering
 operator() [[nodiscard]] (_Tp&& __e, _Up&& __f) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (__adl_partial<_Tp, _Up>)
     return partial_ordering(partial_order(static_cast<_Tp&&>(__e),
        static_cast<_Up&&>(__f)));
   else if constexpr (__cmp3way<partial_ordering, _Tp, _Up>)
     return compare_three_way()(static_cast<_Tp&&>(__e),
           static_cast<_Up&&>(__f));
   else if constexpr (__weakly_ordered<_Tp, _Up>)
     return _Weak_order{}(static_cast<_Tp&&>(__e),
     static_cast<_Up&&>(__f));
 }
    };

    template<typename _Tp, typename _Up>
      concept __op_eq_lt = requires(_Tp&& __t, _Up&& __u)
 {
   { static_cast<_Tp&&>(__t) == static_cast<_Up&&>(__u) }
     -> convertible_to<bool>;
   { static_cast<_Tp&&>(__t) < static_cast<_Up&&>(__u) }
     -> convertible_to<bool>;
 };

    class _Strong_fallback
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (__strongly_ordered<_Tp, _Up>)
     return _Strong_order::_S_noexcept<_Tp, _Up>();
   else
     return noexcept(bool(std::declval<_Tp>() == std::declval<_Up>()))
       && noexcept(bool(std::declval<_Tp>() < std::declval<_Up>()));
 }

    public:
      template<typename _Tp, __decayed_same_as<_Tp> _Up>
 requires __strongly_ordered<_Tp, _Up> || __op_eq_lt<_Tp, _Up>
 constexpr strong_ordering
 operator() [[nodiscard]] (_Tp&& __e, _Up&& __f) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (__strongly_ordered<_Tp, _Up>)
     return _Strong_order{}(static_cast<_Tp&&>(__e),
       static_cast<_Up&&>(__f));
   else
     return static_cast<_Tp&&>(__e) == static_cast<_Up&&>(__f)
       ? strong_ordering::equal
       : static_cast<_Tp&&>(__e) < static_cast<_Up&&>(__f)
       ? strong_ordering::less
       : strong_ordering::greater;
 }
    };

    class _Weak_fallback
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (__weakly_ordered<_Tp, _Up>)
     return _Weak_order::_S_noexcept<_Tp, _Up>();
   else
     return noexcept(bool(std::declval<_Tp>() == std::declval<_Up>()))
       && noexcept(bool(std::declval<_Tp>() < std::declval<_Up>()));
 }

    public:
      template<typename _Tp, __decayed_same_as<_Tp> _Up>
 requires __weakly_ordered<_Tp, _Up> || __op_eq_lt<_Tp, _Up>
 constexpr weak_ordering
 operator() [[nodiscard]] (_Tp&& __e, _Up&& __f) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (__weakly_ordered<_Tp, _Up>)
     return _Weak_order{}(static_cast<_Tp&&>(__e),
     static_cast<_Up&&>(__f));
   else
     return static_cast<_Tp&&>(__e) == static_cast<_Up&&>(__f)
       ? weak_ordering::equivalent
       : static_cast<_Tp&&>(__e) < static_cast<_Up&&>(__f)
       ? weak_ordering::less
       : weak_ordering::greater;
 }
    };



    template<typename _Tp, typename _Up>
      concept __op_eq_lt_lt = __op_eq_lt<_Tp, _Up>
 && requires(_Tp&& __t, _Up&& __u)
 {
   { static_cast<_Up&&>(__u) < static_cast<_Tp&&>(__t) }
     -> convertible_to<bool>;
 };

    class _Partial_fallback
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (__partially_ordered<_Tp, _Up>)
     return _Partial_order::_S_noexcept<_Tp, _Up>();
   else
     return noexcept(bool(std::declval<_Tp>() == std::declval<_Up>()))
       && noexcept(bool(std::declval<_Tp>() < std::declval<_Up>()));
 }

    public:
      template<typename _Tp, __decayed_same_as<_Tp> _Up>
 requires __partially_ordered<_Tp, _Up> || __op_eq_lt_lt<_Tp, _Up>
 constexpr partial_ordering
 operator() [[nodiscard]] (_Tp&& __e, _Up&& __f) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (__partially_ordered<_Tp, _Up>)
     return _Partial_order{}(static_cast<_Tp&&>(__e),
        static_cast<_Up&&>(__f));
   else
     return static_cast<_Tp&&>(__e) == static_cast<_Up&&>(__f)
       ? partial_ordering::equivalent
       : static_cast<_Tp&&>(__e) < static_cast<_Up&&>(__f)
       ? partial_ordering::less
       : static_cast<_Up&&>(__f) < static_cast<_Tp&&>(__e)
       ? partial_ordering::greater
       : partial_ordering::unordered;
 }
    };
  }



  inline namespace _Cpo
  {
    inline constexpr __compare::_Strong_order strong_order{};

    inline constexpr __compare::_Weak_order weak_order{};

    inline constexpr __compare::_Partial_order partial_order{};

    inline constexpr __compare::_Strong_fallback
      compare_strong_order_fallback{};

    inline constexpr __compare::_Weak_fallback
      compare_weak_order_fallback{};

    inline constexpr __compare::_Partial_fallback
      compare_partial_order_fallback{};
  }


  namespace __detail
  {

    inline constexpr struct _Synth3way
    {
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept(const _Tp* __t = nullptr, const _Up* __u = nullptr)
 {
   if constexpr (three_way_comparable_with<_Tp, _Up>)
     return noexcept(*__t <=> *__u);
   else
     return noexcept(*__t < *__u) && noexcept(*__u < *__t);
 }

      template<typename _Tp, typename _Up>
 [[nodiscard]]
 constexpr auto
 operator()(const _Tp& __t, const _Up& __u) const
 noexcept(_S_noexcept<_Tp, _Up>())
 requires requires
 {
   { __t < __u } -> __boolean_testable;
   { __u < __t } -> __boolean_testable;
 }
 {
   if constexpr (three_way_comparable_with<_Tp, _Up>)
     return __t <=> __u;
   else
     {
       if (__t < __u)
  return weak_ordering::less;
       else if (__u < __t)
  return weak_ordering::greater;
       else
  return weak_ordering::equivalent;
     }
 }
    } __synth3way = {};


    template<typename _Tp, typename _Up = _Tp>
      using __synth3way_t
 = decltype(__detail::__synth3way(std::declval<_Tp&>(),
      std::declval<_Up&>()));
  }


}
# 66 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 2 3


namespace std
{

# 79 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  struct piecewise_construct_t { explicit piecewise_construct_t() = default; };


  inline constexpr piecewise_construct_t piecewise_construct =
    piecewise_construct_t();




  template<typename _T1, typename _T2>
    struct pair;

  template<typename...>
    class tuple;





  template<typename _Tp, size_t _Nm>
    struct array;

  template<size_t...>
    struct _Index_tuple;

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(pair<_Tp1, _Tp2>& __in) noexcept;

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(pair<_Tp1, _Tp2>&& __in) noexcept;

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(const pair<_Tp1, _Tp2>& __in) noexcept;

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(const pair<_Tp1, _Tp2>&& __in) noexcept;

  template<size_t __i, typename... _Elements>
    constexpr __tuple_element_t<__i, tuple<_Elements...>>&
    get(tuple<_Elements...>& __t) noexcept;

  template<size_t __i, typename... _Elements>
    constexpr const __tuple_element_t<__i, tuple<_Elements...>>&
    get(const tuple<_Elements...>& __t) noexcept;

  template<size_t __i, typename... _Elements>
    constexpr __tuple_element_t<__i, tuple<_Elements...>>&&
    get(tuple<_Elements...>&& __t) noexcept;

  template<size_t __i, typename... _Elements>
    constexpr const __tuple_element_t<__i, tuple<_Elements...>>&&
    get(const tuple<_Elements...>&& __t) noexcept;

  template<size_t _Int, typename _Tp, size_t _Nm>
    constexpr _Tp&
    get(array<_Tp, _Nm>&) noexcept;

  template<size_t _Int, typename _Tp, size_t _Nm>
    constexpr _Tp&&
    get(array<_Tp, _Nm>&&) noexcept;

  template<size_t _Int, typename _Tp, size_t _Nm>
    constexpr const _Tp&
    get(const array<_Tp, _Nm>&) noexcept;

  template<size_t _Int, typename _Tp, size_t _Nm>
    constexpr const _Tp&&
    get(const array<_Tp, _Nm>&&) noexcept;
# 260 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _U1, typename _U2> class __pair_base
  {







  };
# 283 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    struct pair
    : public __pair_base<_T1, _T2>
    {
      typedef _T1 first_type;
      typedef _T2 second_type;

      _T1 first;
      _T2 second;


      constexpr pair(const pair&) = default;
      constexpr pair(pair&&) = default;

      template<typename... _Args1, typename... _Args2>
 constexpr
 pair(piecewise_construct_t, tuple<_Args1...>, tuple<_Args2...>);


      constexpr void
      swap(pair& __p)
      noexcept(__and_<__is_nothrow_swappable<_T1>,
        __is_nothrow_swappable<_T2>>::value)
      {
 using std::swap;
 swap(first, __p.first);
 swap(second, __p.second);
      }
# 331 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
    private:
      template<typename... _Args1, size_t... _Indexes1,
        typename... _Args2, size_t... _Indexes2>
 constexpr
 pair(tuple<_Args1...>&, tuple<_Args2...>&,
      _Index_tuple<_Indexes1...>, _Index_tuple<_Indexes2...>);
    public:





      constexpr
      explicit(__not_<__and_<__is_implicitly_default_constructible<_T1>,
        __is_implicitly_default_constructible<_T2>>>())
      pair()
      requires is_default_constructible_v<_T1>
        && is_default_constructible_v<_T2>
      : first(), second()
      { }

    private:


      template<typename _U1, typename _U2>
 static constexpr bool
 _S_constructible()
 {
   if constexpr (is_constructible_v<_T1, _U1>)
     return is_constructible_v<_T2, _U2>;
   return false;
 }

      template<typename _U1, typename _U2>
 static constexpr bool
 _S_nothrow_constructible()
 {
   if constexpr (is_nothrow_constructible_v<_T1, _U1>)
     return is_nothrow_constructible_v<_T2, _U2>;
   return false;
 }

      template<typename _U1, typename _U2>
 static constexpr bool
 _S_convertible()
 {
   if constexpr (is_convertible_v<_U1, _T1>)
     return is_convertible_v<_U2, _T2>;
   return false;
 }


      template<typename _U1, typename _U2>
 static constexpr bool
 _S_dangles()
 {

   if constexpr (__reference_constructs_from_temporary(_T1, _U1&&))
     return true;
   else
     return __reference_constructs_from_temporary(_T2, _U2&&);



 }
# 424 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
    public:


      constexpr explicit(!_S_convertible<const _T1&, const _T2&>())
      pair(const _T1& __x, const _T2& __y)
      noexcept(_S_nothrow_constructible<const _T1&, const _T2&>())
      requires (_S_constructible<const _T1&, const _T2&>())
      : first(__x), second(__y)
      { }





      template<typename _U1, typename _U2>

 requires (_S_constructible<_U1, _U2>()) && (!_S_dangles<_U1, _U2>())
 constexpr explicit(!_S_convertible<_U1, _U2>())
 pair(_U1&& __x, _U2&& __y)
 noexcept(_S_nothrow_constructible<_U1, _U2>())
 : first(std::forward<_U1>(__x)), second(std::forward<_U2>(__y))
 { }




      template<typename _U1, typename _U2>

 requires (_S_constructible<_U1, _U2>()) && (_S_dangles<_U1, _U2>())
 constexpr explicit(!_S_convertible<_U1, _U2>())
 pair(_U1&&, _U2&&) = delete;


      template<typename _U1, typename _U2>
 requires (_S_constructible<const _U1&, const _U2&>())
   && (!_S_dangles<_U1, _U2>())
 constexpr explicit(!_S_convertible<const _U1&, const _U2&>())
 pair(const pair<_U1, _U2>& __p)
 noexcept(_S_nothrow_constructible<const _U1&, const _U2&>())
 : first(__p.first), second(__p.second)
 { }

      template<typename _U1, typename _U2>
 requires (_S_constructible<const _U1&, const _U2&>())
       && (_S_dangles<const _U1&, const _U2&>())
 constexpr explicit(!_S_convertible<const _U1&, const _U2&>())
 pair(const pair<_U1, _U2>&) = delete;


      template<typename _U1, typename _U2>
 requires (_S_constructible<_U1, _U2>()) && (!_S_dangles<_U1, _U2>())
 constexpr explicit(!_S_convertible<_U1, _U2>())
 pair(pair<_U1, _U2>&& __p)
 noexcept(_S_nothrow_constructible<_U1, _U2>())
 : first(std::forward<_U1>(__p.first)),
   second(std::forward<_U2>(__p.second))
 { }

      template<typename _U1, typename _U2>
 requires (_S_constructible<_U1, _U2>()) && (_S_dangles<_U1, _U2>())
 constexpr explicit(!_S_convertible<_U1, _U2>())
 pair(pair<_U1, _U2>&&) = delete;
# 537 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  private:

      template<typename _U1, typename _U2>
 static constexpr bool
 _S_assignable()
 {
   if constexpr (is_assignable_v<_T1&, _U1>)
     return is_assignable_v<_T2&, _U2>;
   return false;
 }

      template<typename _U1, typename _U2>
 static constexpr bool
 _S_const_assignable()
 {
   if constexpr (is_assignable_v<const _T1&, _U1>)
     return is_assignable_v<const _T2&, _U2>;
   return false;
 }

      template<typename _U1, typename _U2>
 static constexpr bool
 _S_nothrow_assignable()
 {
   if constexpr (is_nothrow_assignable_v<_T1&, _U1>)
     return is_nothrow_assignable_v<_T2&, _U2>;
   return false;
 }
# 585 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  public:

      pair& operator=(const pair&) = delete;


      constexpr pair&
      operator=(const pair& __p)
      noexcept(_S_nothrow_assignable<const _T1&, const _T2&>())
      requires (_S_assignable<const _T1&, const _T2&>())
      {
 first = __p.first;
 second = __p.second;
 return *this;
      }


      constexpr pair&
      operator=(pair&& __p)
      noexcept(_S_nothrow_assignable<_T1, _T2>())
      requires (_S_assignable<_T1, _T2>())
      {
 first = std::forward<first_type>(__p.first);
 second = std::forward<second_type>(__p.second);
 return *this;
      }


      template<typename _U1, typename _U2>
 constexpr pair&
 operator=(const pair<_U1, _U2>& __p)
 noexcept(_S_nothrow_assignable<const _U1&, const _U2&>())
 requires (_S_assignable<const _U1&, const _U2&>())
 {
   first = __p.first;
   second = __p.second;
   return *this;
 }


      template<typename _U1, typename _U2>
 constexpr pair&
 operator=(pair<_U1, _U2>&& __p)
 noexcept(_S_nothrow_assignable<_U1, _U2>())
 requires (_S_assignable<_U1, _U2>())
 {
   first = std::forward<_U1>(__p.first);
   second = std::forward<_U2>(__p.second);
   return *this;
 }
# 995 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
    };




  template<typename _T1, typename _T2> pair(_T1, _T2) -> pair<_T1, _T2>;







  template<typename _T1, typename _T2, typename _U1, typename _U2>
    inline constexpr bool
    operator==(const pair<_T1, _T2>& __x, const pair<_U1, _U2>& __y)
    { return __x.first == __y.first && __x.second == __y.second; }
# 1020 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _T1, typename _T2, typename _U1, typename _U2>
    constexpr common_comparison_category_t<__detail::__synth3way_t<_T1, _U1>,
        __detail::__synth3way_t<_T2, _U2>>
    operator<=>(const pair<_T1, _T2>& __x, const pair<_U1, _U2>& __y)
    {
      if (auto __c = __detail::__synth3way(__x.first, __y.first); __c != 0)
 return __c;
      return __detail::__synth3way(__x.second, __y.second);
    }
# 1080 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    constexpr inline


    typename enable_if<__and_<__is_swappable<_T1>,
                              __is_swappable<_T2>>::value>::type



    swap(pair<_T1, _T2>& __x, pair<_T1, _T2>& __y)
    noexcept(noexcept(__x.swap(__y)))
    { __x.swap(__y); }
# 1103 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    typename enable_if<!__and_<__is_swappable<_T1>,
          __is_swappable<_T2>>::value>::type
    swap(pair<_T1, _T2>&, pair<_T1, _T2>&) = delete;
# 1129 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    constexpr pair<typename __decay_and_strip<_T1>::__type,
                   typename __decay_and_strip<_T2>::__type>
    make_pair(_T1&& __x, _T2&& __y)
    {
      typedef typename __decay_and_strip<_T1>::__type __ds_type1;
      typedef typename __decay_and_strip<_T2>::__type __ds_type2;
      typedef pair<__ds_type1, __ds_type2> __pair_type;
      return __pair_type(std::forward<_T1>(__x), std::forward<_T2>(__y));
    }
# 1152 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3
  template<typename _T1, typename _T2>
    struct __is_tuple_like_impl<pair<_T1, _T2>> : true_type
    { };



  template<class _Tp1, class _Tp2>
    struct tuple_size<pair<_Tp1, _Tp2>>
    : public integral_constant<size_t, 2> { };


  template<class _Tp1, class _Tp2>
    struct tuple_element<0, pair<_Tp1, _Tp2>>
    { typedef _Tp1 type; };


  template<class _Tp1, class _Tp2>
    struct tuple_element<1, pair<_Tp1, _Tp2>>
    { typedef _Tp2 type; };



  template<size_t __i, typename... _Types>
    struct tuple_element<__i, tuple<_Types...>>;


  template<typename _Tp1, typename _Tp2>
    inline constexpr size_t tuple_size_v<pair<_Tp1, _Tp2>> = 2;

  template<typename _Tp1, typename _Tp2>
    inline constexpr size_t tuple_size_v<const pair<_Tp1, _Tp2>> = 2;

  template<typename _Tp>
    inline constexpr bool __is_pair = false;

  template<typename _Tp, typename _Up>
    inline constexpr bool __is_pair<pair<_Tp, _Up>> = true;



  template<size_t _Int>
    struct __pair_get;

  template<>
    struct __pair_get<0>
    {
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp1&
 __get(pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.first; }

      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp1&&
 __move_get(pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<_Tp1>(__pair.first); }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp1&
 __const_get(const pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.first; }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp1&&
 __const_move_get(const pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<const _Tp1>(__pair.first); }
    };

  template<>
    struct __pair_get<1>
    {
      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp2&
 __get(pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.second; }

      template<typename _Tp1, typename _Tp2>
 static constexpr _Tp2&&
 __move_get(pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<_Tp2>(__pair.second); }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp2&
 __const_get(const pair<_Tp1, _Tp2>& __pair) noexcept
 { return __pair.second; }

      template<typename _Tp1, typename _Tp2>
 static constexpr const _Tp2&&
 __const_move_get(const pair<_Tp1, _Tp2>&& __pair) noexcept
 { return std::forward<const _Tp2>(__pair.second); }
    };






  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(pair<_Tp1, _Tp2>& __in) noexcept
    { return __pair_get<_Int>::__get(__in); }

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(pair<_Tp1, _Tp2>&& __in) noexcept
    { return __pair_get<_Int>::__move_get(std::move(__in)); }

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&
    get(const pair<_Tp1, _Tp2>& __in) noexcept
    { return __pair_get<_Int>::__const_get(__in); }

  template<size_t _Int, class _Tp1, class _Tp2>
    constexpr const typename tuple_element<_Int, pair<_Tp1, _Tp2>>::type&&
    get(const pair<_Tp1, _Tp2>&& __in) noexcept
    { return __pair_get<_Int>::__const_move_get(std::move(__in)); }



  template <typename _Tp, typename _Up>
    constexpr _Tp&
    get(pair<_Tp, _Up>& __p) noexcept
    { return __p.first; }

  template <typename _Tp, typename _Up>
    constexpr const _Tp&
    get(const pair<_Tp, _Up>& __p) noexcept
    { return __p.first; }

  template <typename _Tp, typename _Up>
    constexpr _Tp&&
    get(pair<_Tp, _Up>&& __p) noexcept
    { return std::move(__p.first); }

  template <typename _Tp, typename _Up>
    constexpr const _Tp&&
    get(const pair<_Tp, _Up>&& __p) noexcept
    { return std::move(__p.first); }

  template <typename _Tp, typename _Up>
    constexpr _Tp&
    get(pair<_Up, _Tp>& __p) noexcept
    { return __p.second; }

  template <typename _Tp, typename _Up>
    constexpr const _Tp&
    get(const pair<_Up, _Tp>& __p) noexcept
    { return __p.second; }

  template <typename _Tp, typename _Up>
    constexpr _Tp&&
    get(pair<_Up, _Tp>&& __p) noexcept
    { return std::move(__p.second); }

  template <typename _Tp, typename _Up>
    constexpr const _Tp&&
    get(const pair<_Up, _Tp>&& __p) noexcept
    { return std::move(__p.second); }
# 1332 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_pair.h" 3

}
# 65 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 1 3
# 62 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
       
# 63 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
# 71 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 1 3
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 3
       
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 3



# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/ptr_traits.h" 1 3
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/bits/ptr_traits.h" 3
namespace __gnu_debug { struct _Safe_iterator_base; }


namespace std
{




  class __undefined;



  template<typename _Tp>
    struct __get_first_arg
    { using type = __undefined; };

  template<template<typename, typename...> class _SomeTemplate, typename _Tp,
           typename... _Types>
    struct __get_first_arg<_SomeTemplate<_Tp, _Types...>>
    { using type = _Tp; };



  template<typename _Tp, typename _Up>
    struct __replace_first_arg
    { };

  template<template<typename, typename...> class _SomeTemplate, typename _Up,
           typename _Tp, typename... _Types>
    struct __replace_first_arg<_SomeTemplate<_Tp, _Types...>, _Up>
    { using type = _SomeTemplate<_Up, _Types...>; };


  template<typename _Ptr, typename = void>
    struct __ptr_traits_elem : __get_first_arg<_Ptr>
    { };



  template<typename _Ptr> requires requires { typename _Ptr::element_type; }
    struct __ptr_traits_elem<_Ptr, void>
    { using type = typename _Ptr::element_type; };






  template<typename _Ptr>
    using __ptr_traits_elem_t = typename __ptr_traits_elem<_Ptr>::type;




  template<typename _Ptr, typename _Elt, bool = is_void<_Elt>::value>
    struct __ptr_traits_ptr_to
    {
      using pointer = _Ptr;
      using element_type = _Elt;







      static pointer
      pointer_to(element_type& __r)

      requires requires {
 { pointer::pointer_to(__r) } -> convertible_to<pointer>;
      }

      { return pointer::pointer_to(__r); }
    };


  template<typename _Ptr, typename _Elt>
    struct __ptr_traits_ptr_to<_Ptr, _Elt, true>
    { };


  template<typename _Tp>
    struct __ptr_traits_ptr_to<_Tp*, _Tp, false>
    {
      using pointer = _Tp*;
      using element_type = _Tp;






      static constexpr pointer
      pointer_to(element_type& __r) noexcept
      { return std::addressof(__r); }
    };

  template<typename _Ptr, typename _Elt>
    struct __ptr_traits_impl : __ptr_traits_ptr_to<_Ptr, _Elt>
    {
    private:
      template<typename _Tp>
 using __diff_t = typename _Tp::difference_type;

      template<typename _Tp, typename _Up>
 using __rebind = __type_identity<typename _Tp::template rebind<_Up>>;

    public:

      using pointer = _Ptr;


      using element_type = _Elt;


      using difference_type = __detected_or_t<ptrdiff_t, __diff_t, _Ptr>;


      template<typename _Up>
 using rebind = typename __detected_or_t<__replace_first_arg<_Ptr, _Up>,
      __rebind, _Ptr, _Up>::type;
    };



  template<typename _Ptr>
    struct __ptr_traits_impl<_Ptr, __undefined>
    { };







  template<typename _Ptr>
    struct pointer_traits : __ptr_traits_impl<_Ptr, __ptr_traits_elem_t<_Ptr>>
    { };







  template<typename _Tp>
    struct pointer_traits<_Tp*> : __ptr_traits_ptr_to<_Tp*, _Tp>
    {

      typedef _Tp* pointer;

      typedef _Tp element_type;

      typedef ptrdiff_t difference_type;

      template<typename _Up> using rebind = _Up*;
    };


  template<typename _Ptr, typename _Tp>
    using __ptr_rebind = typename pointer_traits<_Ptr>::template rebind<_Tp>;

  template<typename _Tp>
    constexpr _Tp*
    __to_address(_Tp* __ptr) noexcept
    {
      static_assert(!std::is_function<_Tp>::value, "not a function pointer");
      return __ptr;
    }







  template<typename _Ptr>
    constexpr auto
    __to_address(const _Ptr& __ptr) noexcept
    -> decltype(std::pointer_traits<_Ptr>::to_address(__ptr))
    { return std::pointer_traits<_Ptr>::to_address(__ptr); }

  template<typename _Ptr, typename... _None>
    constexpr auto
    __to_address(const _Ptr& __ptr, _None...) noexcept
    {
      if constexpr (is_base_of_v<__gnu_debug::_Safe_iterator_base, _Ptr>)
 return std::__to_address(__ptr.base().operator->());
      else
 return std::__to_address(__ptr.operator->());
    }







  template<typename _Tp>
    constexpr _Tp*
    to_address(_Tp* __ptr) noexcept
    { return std::__to_address(__ptr); }
# 251 "C:/msys64/ucrt64/include/c++/14.2.0/bits/ptr_traits.h" 3
  template<typename _Ptr>
    constexpr auto
    to_address(const _Ptr& __ptr) noexcept
    { return std::__to_address(__ptr); }



}
# 38 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/ranges_cmp.h" 1 3
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/bits/ranges_cmp.h" 3
namespace std
{


  struct __is_transparent;





  struct identity
  {
    template<typename _Tp>
      [[nodiscard]]
      constexpr _Tp&&
      operator()(_Tp&& __t) const noexcept
      { return std::forward<_Tp>(__t); }

    using is_transparent = __is_transparent;
  };


namespace ranges
{
  namespace __detail
  {



    template<typename _Tp, typename _Up>
      concept __less_builtin_ptr_cmp
 = requires (_Tp&& __t, _Up&& __u) { { __t < __u } -> same_as<bool>; }
   && convertible_to<_Tp, const volatile void*>
   && convertible_to<_Up, const volatile void*>
   && (! requires(_Tp&& __t, _Up&& __u)
       { operator<(std::forward<_Tp>(__t), std::forward<_Up>(__u)); }
       && ! requires(_Tp&& __t, _Up&& __u)
       { std::forward<_Tp>(__t).operator<(std::forward<_Up>(__u)); });
  }







  struct equal_to
  {
    template<typename _Tp, typename _Up>
      requires equality_comparable_with<_Tp, _Up>
      constexpr bool
      operator()(_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Tp>() == std::declval<_Up>()))
      { return std::forward<_Tp>(__t) == std::forward<_Up>(__u); }

    using is_transparent = __is_transparent;
  };


  struct not_equal_to
  {
    template<typename _Tp, typename _Up>
      requires equality_comparable_with<_Tp, _Up>
      constexpr bool
      operator()(_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Up>() == std::declval<_Tp>()))
      { return !equal_to{}(std::forward<_Tp>(__t), std::forward<_Up>(__u)); }

    using is_transparent = __is_transparent;
  };


  struct less
  {
    template<typename _Tp, typename _Up>
      requires totally_ordered_with<_Tp, _Up>
      constexpr bool
      operator()(_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Tp>() < std::declval<_Up>()))
      {
 if constexpr (__detail::__less_builtin_ptr_cmp<_Tp, _Up>)
   {
     if (std::__is_constant_evaluated())
       return __t < __u;

     auto __x = reinterpret_cast<long long unsigned int>(
       static_cast<const volatile void*>(std::forward<_Tp>(__t)));
     auto __y = reinterpret_cast<long long unsigned int>(
       static_cast<const volatile void*>(std::forward<_Up>(__u)));
     return __x < __y;
   }
 else
   return std::forward<_Tp>(__t) < std::forward<_Up>(__u);
      }

    using is_transparent = __is_transparent;
  };


  struct greater
  {
    template<typename _Tp, typename _Up>
      requires totally_ordered_with<_Tp, _Up>
      constexpr bool
      operator()(_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Up>() < std::declval<_Tp>()))
      { return less{}(std::forward<_Up>(__u), std::forward<_Tp>(__t)); }

    using is_transparent = __is_transparent;
  };


  struct greater_equal
  {
    template<typename _Tp, typename _Up>
      requires totally_ordered_with<_Tp, _Up>
      constexpr bool
      operator()(_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Tp>() < std::declval<_Up>()))
      { return !less{}(std::forward<_Tp>(__t), std::forward<_Up>(__u)); }

    using is_transparent = __is_transparent;
  };


  struct less_equal
  {
    template<typename _Tp, typename _Up>
      requires totally_ordered_with<_Tp, _Up>
      constexpr bool
      operator()(_Tp&& __t, _Up&& __u) const
      noexcept(noexcept(std::declval<_Up>() < std::declval<_Tp>()))
      { return !less{}(std::forward<_Up>(__u), std::forward<_Tp>(__t)); }

    using is_transparent = __is_transparent;
  };

}


}
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 2 3

namespace std
{

# 58 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 3
  struct default_sentinel_t { };


  inline constexpr default_sentinel_t default_sentinel{};


  struct input_iterator_tag;
  struct output_iterator_tag;
  struct forward_iterator_tag;
  struct bidirectional_iterator_tag;
  struct random_access_iterator_tag;
  struct contiguous_iterator_tag;

  template<typename _Iterator>
    struct iterator_traits;

  template<typename _Tp> requires is_object_v<_Tp>
    struct iterator_traits<_Tp*>;

  template<typename _Iterator, typename>
    struct __iterator_traits;

  namespace __detail
  {
    template<typename _Tp>
      using __with_ref = _Tp&;

    template<typename _Tp>
      concept __can_reference = requires { typename __with_ref<_Tp>; };

    template<typename _Tp>
      concept __dereferenceable = requires(_Tp& __t)
 {
   { *__t } -> __can_reference;
 };
  }

  template<__detail::__dereferenceable _Tp>
    using iter_reference_t = decltype(*std::declval<_Tp&>());

  namespace ranges
  {

    namespace __imove
    {
      void iter_move() = delete;

      template<typename _Tp>
 concept __adl_imove
   = (std::__detail::__class_or_enum<remove_reference_t<_Tp>>)
   && requires(_Tp&& __t) { iter_move(static_cast<_Tp&&>(__t)); };

      struct _IterMove
      {
      private:
 template<typename _Tp>
   struct __result
   { using type = iter_reference_t<_Tp>; };

 template<typename _Tp>
   requires __adl_imove<_Tp>
   struct __result<_Tp>
   { using type = decltype(iter_move(std::declval<_Tp>())); };

 template<typename _Tp>
   requires (!__adl_imove<_Tp>)
   && is_lvalue_reference_v<iter_reference_t<_Tp>>
   struct __result<_Tp>
   { using type = remove_reference_t<iter_reference_t<_Tp>>&&; };

 template<typename _Tp>
   static constexpr bool
   _S_noexcept()
   {
     if constexpr (__adl_imove<_Tp>)
       return noexcept(iter_move(std::declval<_Tp>()));
     else
       return noexcept(*std::declval<_Tp>());
   }

      public:

 template<std::__detail::__dereferenceable _Tp>
   using __type = typename __result<_Tp>::type;

 template<std::__detail::__dereferenceable _Tp>
   [[nodiscard]]
   constexpr __type<_Tp>
   operator()(_Tp&& __e) const
   noexcept(_S_noexcept<_Tp>())
   {
     if constexpr (__adl_imove<_Tp>)
       return iter_move(static_cast<_Tp&&>(__e));
     else if constexpr (is_lvalue_reference_v<iter_reference_t<_Tp>>)
       return static_cast<__type<_Tp>>(*__e);
     else
       return *__e;
   }
      };
    }


    inline namespace _Cpo {
      inline constexpr __imove::_IterMove iter_move{};
    }
  }

  template<__detail::__dereferenceable _Tp>
    requires __detail::__can_reference<ranges::__imove::_IterMove::__type<_Tp&>>
    using iter_rvalue_reference_t = ranges::__imove::_IterMove::__type<_Tp&>;

  template<typename> struct incrementable_traits { };

  template<typename _Tp> requires is_object_v<_Tp>
    struct incrementable_traits<_Tp*>
    { using difference_type = ptrdiff_t; };

  template<typename _Iter>
    struct incrementable_traits<const _Iter>
    : incrementable_traits<_Iter> { };

  template<typename _Tp> requires requires { typename _Tp::difference_type; }
    struct incrementable_traits<_Tp>
    { using difference_type = typename _Tp::difference_type; };

  template<typename _Tp>
    requires (!requires { typename _Tp::difference_type; }
       && requires(const _Tp& __a, const _Tp& __b)
       { { __a - __b } -> integral; })
    struct incrementable_traits<_Tp>
    {
      using difference_type
 = make_signed_t<decltype(std::declval<_Tp>() - std::declval<_Tp>())>;
    };
# 204 "C:/msys64/ucrt64/include/c++/14.2.0/bits/iterator_concepts.h" 3
  namespace __detail
  {


    template<typename _Iter>
      concept __primary_traits_iter
 = __is_base_of(__iterator_traits<_Iter, void>, iterator_traits<_Iter>);

    template<typename _Iter, typename _Tp>
      struct __iter_traits_impl
      { using type = iterator_traits<_Iter>; };

    template<typename _Iter, typename _Tp>
      requires __primary_traits_iter<_Iter>
      struct __iter_traits_impl<_Iter, _Tp>
      { using type = _Tp; };


    template<typename _Iter, typename _Tp = _Iter>
      using __iter_traits = typename __iter_traits_impl<_Iter, _Tp>::type;

    template<typename _Tp>
      using __iter_diff_t = typename
 __iter_traits<_Tp, incrementable_traits<_Tp>>::difference_type;
  }

  template<typename _Tp>
    using iter_difference_t = __detail::__iter_diff_t<remove_cvref_t<_Tp>>;

  namespace __detail
  {
    template<typename> struct __cond_value_type { };

    template<typename _Tp> requires is_object_v<_Tp>
      struct __cond_value_type<_Tp>
      { using value_type = remove_cv_t<_Tp>; };

    template<typename _Tp>
      concept __has_member_value_type
 = requires { typename _Tp::value_type; };

    template<typename _Tp>
      concept __has_member_element_type
 = requires { typename _Tp::element_type; };

  }

  template<typename> struct indirectly_readable_traits { };

  template<typename _Tp>
    struct indirectly_readable_traits<_Tp*>
    : __detail::__cond_value_type<_Tp>
    { };

  template<typename _Iter> requires is_array_v<_Iter>
    struct indirectly_readable_traits<_Iter>
    { using value_type = remove_cv_t<remove_extent_t<_Iter>>; };

  template<typename _Iter>
    struct indirectly_readable_traits<const _Iter>
    : indirectly_readable_traits<_Iter>
    { };

  template<__detail::__has_member_value_type _Tp>
    struct indirectly_readable_traits<_Tp>
    : __detail::__cond_value_type<typename _Tp::value_type>
    { };

  template<__detail::__has_member_element_type _Tp>
    struct indirectly_readable_traits<_Tp>
    : __detail::__cond_value_type<typename _Tp::element_type>
    { };



  template<__detail::__has_member_value_type _Tp>
    requires __detail::__has_member_element_type<_Tp>
    && same_as<remove_cv_t<typename _Tp::element_type>,
        remove_cv_t<typename _Tp::value_type>>
    struct indirectly_readable_traits<_Tp>
    : __detail::__cond_value_type<typename _Tp::value_type>
    { };



  template<__detail::__has_member_value_type _Tp>
    requires __detail::__has_member_element_type<_Tp>
    struct indirectly_readable_traits<_Tp>
    { };

  namespace __detail
  {
    template<typename _Tp>
      using __iter_value_t = typename
 __iter_traits<_Tp, indirectly_readable_traits<_Tp>>::value_type;
  }

  template<typename _Tp>
    using iter_value_t = __detail::__iter_value_t<remove_cvref_t<_Tp>>;

  namespace __detail
  {


    template<typename _Iter>
      concept __cpp17_iterator = requires(_Iter __it)
 {
   { *__it } -> __can_reference;
   { ++__it } -> same_as<_Iter&>;
   { *__it++ } -> __can_reference;
 } && copyable<_Iter>;

    template<typename _Iter>
      concept __cpp17_input_iterator = __cpp17_iterator<_Iter>
 && equality_comparable<_Iter>
 && requires(_Iter __it)
 {
   typename incrementable_traits<_Iter>::difference_type;
   typename indirectly_readable_traits<_Iter>::value_type;
   typename common_reference_t<iter_reference_t<_Iter>&&,
     typename indirectly_readable_traits<_Iter>::value_type&>;
   typename common_reference_t<decltype(*__it++)&&,
     typename indirectly_readable_traits<_Iter>::value_type&>;
   requires signed_integral<
     typename incrementable_traits<_Iter>::difference_type>;
 };

    template<typename _Iter>
      concept __cpp17_fwd_iterator = __cpp17_input_iterator<_Iter>
 && constructible_from<_Iter>
 && is_lvalue_reference_v<iter_reference_t<_Iter>>
 && same_as<remove_cvref_t<iter_reference_t<_Iter>>,
     typename indirectly_readable_traits<_Iter>::value_type>
 && requires(_Iter __it)
 {
   { __it++ } -> convertible_to<const _Iter&>;
   { *__it++ } -> same_as<iter_reference_t<_Iter>>;
 };

    template<typename _Iter>
      concept __cpp17_bidi_iterator = __cpp17_fwd_iterator<_Iter>
 && requires(_Iter __it)
 {
   { --__it } -> same_as<_Iter&>;
   { __it-- } -> convertible_to<const _Iter&>;
   { *__it-- } -> same_as<iter_reference_t<_Iter>>;
 };

    template<typename _Iter>
      concept __cpp17_randacc_iterator = __cpp17_bidi_iterator<_Iter>
 && totally_ordered<_Iter>
 && requires(_Iter __it,
      typename incrementable_traits<_Iter>::difference_type __n)
 {
   { __it += __n } -> same_as<_Iter&>;
   { __it -= __n } -> same_as<_Iter&>;
   { __it + __n } -> same_as<_Iter>;
   { __n + __it } -> same_as<_Iter>;
   { __it - __n } -> same_as<_Iter>;
   { __it - __it } -> same_as<decltype(__n)>;
   { __it[__n] } -> convertible_to<iter_reference_t<_Iter>>;
 };

    template<typename _Iter>
      concept __iter_with_nested_types = requires {
 typename _Iter::iterator_category;
 typename _Iter::value_type;
 typename _Iter::difference_type;
 typename _Iter::reference;
      };

    template<typename _Iter>
      concept __iter_without_nested_types = !__iter_with_nested_types<_Iter>;

    template<typename _Iter>
      concept __iter_without_category
 = !requires { typename _Iter::iterator_category; };

  }

  template<typename _Iterator>
    requires __detail::__iter_with_nested_types<_Iterator>
    struct __iterator_traits<_Iterator, void>
    {
    private:
      template<typename _Iter>
 struct __ptr
 { using type = void; };

      template<typename _Iter> requires requires { typename _Iter::pointer; }
 struct __ptr<_Iter>
 { using type = typename _Iter::pointer; };

    public:
      using iterator_category = typename _Iterator::iterator_category;
      using value_type = typename _Iterator::value_type;
      using difference_type = typename _Iterator::difference_type;
      using pointer = typename __ptr<_Iterator>::type;
      using reference = typename _Iterator::reference;
    };

  template<typename _Iterator>
    requires __detail::__iter_without_nested_types<_Iterator>
       && __detail::__cpp17_input_iterator<_Iterator>
    struct __iterator_traits<_Iterator, void>
    {
    private:
      template<typename _Iter>
 struct __cat
 { using type = input_iterator_tag; };

      template<typename _Iter>
 requires requires { typename _Iter::iterator_category; }
 struct __cat<_Iter>
 { using type = typename _Iter::iterator_category; };

      template<typename _Iter>
 requires __detail::__iter_without_category<_Iter>
    && __detail::__cpp17_randacc_iterator<_Iter>
 struct __cat<_Iter>
 { using type = random_access_iterator_tag; };

      template<typename _Iter>
 requires __detail::__iter_without_category<_Iter>
    && __detail::__cpp17_bidi_iterator<_Iter>
 struct __cat<_Iter>
 { using type = bidirectional_iterator_tag; };

      template<typename _Iter>
 requires __detail::__iter_without_category<_Iter>
    && __detail::__cpp17_fwd_iterator<_Iter>
 struct __cat<_Iter>
 { using type = forward_iterator_tag; };

      template<typename _Iter>
 struct __ptr
 { using type = void; };

      template<typename _Iter> requires requires { typename _Iter::pointer; }
 struct __ptr<_Iter>
 { using type = typename _Iter::pointer; };

      template<typename _Iter>
 requires (!requires { typename _Iter::pointer; }
     && requires(_Iter& __it) { __it.operator->(); })
 struct __ptr<_Iter>
 { using type = decltype(std::declval<_Iter&>().operator->()); };

      template<typename _Iter>
 struct __ref
 { using type = iter_reference_t<_Iter>; };

      template<typename _Iter> requires requires { typename _Iter::reference; }
 struct __ref<_Iter>
 { using type = typename _Iter::reference; };

    public:
      using iterator_category = typename __cat<_Iterator>::type;
      using value_type
 = typename indirectly_readable_traits<_Iterator>::value_type;
      using difference_type
 = typename incrementable_traits<_Iterator>::difference_type;
      using pointer = typename __ptr<_Iterator>::type;
      using reference = typename __ref<_Iterator>::type;
    };

  template<typename _Iterator>
    requires __detail::__iter_without_nested_types<_Iterator>
       && __detail::__cpp17_iterator<_Iterator>
    struct __iterator_traits<_Iterator, void>
    {
    private:
      template<typename _Iter>
 struct __diff
 { using type = void; };

      template<typename _Iter>
 requires requires
 { typename incrementable_traits<_Iter>::difference_type; }
 struct __diff<_Iter>
 {
   using type = typename incrementable_traits<_Iter>::difference_type;
 };

    public:
      using iterator_category = output_iterator_tag;
      using value_type = void;
      using difference_type = typename __diff<_Iterator>::type;
      using pointer = void;
      using reference = void;
    };

  namespace __detail
  {
    template<typename _Iter>
      struct __iter_concept_impl;


    template<typename _Iter>
      requires requires { typename __iter_traits<_Iter>::iterator_concept; }
      struct __iter_concept_impl<_Iter>
      { using type = typename __iter_traits<_Iter>::iterator_concept; };


    template<typename _Iter>
      requires (!requires { typename __iter_traits<_Iter>::iterator_concept; }
   && requires { typename __iter_traits<_Iter>::iterator_category; })
      struct __iter_concept_impl<_Iter>
      { using type = typename __iter_traits<_Iter>::iterator_category; };


    template<typename _Iter>
      requires (!requires { typename __iter_traits<_Iter>::iterator_concept; }
   && !requires { typename __iter_traits<_Iter>::iterator_category; }
   && __primary_traits_iter<_Iter>)
      struct __iter_concept_impl<_Iter>
      { using type = random_access_iterator_tag; };


    template<typename _Iter>
      struct __iter_concept_impl
      { };


    template<typename _Iter>
      using __iter_concept = typename __iter_concept_impl<_Iter>::type;

  template<typename _In>
    concept __indirectly_readable_impl = requires
      {
 typename iter_value_t<_In>;
 typename iter_reference_t<_In>;
 typename iter_rvalue_reference_t<_In>;
 requires same_as<iter_reference_t<const _In>,
    iter_reference_t<_In>>;
 requires same_as<iter_rvalue_reference_t<const _In>,
    iter_rvalue_reference_t<_In>>;
      }
      && common_reference_with<iter_reference_t<_In>&&, iter_value_t<_In>&>
      && common_reference_with<iter_reference_t<_In>&&,
         iter_rvalue_reference_t<_In>&&>
      && common_reference_with<iter_rvalue_reference_t<_In>&&,
          const iter_value_t<_In>&>;

  }


  template<typename _In>
    concept indirectly_readable
      = __detail::__indirectly_readable_impl<remove_cvref_t<_In>>;

  template<indirectly_readable _Tp>
    using iter_common_reference_t
      = common_reference_t<iter_reference_t<_Tp>, iter_value_t<_Tp>&>;


  template<typename _Out, typename _Tp>
    concept indirectly_writable = requires(_Out&& __o, _Tp&& __t)
      {
 *__o = std::forward<_Tp>(__t);
 *std::forward<_Out>(__o) = std::forward<_Tp>(__t);
 const_cast<const iter_reference_t<_Out>&&>(*__o)
   = std::forward<_Tp>(__t);
 const_cast<const iter_reference_t<_Out>&&>(*std::forward<_Out>(__o))
   = std::forward<_Tp>(__t);
      };

  namespace ranges::__detail
  {
    class __max_diff_type;
    class __max_size_type;

    __extension__
    template<typename _Tp>
      concept __is_signed_int128

 = same_as<_Tp, __int128>;




    __extension__
    template<typename _Tp>
      concept __is_unsigned_int128

 = same_as<_Tp, unsigned __int128>;




    template<typename _Tp>
      concept __cv_bool = same_as<const volatile _Tp, const volatile bool>;

    template<typename _Tp>
      concept __integral_nonbool = integral<_Tp> && !__cv_bool<_Tp>;

    template<typename _Tp>
      concept __is_int128 = __is_signed_int128<_Tp> || __is_unsigned_int128<_Tp>;

    template<typename _Tp>
      concept __is_integer_like = __integral_nonbool<_Tp>
 || __is_int128<_Tp>
 || same_as<_Tp, __max_diff_type> || same_as<_Tp, __max_size_type>;

    template<typename _Tp>
      concept __is_signed_integer_like = signed_integral<_Tp>
 || __is_signed_int128<_Tp>
 || same_as<_Tp, __max_diff_type>;

  }

  namespace __detail { using ranges::__detail::__is_signed_integer_like; }


  template<typename _Iter>
    concept weakly_incrementable = movable<_Iter>
      && requires(_Iter __i)
      {
 typename iter_difference_t<_Iter>;
 requires __detail::__is_signed_integer_like<iter_difference_t<_Iter>>;
 { ++__i } -> same_as<_Iter&>;
 __i++;
      };

  template<typename _Iter>
    concept incrementable = regular<_Iter> && weakly_incrementable<_Iter>
      && requires(_Iter __i) { { __i++ } -> same_as<_Iter>; };

  template<typename _Iter>
    concept input_or_output_iterator
      = requires(_Iter __i) { { *__i } -> __detail::__can_reference; }
 && weakly_incrementable<_Iter>;

  template<typename _Sent, typename _Iter>
    concept sentinel_for = semiregular<_Sent>
      && input_or_output_iterator<_Iter>
      && __detail::__weakly_eq_cmp_with<_Sent, _Iter>;

  template<typename _Sent, typename _Iter>
    inline constexpr bool disable_sized_sentinel_for = false;

  template<typename _Sent, typename _Iter>
    concept sized_sentinel_for = sentinel_for<_Sent, _Iter>
    && !disable_sized_sentinel_for<remove_cv_t<_Sent>, remove_cv_t<_Iter>>
    && requires(const _Iter& __i, const _Sent& __s)
    {
      { __s - __i } -> same_as<iter_difference_t<_Iter>>;
      { __i - __s } -> same_as<iter_difference_t<_Iter>>;
    };

  template<typename _Iter>
    concept input_iterator = input_or_output_iterator<_Iter>
      && indirectly_readable<_Iter>
      && requires { typename __detail::__iter_concept<_Iter>; }
      && derived_from<__detail::__iter_concept<_Iter>, input_iterator_tag>;

  template<typename _Iter, typename _Tp>
    concept output_iterator = input_or_output_iterator<_Iter>
      && indirectly_writable<_Iter, _Tp>
      && requires(_Iter __i, _Tp&& __t) { *__i++ = std::forward<_Tp>(__t); };

  template<typename _Iter>
    concept forward_iterator = input_iterator<_Iter>
      && derived_from<__detail::__iter_concept<_Iter>, forward_iterator_tag>
      && incrementable<_Iter> && sentinel_for<_Iter, _Iter>;

  template<typename _Iter>
    concept bidirectional_iterator = forward_iterator<_Iter>
      && derived_from<__detail::__iter_concept<_Iter>,
        bidirectional_iterator_tag>
      && requires(_Iter __i)
      {
 { --__i } -> same_as<_Iter&>;
 { __i-- } -> same_as<_Iter>;
      };

  template<typename _Iter>
    concept random_access_iterator = bidirectional_iterator<_Iter>
      && derived_from<__detail::__iter_concept<_Iter>,
        random_access_iterator_tag>
      && totally_ordered<_Iter> && sized_sentinel_for<_Iter, _Iter>
      && requires(_Iter __i, const _Iter __j,
    const iter_difference_t<_Iter> __n)
      {
 { __i += __n } -> same_as<_Iter&>;
 { __j + __n } -> same_as<_Iter>;
 { __n + __j } -> same_as<_Iter>;
 { __i -= __n } -> same_as<_Iter&>;
 { __j - __n } -> same_as<_Iter>;
 { __j[__n] } -> same_as<iter_reference_t<_Iter>>;
      };

  template<typename _Iter>
    concept contiguous_iterator = random_access_iterator<_Iter>
      && derived_from<__detail::__iter_concept<_Iter>, contiguous_iterator_tag>
      && is_lvalue_reference_v<iter_reference_t<_Iter>>
      && same_as<iter_value_t<_Iter>, remove_cvref_t<iter_reference_t<_Iter>>>
      && requires(const _Iter& __i)
      {
 { std::to_address(__i) }
   -> same_as<add_pointer_t<iter_reference_t<_Iter>>>;
      };





  template<typename _Fn, typename _Iter>
    concept indirectly_unary_invocable = indirectly_readable<_Iter>
      && copy_constructible<_Fn> && invocable<_Fn&, iter_value_t<_Iter>&>
      && invocable<_Fn&, iter_reference_t<_Iter>>
      && invocable<_Fn&, iter_common_reference_t<_Iter>>
      && common_reference_with<invoke_result_t<_Fn&, iter_value_t<_Iter>&>,
          invoke_result_t<_Fn&, iter_reference_t<_Iter>>>;

  template<typename _Fn, typename _Iter>
    concept indirectly_regular_unary_invocable = indirectly_readable<_Iter>
      && copy_constructible<_Fn>
      && regular_invocable<_Fn&, iter_value_t<_Iter>&>
      && regular_invocable<_Fn&, iter_reference_t<_Iter>>
      && regular_invocable<_Fn&, iter_common_reference_t<_Iter>>
      && common_reference_with<invoke_result_t<_Fn&, iter_value_t<_Iter>&>,
          invoke_result_t<_Fn&, iter_reference_t<_Iter>>>;

  template<typename _Fn, typename _Iter>
    concept indirect_unary_predicate = indirectly_readable<_Iter>
      && copy_constructible<_Fn> && predicate<_Fn&, iter_value_t<_Iter>&>
      && predicate<_Fn&, iter_reference_t<_Iter>>
      && predicate<_Fn&, iter_common_reference_t<_Iter>>;

  template<typename _Fn, typename _I1, typename _I2>
    concept indirect_binary_predicate
      = indirectly_readable<_I1> && indirectly_readable<_I2>
      && copy_constructible<_Fn>
      && predicate<_Fn&, iter_value_t<_I1>&, iter_value_t<_I2>&>
      && predicate<_Fn&, iter_value_t<_I1>&, iter_reference_t<_I2>>
      && predicate<_Fn&, iter_reference_t<_I1>, iter_value_t<_I2>&>
      && predicate<_Fn&, iter_reference_t<_I1>, iter_reference_t<_I2>>
      && predicate<_Fn&, iter_common_reference_t<_I1>,
     iter_common_reference_t<_I2>>;

  template<typename _Fn, typename _I1, typename _I2 = _I1>
    concept indirect_equivalence_relation
      = indirectly_readable<_I1> && indirectly_readable<_I2>
      && copy_constructible<_Fn>
      && equivalence_relation<_Fn&, iter_value_t<_I1>&, iter_value_t<_I2>&>
      && equivalence_relation<_Fn&, iter_value_t<_I1>&, iter_reference_t<_I2>>
      && equivalence_relation<_Fn&, iter_reference_t<_I1>, iter_value_t<_I2>&>
      && equivalence_relation<_Fn&, iter_reference_t<_I1>,
         iter_reference_t<_I2>>
      && equivalence_relation<_Fn&, iter_common_reference_t<_I1>,
         iter_common_reference_t<_I2>>;

  template<typename _Fn, typename _I1, typename _I2 = _I1>
    concept indirect_strict_weak_order
      = indirectly_readable<_I1> && indirectly_readable<_I2>
      && copy_constructible<_Fn>
      && strict_weak_order<_Fn&, iter_value_t<_I1>&, iter_value_t<_I2>&>
      && strict_weak_order<_Fn&, iter_value_t<_I1>&, iter_reference_t<_I2>>
      && strict_weak_order<_Fn&, iter_reference_t<_I1>, iter_value_t<_I2>&>
      && strict_weak_order<_Fn&, iter_reference_t<_I1>, iter_reference_t<_I2>>
      && strict_weak_order<_Fn&, iter_common_reference_t<_I1>,
      iter_common_reference_t<_I2>>;

  template<typename _Fn, typename... _Is>
    requires (indirectly_readable<_Is> && ...)
      && invocable<_Fn, iter_reference_t<_Is>...>
    using indirect_result_t = invoke_result_t<_Fn, iter_reference_t<_Is>...>;

  namespace __detail
  {
    template<typename _Iter, typename _Proj>
      struct __projected
      {
 struct __type
 {
   using value_type = remove_cvref_t<indirect_result_t<_Proj&, _Iter>>;
   indirect_result_t<_Proj&, _Iter> operator*() const;
 };
      };

    template<weakly_incrementable _Iter, typename _Proj>
      struct __projected<_Iter, _Proj>
      {
 struct __type
 {
   using value_type = remove_cvref_t<indirect_result_t<_Proj&, _Iter>>;
   using difference_type = iter_difference_t<_Iter>;
   indirect_result_t<_Proj&, _Iter> operator*() const;
 };
      };
  }


  template<indirectly_readable _Iter,
    indirectly_regular_unary_invocable<_Iter> _Proj>
    using projected = typename __detail::__projected<_Iter, _Proj>::__type;





  template<typename _In, typename _Out>
    concept indirectly_movable = indirectly_readable<_In>
      && indirectly_writable<_Out, iter_rvalue_reference_t<_In>>;

  template<typename _In, typename _Out>
    concept indirectly_movable_storable = indirectly_movable<_In, _Out>
      && indirectly_writable<_Out, iter_value_t<_In>>
      && movable<iter_value_t<_In>>
      && constructible_from<iter_value_t<_In>, iter_rvalue_reference_t<_In>>
      && assignable_from<iter_value_t<_In>&, iter_rvalue_reference_t<_In>>;


  template<typename _In, typename _Out>
    concept indirectly_copyable = indirectly_readable<_In>
      && indirectly_writable<_Out, iter_reference_t<_In>>;

  template<typename _In, typename _Out>
    concept indirectly_copyable_storable = indirectly_copyable<_In, _Out>
      && indirectly_writable<_Out, iter_value_t<_In>&>
      && indirectly_writable<_Out, const iter_value_t<_In>&>
      && indirectly_writable<_Out, iter_value_t<_In>&&>
      && indirectly_writable<_Out, const iter_value_t<_In>&&>
      && copyable<iter_value_t<_In>>
      && constructible_from<iter_value_t<_In>, iter_reference_t<_In>>
      && assignable_from<iter_value_t<_In>&, iter_reference_t<_In>>;

namespace ranges
{

  namespace __iswap
  {
    template<typename _It1, typename _It2>
      void iter_swap(_It1, _It2) = delete;

    template<typename _Tp, typename _Up>
      concept __adl_iswap
 = (std::__detail::__class_or_enum<remove_reference_t<_Tp>>
   || std::__detail::__class_or_enum<remove_reference_t<_Up>>)
 && requires(_Tp&& __t, _Up&& __u) {
   iter_swap(static_cast<_Tp&&>(__t), static_cast<_Up&&>(__u));
 };

    template<typename _Xp, typename _Yp>
      constexpr iter_value_t<_Xp>
      __iter_exchange_move(_Xp&& __x, _Yp&& __y)
      noexcept(noexcept(iter_value_t<_Xp>(iter_move(__x)))
        && noexcept(*__x = iter_move(__y)))
      {
 iter_value_t<_Xp> __old_value(iter_move(__x));
 *__x = iter_move(__y);
 return __old_value;
      }

    struct _IterSwap
    {
    private:
      template<typename _Tp, typename _Up>
 static constexpr bool
 _S_noexcept()
 {
   if constexpr (__adl_iswap<_Tp, _Up>)
     return noexcept(iter_swap(std::declval<_Tp>(),
          std::declval<_Up>()));
   else if constexpr (indirectly_readable<_Tp>
       && indirectly_readable<_Up>
       && swappable_with<iter_reference_t<_Tp>, iter_reference_t<_Up>>)
     return noexcept(ranges::swap(*std::declval<_Tp>(),
      *std::declval<_Up>()));
   else
     return noexcept(*std::declval<_Tp>()
  = __iswap::__iter_exchange_move(std::declval<_Up>(),
          std::declval<_Tp>()));
 }

    public:
      template<typename _Tp, typename _Up>
 requires __adl_iswap<_Tp, _Up>
 || (indirectly_readable<remove_reference_t<_Tp>>
     && indirectly_readable<remove_reference_t<_Up>>
     && swappable_with<iter_reference_t<_Tp>, iter_reference_t<_Up>>)
 || (indirectly_movable_storable<_Tp, _Up>
     && indirectly_movable_storable<_Up, _Tp>)
 constexpr void
 operator()(_Tp&& __e1, _Up&& __e2) const
 noexcept(_S_noexcept<_Tp, _Up>())
 {
   if constexpr (__adl_iswap<_Tp, _Up>)
     iter_swap(static_cast<_Tp&&>(__e1), static_cast<_Up&&>(__e2));
   else if constexpr (indirectly_readable<_Tp>
       && indirectly_readable<_Up>
       && swappable_with<iter_reference_t<_Tp>, iter_reference_t<_Up>>)
     ranges::swap(*__e1, *__e2);
   else
     *__e1 = __iswap::__iter_exchange_move(__e2, __e1);
 }
    };
  }


  inline namespace _Cpo {
    inline constexpr __iswap::_IterSwap iter_swap{};
  }

}


  template<typename _I1, typename _I2 = _I1>
    concept indirectly_swappable
      = indirectly_readable<_I1> && indirectly_readable<_I2>
      && requires(const _I1 __i1, const _I2 __i2)
      {
 ranges::iter_swap(__i1, __i1);
 ranges::iter_swap(__i2, __i2);
 ranges::iter_swap(__i1, __i2);
 ranges::iter_swap(__i2, __i1);
      };


  template<typename _I1, typename _I2, typename _Rel, typename _P1 = identity,
    typename _P2 = identity>
    concept indirectly_comparable
      = indirect_binary_predicate<_Rel, projected<_I1, _P1>,
      projected<_I2, _P2>>;


  template<typename _Iter>
    concept permutable = forward_iterator<_Iter>
      && indirectly_movable_storable<_Iter, _Iter>
      && indirectly_swappable<_Iter, _Iter>;


  template<typename _I1, typename _I2, typename _Out,
    typename _Rel = ranges::less, typename _P1 = identity,
    typename _P2 = identity>
    concept mergeable = input_iterator<_I1> && input_iterator<_I2>
      && weakly_incrementable<_Out> && indirectly_copyable<_I1, _Out>
      && indirectly_copyable<_I2, _Out>
      && indirect_strict_weak_order<_Rel, projected<_I1, _P1>,
        projected<_I2, _P2>>;


  template<typename _Iter, typename _Rel = ranges::less,
    typename _Proj = identity>
    concept sortable = permutable<_Iter>
      && indirect_strict_weak_order<_Rel, projected<_Iter, _Proj>>;

  struct unreachable_sentinel_t
  {
    template<weakly_incrementable _It>
      friend constexpr bool
      operator==(unreachable_sentinel_t, const _It&) noexcept
      { return false; }
  };

  inline constexpr unreachable_sentinel_t unreachable_sentinel{};


  namespace ranges::__access
  {
    using std::__detail::__class_or_enum;

    struct _Decay_copy final
    {
      template<typename _Tp>
 constexpr decay_t<_Tp>
 operator()(_Tp&& __t) const
 noexcept(is_nothrow_convertible_v<_Tp, decay_t<_Tp>>)
 { return std::forward<_Tp>(__t); }
    } inline constexpr __decay_copy{};

    template<typename _Tp>
      concept __member_begin = requires(_Tp& __t)
 {
   { __decay_copy(__t.begin()) } -> input_or_output_iterator;
 };


    void begin() = delete;

    template<typename _Tp>
      concept __adl_begin = __class_or_enum<remove_reference_t<_Tp>>
 && requires(_Tp& __t)
 {
   { __decay_copy(begin(__t)) } -> input_or_output_iterator;
 };



    template<typename _Tp>
      requires is_array_v<_Tp> || __member_begin<_Tp&> || __adl_begin<_Tp&>
      auto
      __begin(_Tp& __t)
      {
 if constexpr (is_array_v<_Tp>)
   return __t + 0;
 else if constexpr (__member_begin<_Tp&>)
   return __t.begin();
 else
   return begin(__t);
      }
  }

  namespace __detail
  {

    template<typename _Tp>
      using __range_iter_t
 = decltype(ranges::__access::__begin(std::declval<_Tp&>()));

  }



}
# 72 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 2 3


namespace std
{

# 93 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
  struct input_iterator_tag { };


  struct output_iterator_tag { };


  struct forward_iterator_tag : public input_iterator_tag { };



  struct bidirectional_iterator_tag : public forward_iterator_tag { };



  struct random_access_iterator_tag : public bidirectional_iterator_tag { };



  struct contiguous_iterator_tag : public random_access_iterator_tag { };
# 125 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
  template<typename _Category, typename _Tp, typename _Distance = ptrdiff_t,
           typename _Pointer = _Tp*, typename _Reference = _Tp&>
    struct [[__deprecated__]] iterator
    {

      typedef _Category iterator_category;

      typedef _Tp value_type;

      typedef _Distance difference_type;

      typedef _Pointer pointer;

      typedef _Reference reference;
    };
# 149 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
  template<typename _Iterator>
    struct iterator_traits;




  template<typename _Iterator, typename = __void_t<>>
    struct __iterator_traits { };
# 176 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
  template<typename _Iterator>
    struct iterator_traits
    : public __iterator_traits<_Iterator> { };
# 194 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
  template<typename _Tp>

    requires is_object_v<_Tp>

    struct iterator_traits<_Tp*>
    {
      using iterator_concept = contiguous_iterator_tag;
      using iterator_category = random_access_iterator_tag;
      using value_type = remove_cv_t<_Tp>;
      using difference_type = ptrdiff_t;
      using pointer = _Tp*;
      using reference = _Tp&;
    };
# 235 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_types.h" 3
  template<typename _Iter>
    __attribute__((__always_inline__))
    inline constexpr
    typename iterator_traits<_Iter>::iterator_category
    __iterator_category(const _Iter&)
    { return typename iterator_traits<_Iter>::iterator_category(); }




  template<typename _Iter>
    using __iter_category_t
      = typename iterator_traits<_Iter>::iterator_category;

  template<typename _InIter>
    using _RequireInputIter =
      __enable_if_t<is_convertible<__iter_category_t<_InIter>,
       input_iterator_tag>::value>;

  template<typename _It,
    typename _Cat = __iter_category_t<_It>>
    struct __is_random_access_iter
      : is_base_of<random_access_iterator_tag, _Cat>
    {
      typedef is_base_of<random_access_iterator_tag, _Cat> _Base;
      enum { __value = _Base::value };
    };








}
# 66 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 1 3
# 62 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 3
       
# 63 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 3

# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/concept_check.h" 1 3
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/bits/concept_check.h" 3
       
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/bits/concept_check.h" 3
# 65 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/debug/assertions.h" 1 3
# 66 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 2 3


namespace std
{




  template <typename> struct _List_iterator;
  template <typename> struct _List_const_iterator;


  template<typename _InputIterator>
    inline constexpr
    typename iterator_traits<_InputIterator>::difference_type
    __distance(_InputIterator __first, _InputIterator __last,
               input_iterator_tag)
    {

     

      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      while (__first != __last)
 {
   ++__first;
   ++__n;
 }
      return __n;
    }

  template<typename _RandomAccessIterator>
    __attribute__((__always_inline__))
    inline constexpr
    typename iterator_traits<_RandomAccessIterator>::difference_type
    __distance(_RandomAccessIterator __first, _RandomAccessIterator __last,
               random_access_iterator_tag)
    {

     

      return __last - __first;
    }



  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_iterator<_Tp>,
        std::_List_iterator<_Tp>,
        input_iterator_tag);

  template<typename _Tp>
    ptrdiff_t
    __distance(std::_List_const_iterator<_Tp>,
        std::_List_const_iterator<_Tp>,
        input_iterator_tag);




  template<typename _OutputIterator>
    void
    __distance(_OutputIterator, _OutputIterator, output_iterator_tag) = delete;
# 144 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator>
    [[__nodiscard__]] __attribute__((__always_inline__))
    inline constexpr
    typename iterator_traits<_InputIterator>::difference_type
    distance(_InputIterator __first, _InputIterator __last)
    {

      return std::__distance(__first, __last,
        std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Distance>
    inline constexpr void
    __advance(_InputIterator& __i, _Distance __n, input_iterator_tag)
    {

     
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__n >= 0), false)) std::__glibcxx_assert_fail(); } while (false);
      while (__n--)
 ++__i;
    }

  template<typename _BidirectionalIterator, typename _Distance>
    inline constexpr void
    __advance(_BidirectionalIterator& __i, _Distance __n,
       bidirectional_iterator_tag)
    {

     

      if (__n > 0)
        while (__n--)
   ++__i;
      else
        while (__n++)
   --__i;
    }

  template<typename _RandomAccessIterator, typename _Distance>
    inline constexpr void
    __advance(_RandomAccessIterator& __i, _Distance __n,
              random_access_iterator_tag)
    {

     

      if (__builtin_constant_p(__n) && __n == 1)
 ++__i;
      else if (__builtin_constant_p(__n) && __n == -1)
 --__i;
      else
 __i += __n;
    }



  template<typename _OutputIterator, typename _Distance>
    void
    __advance(_OutputIterator&, _Distance, output_iterator_tag) = delete;
# 217 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator, typename _Distance>
    __attribute__((__always_inline__))
    inline constexpr void
    advance(_InputIterator& __i, _Distance __n)
    {

      typename iterator_traits<_InputIterator>::difference_type __d = __n;
      std::__advance(__i, __d, std::__iterator_category(__i));
    }



  template<typename _InputIterator>
    [[__nodiscard__]] [[__gnu__::__always_inline__]]
    inline constexpr _InputIterator
    next(_InputIterator __x, typename
  iterator_traits<_InputIterator>::difference_type __n = 1)
    {

     
      std::advance(__x, __n);
      return __x;
    }

  template<typename _BidirectionalIterator>
    [[__nodiscard__]] [[__gnu__::__always_inline__]]
    inline constexpr _BidirectionalIterator
    prev(_BidirectionalIterator __x, typename
  iterator_traits<_BidirectionalIterator>::difference_type __n = 1)
    {

     

      std::advance(__x, -__n);
      return __x;
    }




}
# 67 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 1 3
# 75 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/new" 1 3
# 38 "C:/msys64/ucrt64/include/c++/14.2.0/new" 3
       
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/new" 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/exception.h" 1 3
# 34 "C:/msys64/ucrt64/include/c++/14.2.0/bits/exception.h" 3
       
# 35 "C:/msys64/ucrt64/include/c++/14.2.0/bits/exception.h" 3



extern "C++" {

namespace std
{
# 59 "C:/msys64/ucrt64/include/c++/14.2.0/bits/exception.h" 3
  class exception
  {
  public:
    exception() noexcept { }
    virtual ~exception() noexcept;

    exception(const exception&) = default;
    exception& operator=(const exception&) = default;
    exception(exception&&) = default;
    exception& operator=(exception&&) = default;




    virtual const char*
    what() const noexcept;
  };



}

}
# 42 "C:/msys64/ucrt64/include/c++/14.2.0/new" 2 3




# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/new" 2 3

#pragma GCC visibility push(default)

extern "C++" {

namespace std
{






  class bad_alloc : public exception
  {
  public:
    bad_alloc() throw() { }


    bad_alloc(const bad_alloc&) = default;
    bad_alloc& operator=(const bad_alloc&) = default;




    virtual ~bad_alloc() throw();


    virtual const char* what() const throw();
  };


  class bad_array_new_length : public bad_alloc
  {
  public:
    bad_array_new_length() throw() { }



    virtual ~bad_array_new_length() throw();


    virtual const char* what() const throw();
  };



  enum class align_val_t: size_t {};


  struct nothrow_t
  {

    explicit nothrow_t() = default;

  };

  extern const nothrow_t nothrow;



  typedef void (*new_handler)();



  new_handler set_new_handler(new_handler) throw();



  new_handler get_new_handler() noexcept;

}
# 131 "C:/msys64/ucrt64/include/c++/14.2.0/new" 3
[[__nodiscard__]] void* operator new(std::size_t)
  __attribute__((__externally_visible__));
[[__nodiscard__]] void* operator new[](std::size_t)
  __attribute__((__externally_visible__));
void operator delete(void*) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*) noexcept
  __attribute__((__externally_visible__));

void operator delete(void*, std::size_t) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*, std::size_t) noexcept
  __attribute__((__externally_visible__));

[[__nodiscard__]] void* operator new(std::size_t, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
[[__nodiscard__]] void* operator new[](std::size_t, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete(void*, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__));
void operator delete[](void*, const std::nothrow_t&) noexcept
  __attribute__((__externally_visible__));

[[__nodiscard__]] void* operator new(std::size_t, std::align_val_t)
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
[[__nodiscard__]] void* operator new(std::size_t, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete(void*, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
void operator delete(void*, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__));
[[__nodiscard__]] void* operator new[](std::size_t, std::align_val_t)
  __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
[[__nodiscard__]] void* operator new[](std::size_t, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__, __alloc_size__ (1), __malloc__));
void operator delete[](void*, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
void operator delete[](void*, std::align_val_t, const std::nothrow_t&)
  noexcept __attribute__((__externally_visible__));

void operator delete(void*, std::size_t, std::align_val_t)
  noexcept __attribute__((__externally_visible__));
void operator delete[](void*, std::size_t, std::align_val_t)
  noexcept __attribute__((__externally_visible__));




[[__nodiscard__]] inline void* operator new(std::size_t, void* __p) noexcept
{ return __p; }
[[__nodiscard__]] inline void* operator new[](std::size_t, void* __p) noexcept
{ return __p; }


inline void operator delete (void*, void*) noexcept { }
inline void operator delete[](void*, void*) noexcept { }

}


namespace std
{


  template<typename _Tp>
    [[nodiscard]] constexpr _Tp*
    launder(_Tp* __p) noexcept
    { return __builtin_launder(__p); }




  template<typename _Ret, typename... _Args , bool _NE>
    void launder(_Ret (*)(_Args...) noexcept (_NE)) = delete;
  template<typename _Ret, typename... _Args , bool _NE>
    void launder(_Ret (*)(_Args......) noexcept (_NE)) = delete;

  void launder(void*) = delete;
  void launder(const void*) = delete;
  void launder(volatile void*) = delete;
  void launder(const volatile void*) = delete;



  inline constexpr size_t hardware_destructive_interference_size = 64;
  inline constexpr size_t hardware_constructive_interference_size = 64;

}




namespace std
{


  struct destroying_delete_t
  {
    explicit destroying_delete_t() = default;
  };

  inline constexpr destroying_delete_t destroying_delete{};
}


#pragma GCC visibility pop
# 76 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 2 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_construct.h" 1 3
# 73 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_construct.h" 3
namespace std
{



  template <typename _Tp>
    constexpr inline void
    destroy_at(_Tp* __location)
    {
      if constexpr (202002L > 201703L && is_array_v<_Tp>)
 {
   for (auto& __x : *__location)
     std::destroy_at(std::__addressof(__x));
 }
      else
 __location->~_Tp();
    }


  template<typename _Tp, typename... _Args>
    constexpr auto
    construct_at(_Tp* __location, _Args&&... __args)
    noexcept(noexcept(::new((void*)0) _Tp(std::declval<_Args>()...)))
    -> decltype(::new((void*)0) _Tp(std::declval<_Args>()...))
    { return ::new((void*)__location) _Tp(std::forward<_Args>(__args)...); }
# 106 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_construct.h" 3
  template<typename _Tp, typename... _Args>
    constexpr
    inline void
    _Construct(_Tp* __p, _Args&&... __args)
    {

      if (std::__is_constant_evaluated())
 {

   std::construct_at(__p, std::forward<_Args>(__args)...);
   return;
 }

      ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
    }
# 132 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_construct.h" 3
  template<typename _T1>
    inline void
    _Construct_novalue(_T1* __p)
    { ::new((void*)__p) _T1; }

  template<typename _ForwardIterator>
    constexpr void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last);




  template<typename _Tp>
    constexpr inline void
    _Destroy(_Tp* __pointer)
    {

      std::destroy_at(__pointer);



    }

  template<bool>
    struct _Destroy_aux
    {
      template<typename _ForwardIterator>
 static constexpr void
 __destroy(_ForwardIterator __first, _ForwardIterator __last)
 {
   for (; __first != __last; ++__first)
     std::_Destroy(std::__addressof(*__first));
 }
    };

  template<>
    struct _Destroy_aux<true>
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator, _ForwardIterator) { }
    };






  template<typename _ForwardIterator>
    constexpr inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;


      static_assert(is_destructible<_Value_type>::value,
      "value type is destructible");


      if (std::__is_constant_evaluated())
 return std::_Destroy_aux<false>::__destroy(__first, __last);

      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
 __destroy(__first, __last);
    }

  template<bool>
    struct _Destroy_n_aux
    {
      template<typename _ForwardIterator, typename _Size>
 static constexpr _ForwardIterator
 __destroy_n(_ForwardIterator __first, _Size __count)
 {
   for (; __count > 0; (void)++__first, --__count)
     std::_Destroy(std::__addressof(*__first));
   return __first;
 }
    };

  template<>
    struct _Destroy_n_aux<true>
    {
      template<typename _ForwardIterator, typename _Size>
        static _ForwardIterator
        __destroy_n(_ForwardIterator __first, _Size __count)
 {
   std::advance(__first, __count);
   return __first;
 }
    };






  template<typename _ForwardIterator, typename _Size>
    constexpr inline _ForwardIterator
    _Destroy_n(_ForwardIterator __first, _Size __count)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;


      static_assert(is_destructible<_Value_type>::value,
      "value type is destructible");


      if (std::__is_constant_evaluated())
 return std::_Destroy_n_aux<false>::__destroy_n(__first, __count);

      return std::_Destroy_n_aux<__has_trivial_destructor(_Value_type)>::
 __destroy_n(__first, __count);
    }


  template <typename _ForwardIterator>
    constexpr inline void
    destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      std::_Destroy(__first, __last);
    }

  template <typename _ForwardIterator, typename _Size>
    constexpr inline _ForwardIterator
    destroy_n(_ForwardIterator __first, _Size __count)
    {
      return std::_Destroy_n(__first, __count);
    }



}
# 79 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 2 3






namespace std
{








  namespace __detail
  {


    template<typename _Cat, typename _Limit, typename _Otherwise = _Cat>
      using __clamp_iter_cat
 = __conditional_t<derived_from<_Cat, _Limit>, _Limit, _Otherwise>;
  }



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
# 128 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class reverse_iterator
    : public iterator<typename iterator_traits<_Iterator>::iterator_category,
        typename iterator_traits<_Iterator>::value_type,
        typename iterator_traits<_Iterator>::difference_type,
        typename iterator_traits<_Iterator>::pointer,
                      typename iterator_traits<_Iterator>::reference>
    {
      template<typename _Iter>
 friend class reverse_iterator;




      template<typename _Iter>
 static constexpr bool __convertible = !is_same_v<_Iter, _Iterator>
     && convertible_to<const _Iter&, _Iterator>;


    protected:
      _Iterator current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::pointer pointer;




      using iterator_concept
 = __conditional_t<random_access_iterator<_Iterator>,
     random_access_iterator_tag,
     bidirectional_iterator_tag>;
      using iterator_category
 = __detail::__clamp_iter_cat<typename __traits_type::iterator_category,
         random_access_iterator_tag>;
      using value_type = iter_value_t<_Iterator>;
      using difference_type = iter_difference_t<_Iterator>;
      using reference = iter_reference_t<_Iterator>;
# 178 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
      constexpr
      reverse_iterator()
      noexcept(noexcept(_Iterator()))
      : current()
      { }




      explicit constexpr
      reverse_iterator(iterator_type __x)
      noexcept(noexcept(_Iterator(__x)))
      : current(__x)
      { }




      constexpr
      reverse_iterator(const reverse_iterator& __x)
      noexcept(noexcept(_Iterator(__x.current)))
      : current(__x.current)
      { }


      reverse_iterator& operator=(const reverse_iterator&) = default;






      template<typename _Iter>

 requires __convertible<_Iter>

 constexpr
        reverse_iterator(const reverse_iterator<_Iter>& __x)
 noexcept(noexcept(_Iterator(__x.current)))
 : current(__x.current)
 { }


      template<typename _Iter>

 requires __convertible<_Iter>
   && assignable_from<_Iterator&, const _Iter&>

 constexpr
 reverse_iterator&
 operator=(const reverse_iterator<_Iter>& __x)
 noexcept(noexcept(current = __x.current))
 {
   current = __x.current;
   return *this;
 }





      [[__nodiscard__]]
      constexpr iterator_type
      base() const
      noexcept(noexcept(_Iterator(current)))
      { return current; }
# 255 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
      [[__nodiscard__]]
      constexpr reference
      operator*() const
      {
 _Iterator __tmp = current;
 return *--__tmp;
      }






      [[__nodiscard__]]
      constexpr pointer
      operator->() const

      requires is_pointer_v<_Iterator>
 || requires(const _Iterator __i) { __i.operator->(); }

      {


 _Iterator __tmp = current;
 --__tmp;
 return _S_to_pointer(__tmp);
      }






      constexpr reverse_iterator&
      operator++()
      {
 --current;
 return *this;
      }






      constexpr reverse_iterator
      operator++(int)
      {
 reverse_iterator __tmp = *this;
 --current;
 return __tmp;
      }






      constexpr reverse_iterator&
      operator--()
      {
 ++current;
 return *this;
      }






      constexpr reverse_iterator
      operator--(int)
      {
 reverse_iterator __tmp = *this;
 ++current;
 return __tmp;
      }






      [[__nodiscard__]]
      constexpr reverse_iterator
      operator+(difference_type __n) const
      { return reverse_iterator(current - __n); }







      constexpr reverse_iterator&
      operator+=(difference_type __n)
      {
 current -= __n;
 return *this;
      }






      [[__nodiscard__]]
      constexpr reverse_iterator
      operator-(difference_type __n) const
      { return reverse_iterator(current + __n); }







      constexpr reverse_iterator&
      operator-=(difference_type __n)
      {
 current += __n;
 return *this;
      }






      [[__nodiscard__]]
      constexpr reference
      operator[](difference_type __n) const
      { return *(*this + __n); }


      [[nodiscard]]
      friend constexpr iter_rvalue_reference_t<_Iterator>
      iter_move(const reverse_iterator& __i)
      noexcept(is_nothrow_copy_constructible_v<_Iterator>
        && noexcept(ranges::iter_move(--std::declval<_Iterator&>())))
      {
 auto __tmp = __i.base();
 return ranges::iter_move(--__tmp);
      }

      template<indirectly_swappable<_Iterator> _Iter2>
 friend constexpr void
 iter_swap(const reverse_iterator& __x,
    const reverse_iterator<_Iter2>& __y)
 noexcept(is_nothrow_copy_constructible_v<_Iterator>
   && is_nothrow_copy_constructible_v<_Iter2>
   && noexcept(ranges::iter_swap(--std::declval<_Iterator&>(),
            --std::declval<_Iter2&>())))
 {
   auto __xtmp = __x.base();
   auto __ytmp = __y.base();
   ranges::iter_swap(--__xtmp, --__ytmp);
 }


    private:
      template<typename _Tp>
 static constexpr _Tp*
 _S_to_pointer(_Tp* __p)
        { return __p; }

      template<typename _Tp>
 static constexpr pointer
 _S_to_pointer(_Tp __t)
        { return __t.operator->(); }
    };
# 524 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    [[nodiscard]]
    constexpr bool
    operator==(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    requires requires { { __x.base() == __y.base() } -> convertible_to<bool>; }
    { return __x.base() == __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    [[nodiscard]]
    constexpr bool
    operator!=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    requires requires { { __x.base() != __y.base() } -> convertible_to<bool>; }
    { return __x.base() != __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    [[nodiscard]]
    constexpr bool
    operator<(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    requires requires { { __x.base() > __y.base() } -> convertible_to<bool>; }
    { return __x.base() > __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    [[nodiscard]]
    constexpr bool
    operator>(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    requires requires { { __x.base() < __y.base() } -> convertible_to<bool>; }
    { return __x.base() < __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    [[nodiscard]]
    constexpr bool
    operator<=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    requires requires { { __x.base() >= __y.base() } -> convertible_to<bool>; }
    { return __x.base() >= __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    [[nodiscard]]
    constexpr bool
    operator>=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    requires requires { { __x.base() <= __y.base() } -> convertible_to<bool>; }
    { return __x.base() <= __y.base(); }

  template<typename _IteratorL,
    three_way_comparable_with<_IteratorL> _IteratorR>
    [[nodiscard]]
    constexpr compare_three_way_result_t<_IteratorL, _IteratorR>
    operator<=>(const reverse_iterator<_IteratorL>& __x,
  const reverse_iterator<_IteratorR>& __y)
    { return __y.base() <=> __x.base(); }




  template<typename _Iterator>
    [[nodiscard]]
    constexpr bool
    operator==(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    requires requires { { __x.base() == __y.base() } -> convertible_to<bool>; }
    { return __x.base() == __y.base(); }

  template<three_way_comparable _Iterator>
    [[nodiscard]]
    constexpr compare_three_way_result_t<_Iterator, _Iterator>
    operator<=>(const reverse_iterator<_Iterator>& __x,
  const reverse_iterator<_Iterator>& __y)
    { return __y.base() <=> __x.base(); }
# 615 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr auto
    operator-(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    -> decltype(__y.base() - __x.base())
    { return __y.base() - __x.base(); }


  template<typename _Iterator>
    [[__nodiscard__]]
    inline constexpr reverse_iterator<_Iterator>
    operator+(typename reverse_iterator<_Iterator>::difference_type __n,
       const reverse_iterator<_Iterator>& __x)
    { return reverse_iterator<_Iterator>(__x.base() - __n); }



  template<typename _Iterator>
    inline constexpr reverse_iterator<_Iterator>
    __make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }





  template<typename _Iterator>
    [[__nodiscard__]]
    inline constexpr reverse_iterator<_Iterator>
    make_reverse_iterator(_Iterator __i)
    { return reverse_iterator<_Iterator>(__i); }


  template<typename _Iterator1, typename _Iterator2>
    requires (!sized_sentinel_for<_Iterator1, _Iterator2>)
    inline constexpr bool
    disable_sized_sentinel_for<reverse_iterator<_Iterator1>,
          reverse_iterator<_Iterator2>> = true;



  template<typename _Iterator>
    constexpr
    auto
    __niter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__niter_base(__it.base())))
    { return __make_reverse_iterator(__niter_base(__it.base())); }

  template<typename _Iterator>
    struct __is_move_iterator<reverse_iterator<_Iterator> >
      : __is_move_iterator<_Iterator>
    { };

  template<typename _Iterator>
    constexpr
    auto
    __miter_base(reverse_iterator<_Iterator> __it)
    -> decltype(__make_reverse_iterator(__miter_base(__it.base())))
    { return __make_reverse_iterator(__miter_base(__it.base())); }
# 688 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Container>
    class back_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;

      using difference_type = ptrdiff_t;



      explicit constexpr
      back_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
# 726 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
      constexpr
      back_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_back(__value);
 return *this;
      }

      constexpr
      back_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_back(std::move(__value));
 return *this;
      }



      [[__nodiscard__]] constexpr
      back_insert_iterator&
      operator*()
      { return *this; }


      constexpr
      back_insert_iterator&
      operator++()
      { return *this; }


      constexpr
      back_insert_iterator
      operator++(int)
      { return *this; }
    };
# 773 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Container>
    [[__nodiscard__]] constexpr
    inline back_insert_iterator<_Container>
    back_inserter(_Container& __x)
    { return back_insert_iterator<_Container>(__x); }
# 789 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Container>
    class front_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;

      using difference_type = ptrdiff_t;



      explicit constexpr
      front_insert_iterator(_Container& __x)
      : container(std::__addressof(__x)) { }
# 827 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
      constexpr
      front_insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 container->push_front(__value);
 return *this;
      }

      constexpr
      front_insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 container->push_front(std::move(__value));
 return *this;
      }



      [[__nodiscard__]] constexpr
      front_insert_iterator&
      operator*()
      { return *this; }


      constexpr
      front_insert_iterator&
      operator++()
      { return *this; }


      constexpr
      front_insert_iterator
      operator++(int)
      { return *this; }
    };
# 874 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Container>
    [[__nodiscard__]] constexpr
    inline front_insert_iterator<_Container>
    front_inserter(_Container& __x)
    { return front_insert_iterator<_Container>(__x); }
# 894 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Container>
    class insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {

      using _Iter = std::__detail::__range_iter_t<_Container>;



    protected:
      _Container* container;
      _Iter iter;

    public:

      typedef _Container container_type;


      using difference_type = ptrdiff_t;






      constexpr
      insert_iterator(_Container& __x, _Iter __i)
      : container(std::__addressof(__x)), iter(__i) {}
# 955 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
      constexpr
      insert_iterator&
      operator=(const typename _Container::value_type& __value)
      {
 iter = container->insert(iter, __value);
 ++iter;
 return *this;
      }

      constexpr
      insert_iterator&
      operator=(typename _Container::value_type&& __value)
      {
 iter = container->insert(iter, std::move(__value));
 ++iter;
 return *this;
      }



      [[__nodiscard__]] constexpr
      insert_iterator&
      operator*()
      { return *this; }


      constexpr
      insert_iterator&
      operator++()
      { return *this; }


      constexpr
      insert_iterator&
      operator++(int)
      { return *this; }
    };

#pragma GCC diagnostic pop
# 1008 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Container>
    [[nodiscard]]
    constexpr insert_iterator<_Container>
    inserter(_Container& __x, std::__detail::__range_iter_t<_Container> __i)
    { return insert_iterator<_Container>(__x, __i); }
# 1023 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3

}

namespace __gnu_cxx
{

# 1037 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Iterator, typename _Container>
    class __normal_iterator
    {
    protected:
      _Iterator _M_current;

      typedef std::iterator_traits<_Iterator> __traits_type;


      template<typename _Iter>
 using __convertible_from
   = std::__enable_if_t<std::is_convertible<_Iter, _Iterator>::value>;


    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      typedef typename __traits_type::pointer pointer;


      using iterator_concept = std::__detail::__iter_concept<_Iterator>;


      constexpr __normal_iterator() noexcept
      : _M_current(_Iterator()) { }

      explicit constexpr
      __normal_iterator(const _Iterator& __i) noexcept
      : _M_current(__i) { }



      template<typename _Iter, typename = __convertible_from<_Iter>>
 constexpr
 __normal_iterator(const __normal_iterator<_Iter, _Container>& __i)
 noexcept
# 1085 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
        : _M_current(__i.base()) { }


      constexpr
      reference
      operator*() const noexcept
      { return *_M_current; }

      constexpr
      pointer
      operator->() const noexcept
      { return _M_current; }

      constexpr
      __normal_iterator&
      operator++() noexcept
      {
 ++_M_current;
 return *this;
      }

      constexpr
      __normal_iterator
      operator++(int) noexcept
      { return __normal_iterator(_M_current++); }


      constexpr
      __normal_iterator&
      operator--() noexcept
      {
 --_M_current;
 return *this;
      }

      constexpr
      __normal_iterator
      operator--(int) noexcept
      { return __normal_iterator(_M_current--); }


      constexpr
      reference
      operator[](difference_type __n) const noexcept
      { return _M_current[__n]; }

      constexpr
      __normal_iterator&
      operator+=(difference_type __n) noexcept
      { _M_current += __n; return *this; }

      constexpr
      __normal_iterator
      operator+(difference_type __n) const noexcept
      { return __normal_iterator(_M_current + __n); }

      constexpr
      __normal_iterator&
      operator-=(difference_type __n) noexcept
      { _M_current -= __n; return *this; }

      constexpr
      __normal_iterator
      operator-(difference_type __n) const noexcept
      { return __normal_iterator(_M_current - __n); }

      constexpr
      const _Iterator&
      base() const noexcept
      { return _M_current; }
    };
# 1166 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    [[nodiscard]]
    constexpr bool
    operator==(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept(noexcept(__lhs.base() == __rhs.base()))
    requires requires {
      { __lhs.base() == __rhs.base() } -> std::convertible_to<bool>;
    }
    { return __lhs.base() == __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    [[nodiscard]]
    constexpr std::__detail::__synth3way_t<_IteratorR, _IteratorL>
    operator<=>(const __normal_iterator<_IteratorL, _Container>& __lhs,
  const __normal_iterator<_IteratorR, _Container>& __rhs)
    noexcept(noexcept(std::__detail::__synth3way(__lhs.base(), __rhs.base())))
    { return std::__detail::__synth3way(__lhs.base(), __rhs.base()); }

  template<typename _Iterator, typename _Container>
    [[nodiscard]]
    constexpr bool
    operator==(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept(noexcept(__lhs.base() == __rhs.base()))
    requires requires {
      { __lhs.base() == __rhs.base() } -> std::convertible_to<bool>;
    }
    { return __lhs.base() == __rhs.base(); }

  template<typename _Iterator, typename _Container>
    [[nodiscard]]
    constexpr std::__detail::__synth3way_t<_Iterator>
    operator<=>(const __normal_iterator<_Iterator, _Container>& __lhs,
  const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept(noexcept(std::__detail::__synth3way(__lhs.base(), __rhs.base())))
    { return std::__detail::__synth3way(__lhs.base(), __rhs.base()); }
# 1307 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR, typename _Container>


    [[__nodiscard__]] constexpr
    inline auto
    operator-(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs) noexcept
    -> decltype(__lhs.base() - __rhs.base())





    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    [[__nodiscard__]] constexpr
    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
    noexcept
    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    [[__nodiscard__]] constexpr
    inline __normal_iterator<_Iterator, _Container>
    operator+(typename __normal_iterator<_Iterator, _Container>::difference_type
       __n, const __normal_iterator<_Iterator, _Container>& __i)
    noexcept
    { return __normal_iterator<_Iterator, _Container>(__i.base() + __n); }


}

namespace std
{


  template<typename _Iterator, typename _Container>
    constexpr
    _Iterator
    __niter_base(__gnu_cxx::__normal_iterator<_Iterator, _Container> __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it.base(); }
# 1371 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<semiregular _Sent>
    class move_sentinel
    {
    public:
      constexpr
      move_sentinel()
      noexcept(is_nothrow_default_constructible_v<_Sent>)
      : _M_last() { }

      constexpr explicit
      move_sentinel(_Sent __s)
      noexcept(is_nothrow_move_constructible_v<_Sent>)
      : _M_last(std::move(__s)) { }

      template<typename _S2> requires convertible_to<const _S2&, _Sent>
 constexpr
 move_sentinel(const move_sentinel<_S2>& __s)
 noexcept(is_nothrow_constructible_v<_Sent, const _S2&>)
 : _M_last(__s.base())
 { }

      template<typename _S2> requires assignable_from<_Sent&, const _S2&>
 constexpr move_sentinel&
 operator=(const move_sentinel<_S2>& __s)
 noexcept(is_nothrow_assignable_v<_Sent, const _S2&>)
 {
   _M_last = __s.base();
   return *this;
 }

      [[nodiscard]]
      constexpr _Sent
      base() const
      noexcept(is_nothrow_copy_constructible_v<_Sent>)
      { return _M_last; }

    private:
      _Sent _M_last;
    };


  namespace __detail
  {

    template<typename _Iterator>
      struct __move_iter_cat
      { };

    template<typename _Iterator>
      requires requires { typename __iter_category_t<_Iterator>; }
      struct __move_iter_cat<_Iterator>
      {
 using iterator_category
   = __clamp_iter_cat<__iter_category_t<_Iterator>,
        random_access_iterator_tag>;
      };

  }
# 1439 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class move_iterator

      : public __detail::__move_iter_cat<_Iterator>

    {
      _Iterator _M_current;

      using __traits_type = iterator_traits<_Iterator>;




      template<typename _Iter2>
 friend class move_iterator;




      template<typename _Iter2>
 static constexpr bool __convertible = !is_same_v<_Iter2, _Iterator>
     && convertible_to<const _Iter2&, _Iterator>;



      static auto
      _S_iter_concept()
      {
 if constexpr (random_access_iterator<_Iterator>)
   return random_access_iterator_tag{};
 else if constexpr (bidirectional_iterator<_Iterator>)
   return bidirectional_iterator_tag{};
 else if constexpr (forward_iterator<_Iterator>)
   return forward_iterator_tag{};
 else
   return input_iterator_tag{};
      }


    public:
      using iterator_type = _Iterator;


      using iterator_concept = decltype(_S_iter_concept());


      using value_type = iter_value_t<_Iterator>;
      using difference_type = iter_difference_t<_Iterator>;
      using pointer = _Iterator;
      using reference = iter_rvalue_reference_t<_Iterator>;
# 1503 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
      constexpr
      move_iterator()
      : _M_current() { }

      explicit constexpr
      move_iterator(iterator_type __i)
      : _M_current(std::move(__i)) { }

      template<typename _Iter>

 requires __convertible<_Iter>

 constexpr
 move_iterator(const move_iterator<_Iter>& __i)
 : _M_current(__i._M_current) { }

      template<typename _Iter>

 requires __convertible<_Iter>
   && assignable_from<_Iterator&, const _Iter&>

 constexpr
 move_iterator& operator=(const move_iterator<_Iter>& __i)
 {
   _M_current = __i._M_current;
   return *this;
 }







      [[nodiscard]]
      constexpr const iterator_type&
      base() const & noexcept
      { return _M_current; }

      [[nodiscard]]
      constexpr iterator_type
      base() &&
      { return std::move(_M_current); }


      [[__nodiscard__]]
      constexpr reference
      operator*() const

      { return ranges::iter_move(_M_current); }




      [[__nodiscard__]]
      constexpr pointer
      operator->() const
      { return _M_current; }

      constexpr move_iterator&
      operator++()
      {
 ++_M_current;
 return *this;
      }

      constexpr move_iterator
      operator++(int)
      {
 move_iterator __tmp = *this;
 ++_M_current;
 return __tmp;
      }


      constexpr void
      operator++(int) requires (!forward_iterator<_Iterator>)
      { ++_M_current; }


      constexpr move_iterator&
      operator--()
      {
 --_M_current;
 return *this;
      }

      constexpr move_iterator
      operator--(int)
      {
 move_iterator __tmp = *this;
 --_M_current;
 return __tmp;
      }

      [[__nodiscard__]]
      constexpr move_iterator
      operator+(difference_type __n) const
      { return move_iterator(_M_current + __n); }

      constexpr move_iterator&
      operator+=(difference_type __n)
      {
 _M_current += __n;
 return *this;
      }

      [[__nodiscard__]]
      constexpr move_iterator
      operator-(difference_type __n) const
      { return move_iterator(_M_current - __n); }

      constexpr move_iterator&
      operator-=(difference_type __n)
      {
 _M_current -= __n;
 return *this;
      }

      [[__nodiscard__]]
      constexpr reference
      operator[](difference_type __n) const

      { return ranges::iter_move(_M_current + __n); }





      template<sentinel_for<_Iterator> _Sent>
 [[nodiscard]]
 friend constexpr bool
 operator==(const move_iterator& __x, const move_sentinel<_Sent>& __y)
 { return __x.base() == __y.base(); }

      template<sized_sentinel_for<_Iterator> _Sent>
 [[nodiscard]]
 friend constexpr iter_difference_t<_Iterator>
 operator-(const move_sentinel<_Sent>& __x, const move_iterator& __y)
 { return __x.base() - __y.base(); }

      template<sized_sentinel_for<_Iterator> _Sent>
 [[nodiscard]]
 friend constexpr iter_difference_t<_Iterator>
 operator-(const move_iterator& __x, const move_sentinel<_Sent>& __y)
 { return __x.base() - __y.base(); }

      [[nodiscard]]
      friend constexpr iter_rvalue_reference_t<_Iterator>
      iter_move(const move_iterator& __i)
      noexcept(noexcept(ranges::iter_move(__i._M_current)))
      { return ranges::iter_move(__i._M_current); }

      template<indirectly_swappable<_Iterator> _Iter2>
 friend constexpr void
 iter_swap(const move_iterator& __x, const move_iterator<_Iter2>& __y)
 noexcept(noexcept(ranges::iter_swap(__x._M_current, __y._M_current)))
 { return ranges::iter_swap(__x._M_current, __y._M_current); }

    };

  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr bool
    operator==(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)

    requires requires { { __x.base() == __y.base() } -> convertible_to<bool>; }

    { return __x.base() == __y.base(); }


  template<typename _IteratorL,
    three_way_comparable_with<_IteratorL> _IteratorR>
    [[__nodiscard__]]
    constexpr compare_three_way_result_t<_IteratorL, _IteratorR>
    operator<=>(const move_iterator<_IteratorL>& __x,
  const move_iterator<_IteratorR>& __y)
    { return __x.base() <=> __y.base(); }
# 1691 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr bool
    operator<(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)

    requires requires { { __x.base() < __y.base() } -> convertible_to<bool>; }

    { return __x.base() < __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr bool
    operator<=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)

    requires requires { { __y.base() < __x.base() } -> convertible_to<bool>; }

    { return !(__y < __x); }

  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr bool
    operator>(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)

    requires requires { { __y.base() < __x.base() } -> convertible_to<bool>; }

    { return __y < __x; }

  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr bool
    operator>=(const move_iterator<_IteratorL>& __x,
        const move_iterator<_IteratorR>& __y)

    requires requires { { __x.base() < __y.base() } -> convertible_to<bool>; }

    { return !(__x < __y); }




  template<typename _Iterator>
    [[__nodiscard__]]
    inline constexpr bool
    operator==(const move_iterator<_Iterator>& __x,
        const move_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }


  template<three_way_comparable _Iterator>
    [[__nodiscard__]]
    constexpr compare_three_way_result_t<_Iterator>
    operator<=>(const move_iterator<_Iterator>& __x,
  const move_iterator<_Iterator>& __y)
    { return __x.base() <=> __y.base(); }
# 1786 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR>
    [[__nodiscard__]]
    inline constexpr auto
    operator-(const move_iterator<_IteratorL>& __x,
       const move_iterator<_IteratorR>& __y)
    -> decltype(__x.base() - __y.base())
    { return __x.base() - __y.base(); }

  template<typename _Iterator>
    [[__nodiscard__]]
    inline constexpr move_iterator<_Iterator>
    operator+(typename move_iterator<_Iterator>::difference_type __n,
       const move_iterator<_Iterator>& __x)
    { return __x + __n; }

  template<typename _Iterator>
    [[__nodiscard__]]
    inline constexpr move_iterator<_Iterator>
    make_move_iterator(_Iterator __i)
    { return move_iterator<_Iterator>(std::move(__i)); }

  template<typename _Iterator, typename _ReturnType
    = __conditional_t<__move_if_noexcept_cond
      <typename iterator_traits<_Iterator>::value_type>::value,
  _Iterator, move_iterator<_Iterator>>>
    inline constexpr _ReturnType
    __make_move_if_noexcept_iterator(_Iterator __i)
    { return _ReturnType(__i); }



  template<typename _Tp, typename _ReturnType
    = __conditional_t<__move_if_noexcept_cond<_Tp>::value,
        const _Tp*, move_iterator<_Tp*>>>
    inline constexpr _ReturnType
    __make_move_if_noexcept_iterator(_Tp* __i)
    { return _ReturnType(__i); }




  namespace __detail
  {
    template<typename _It>
      concept __common_iter_has_arrow = indirectly_readable<const _It>
 && (requires(const _It& __it) { __it.operator->(); }
     || is_reference_v<iter_reference_t<_It>>
     || constructible_from<iter_value_t<_It>, iter_reference_t<_It>>);

    template<typename _It>
      concept __common_iter_use_postfix_proxy
 = (!requires (_It& __i) { { *__i++ } -> __can_reference; })
   && constructible_from<iter_value_t<_It>, iter_reference_t<_It>>
   && move_constructible<iter_value_t<_It>>;
  }


  template<input_or_output_iterator _It, sentinel_for<_It> _Sent>
    requires (!same_as<_It, _Sent>) && copyable<_It>
  class common_iterator
  {
    template<typename _Tp, typename _Up>
      static constexpr bool
      _S_noexcept1()
      {
 if constexpr (is_trivially_default_constructible_v<_Tp>)
   return is_nothrow_assignable_v<_Tp&, _Up>;
 else
   return is_nothrow_constructible_v<_Tp, _Up>;
      }

    template<typename _It2, typename _Sent2>
      static constexpr bool
      _S_noexcept()
      { return _S_noexcept1<_It, _It2>() && _S_noexcept1<_Sent, _Sent2>(); }

    class __arrow_proxy
    {
      iter_value_t<_It> _M_keep;

      constexpr
      __arrow_proxy(iter_reference_t<_It>&& __x)
      : _M_keep(std::move(__x)) { }

      friend class common_iterator;

    public:
      constexpr const iter_value_t<_It>*
      operator->() const noexcept
      { return std::__addressof(_M_keep); }
    };

    class __postfix_proxy
    {
      iter_value_t<_It> _M_keep;

      constexpr
      __postfix_proxy(iter_reference_t<_It>&& __x)
      : _M_keep(std::forward<iter_reference_t<_It>>(__x)) { }

      friend class common_iterator;

    public:
      constexpr const iter_value_t<_It>&
      operator*() const noexcept
      { return _M_keep; }
    };

  public:
    constexpr
    common_iterator()
    noexcept(is_nothrow_default_constructible_v<_It>)
    requires default_initializable<_It>
    : _M_it(), _M_index(0)
    { }

    constexpr
    common_iterator(_It __i)
    noexcept(is_nothrow_move_constructible_v<_It>)
    : _M_it(std::move(__i)), _M_index(0)
    { }

    constexpr
    common_iterator(_Sent __s)
    noexcept(is_nothrow_move_constructible_v<_Sent>)
    : _M_sent(std::move(__s)), _M_index(1)
    { }

    template<typename _It2, typename _Sent2>
      requires convertible_to<const _It2&, _It>
 && convertible_to<const _Sent2&, _Sent>
      constexpr
      common_iterator(const common_iterator<_It2, _Sent2>& __x)
      noexcept(_S_noexcept<const _It2&, const _Sent2&>())
      : _M_valueless(), _M_index(__x._M_index)
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
 if (_M_index == 0)
   {
     if constexpr (is_trivially_default_constructible_v<_It>)
       _M_it = std::move(__x._M_it);
     else
       std::construct_at(std::__addressof(_M_it), __x._M_it);
   }
 else if (_M_index == 1)
   {
     if constexpr (is_trivially_default_constructible_v<_Sent>)
       _M_sent = std::move(__x._M_sent);
     else
       std::construct_at(std::__addressof(_M_sent), __x._M_sent);
   }
      }

    common_iterator(const common_iterator&) = default;

    constexpr
    common_iterator(const common_iterator& __x)
    noexcept(_S_noexcept<const _It&, const _Sent&>())
    requires (!is_trivially_copyable_v<_It> || !is_trivially_copyable_v<_Sent>)
    : _M_valueless(), _M_index(__x._M_index)
    {
      if (_M_index == 0)
 {
   if constexpr (is_trivially_default_constructible_v<_It>)
     _M_it = __x._M_it;
   else
     std::construct_at(std::__addressof(_M_it), __x._M_it);
 }
      else if (_M_index == 1)
 {
   if constexpr (is_trivially_default_constructible_v<_Sent>)
     _M_sent = __x._M_sent;
   else
     std::construct_at(std::__addressof(_M_sent), __x._M_sent);
 }
    }

    common_iterator(common_iterator&&) = default;

    constexpr
    common_iterator(common_iterator&& __x)
    noexcept(_S_noexcept<_It, _Sent>())
    requires (!is_trivially_copyable_v<_It> || !is_trivially_copyable_v<_Sent>)
    : _M_valueless(), _M_index(__x._M_index)
    {
      if (_M_index == 0)
 {
   if constexpr (is_trivially_default_constructible_v<_It>)
     _M_it = std::move(__x._M_it);
   else
     std::construct_at(std::__addressof(_M_it), std::move(__x._M_it));
 }
      else if (_M_index == 1)
 {
   if constexpr (is_trivially_default_constructible_v<_Sent>)
     _M_sent = std::move(__x._M_sent);
   else
     std::construct_at(std::__addressof(_M_sent),
         std::move(__x._M_sent));
 }
    }

    constexpr common_iterator&
    operator=(const common_iterator&) = default;

    constexpr common_iterator&
    operator=(const common_iterator& __x)
    noexcept(is_nothrow_copy_assignable_v<_It>
      && is_nothrow_copy_assignable_v<_Sent>
      && is_nothrow_copy_constructible_v<_It>
      && is_nothrow_copy_constructible_v<_Sent>)
    requires (!is_trivially_copy_assignable_v<_It>
  || !is_trivially_copy_assignable_v<_Sent>)
    {
      _M_assign(__x);
      return *this;
    }

    constexpr common_iterator&
    operator=(common_iterator&&) = default;

    constexpr common_iterator&
    operator=(common_iterator&& __x)
    noexcept(is_nothrow_move_assignable_v<_It>
      && is_nothrow_move_assignable_v<_Sent>
      && is_nothrow_move_constructible_v<_It>
      && is_nothrow_move_constructible_v<_Sent>)
    requires (!is_trivially_move_assignable_v<_It>
  || !is_trivially_move_assignable_v<_Sent>)
    {
      _M_assign(std::move(__x));
      return *this;
    }

    template<typename _It2, typename _Sent2>
      requires convertible_to<const _It2&, _It>
 && convertible_to<const _Sent2&, _Sent>
 && assignable_from<_It&, const _It2&>
 && assignable_from<_Sent&, const _Sent2&>
      constexpr common_iterator&
      operator=(const common_iterator<_It2, _Sent2>& __x)
      noexcept(is_nothrow_constructible_v<_It, const _It2&>
        && is_nothrow_constructible_v<_Sent, const _Sent2&>
        && is_nothrow_assignable_v<_It&, const _It2&>
        && is_nothrow_assignable_v<_Sent&, const _Sent2&>)
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
 _M_assign(__x);
 return *this;
      }


    ~common_iterator() = default;

    constexpr
    ~common_iterator()
      requires (!is_trivially_destructible_v<_It>
    || !is_trivially_destructible_v<_Sent>)




    {
      if (_M_index == 0)
 _M_it.~_It();
      else if (_M_index == 1)
 _M_sent.~_Sent();
    }

    [[nodiscard]]
    constexpr decltype(auto)
    operator*()
    {
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
      return *_M_it;
    }

    [[nodiscard]]
    constexpr decltype(auto)
    operator*() const requires __detail::__dereferenceable<const _It>
    {
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
      return *_M_it;
    }

    [[nodiscard]]
    constexpr auto
    operator->() const requires __detail::__common_iter_has_arrow<_It>
    {
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
      if constexpr (is_pointer_v<_It> || requires { _M_it.operator->(); })
 return _M_it;
      else if constexpr (is_reference_v<iter_reference_t<_It>>)
 {
   auto&& __tmp = *_M_it;
   return std::__addressof(__tmp);
 }
      else
 return __arrow_proxy{*_M_it};
    }

    constexpr common_iterator&
    operator++()
    {
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
      ++_M_it;
      return *this;
    }

    constexpr decltype(auto)
    operator++(int)
    {
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
      if constexpr (forward_iterator<_It>)
 {
   common_iterator __tmp = *this;
   ++*this;
   return __tmp;
 }
      else if constexpr (!__detail::__common_iter_use_postfix_proxy<_It>)
 return _M_it++;
      else
 {
   __postfix_proxy __p(**this);
   ++*this;
   return __p;
 }
    }

    template<typename _It2, sentinel_for<_It> _Sent2>
      requires sentinel_for<_Sent, _It2>
      friend constexpr bool
      operator== [[nodiscard]] (const common_iterator& __x,
    const common_iterator<_It2, _Sent2>& __y)
      {
 switch(__x._M_index << 2 | __y._M_index)
   {
   case 0b0000:
   case 0b0101:
     return true;
   case 0b0001:
     return __x._M_it == __y._M_sent;
   case 0b0100:
     return __x._M_sent == __y._M_it;
   default:
     do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
     do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__y._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
     __builtin_unreachable();
   }
      }

    template<typename _It2, sentinel_for<_It> _Sent2>
      requires sentinel_for<_Sent, _It2> && equality_comparable_with<_It, _It2>
      friend constexpr bool
      operator== [[nodiscard]] (const common_iterator& __x,
    const common_iterator<_It2, _Sent2>& __y)
      {
 switch(__x._M_index << 2 | __y._M_index)
   {
   case 0b0101:
     return true;
   case 0b0000:
     return __x._M_it == __y._M_it;
   case 0b0001:
     return __x._M_it == __y._M_sent;
   case 0b0100:
     return __x._M_sent == __y._M_it;
   default:
     do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
     do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__y._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
     __builtin_unreachable();
   }
      }

    template<sized_sentinel_for<_It> _It2, sized_sentinel_for<_It> _Sent2>
      requires sized_sentinel_for<_Sent, _It2>
      friend constexpr iter_difference_t<_It2>
      operator- [[nodiscard]] (const common_iterator& __x,
          const common_iterator<_It2, _Sent2>& __y)
      {
 switch(__x._M_index << 2 | __y._M_index)
   {
   case 0b0101:
     return 0;
   case 0b0000:
     return __x._M_it - __y._M_it;
   case 0b0001:
     return __x._M_it - __y._M_sent;
   case 0b0100:
     return __x._M_sent - __y._M_it;
   default:
     do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
     do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__y._M_has_value()), false)) std::__glibcxx_assert_fail(); } while (false);
     __builtin_unreachable();
   }
      }

    [[nodiscard]]
    friend constexpr iter_rvalue_reference_t<_It>
    iter_move(const common_iterator& __i)
    noexcept(noexcept(ranges::iter_move(std::declval<const _It&>())))
    requires input_iterator<_It>
    {
      do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__i._M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
      return ranges::iter_move(__i._M_it);
    }

    template<indirectly_swappable<_It> _It2, typename _Sent2>
      friend constexpr void
      iter_swap(const common_iterator& __x,
  const common_iterator<_It2, _Sent2>& __y)
      noexcept(noexcept(ranges::iter_swap(std::declval<const _It&>(),
       std::declval<const _It2&>())))
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__y._M_index == 0), false)) std::__glibcxx_assert_fail(); } while (false);
 return ranges::iter_swap(__x._M_it, __y._M_it);
      }

  private:
    template<input_or_output_iterator _It2, sentinel_for<_It2> _Sent2>
      requires (!same_as<_It2, _Sent2>) && copyable<_It2>
      friend class common_iterator;

    constexpr bool
    _M_has_value() const noexcept { return _M_index != _S_valueless; }

    template<typename _CIt>
      constexpr void
      _M_assign(_CIt&& __x)
      {
 if (_M_index == __x._M_index)
   {
     if (_M_index == 0)
       _M_it = std::forward<_CIt>(__x)._M_it;
     else if (_M_index == 1)
       _M_sent = std::forward<_CIt>(__x)._M_sent;
   }
 else
   {
     if (_M_index == 0)
       _M_it.~_It();
     else if (_M_index == 1)
       _M_sent.~_Sent();
     _M_index = _S_valueless;

     if (__x._M_index == 0)
       std::construct_at(std::__addressof(_M_it),
    std::forward<_CIt>(__x)._M_it);
     else if (__x._M_index == 1)
       std::construct_at(std::__addressof(_M_sent),
    std::forward<_CIt>(__x)._M_sent);
     _M_index = __x._M_index;
   }
      }

    union
    {
      _It _M_it;
      _Sent _M_sent;
      unsigned char _M_valueless;
    };
    unsigned char _M_index;

    static constexpr unsigned char _S_valueless{2};
  };

  template<typename _It, typename _Sent>
    struct incrementable_traits<common_iterator<_It, _Sent>>
    {
      using difference_type = iter_difference_t<_It>;
    };

  template<input_iterator _It, typename _Sent>
    struct iterator_traits<common_iterator<_It, _Sent>>
    {
    private:
      template<typename _Iter>
 struct __ptr
 {
   using type = void;
 };

      template<typename _Iter>
 requires __detail::__common_iter_has_arrow<_Iter>
 struct __ptr<_Iter>
 {
   using _CIter = common_iterator<_Iter, _Sent>;
   using type = decltype(std::declval<const _CIter&>().operator->());
 };

      static auto
      _S_iter_cat()
      {
 if constexpr (requires { requires derived_from<__iter_category_t<_It>,
             forward_iterator_tag>; })
   return forward_iterator_tag{};
 else
   return input_iterator_tag{};
      }

    public:
      using iterator_concept = __conditional_t<forward_iterator<_It>,
            forward_iterator_tag,
            input_iterator_tag>;
      using iterator_category = decltype(_S_iter_cat());
      using value_type = iter_value_t<_It>;
      using difference_type = iter_difference_t<_It>;
      using pointer = typename __ptr<_It>::type;
      using reference = iter_reference_t<_It>;
    };



  namespace __detail
  {
    template<typename _It>
      struct __counted_iter_value_type
      { };

    template<indirectly_readable _It>
      struct __counted_iter_value_type<_It>
      { using value_type = iter_value_t<_It>; };

    template<typename _It>
      struct __counted_iter_concept
      { };

    template<typename _It>
      requires requires { typename _It::iterator_concept; }
      struct __counted_iter_concept<_It>
      { using iterator_concept = typename _It::iterator_concept; };

    template<typename _It>
      struct __counted_iter_cat
      { };

    template<typename _It>
      requires requires { typename _It::iterator_category; }
      struct __counted_iter_cat<_It>
      { using iterator_category = typename _It::iterator_category; };
  }


  template<input_or_output_iterator _It>
    class counted_iterator
      : public __detail::__counted_iter_value_type<_It>,
 public __detail::__counted_iter_concept<_It>,
 public __detail::__counted_iter_cat<_It>
    {
    public:
      using iterator_type = _It;

      using difference_type = iter_difference_t<_It>;



      constexpr counted_iterator() requires default_initializable<_It> = default;

      constexpr
      counted_iterator(_It __i, iter_difference_t<_It> __n)
      : _M_current(std::move(__i)), _M_length(__n)
      { do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__n >= 0), false)) std::__glibcxx_assert_fail(); } while (false); }

      template<typename _It2>
 requires convertible_to<const _It2&, _It>
 constexpr
 counted_iterator(const counted_iterator<_It2>& __x)
 : _M_current(__x._M_current), _M_length(__x._M_length)
 { }

      template<typename _It2>
 requires assignable_from<_It&, const _It2&>
 constexpr counted_iterator&
 operator=(const counted_iterator<_It2>& __x)
 {
   _M_current = __x._M_current;
   _M_length = __x._M_length;
   return *this;
 }

      [[nodiscard]]
      constexpr const _It&
      base() const & noexcept
      { return _M_current; }

      [[nodiscard]]
      constexpr _It
      base() &&
      noexcept(is_nothrow_move_constructible_v<_It>)
      { return std::move(_M_current); }

      [[nodiscard]]
      constexpr iter_difference_t<_It>
      count() const noexcept { return _M_length; }

      [[nodiscard]]
      constexpr decltype(auto)
      operator*()
      noexcept(noexcept(*_M_current))
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_length > 0), false)) std::__glibcxx_assert_fail(); } while (false);
 return *_M_current;
      }

      [[nodiscard]]
      constexpr decltype(auto)
      operator*() const
      noexcept(noexcept(*_M_current))
      requires __detail::__dereferenceable<const _It>
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_length > 0), false)) std::__glibcxx_assert_fail(); } while (false);
 return *_M_current;
      }

      [[nodiscard]]
      constexpr auto
      operator->() const noexcept
      requires contiguous_iterator<_It>
      { return std::to_address(_M_current); }

      constexpr counted_iterator&
      operator++()
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_length > 0), false)) std::__glibcxx_assert_fail(); } while (false);
 ++_M_current;
 --_M_length;
 return *this;
      }

      constexpr decltype(auto)
      operator++(int)
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(_M_length > 0), false)) std::__glibcxx_assert_fail(); } while (false);
 --_M_length;
 try
   {
     return _M_current++;
   } catch(...) {
     ++_M_length;
     throw;
   }
      }

      constexpr counted_iterator
      operator++(int) requires forward_iterator<_It>
      {
 auto __tmp = *this;
 ++*this;
 return __tmp;
      }

      constexpr counted_iterator&
      operator--() requires bidirectional_iterator<_It>
      {
 --_M_current;
 ++_M_length;
 return *this;
      }

      constexpr counted_iterator
      operator--(int) requires bidirectional_iterator<_It>
      {
 auto __tmp = *this;
 --*this;
 return __tmp;
      }

      [[nodiscard]]
      constexpr counted_iterator
      operator+(iter_difference_t<_It> __n) const
 requires random_access_iterator<_It>
      { return counted_iterator(_M_current + __n, _M_length - __n); }

      [[nodiscard]]
      friend constexpr counted_iterator
      operator+(iter_difference_t<_It> __n, const counted_iterator& __x)
      requires random_access_iterator<_It>
      { return __x + __n; }

      constexpr counted_iterator&
      operator+=(iter_difference_t<_It> __n)
      requires random_access_iterator<_It>
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__n <= _M_length), false)) std::__glibcxx_assert_fail(); } while (false);
 _M_current += __n;
 _M_length -= __n;
 return *this;
      }

      [[nodiscard]]
      constexpr counted_iterator
      operator-(iter_difference_t<_It> __n) const
      requires random_access_iterator<_It>
      { return counted_iterator(_M_current - __n, _M_length + __n); }

      template<common_with<_It> _It2>
 [[nodiscard]]
 friend constexpr iter_difference_t<_It2>
 operator-(const counted_iterator& __x,
    const counted_iterator<_It2>& __y)
 { return __y._M_length - __x._M_length; }

      [[nodiscard]]
      friend constexpr iter_difference_t<_It>
      operator-(const counted_iterator& __x, default_sentinel_t)
      { return -__x._M_length; }

      [[nodiscard]]
      friend constexpr iter_difference_t<_It>
      operator-(default_sentinel_t, const counted_iterator& __y)
      { return __y._M_length; }

      constexpr counted_iterator&
      operator-=(iter_difference_t<_It> __n)
      requires random_access_iterator<_It>
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(-__n <= _M_length), false)) std::__glibcxx_assert_fail(); } while (false);
 _M_current -= __n;
 _M_length += __n;
 return *this;
      }

      [[nodiscard]]
      constexpr decltype(auto)
      operator[](iter_difference_t<_It> __n) const
      noexcept(noexcept(_M_current[__n]))
      requires random_access_iterator<_It>
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__n < _M_length), false)) std::__glibcxx_assert_fail(); } while (false);
 return _M_current[__n];
      }

      template<common_with<_It> _It2>
 [[nodiscard]]
 friend constexpr bool
 operator==(const counted_iterator& __x,
     const counted_iterator<_It2>& __y)
 { return __x._M_length == __y._M_length; }

      [[nodiscard]]
      friend constexpr bool
      operator==(const counted_iterator& __x, default_sentinel_t)
      { return __x._M_length == 0; }

      template<common_with<_It> _It2>
 [[nodiscard]]
 friend constexpr strong_ordering
 operator<=>(const counted_iterator& __x,
      const counted_iterator<_It2>& __y)
 { return __y._M_length <=> __x._M_length; }

      [[nodiscard]]
      friend constexpr iter_rvalue_reference_t<_It>
      iter_move(const counted_iterator& __i)
      noexcept(noexcept(ranges::iter_move(__i._M_current)))
      requires input_iterator<_It>
      {
 do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__i._M_length > 0), false)) std::__glibcxx_assert_fail(); } while (false);
 return ranges::iter_move(__i._M_current);
      }

      template<indirectly_swappable<_It> _It2>
 friend constexpr void
 iter_swap(const counted_iterator& __x,
    const counted_iterator<_It2>& __y)
 noexcept(noexcept(ranges::iter_swap(__x._M_current, __y._M_current)))
 {
   do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__x._M_length > 0 && __y._M_length > 0), false)) std::__glibcxx_assert_fail(); } while (false);
   ranges::iter_swap(__x._M_current, __y._M_current);
 }

    private:
      template<input_or_output_iterator _It2> friend class counted_iterator;

      _It _M_current = _It();
      iter_difference_t<_It> _M_length = 0;
    };

  template<input_iterator _It>
    requires same_as<__detail::__iter_traits<_It>, iterator_traits<_It>>
    struct iterator_traits<counted_iterator<_It>> : iterator_traits<_It>
    {
      using pointer = __conditional_t<contiguous_iterator<_It>,
          add_pointer_t<iter_reference_t<_It>>,
          void>;
    };
# 2952 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _Iterator>
    constexpr
    auto
    __niter_base(move_iterator<_Iterator> __it)
    -> decltype(make_move_iterator(__niter_base(__it.base())))
    { return make_move_iterator(__niter_base(__it.base())); }

  template<typename _Iterator>
    struct __is_move_iterator<move_iterator<_Iterator> >
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<typename _Iterator>
    constexpr
    auto
    __miter_base(move_iterator<_Iterator> __it)
    -> decltype(__miter_base(__it.base()))
    { return __miter_base(__it.base()); }
# 2984 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_iterator.h" 3
  template<typename _InputIterator>
    using __iter_key_t = remove_const_t<



      typename iterator_traits<_InputIterator>::value_type::first_type>;


  template<typename _InputIterator>
    using __iter_val_t



      = typename iterator_traits<_InputIterator>::value_type::second_type;


  template<typename _T1, typename _T2>
    struct pair;

  template<typename _InputIterator>
    using __iter_to_alloc_t
      = pair<const __iter_key_t<_InputIterator>, __iter_val_t<_InputIterator>>;



}
# 68 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3

# 1 "C:/msys64/ucrt64/include/c++/14.2.0/debug/debug.h" 1 3
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/debug/debug.h" 3
namespace std
{
  namespace __debug { }
}




namespace __gnu_debug
{
  using namespace std::__debug;

  template<typename _Ite, typename _Seq, typename _Cat>
    struct _Safe_iterator;
}
# 70 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3

# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/predefined_ops.h" 1 3
# 35 "C:/msys64/ucrt64/include/c++/14.2.0/bits/predefined_ops.h" 3
namespace __gnu_cxx
{
namespace __ops
{
  struct _Iter_less_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      constexpr
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 < *__it2; }
  };

  constexpr
  inline _Iter_less_iter
  __iter_less_iter()
  { return _Iter_less_iter(); }

  struct _Iter_less_val
  {

    constexpr _Iter_less_val() = default;




    constexpr
    explicit
    _Iter_less_val(_Iter_less_iter) { }

    template<typename _Iterator, typename _Value>
      constexpr
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it < __val; }
  };

  constexpr
  inline _Iter_less_val
  __iter_less_val()
  { return _Iter_less_val(); }

  constexpr
  inline _Iter_less_val
  __iter_comp_val(_Iter_less_iter)
  { return _Iter_less_val(); }

  struct _Val_less_iter
  {

    constexpr _Val_less_iter() = default;




    constexpr
    explicit
    _Val_less_iter(_Iter_less_iter) { }

    template<typename _Value, typename _Iterator>
      constexpr
      bool
      operator()(_Value& __val, _Iterator __it) const
      { return __val < *__it; }
  };

  constexpr
  inline _Val_less_iter
  __val_less_iter()
  { return _Val_less_iter(); }

  constexpr
  inline _Val_less_iter
  __val_comp_iter(_Iter_less_iter)
  { return _Val_less_iter(); }

  struct _Iter_equal_to_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      constexpr
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 == *__it2; }
  };

  constexpr
  inline _Iter_equal_to_iter
  __iter_equal_to_iter()
  { return _Iter_equal_to_iter(); }

  struct _Iter_equal_to_val
  {
    template<typename _Iterator, typename _Value>
      constexpr
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it == __val; }
  };

  constexpr
  inline _Iter_equal_to_val
  __iter_equal_to_val()
  { return _Iter_equal_to_val(); }

  constexpr
  inline _Iter_equal_to_val
  __iter_comp_val(_Iter_equal_to_iter)
  { return _Iter_equal_to_val(); }

  template<typename _Compare>
    struct _Iter_comp_iter
    {
      _Compare _M_comp;

      explicit constexpr
      _Iter_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      template<typename _Iterator1, typename _Iterator2>
        constexpr
        bool
        operator()(_Iterator1 __it1, _Iterator2 __it2)
        { return bool(_M_comp(*__it1, *__it2)); }
    };

  template<typename _Compare>
    constexpr
    inline _Iter_comp_iter<_Compare>
    __iter_comp_iter(_Compare __comp)
    { return _Iter_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    struct _Iter_comp_val
    {
      _Compare _M_comp;

      constexpr
      explicit
      _Iter_comp_val(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      constexpr
      explicit
      _Iter_comp_val(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }


      constexpr
      explicit
      _Iter_comp_val(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }


      template<typename _Iterator, typename _Value>
 constexpr
 bool
 operator()(_Iterator __it, _Value& __val)
 { return bool(_M_comp(*__it, __val)); }
    };

  template<typename _Compare>
    constexpr
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Compare __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    constexpr
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Iter_comp_iter<_Compare> __comp)
    { return _Iter_comp_val<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    struct _Val_comp_iter
    {
      _Compare _M_comp;

      constexpr
      explicit
      _Val_comp_iter(_Compare __comp)
 : _M_comp(std::move(__comp))
      { }

      constexpr
      explicit
      _Val_comp_iter(const _Iter_comp_iter<_Compare>& __comp)
 : _M_comp(__comp._M_comp)
      { }


      constexpr
      explicit
      _Val_comp_iter(_Iter_comp_iter<_Compare>&& __comp)
 : _M_comp(std::move(__comp._M_comp))
      { }


      template<typename _Value, typename _Iterator>
 constexpr
 bool
 operator()(_Value& __val, _Iterator __it)
 { return bool(_M_comp(__val, *__it)); }
    };

  template<typename _Compare>
    constexpr
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Compare __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Compare>
    constexpr
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Iter_comp_iter<_Compare> __comp)
    { return _Val_comp_iter<_Compare>(std::move(__comp)); }

  template<typename _Value>
    struct _Iter_equals_val
    {
      _Value& _M_value;

      constexpr
      explicit
      _Iter_equals_val(_Value& __value)
 : _M_value(__value)
      { }

      template<typename _Iterator>
 constexpr
 bool
 operator()(_Iterator __it)
 { return *__it == _M_value; }
    };

  template<typename _Value>
    constexpr
    inline _Iter_equals_val<_Value>
    __iter_equals_val(_Value& __val)
    { return _Iter_equals_val<_Value>(__val); }

  template<typename _Iterator1>
    struct _Iter_equals_iter
    {
      _Iterator1 _M_it1;

      constexpr
      explicit
      _Iter_equals_iter(_Iterator1 __it1)
 : _M_it1(__it1)
      { }

      template<typename _Iterator2>
 constexpr
 bool
 operator()(_Iterator2 __it2)
 { return *__it2 == *_M_it1; }
    };

  template<typename _Iterator>
    constexpr
    inline _Iter_equals_iter<_Iterator>
    __iter_comp_iter(_Iter_equal_to_iter, _Iterator __it)
    { return _Iter_equals_iter<_Iterator>(__it); }

  template<typename _Predicate>
    struct _Iter_pred
    {
      _Predicate _M_pred;

      constexpr
      explicit
      _Iter_pred(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }

      template<typename _Iterator>
 constexpr
 bool
 operator()(_Iterator __it)
 { return bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    constexpr
    inline _Iter_pred<_Predicate>
    __pred_iter(_Predicate __pred)
    { return _Iter_pred<_Predicate>(std::move(__pred)); }

  template<typename _Compare, typename _Value>
    struct _Iter_comp_to_val
    {
      _Compare _M_comp;
      _Value& _M_value;

      constexpr
      _Iter_comp_to_val(_Compare __comp, _Value& __value)
 : _M_comp(std::move(__comp)), _M_value(__value)
      { }

      template<typename _Iterator>
 constexpr
 bool
 operator()(_Iterator __it)
 { return bool(_M_comp(*__it, _M_value)); }
    };

  template<typename _Compare, typename _Value>
    _Iter_comp_to_val<_Compare, _Value>
    constexpr
    __iter_comp_val(_Compare __comp, _Value &__val)
    {
      return _Iter_comp_to_val<_Compare, _Value>(std::move(__comp), __val);
    }

  template<typename _Compare, typename _Iterator1>
    struct _Iter_comp_to_iter
    {
      _Compare _M_comp;
      _Iterator1 _M_it1;

      constexpr
      _Iter_comp_to_iter(_Compare __comp, _Iterator1 __it1)
 : _M_comp(std::move(__comp)), _M_it1(__it1)
      { }

      template<typename _Iterator2>
 constexpr
 bool
 operator()(_Iterator2 __it2)
 { return bool(_M_comp(*__it2, *_M_it1)); }
    };

  template<typename _Compare, typename _Iterator>
    constexpr
    inline _Iter_comp_to_iter<_Compare, _Iterator>
    __iter_comp_iter(_Iter_comp_iter<_Compare> __comp, _Iterator __it)
    {
      return _Iter_comp_to_iter<_Compare, _Iterator>(
   std::move(__comp._M_comp), __it);
    }

  template<typename _Predicate>
    struct _Iter_negate
    {
      _Predicate _M_pred;

      constexpr
      explicit
      _Iter_negate(_Predicate __pred)
 : _M_pred(std::move(__pred))
      { }

      template<typename _Iterator>
 constexpr
 bool
 operator()(_Iterator __it)
 { return !bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    constexpr
    inline _Iter_negate<_Predicate>
    __negate(_Iter_pred<_Predicate> __pred)
    { return _Iter_negate<_Predicate>(std::move(__pred._M_pred)); }

}
}
# 72 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3




# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 1 3
# 32 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 3
       
# 33 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 3
# 61 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
       
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/version.h" 3
# 62 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 2 3

namespace std
{

# 85 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 3
  template<typename _To, typename _From>
    [[nodiscard]]
    constexpr _To
    bit_cast(const _From& __from) noexcept

    requires (sizeof(_To) == sizeof(_From))
      && is_trivially_copyable_v<_To> && is_trivially_copyable_v<_From>

    {
      return __builtin_bit_cast(_To, __from);
    }
# 155 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 3
  template<typename _Tp>
    constexpr _Tp
    __rotl(_Tp __x, int __s) noexcept
    {
      constexpr auto _Nd = __gnu_cxx::__int_traits<_Tp>::__digits;
      if constexpr ((_Nd & (_Nd - 1)) == 0)
 {


   constexpr unsigned __uNd = _Nd;
   const unsigned __r = __s;
   return (__x << (__r % __uNd)) | (__x >> ((-__r) % __uNd));
 }
      const int __r = __s % _Nd;
      if (__r == 0)
 return __x;
      else if (__r > 0)
 return (__x << __r) | (__x >> ((_Nd - __r) % _Nd));
      else
 return (__x >> -__r) | (__x << ((_Nd + __r) % _Nd));
    }

  template<typename _Tp>
    constexpr _Tp
    __rotr(_Tp __x, int __s) noexcept
    {
      constexpr auto _Nd = __gnu_cxx::__int_traits<_Tp>::__digits;
      if constexpr ((_Nd & (_Nd - 1)) == 0)
 {


   constexpr unsigned __uNd = _Nd;
   const unsigned __r = __s;
   return (__x >> (__r % __uNd)) | (__x << ((-__r) % __uNd));
 }
      const int __r = __s % _Nd;
      if (__r == 0)
 return __x;
      else if (__r > 0)
 return (__x >> __r) | (__x << ((_Nd - __r) % _Nd));
      else
 return (__x << -__r) | (__x >> ((_Nd + __r) % _Nd));
    }

  template<typename _Tp>
    constexpr int
    __countl_zero(_Tp __x) noexcept
    {
      using __gnu_cxx::__int_traits;
      constexpr auto _Nd = __int_traits<_Tp>::__digits;

      if (__x == 0)
        return _Nd;

      constexpr auto _Nd_ull = __int_traits<unsigned long long>::__digits;
      constexpr auto _Nd_ul = __int_traits<unsigned long>::__digits;
      constexpr auto _Nd_u = __int_traits<unsigned>::__digits;

      if constexpr (_Nd <= _Nd_u)
 {
   constexpr int __diff = _Nd_u - _Nd;
   return __builtin_clz(__x) - __diff;
 }
      else if constexpr (_Nd <= _Nd_ul)
 {
   constexpr int __diff = _Nd_ul - _Nd;
   return __builtin_clzl(__x) - __diff;
 }
      else if constexpr (_Nd <= _Nd_ull)
 {
   constexpr int __diff = _Nd_ull - _Nd;
   return __builtin_clzll(__x) - __diff;
 }
      else
 {
   static_assert(_Nd <= (2 * _Nd_ull),
   "Maximum supported integer size is 128-bit");

   unsigned long long __high = __x >> _Nd_ull;
   if (__high != 0)
     {
       constexpr int __diff = (2 * _Nd_ull) - _Nd;
       return __builtin_clzll(__high) - __diff;
     }
   constexpr auto __max_ull = __int_traits<unsigned long long>::__max;
   unsigned long long __low = __x & __max_ull;
   return (_Nd - _Nd_ull) + __builtin_clzll(__low);
 }
    }

  template<typename _Tp>
    constexpr int
    __countl_one(_Tp __x) noexcept
    {
      return std::__countl_zero<_Tp>((_Tp)~__x);
    }

  template<typename _Tp>
    constexpr int
    __countr_zero(_Tp __x) noexcept
    {
      using __gnu_cxx::__int_traits;
      constexpr auto _Nd = __int_traits<_Tp>::__digits;

      if (__x == 0)
        return _Nd;

      constexpr auto _Nd_ull = __int_traits<unsigned long long>::__digits;
      constexpr auto _Nd_ul = __int_traits<unsigned long>::__digits;
      constexpr auto _Nd_u = __int_traits<unsigned>::__digits;

      if constexpr (_Nd <= _Nd_u)
 return __builtin_ctz(__x);
      else if constexpr (_Nd <= _Nd_ul)
 return __builtin_ctzl(__x);
      else if constexpr (_Nd <= _Nd_ull)
 return __builtin_ctzll(__x);
      else
 {
   static_assert(_Nd <= (2 * _Nd_ull),
   "Maximum supported integer size is 128-bit");

   constexpr auto __max_ull = __int_traits<unsigned long long>::__max;
   unsigned long long __low = __x & __max_ull;
   if (__low != 0)
     return __builtin_ctzll(__low);
   unsigned long long __high = __x >> _Nd_ull;
   return __builtin_ctzll(__high) + _Nd_ull;
 }
    }

  template<typename _Tp>
    constexpr int
    __countr_one(_Tp __x) noexcept
    {
      return std::__countr_zero((_Tp)~__x);
    }

  template<typename _Tp>
    constexpr int
    __popcount(_Tp __x) noexcept
    {
      using __gnu_cxx::__int_traits;
      constexpr auto _Nd = __int_traits<_Tp>::__digits;

      constexpr auto _Nd_ull = __int_traits<unsigned long long>::__digits;
      constexpr auto _Nd_ul = __int_traits<unsigned long>::__digits;
      constexpr auto _Nd_u = __int_traits<unsigned>::__digits;

      if constexpr (_Nd <= _Nd_u)
 return __builtin_popcount(__x);
      else if constexpr (_Nd <= _Nd_ul)
 return __builtin_popcountl(__x);
      else if constexpr (_Nd <= _Nd_ull)
 return __builtin_popcountll(__x);
      else
 {
   static_assert(_Nd <= (2 * _Nd_ull),
   "Maximum supported integer size is 128-bit");

   constexpr auto __max_ull = __int_traits<unsigned long long>::__max;
   unsigned long long __low = __x & __max_ull;
   unsigned long long __high = __x >> _Nd_ull;
   return __builtin_popcountll(__low) + __builtin_popcountll(__high);
 }
    }

  template<typename _Tp>
    constexpr bool
    __has_single_bit(_Tp __x) noexcept
    { return std::__popcount(__x) == 1; }

  template<typename _Tp>
    constexpr _Tp
    __bit_ceil(_Tp __x) noexcept
    {
      using __gnu_cxx::__int_traits;
      constexpr auto _Nd = __int_traits<_Tp>::__digits;
      if (__x == 0 || __x == 1)
        return 1;
      auto __shift_exponent = _Nd - std::__countl_zero((_Tp)(__x - 1u));




      if (!std::__is_constant_evaluated())
 {
   do { if (std::__is_constant_evaluated()) if (__builtin_expect(!bool(__shift_exponent != __int_traits<_Tp>::__digits), false)) std::__glibcxx_assert_fail(); } while (false);
 }

      using __promoted_type = decltype(__x << 1);
      if constexpr (!is_same<__promoted_type, _Tp>::value)
 {





   const int __extra_exp = sizeof(__promoted_type) / sizeof(_Tp) / 2;
   __shift_exponent |= (__shift_exponent & _Nd) << __extra_exp;
 }
      return (_Tp)1u << __shift_exponent;
    }

  template<typename _Tp>
    constexpr _Tp
    __bit_floor(_Tp __x) noexcept
    {
      constexpr auto _Nd = __gnu_cxx::__int_traits<_Tp>::__digits;
      if (__x == 0)
        return 0;
      return (_Tp)1u << (_Nd - std::__countl_zero((_Tp)(__x >> 1)));
    }

  template<typename _Tp>
    constexpr int
    __bit_width(_Tp __x) noexcept
    {
      constexpr auto _Nd = __gnu_cxx::__int_traits<_Tp>::__digits;
      return _Nd - std::__countl_zero(__x);
    }






  template<typename _Tp>
    concept __unsigned_integer = __is_unsigned_integer<_Tp>::value;





  template<__unsigned_integer _Tp>
    [[nodiscard]] constexpr _Tp
    rotl(_Tp __x, int __s) noexcept
    { return std::__rotl(__x, __s); }


  template<__unsigned_integer _Tp>
    [[nodiscard]] constexpr _Tp
    rotr(_Tp __x, int __s) noexcept
    { return std::__rotr(__x, __s); }




  template<__unsigned_integer _Tp>
    constexpr int
    countl_zero(_Tp __x) noexcept
    { return std::__countl_zero(__x); }


  template<__unsigned_integer _Tp>
    constexpr int
    countl_one(_Tp __x) noexcept
    { return std::__countl_one(__x); }


  template<__unsigned_integer _Tp>
    constexpr int
    countr_zero(_Tp __x) noexcept
    { return std::__countr_zero(__x); }


  template<__unsigned_integer _Tp>
    constexpr int
    countr_one(_Tp __x) noexcept
    { return std::__countr_one(__x); }


  template<__unsigned_integer _Tp>
    constexpr int
    popcount(_Tp __x) noexcept
    { return std::__popcount(__x); }






  template<__unsigned_integer _Tp>
    constexpr bool
    has_single_bit(_Tp __x) noexcept
    { return std::__has_single_bit(__x); }


  template<__unsigned_integer _Tp>
    constexpr _Tp
    bit_ceil(_Tp __x) noexcept
    { return std::__bit_ceil(__x); }


  template<__unsigned_integer _Tp>
    constexpr _Tp
    bit_floor(_Tp __x) noexcept
    { return std::__bit_floor(__x); }




  template<__unsigned_integer _Tp>
    constexpr int
    bit_width(_Tp __x) noexcept
    { return std::__bit_width(__x); }
# 472 "C:/msys64/ucrt64/include/c++/14.2.0/bit" 3
  enum class endian
  {
    little = 1234,
    big = 4321,
    native = 1234
  };





}
# 77 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 2 3





namespace std
{






  template<typename _Tp, typename _Up>
    constexpr
    inline int
    __memcmp(const _Tp* __first1, const _Up* __first2, size_t __num)
    {

      static_assert(sizeof(_Tp) == sizeof(_Up), "can be compared with memcmp");


      if (std::is_constant_evaluated())
 {
   for(; __num > 0; ++__first1, ++__first2, --__num)
     if (*__first1 != *__first2)
       return *__first1 < *__first2 ? -1 : 1;
   return 0;
 }
      else

 return __builtin_memcmp(__first1, __first2, sizeof(_Tp) * __num);
    }
# 152 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    constexpr
    inline void
    iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
    {

     

     
# 185 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
      swap(*__a, *__b);

    }
# 201 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    constexpr
    _ForwardIterator2
    swap_ranges(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
  _ForwardIterator2 __first2)
    {

     

     

      ;

      for (; __first1 != __last1; ++__first1, (void)++__first2)
 std::iter_swap(__first1, __first2);
      return __first2;
    }
# 230 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _Tp>
    [[__nodiscard__]] constexpr
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {

     

      if (__b < __a)
 return __b;
      return __a;
    }
# 254 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _Tp>
    [[__nodiscard__]] constexpr
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {

     

      if (__a < __b)
 return __b;
      return __a;
    }
# 278 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
    [[__nodiscard__]] constexpr
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__b, __a))
 return __b;
      return __a;
    }
# 300 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
    [[__nodiscard__]] constexpr
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__a, __b))
 return __b;
      return __a;
    }



  template<typename _Iterator>
    constexpr
    inline _Iterator
    __niter_base(_Iterator __it)
    noexcept(std::is_nothrow_copy_constructible<_Iterator>::value)
    { return __it; }
# 332 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _Ite, typename _Seq>
    constexpr
    decltype(std::__niter_base(std::declval<_Ite>()))
    __niter_base(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq,
   std::random_access_iterator_tag>&)
    noexcept(std::is_nothrow_copy_constructible<_Ite>::value);





  template<typename _From, typename _To>
    constexpr
    inline _From
    __niter_wrap(_From __from, _To __res)
    { return __from + (std::__niter_base(__res) - std::__niter_base(__from)); }


  template<typename _Iterator>
    constexpr
    inline _Iterator
    __niter_wrap(const _Iterator&, _Iterator __res)
    { return __res; }







  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move
    {
      template<typename _II, typename _OI>
 constexpr
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = *__first;
   return __result;
 }
    };


  template<typename _Category>
    struct __copy_move<true, false, _Category>
    {
      template<typename _II, typename _OI>
 constexpr
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   for (; __first != __last; ++__result, (void)++__first)
     *__result = std::move(*__first);
   return __result;
 }
    };


  template<>
    struct __copy_move<false, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
 constexpr
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = *__first;
       ++__first;
       ++__result;
     }
   return __result;
 }

      template<typename _Tp, typename _Up>
 static void
 __assign_one(_Tp* __to, _Up* __from)
 { *__to = *__from; }
    };


  template<>
    struct __copy_move<true, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
 constexpr
 static _OI
 __copy_m(_II __first, _II __last, _OI __result)
 {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = std::move(*__first);
       ++__first;
       ++__result;
     }
   return __result;
 }

      template<typename _Tp, typename _Up>
 static void
 __assign_one(_Tp* __to, _Up* __from)
 { *__to = std::move(*__from); }
    };


  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp, typename _Up>
 constexpr
 static _Up*
 __copy_m(_Tp* __first, _Tp* __last, _Up* __result)
 {
   const ptrdiff_t _Num = __last - __first;
   if (__builtin_expect(_Num > 1, true))
     __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
   else if (_Num == 1)
     std::__copy_move<_IsMove, false, random_access_iterator_tag>::
       __assign_one(__result, __first);
   return __result + _Num;
 }
    };



  template<typename _Tp, typename _Ref, typename _Ptr>
    struct _Deque_iterator;

  struct _Bit_iterator;






  template<typename _CharT>
    struct char_traits;

  template<typename _CharT, typename _Traits>
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator;

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(_CharT*, _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(const _CharT*, const _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
     istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value,
      std::_Deque_iterator<_CharT, _CharT&, _CharT*> >::__type
    __copy_move_a2(
 istreambuf_iterator<_CharT, char_traits<_CharT> >,
 istreambuf_iterator<_CharT, char_traits<_CharT> >,
 std::_Deque_iterator<_CharT, _CharT&, _CharT*>);


  template<bool _IsMove, typename _II, typename _OI>
    constexpr
    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
    {
      typedef typename iterator_traits<_II>::iterator_category _Category;

      if (std::is_constant_evaluated())
 return std::__copy_move<_IsMove, false, _Category>::
   __copy_m(__first, __last, __result);

      return std::__copy_move<_IsMove, __memcpyable<_OI, _II>::__value,
         _Category>::__copy_m(__first, __last, __result);
    }

  template<bool _IsMove,
    typename _Tp, typename _Ref, typename _Ptr, typename _OI>
    _OI
    __copy_move_a1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
     std::_Deque_iterator<_Tp, _Ref, _Ptr>,
     _OI);

  template<bool _IsMove,
    typename _ITp, typename _IRef, typename _IPtr, typename _OTp>
    std::_Deque_iterator<_OTp, _OTp&, _OTp*>
    __copy_move_a1(std::_Deque_iterator<_ITp, _IRef, _IPtr>,
     std::_Deque_iterator<_ITp, _IRef, _IPtr>,
     std::_Deque_iterator<_OTp, _OTp&, _OTp*>);

  template<bool _IsMove, typename _II, typename _Tp>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value,
      std::_Deque_iterator<_Tp, _Tp&, _Tp*> >::__type
    __copy_move_a1(_II, _II, std::_Deque_iterator<_Tp, _Tp&, _Tp*>);

  template<bool _IsMove, typename _II, typename _OI>
    constexpr
    inline _OI
    __copy_move_a1(_II __first, _II __last, _OI __result)
    { return std::__copy_move_a2<_IsMove>(__first, __last, __result); }

  template<bool _IsMove, typename _II, typename _OI>
    constexpr
    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_a1<_IsMove>(std::__niter_base(__first),
          std::__niter_base(__last),
          std::__niter_base(__result)));
    }

  template<bool _IsMove,
    typename _Ite, typename _Seq, typename _Cat, typename _OI>
    constexpr
    _OI
    __copy_move_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
    const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
    _OI);

  template<bool _IsMove,
    typename _II, typename _Ite, typename _Seq, typename _Cat>
    constexpr
    __gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __copy_move_a(_II, _II,
    const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&);

  template<bool _IsMove,
    typename _IIte, typename _ISeq, typename _ICat,
    typename _OIte, typename _OSeq, typename _OCat>
    constexpr
    ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>
    __copy_move_a(const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
    const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
    const ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>&);

  template<typename _InputIterator, typename _Size, typename _OutputIterator>
    constexpr
    _OutputIterator
    __copy_n_a(_InputIterator __first, _Size __n, _OutputIterator __result,
        bool)
    {
      if (__n > 0)
 {
   while (true)
     {
       *__result = *__first;
       ++__result;
       if (--__n > 0)
  ++__first;
       else
  break;
     }
 }
      return __result;
    }


  template<typename _CharT, typename _Size>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value, _CharT*>::__type
    __copy_n_a(istreambuf_iterator<_CharT, char_traits<_CharT> >,
        _Size, _CharT*, bool);

  template<typename _CharT, typename _Size>
    typename __gnu_cxx::__enable_if<
      __is_char<_CharT>::__value,
      std::_Deque_iterator<_CharT, _CharT&, _CharT*> >::__type
    __copy_n_a(istreambuf_iterator<_CharT, char_traits<_CharT> >, _Size,
        std::_Deque_iterator<_CharT, _CharT&, _CharT*>,
        bool);
# 639 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>
    constexpr
    inline _OI
    copy(_II __first, _II __last, _OI __result)
    {

     
     

      ;

      return std::__copy_move_a<__is_move_iterator<_II>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
# 672 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>
    constexpr
    inline _OI
    move(_II __first, _II __last, _OI __result)
    {

     
     

      ;

      return std::__copy_move_a<true>(std::__miter_base(__first),
          std::__miter_base(__last), __result);
    }






  template<bool _IsMove, bool _IsSimple, typename _Category>
    struct __copy_move_backward
    {
      template<typename _BI1, typename _BI2>
 constexpr
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = *--__last;
   return __result;
 }
    };


  template<typename _Category>
    struct __copy_move_backward<true, false, _Category>
    {
      template<typename _BI1, typename _BI2>
 constexpr
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   while (__first != __last)
     *--__result = std::move(*--__last);
   return __result;
 }
    };


  template<>
    struct __copy_move_backward<false, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
 constexpr
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type
     __n = __last - __first;
   for (; __n > 0; --__n)
     *--__result = *--__last;
   return __result;
 }
    };


  template<>
    struct __copy_move_backward<true, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
 constexpr
 static _BI2
 __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
 {
   typename iterator_traits<_BI1>::difference_type
     __n = __last - __first;
   for (; __n > 0; --__n)
     *--__result = std::move(*--__last);
   return __result;
 }
    };


  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp, typename _Up>
 constexpr
 static _Up*
 __copy_move_b(_Tp* __first, _Tp* __last, _Up* __result)
 {
   const ptrdiff_t _Num = __last - __first;
   if (__builtin_expect(_Num > 1, true))
     __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
   else if (_Num == 1)
     std::__copy_move<_IsMove, false, random_access_iterator_tag>::
       __assign_one(__result - 1, __first);
   return __result - _Num;
 }
    };

  template<bool _IsMove, typename _BI1, typename _BI2>
    constexpr
    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      typedef typename iterator_traits<_BI1>::iterator_category _Category;

      if (std::is_constant_evaluated())
 return std::__copy_move_backward<_IsMove, false, _Category>::
   __copy_move_b(__first, __last, __result);

      return std::__copy_move_backward<_IsMove,
           __memcpyable<_BI2, _BI1>::__value,
           _Category>::__copy_move_b(__first,
         __last,
         __result);
    }

  template<bool _IsMove, typename _BI1, typename _BI2>
    constexpr
    inline _BI2
    __copy_move_backward_a1(_BI1 __first, _BI1 __last, _BI2 __result)
    { return std::__copy_move_backward_a2<_IsMove>(__first, __last, __result); }

  template<bool _IsMove,
    typename _Tp, typename _Ref, typename _Ptr, typename _OI>
    _OI
    __copy_move_backward_a1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
       std::_Deque_iterator<_Tp, _Ref, _Ptr>,
       _OI);

  template<bool _IsMove,
    typename _ITp, typename _IRef, typename _IPtr, typename _OTp>
    std::_Deque_iterator<_OTp, _OTp&, _OTp*>
    __copy_move_backward_a1(
   std::_Deque_iterator<_ITp, _IRef, _IPtr>,
   std::_Deque_iterator<_ITp, _IRef, _IPtr>,
   std::_Deque_iterator<_OTp, _OTp&, _OTp*>);

  template<bool _IsMove, typename _II, typename _Tp>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value,
      std::_Deque_iterator<_Tp, _Tp&, _Tp*> >::__type
    __copy_move_backward_a1(_II, _II,
       std::_Deque_iterator<_Tp, _Tp&, _Tp*>);

  template<bool _IsMove, typename _II, typename _OI>
    constexpr
    inline _OI
    __copy_move_backward_a(_II __first, _II __last, _OI __result)
    {
      return std::__niter_wrap(__result,
  std::__copy_move_backward_a1<_IsMove>
    (std::__niter_base(__first), std::__niter_base(__last),
     std::__niter_base(__result)));
    }

  template<bool _IsMove,
    typename _Ite, typename _Seq, typename _Cat, typename _OI>
    constexpr
    _OI
    __copy_move_backward_a(
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
  _OI);

  template<bool _IsMove,
    typename _II, typename _Ite, typename _Seq, typename _Cat>
    constexpr
    __gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __copy_move_backward_a(_II, _II,
  const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&);

  template<bool _IsMove,
    typename _IIte, typename _ISeq, typename _ICat,
    typename _OIte, typename _OSeq, typename _OCat>
    constexpr
    ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>
    __copy_move_backward_a(
  const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
  const ::__gnu_debug::_Safe_iterator<_IIte, _ISeq, _ICat>&,
  const ::__gnu_debug::_Safe_iterator<_OIte, _OSeq, _OCat>&);
# 875 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>
    constexpr
    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {

     
     
     

      ;

      return std::__copy_move_backward_a<__is_move_iterator<_BI1>::__value>
      (std::__miter_base(__first), std::__miter_base(__last), __result);
    }
# 910 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>
    constexpr
    inline _BI2
    move_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {

     
     
     

      ;

      return std::__copy_move_backward_a<true>(std::__miter_base(__first),
            std::__miter_base(__last),
            __result);
    }






  template<typename _ForwardIterator, typename _Tp>
    constexpr
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, void>::__type
    __fill_a1(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      for (; __first != __last; ++__first)
 *__first = __value;
    }

  template<typename _ForwardIterator, typename _Tp>
    constexpr
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, void>::__type
    __fill_a1(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __first != __last; ++__first)
 *__first = __tmp;
    }


  template<typename _Tp>
    constexpr
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, void>::__type
    __fill_a1(_Tp* __first, _Tp* __last, const _Tp& __c)
    {
      const _Tp __tmp = __c;

      if (std::is_constant_evaluated())
 {
   for (; __first != __last; ++__first)
     *__first = __tmp;
   return;
 }

      if (const size_t __len = __last - __first)
 __builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
    }

  template<typename _Ite, typename _Cont, typename _Tp>
    constexpr
    inline void
    __fill_a1(::__gnu_cxx::__normal_iterator<_Ite, _Cont> __first,
       ::__gnu_cxx::__normal_iterator<_Ite, _Cont> __last,
       const _Tp& __value)
    { std::__fill_a1(__first.base(), __last.base(), __value); }

  template<typename _Tp, typename _VTp>
    void
    __fill_a1(const std::_Deque_iterator<_Tp, _Tp&, _Tp*>&,
       const std::_Deque_iterator<_Tp, _Tp&, _Tp*>&,
       const _VTp&);

  constexpr
  void
  __fill_a1(std::_Bit_iterator, std::_Bit_iterator,
     const bool&);

  template<typename _FIte, typename _Tp>
    constexpr
    inline void
    __fill_a(_FIte __first, _FIte __last, const _Tp& __value)
    { std::__fill_a1(__first, __last, __value); }

  template<typename _Ite, typename _Seq, typename _Cat, typename _Tp>
    constexpr
    void
    __fill_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
      const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>&,
      const _Tp&);
# 1019 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    constexpr
    inline void
    fill(_ForwardIterator __first, _ForwardIterator __last, const _Tp& __value)
    {

     

      ;

      std::__fill_a(__first, __last, __value);
    }


  inline constexpr int
  __size_to_integer(int __n) { return __n; }
  inline constexpr unsigned
  __size_to_integer(unsigned __n) { return __n; }
  inline constexpr long
  __size_to_integer(long __n) { return __n; }
  inline constexpr unsigned long
  __size_to_integer(unsigned long __n) { return __n; }
  inline constexpr long long
  __size_to_integer(long long __n) { return __n; }
  inline constexpr unsigned long long
  __size_to_integer(unsigned long long __n) { return __n; }


  __extension__ inline constexpr __int128
  __size_to_integer(__int128 __n) { return __n; }
  __extension__ inline constexpr unsigned __int128
  __size_to_integer(unsigned __int128 __n) { return __n; }
# 1071 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  inline constexpr long long
  __size_to_integer(float __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(double __n) { return (long long)__n; }
  inline constexpr long long
  __size_to_integer(long double __n) { return (long long)__n; }

  __extension__ inline constexpr long long
  __size_to_integer(__float128 __n) { return (long long)__n; }


  template<typename _OutputIterator, typename _Size, typename _Tp>
    constexpr
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a1(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      for (; __n > 0; --__n, (void) ++__first)
 *__first = __value;
      return __first;
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    constexpr
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a1(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __n > 0; --__n, (void) ++__first)
 *__first = __tmp;
      return __first;
    }

  template<typename _Ite, typename _Seq, typename _Cat, typename _Size,
    typename _Tp>
    constexpr
    ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>
    __fill_n_a(const ::__gnu_debug::_Safe_iterator<_Ite, _Seq, _Cat>& __first,
        _Size __n, const _Tp& __value,
        std::input_iterator_tag);

  template<typename _OutputIterator, typename _Size, typename _Tp>
    constexpr
    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::output_iterator_tag)
    {

      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");

      return __fill_n_a1(__first, __n, __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    constexpr
    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::input_iterator_tag)
    {

      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");

      return __fill_n_a1(__first, __n, __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    constexpr
    inline _OutputIterator
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value,
        std::random_access_iterator_tag)
    {

      static_assert(is_integral<_Size>{}, "fill_n must pass integral size");

      if (__n <= 0)
 return __first;

      ;

      std::__fill_a(__first, __first + __n, __value);
      return __first + __n;
    }
# 1172 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _OI, typename _Size, typename _Tp>
    constexpr
    inline _OI
    fill_n(_OI __first, _Size __n, const _Tp& __value)
    {

     

      return std::__fill_n_a(__first, std::__size_to_integer(__n), __value,
          std::__iterator_category(__first));
    }

  template<bool _BoolType>
    struct __equal
    {
      template<typename _II1, typename _II2>
 constexpr
 static bool
 equal(_II1 __first1, _II1 __last1, _II2 __first2)
 {
   for (; __first1 != __last1; ++__first1, (void) ++__first2)
     if (!(*__first1 == *__first2))
       return false;
   return true;
 }
    };

  template<>
    struct __equal<true>
    {
      template<typename _Tp>
 constexpr
 static bool
 equal(const _Tp* __first1, const _Tp* __last1, const _Tp* __first2)
 {
   if (const size_t __len = (__last1 - __first1))
     return !std::__memcmp(__first1, __first2, __len);
   return true;
 }
    };

  template<typename _Tp, typename _Ref, typename _Ptr, typename _II>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value, bool>::__type
    __equal_aux1(std::_Deque_iterator<_Tp, _Ref, _Ptr>,
   std::_Deque_iterator<_Tp, _Ref, _Ptr>,
   _II);

  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __equal_aux1(std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
   std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
   std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);

  template<typename _II, typename _Tp, typename _Ref, typename _Ptr>
    typename __gnu_cxx::__enable_if<
      __is_random_access_iter<_II>::__value, bool>::__type
    __equal_aux1(_II, _II,
  std::_Deque_iterator<_Tp, _Ref, _Ptr>);

  template<typename _II1, typename _II2>
    constexpr
    inline bool
    __equal_aux1(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      const bool __simple = ((__is_integer<_ValueType1>::__value
         || __is_pointer<_ValueType1>::__value)
        && __memcmpable<_II1, _II2>::__value);
      return std::__equal<__simple>::equal(__first1, __last1, __first2);
    }

  template<typename _II1, typename _II2>
    constexpr
    inline bool
    __equal_aux(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      return std::__equal_aux1(std::__niter_base(__first1),
          std::__niter_base(__last1),
          std::__niter_base(__first2));
    }

  template<typename _II1, typename _Seq1, typename _Cat1, typename _II2>
    constexpr
    bool
    __equal_aux(const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  _II2);

  template<typename _II1, typename _II2, typename _Seq2, typename _Cat2>
    constexpr
    bool
    __equal_aux(_II1, _II1,
  const ::__gnu_debug::_Safe_iterator<_II2, _Seq2, _Cat2>&);

  template<typename _II1, typename _Seq1, typename _Cat1,
    typename _II2, typename _Seq2, typename _Cat2>
    constexpr
    bool
    __equal_aux(const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_II2, _Seq2, _Cat2>&);

  template<typename, typename>
    struct __lc_rai
    {
      template<typename _II1, typename _II2>
 constexpr
 static _II1
 __newlast1(_II1, _II1 __last1, _II2, _II2)
 { return __last1; }

      template<typename _II>
 constexpr
 static bool
 __cnd2(_II __first, _II __last)
 { return __first != __last; }
    };

  template<>
    struct __lc_rai<random_access_iterator_tag, random_access_iterator_tag>
    {
      template<typename _RAI1, typename _RAI2>
 constexpr
 static _RAI1
 __newlast1(_RAI1 __first1, _RAI1 __last1,
     _RAI2 __first2, _RAI2 __last2)
 {
   const typename iterator_traits<_RAI1>::difference_type
     __diff1 = __last1 - __first1;
   const typename iterator_traits<_RAI2>::difference_type
     __diff2 = __last2 - __first2;
   return __diff2 < __diff1 ? __first1 + __diff2 : __last1;
 }

      template<typename _RAI>
 static constexpr bool
 __cnd2(_RAI, _RAI)
 { return true; }
    };

  template<typename _II1, typename _II2, typename _Compare>
    constexpr
    bool
    __lexicographical_compare_impl(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2,
       _Compare __comp)
    {
      typedef typename iterator_traits<_II1>::iterator_category _Category1;
      typedef typename iterator_traits<_II2>::iterator_category _Category2;
      typedef std::__lc_rai<_Category1, _Category2> __rai_type;

      __last1 = __rai_type::__newlast1(__first1, __last1, __first2, __last2);
      for (; __first1 != __last1 && __rai_type::__cnd2(__first2, __last2);
    ++__first1, (void)++__first2)
 {
   if (__comp(__first1, __first2))
     return true;
   if (__comp(__first2, __first1))
     return false;
 }
      return __first1 == __last1 && __first2 != __last2;
    }

  template<bool _BoolType>
    struct __lexicographical_compare
    {
      template<typename _II1, typename _II2>
 constexpr
 static bool
 __lc(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
 {
   using __gnu_cxx::__ops::__iter_less_iter;
   return std::__lexicographical_compare_impl(__first1, __last1,
           __first2, __last2,
           __iter_less_iter());
 }

      template<typename _II1, typename _II2>
 constexpr
 static int
 __3way(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
 {
   while (__first1 != __last1)
     {
       if (__first2 == __last2)
  return +1;
       if (*__first1 < *__first2)
  return -1;
       if (*__first2 < *__first1)
  return +1;
       ++__first1;
       ++__first2;
     }
   return int(__first2 == __last2) - 1;
 }
    };

  template<>
    struct __lexicographical_compare<true>
    {
      template<typename _Tp, typename _Up>
 constexpr
 static bool
 __lc(const _Tp* __first1, const _Tp* __last1,
      const _Up* __first2, const _Up* __last2)
 { return __3way(__first1, __last1, __first2, __last2) < 0; }

      template<typename _Tp, typename _Up>
 constexpr
 static ptrdiff_t
 __3way(const _Tp* __first1, const _Tp* __last1,
        const _Up* __first2, const _Up* __last2)
 {
   const size_t __len1 = __last1 - __first1;
   const size_t __len2 = __last2 - __first2;
   if (const size_t __len = std::min(__len1, __len2))
     if (int __result = std::__memcmp(__first1, __first2, __len))
       return __result;
   return ptrdiff_t(__len1 - __len2);
 }
    };

  template<typename _II1, typename _II2>
    constexpr
    inline bool
    __lexicographical_compare_aux1(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple =
 (__is_memcmp_ordered_with<_ValueType1, _ValueType2>::__value
  && __is_pointer<_II1>::__value
  && __is_pointer<_II2>::__value




  && !is_volatile_v<remove_reference_t<iter_reference_t<_II1>>>
  && !is_volatile_v<remove_reference_t<iter_reference_t<_II2>>>

  );

      return std::__lexicographical_compare<__simple>::__lc(__first1, __last1,
           __first2, __last2);
    }

  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2>
    bool
    __lexicographical_compare_aux1(
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 _Tp2*, _Tp2*);

  template<typename _Tp1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __lexicographical_compare_aux1(_Tp1*, _Tp1*,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);

  template<typename _Tp1, typename _Ref1, typename _Ptr1,
    typename _Tp2, typename _Ref2, typename _Ptr2>
    bool
    __lexicographical_compare_aux1(
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp1, _Ref1, _Ptr1>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>,
 std::_Deque_iterator<_Tp2, _Ref2, _Ptr2>);

  template<typename _II1, typename _II2>
    constexpr
    inline bool
    __lexicographical_compare_aux(_II1 __first1, _II1 __last1,
      _II2 __first2, _II2 __last2)
    {
      return std::__lexicographical_compare_aux1(std::__niter_base(__first1),
       std::__niter_base(__last1),
       std::__niter_base(__first2),
       std::__niter_base(__last2));
    }

  template<typename _Iter1, typename _Seq1, typename _Cat1,
    typename _II2>
    constexpr
    bool
    __lexicographical_compare_aux(
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  _II2, _II2);

  template<typename _II1,
    typename _Iter2, typename _Seq2, typename _Cat2>
    constexpr
    bool
    __lexicographical_compare_aux(
  _II1, _II1,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&);

  template<typename _Iter1, typename _Seq1, typename _Cat1,
    typename _Iter2, typename _Seq2, typename _Cat2>
    constexpr
    bool
    __lexicographical_compare_aux(
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter1, _Seq1, _Cat1>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&,
  const ::__gnu_debug::_Safe_iterator<_Iter2, _Seq2, _Cat2>&);

  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    constexpr
    _ForwardIterator
    __lower_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else
     __len = __half;
 }
      return __first;
    }
# 1524 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    [[__nodiscard__]] constexpr
    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {

     
     

      ;

      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val());
    }



  template<typename _Tp>
    inline constexpr _Tp
    __lg(_Tp __n)
    {

      return std::__bit_width(make_unsigned_t<_Tp>(__n)) - 1;
# 1557 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
    }


# 1573 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    [[__nodiscard__]] constexpr
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2)
    {

     
     
     


      ;

      return std::__equal_aux(__first1, __last1, __first2);
    }
# 1604 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    [[__nodiscard__]] constexpr
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return true;
    }



  template<typename _II1, typename _II2>
    constexpr
    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2);
 }

      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!(*__first1 == *__first2))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }


  template<typename _II1, typename _II2, typename _BinaryPredicate>
    constexpr
    inline bool
    __equal4(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2,
      _BinaryPredicate __binary_pred)
    {
      using _RATag = random_access_iterator_tag;
      using _Cat1 = typename iterator_traits<_II1>::iterator_category;
      using _Cat2 = typename iterator_traits<_II2>::iterator_category;
      using _RAIters = __and_<is_same<_Cat1, _RATag>, is_same<_Cat2, _RATag>>;
      if (_RAIters())
 {
   auto __d1 = std::distance(__first1, __last1);
   auto __d2 = std::distance(__first2, __last2);
   if (__d1 != __d2)
     return false;
   return std::equal(__first1, __last1, __first2,
           __binary_pred);
 }

      for (; __first1 != __last1 && __first2 != __last2;
   ++__first1, (void)++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return __first1 == __last1 && __first2 == __last2;
    }
# 1691 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    [[__nodiscard__]] constexpr
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
    {

     
     
     


      ;
      ;

      return std::__equal4(__first1, __last1, __first2, __last2);
    }
# 1724 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    [[__nodiscard__]] constexpr
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _IIter2 __last2, _BinaryPredicate __binary_pred)
    {

     
     
      ;
      ;

      return std::__equal4(__first1, __last1, __first2, __last2,
          __binary_pred);
    }
# 1756 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    [[__nodiscard__]] constexpr
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {





     
     
     
     
      ;
      ;

      return std::__lexicographical_compare_aux(__first1, __last1,
      __first2, __last2);
    }
# 1791 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2, typename _Compare>
    [[__nodiscard__]] constexpr
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2, _Compare __comp)
    {

     
     
      ;
      ;

      return std::__lexicographical_compare_impl
 (__first1, __last1, __first2, __last2,
  __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }





  template<typename _Iter1, typename _Iter2>
    concept __memcmp_ordered_with
      = (__is_memcmp_ordered_with<iter_value_t<_Iter1>,
      iter_value_t<_Iter2>>::__value)
   && contiguous_iterator<_Iter1> && contiguous_iterator<_Iter2>;



  template<typename _Tp>
    constexpr auto
    __min_cmp(_Tp __x, _Tp __y)
    {
      struct _Res {
 _Tp _M_min;
 decltype(__x <=> __y) _M_cmp;
      };
      auto __c = __x <=> __y;
      if (__c > 0)
 return _Res{__y, __c};
      return _Res{__x, __c};
    }
# 1845 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _InputIter1, typename _InputIter2, typename _Comp>
    [[nodiscard]] constexpr auto
    lexicographical_compare_three_way(_InputIter1 __first1,
          _InputIter1 __last1,
          _InputIter2 __first2,
          _InputIter2 __last2,
          _Comp __comp)
    -> decltype(__comp(*__first1, *__first2))
    {

     
     
      ;
      ;

      using _Cat = decltype(__comp(*__first1, *__first2));
      static_assert(same_as<common_comparison_category_t<_Cat>, _Cat>);

      if (!std::__is_constant_evaluated())
 if constexpr (same_as<_Comp, __detail::_Synth3way>
        || same_as<_Comp, compare_three_way>)
   if constexpr (__memcmp_ordered_with<_InputIter1, _InputIter2>)
     {
       const auto [__len, __lencmp] = std::
  __min_cmp(__last1 - __first1, __last2 - __first2);
       if (__len)
  {
    const auto __blen = __len * sizeof(*__first1);
    const auto __c
      = __builtin_memcmp(&*__first1, &*__first2, __blen) <=> 0;
    if (__c != 0)
      return __c;
  }
       return __lencmp;
     }

      while (__first1 != __last1)
 {
   if (__first2 == __last2)
     return strong_ordering::greater;
   if (auto __cmp = __comp(*__first1, *__first2); __cmp != 0)
     return __cmp;
   ++__first1;
   ++__first2;
 }
      return (__first2 == __last2) <=> true;
    }

  template<typename _InputIter1, typename _InputIter2>
    constexpr auto
    lexicographical_compare_three_way(_InputIter1 __first1,
          _InputIter1 __last1,
          _InputIter2 __first2,
          _InputIter2 __last2)
    {
      return std::
 lexicographical_compare_three_way(__first1, __last1, __first2, __last2,
       compare_three_way{});
    }


  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    constexpr
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 1934 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    [[__nodiscard__]] constexpr
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2)
    {

     
     
     


      ;

      return std::__mismatch(__first1, __last1, __first2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1968 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    [[__nodiscard__]] constexpr
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      return std::__mismatch(__first1, __last1, __first2,
 __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }


  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    constexpr
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _InputIterator2 __last2,
        _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __first2 != __last2
      && __binary_pred(__first1, __first2))
 {
   ++__first1;
   ++__first2;
 }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 2016 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    [[__nodiscard__]] constexpr
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2)
    {

     
     
     


      ;
      ;

      return std::__mismatch(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 2052 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    [[__nodiscard__]] constexpr
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2,
      _BinaryPredicate __binary_pred)
    {

     
     
      ;
      ;

      return std::__mismatch(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }





  template<typename _InputIterator, typename _Predicate>
    constexpr
    inline _InputIterator
    __find_if(_InputIterator __first, _InputIterator __last,
       _Predicate __pred, input_iterator_tag)
    {
      while (__first != __last && !__pred(__first))
 ++__first;
      return __first;
    }


  template<typename _RandomAccessIterator, typename _Predicate>
    constexpr
    _RandomAccessIterator
    __find_if(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Predicate __pred, random_access_iterator_tag)
    {
      typename iterator_traits<_RandomAccessIterator>::difference_type
 __trip_count = (__last - __first) >> 2;

      for (; __trip_count > 0; --__trip_count)
 {
   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;
 }

      switch (__last - __first)
 {
 case 3:
   if (__pred(__first))
     return __first;
   ++__first;

 case 2:
   if (__pred(__first))
     return __first;
   ++__first;

 case 1:
   if (__pred(__first))
     return __first;
   ++__first;

 case 0:
 default:
   return __last;
 }
    }

  template<typename _Iterator, typename _Predicate>
    constexpr
    inline _Iterator
    __find_if(_Iterator __first, _Iterator __last, _Predicate __pred)
    {
      return __find_if(__first, __last, __pred,
         std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Predicate>
    constexpr
    typename iterator_traits<_InputIterator>::difference_type
    __count_if(_InputIterator __first, _InputIterator __last, _Predicate __pred)
    {
      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      for (; __first != __last; ++__first)
 if (__pred(__first))
   ++__n;
      return __n;
    }

  template<typename _ForwardIterator, typename _Predicate>
    constexpr
    _ForwardIterator
    __remove_if(_ForwardIterator __first, _ForwardIterator __last,
  _Predicate __pred)
    {
      __first = std::__find_if(__first, __last, __pred);
      if (__first == __last)
 return __first;
      _ForwardIterator __result = __first;
      ++__first;
      for (; __first != __last; ++__first)
 if (!__pred(__first))
   {
     *__result = std::move(*__first);
     ++__result;
   }
      return __result;
    }

  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    constexpr
    _ForwardIterator1
    __search(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
      _ForwardIterator2 __first2, _ForwardIterator2 __last2,
      _BinaryPredicate __predicate)
    {

      if (__first1 == __last1 || __first2 == __last2)
 return __first1;


      _ForwardIterator2 __p1(__first2);
      if (++__p1 == __last2)
 return std::__find_if(__first1, __last1,
  __gnu_cxx::__ops::__iter_comp_iter(__predicate, __first2));


      _ForwardIterator1 __current = __first1;

      for (;;)
 {
   __first1 =
     std::__find_if(__first1, __last1,
  __gnu_cxx::__ops::__iter_comp_iter(__predicate, __first2));

   if (__first1 == __last1)
     return __last1;

   _ForwardIterator2 __p = __p1;
   __current = __first1;
   if (++__current == __last1)
     return __last1;

   while (__predicate(__current, __p))
     {
       if (++__p == __last2)
  return __first1;
       if (++__current == __last1)
  return __last1;
     }
   ++__first1;
 }
      return __first1;
    }


  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    constexpr
    bool
    __is_permutation(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
       _ForwardIterator2 __first2, _BinaryPredicate __pred)
    {


      for (; __first1 != __last1; ++__first1, (void)++__first2)
 if (!__pred(__first1, __first2))
   break;

      if (__first1 == __last1)
 return true;



      _ForwardIterator2 __last2 = __first2;
      std::advance(__last2, std::distance(__first1, __last1));
      for (_ForwardIterator1 __scan = __first1; __scan != __last1; ++__scan)
 {
   if (__scan != std::__find_if(__first1, __scan,
     __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan)))
     continue;

   auto __matches
     = std::__count_if(__first2, __last2,
   __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan));
   if (0 == __matches ||
       std::__count_if(__scan, __last1,
   __gnu_cxx::__ops::__iter_comp_iter(__pred, __scan))
       != __matches)
     return false;
 }
      return true;
    }
# 2276 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    constexpr
    inline bool
    is_permutation(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
     _ForwardIterator2 __first2)
    {

     
     
     


      ;

      return std::__is_permutation(__first1, __last1, __first2,
       __gnu_cxx::__ops::__iter_equal_to_iter());
    }



# 2318 "C:/msys64/ucrt64/include/c++/14.2.0/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    constexpr
    inline _ForwardIterator1
    search(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
    _ForwardIterator2 __first2, _ForwardIterator2 __last2,
    _BinaryPredicate __predicate)
    {

     
     
     


      ;
      ;

      return std::__search(__first1, __last1, __first2, __last2,
      __gnu_cxx::__ops::__iter_comp_iter(__predicate));
    }



}
# 44 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 1 3
# 40 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
       
# 41 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
# 158 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
namespace std
{







  enum float_round_style
  {
    round_indeterminate = -1,
    round_toward_zero = 0,
    round_to_nearest = 1,
    round_toward_infinity = 2,
    round_toward_neg_infinity = 3
  };







  enum float_denorm_style
  {

    denorm_indeterminate = -1,

    denorm_absent = 0,

    denorm_present = 1
  };
# 202 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
  struct __numeric_limits_base
  {


    static constexpr bool is_specialized = false;




    static constexpr int digits = 0;


    static constexpr int digits10 = 0;




    static constexpr int max_digits10 = 0;



    static constexpr bool is_signed = false;


    static constexpr bool is_integer = false;




    static constexpr bool is_exact = false;



    static constexpr int radix = 0;



    static constexpr int min_exponent = 0;



    static constexpr int min_exponent10 = 0;




    static constexpr int max_exponent = 0;



    static constexpr int max_exponent10 = 0;


    static constexpr bool has_infinity = false;



    static constexpr bool has_quiet_NaN = false;



    static constexpr bool has_signaling_NaN = false;


    static constexpr float_denorm_style has_denorm = denorm_absent;



    static constexpr bool has_denorm_loss = false;



    static constexpr bool is_iec559 = false;




    static constexpr bool is_bounded = false;
# 288 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
    static constexpr bool is_modulo = false;


    static constexpr bool traps = false;


    static constexpr bool tinyness_before = false;




    static constexpr float_round_style round_style =
          round_toward_zero;
  };
# 311 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
  template<typename _Tp>
    struct numeric_limits : public __numeric_limits_base
    {


      static constexpr _Tp
      min() noexcept { return _Tp(); }


      static constexpr _Tp
      max() noexcept { return _Tp(); }




      static constexpr _Tp
      lowest() noexcept { return _Tp(); }




      static constexpr _Tp
      epsilon() noexcept { return _Tp(); }


      static constexpr _Tp
      round_error() noexcept { return _Tp(); }


      static constexpr _Tp
      infinity() noexcept { return _Tp(); }



      static constexpr _Tp
      quiet_NaN() noexcept { return _Tp(); }



      static constexpr _Tp
      signaling_NaN() noexcept { return _Tp(); }




      static constexpr _Tp
      denorm_min() noexcept { return _Tp(); }
    };




  template<typename _Tp>
    struct numeric_limits<const _Tp>
    : public numeric_limits<_Tp> { };

  template<typename _Tp>
    struct numeric_limits<volatile _Tp>
    : public numeric_limits<_Tp> { };

  template<typename _Tp>
    struct numeric_limits<const volatile _Tp>
    : public numeric_limits<_Tp> { };
# 383 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
  template<>
    struct numeric_limits<bool>
    {
      static constexpr bool is_specialized = true;

      static constexpr bool
      min() noexcept { return false; }

      static constexpr bool
      max() noexcept { return true; }


      static constexpr bool
      lowest() noexcept { return min(); }

      static constexpr int digits = 1;
      static constexpr int digits10 = 0;

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr bool
      epsilon() noexcept { return false; }

      static constexpr bool
      round_error() noexcept { return false; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr bool
      infinity() noexcept { return false; }

      static constexpr bool
      quiet_NaN() noexcept { return false; }

      static constexpr bool
      signaling_NaN() noexcept { return false; }

      static constexpr bool
      denorm_min() noexcept { return false; }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;




      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<char>
    {
      static constexpr bool is_specialized = true;

      static constexpr char
      min() noexcept { return (((char)(-1) < 0) ? -(((char)(-1) < 0) ? (((((char)1 << ((sizeof(char) * 8 - ((char)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char)0) - 1 : (char)0); }

      static constexpr char
      max() noexcept { return (((char)(-1) < 0) ? (((((char)1 << ((sizeof(char) * 8 - ((char)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char)0); }


      static constexpr char
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(char) * 8 - ((char)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char) * 8 - ((char)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = ((char)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char
      epsilon() noexcept { return 0; }

      static constexpr char
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr
      char infinity() noexcept { return char(); }

      static constexpr char
      quiet_NaN() noexcept { return char(); }

      static constexpr char
      signaling_NaN() noexcept { return char(); }

      static constexpr char
      denorm_min() noexcept { return static_cast<char>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<signed char>
    {
      static constexpr bool is_specialized = true;

      static constexpr signed char
      min() noexcept { return -0x7f - 1; }

      static constexpr signed char
      max() noexcept { return 0x7f; }


      static constexpr signed char
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(signed char) * 8 - ((signed char)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(signed char) * 8 - ((signed char)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr signed char
      epsilon() noexcept { return 0; }

      static constexpr signed char
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr signed char
      infinity() noexcept { return static_cast<signed char>(0); }

      static constexpr signed char
      quiet_NaN() noexcept { return static_cast<signed char>(0); }

      static constexpr signed char
      signaling_NaN() noexcept
      { return static_cast<signed char>(0); }

      static constexpr signed char
      denorm_min() noexcept
      { return static_cast<signed char>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned char>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned char
      min() noexcept { return 0; }

      static constexpr unsigned char
      max() noexcept { return 0x7f * 2U + 1; }


      static constexpr unsigned char
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned char) * 8 - ((unsigned char)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned char) * 8 - ((unsigned char)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned char
      epsilon() noexcept { return 0; }

      static constexpr unsigned char
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned char
      infinity() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr unsigned char
      quiet_NaN() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr unsigned char
      signaling_NaN() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr unsigned char
      denorm_min() noexcept
      { return static_cast<unsigned char>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<wchar_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr wchar_t
      min() noexcept { return (((wchar_t)(-1) < 0) ? -(((wchar_t)(-1) < 0) ? (((((wchar_t)1 << ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(wchar_t)0) - 1 : (wchar_t)0); }

      static constexpr wchar_t
      max() noexcept { return (((wchar_t)(-1) < 0) ? (((((wchar_t)1 << ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(wchar_t)0); }


      static constexpr wchar_t
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = ((wchar_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr wchar_t
      epsilon() noexcept { return 0; }

      static constexpr wchar_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr wchar_t
      infinity() noexcept { return wchar_t(); }

      static constexpr wchar_t
      quiet_NaN() noexcept { return wchar_t(); }

      static constexpr wchar_t
      signaling_NaN() noexcept { return wchar_t(); }

      static constexpr wchar_t
      denorm_min() noexcept { return wchar_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };



  template<>
    struct numeric_limits<char8_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr char8_t
      min() noexcept { return (((char8_t)(-1) < 0) ? -(((char8_t)(-1) < 0) ? (((((char8_t)1 << ((sizeof(char8_t) * 8 - ((char8_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char8_t)0) - 1 : (char8_t)0); }

      static constexpr char8_t
      max() noexcept { return (((char8_t)(-1) < 0) ? (((((char8_t)1 << ((sizeof(char8_t) * 8 - ((char8_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char8_t)0); }

      static constexpr char8_t
      lowest() noexcept { return min(); }

      static constexpr int digits = (sizeof(char8_t) * 8 - ((char8_t)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char8_t) * 8 - ((char8_t)(-1) < 0)) * 643L / 2136);
      static constexpr int max_digits10 = 0;
      static constexpr bool is_signed = ((char8_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char8_t
      epsilon() noexcept { return 0; }

      static constexpr char8_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
 = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr char8_t
      infinity() noexcept { return char8_t(); }

      static constexpr char8_t
      quiet_NaN() noexcept { return char8_t(); }

      static constexpr char8_t
      signaling_NaN() noexcept { return char8_t(); }

      static constexpr char8_t
      denorm_min() noexcept { return char8_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
 = round_toward_zero;
    };




  template<>
    struct numeric_limits<char16_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr char16_t
      min() noexcept { return (((char16_t)(-1) < 0) ? -(((char16_t)(-1) < 0) ? (((((char16_t)1 << ((sizeof(char16_t) * 8 - ((char16_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char16_t)0) - 1 : (char16_t)0); }

      static constexpr char16_t
      max() noexcept { return (((char16_t)(-1) < 0) ? (((((char16_t)1 << ((sizeof(char16_t) * 8 - ((char16_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char16_t)0); }

      static constexpr char16_t
      lowest() noexcept { return min(); }

      static constexpr int digits = (sizeof(char16_t) * 8 - ((char16_t)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char16_t) * 8 - ((char16_t)(-1) < 0)) * 643L / 2136);
      static constexpr int max_digits10 = 0;
      static constexpr bool is_signed = ((char16_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char16_t
      epsilon() noexcept { return 0; }

      static constexpr char16_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr char16_t
      infinity() noexcept { return char16_t(); }

      static constexpr char16_t
      quiet_NaN() noexcept { return char16_t(); }

      static constexpr char16_t
      signaling_NaN() noexcept { return char16_t(); }

      static constexpr char16_t
      denorm_min() noexcept { return char16_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style = round_toward_zero;
    };


  template<>
    struct numeric_limits<char32_t>
    {
      static constexpr bool is_specialized = true;

      static constexpr char32_t
      min() noexcept { return (((char32_t)(-1) < 0) ? -(((char32_t)(-1) < 0) ? (((((char32_t)1 << ((sizeof(char32_t) * 8 - ((char32_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char32_t)0) - 1 : (char32_t)0); }

      static constexpr char32_t
      max() noexcept { return (((char32_t)(-1) < 0) ? (((((char32_t)1 << ((sizeof(char32_t) * 8 - ((char32_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char32_t)0); }

      static constexpr char32_t
      lowest() noexcept { return min(); }

      static constexpr int digits = (sizeof(char32_t) * 8 - ((char32_t)(-1) < 0));
      static constexpr int digits10 = ((sizeof(char32_t) * 8 - ((char32_t)(-1) < 0)) * 643L / 2136);
      static constexpr int max_digits10 = 0;
      static constexpr bool is_signed = ((char32_t)(-1) < 0);
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr char32_t
      epsilon() noexcept { return 0; }

      static constexpr char32_t
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr char32_t
      infinity() noexcept { return char32_t(); }

      static constexpr char32_t
      quiet_NaN() noexcept { return char32_t(); }

      static constexpr char32_t
      signaling_NaN() noexcept { return char32_t(); }

      static constexpr char32_t
      denorm_min() noexcept { return char32_t(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = !is_signed;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style = round_toward_zero;
    };



  template<>
    struct numeric_limits<short>
    {
      static constexpr bool is_specialized = true;

      static constexpr short
      min() noexcept { return -0x7fff - 1; }

      static constexpr short
      max() noexcept { return 0x7fff; }


      static constexpr short
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(short) * 8 - ((short)(-1) < 0));
      static constexpr int digits10 = ((sizeof(short) * 8 - ((short)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr short
      epsilon() noexcept { return 0; }

      static constexpr short
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr short
      infinity() noexcept { return short(); }

      static constexpr short
      quiet_NaN() noexcept { return short(); }

      static constexpr short
      signaling_NaN() noexcept { return short(); }

      static constexpr short
      denorm_min() noexcept { return short(); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned short>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned short
      min() noexcept { return 0; }

      static constexpr unsigned short
      max() noexcept { return 0x7fff * 2U + 1; }


      static constexpr unsigned short
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned short) * 8 - ((unsigned short)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned short) * 8 - ((unsigned short)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned short
      epsilon() noexcept { return 0; }

      static constexpr unsigned short
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned short
      infinity() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr unsigned short
      quiet_NaN() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr unsigned short
      signaling_NaN() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr unsigned short
      denorm_min() noexcept
      { return static_cast<unsigned short>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<int>
    {
      static constexpr bool is_specialized = true;

      static constexpr int
      min() noexcept { return -0x7fffffff - 1; }

      static constexpr int
      max() noexcept { return 0x7fffffff; }


      static constexpr int
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(int) * 8 - ((int)(-1) < 0));
      static constexpr int digits10 = ((sizeof(int) * 8 - ((int)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr int
      epsilon() noexcept { return 0; }

      static constexpr int
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr int
      infinity() noexcept { return static_cast<int>(0); }

      static constexpr int
      quiet_NaN() noexcept { return static_cast<int>(0); }

      static constexpr int
      signaling_NaN() noexcept { return static_cast<int>(0); }

      static constexpr int
      denorm_min() noexcept { return static_cast<int>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned int>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned int
      min() noexcept { return 0; }

      static constexpr unsigned int
      max() noexcept { return 0x7fffffff * 2U + 1; }


      static constexpr unsigned int
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned int) * 8 - ((unsigned int)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned int) * 8 - ((unsigned int)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned int
      epsilon() noexcept { return 0; }

      static constexpr unsigned int
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned int
      infinity() noexcept { return static_cast<unsigned int>(0); }

      static constexpr unsigned int
      quiet_NaN() noexcept
      { return static_cast<unsigned int>(0); }

      static constexpr unsigned int
      signaling_NaN() noexcept
      { return static_cast<unsigned int>(0); }

      static constexpr unsigned int
      denorm_min() noexcept
      { return static_cast<unsigned int>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<long>
    {
      static constexpr bool is_specialized = true;

      static constexpr long
      min() noexcept { return -0x7fffffffL - 1; }

      static constexpr long
      max() noexcept { return 0x7fffffffL; }


      static constexpr long
      lowest() noexcept { return min(); }


      static constexpr int digits = (sizeof(long) * 8 - ((long)(-1) < 0));
      static constexpr int digits10 = ((sizeof(long) * 8 - ((long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr long
      epsilon() noexcept { return 0; }

      static constexpr long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr long
      infinity() noexcept { return static_cast<long>(0); }

      static constexpr long
      quiet_NaN() noexcept { return static_cast<long>(0); }

      static constexpr long
      signaling_NaN() noexcept { return static_cast<long>(0); }

      static constexpr long
      denorm_min() noexcept { return static_cast<long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned long>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned long
      min() noexcept { return 0; }

      static constexpr unsigned long
      max() noexcept { return 0x7fffffffL * 2UL + 1; }


      static constexpr unsigned long
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned long) * 8 - ((unsigned long)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned long) * 8 - ((unsigned long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned long
      epsilon() noexcept { return 0; }

      static constexpr unsigned long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned long
      infinity() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr unsigned long
      quiet_NaN() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr unsigned long
      signaling_NaN() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr unsigned long
      denorm_min() noexcept
      { return static_cast<unsigned long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<long long>
    {
      static constexpr bool is_specialized = true;

      static constexpr long long
      min() noexcept { return -0x7fffffffffffffffLL - 1; }

      static constexpr long long
      max() noexcept { return 0x7fffffffffffffffLL; }


      static constexpr long long
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(long long) * 8 - ((long long)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(long long) * 8 - ((long long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr long long
      epsilon() noexcept { return 0; }

      static constexpr long long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr long long
      infinity() noexcept { return static_cast<long long>(0); }

      static constexpr long long
      quiet_NaN() noexcept { return static_cast<long long>(0); }

      static constexpr long long
      signaling_NaN() noexcept
      { return static_cast<long long>(0); }

      static constexpr long long
      denorm_min() noexcept { return static_cast<long long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned long long>
    {
      static constexpr bool is_specialized = true;

      static constexpr unsigned long long
      min() noexcept { return 0; }

      static constexpr unsigned long long
      max() noexcept { return 0x7fffffffffffffffLL * 2ULL + 1; }


      static constexpr unsigned long long
      lowest() noexcept { return min(); }


      static constexpr int digits
       = (sizeof(unsigned long long) * 8 - ((unsigned long long)(-1) < 0));
      static constexpr int digits10
       = ((sizeof(unsigned long long) * 8 - ((unsigned long long)(-1) < 0)) * 643L / 2136);

      static constexpr int max_digits10 = 0;

      static constexpr bool is_signed = false;
      static constexpr bool is_integer = true;
      static constexpr bool is_exact = true;
      static constexpr int radix = 2;

      static constexpr unsigned long long
      epsilon() noexcept { return 0; }

      static constexpr unsigned long long
      round_error() noexcept { return 0; }

      static constexpr int min_exponent = 0;
      static constexpr int min_exponent10 = 0;
      static constexpr int max_exponent = 0;
      static constexpr int max_exponent10 = 0;

      static constexpr bool has_infinity = false;
      static constexpr bool has_quiet_NaN = false;
      static constexpr bool has_signaling_NaN = false;
      static constexpr float_denorm_style has_denorm
       = denorm_absent;
      static constexpr bool has_denorm_loss = false;

      static constexpr unsigned long long
      infinity() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr unsigned long long
      quiet_NaN() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr unsigned long long
      signaling_NaN() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr unsigned long long
      denorm_min() noexcept
      { return static_cast<unsigned long long>(0); }

      static constexpr bool is_iec559 = false;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = true;

      static constexpr bool traps = true;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
       = round_toward_zero;
    };
# 1637 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
  __extension__ template<> struct numeric_limits<__int128> { static constexpr bool is_specialized = true; static constexpr __int128 min() noexcept { return (((__int128)(-1) < 0) ? -(((__int128)(-1) < 0) ? (((((__int128)1 << ((128 - ((__int128)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(__int128)0) - 1 : (__int128)0); } static constexpr __int128 max() noexcept { return (((__int128)(-1) < 0) ? (((((__int128)1 << ((128 - ((__int128)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(__int128)0); } static constexpr int digits = 128 - 1; static constexpr int digits10 = (128 - 1) * 643L / 2136; static constexpr bool is_signed = true; static constexpr bool is_integer = true; static constexpr bool is_exact = true; static constexpr int radix = 2; static constexpr __int128 epsilon() noexcept { return 0; } static constexpr __int128 round_error() noexcept { return 0; } static constexpr __int128 lowest() noexcept { return min(); } static constexpr int max_digits10 = 0; static constexpr int min_exponent = 0; static constexpr int min_exponent10 = 0; static constexpr int max_exponent = 0; static constexpr int max_exponent10 = 0; static constexpr bool has_infinity = false; static constexpr bool has_quiet_NaN = false; static constexpr bool has_signaling_NaN = false; static constexpr float_denorm_style has_denorm = denorm_absent; static constexpr bool has_denorm_loss = false; static constexpr __int128 infinity() noexcept { return static_cast<__int128>(0); } static constexpr __int128 quiet_NaN() noexcept { return static_cast<__int128>(0); } static constexpr __int128 signaling_NaN() noexcept { return static_cast<__int128>(0); } static constexpr __int128 denorm_min() noexcept { return static_cast<__int128>(0); } static constexpr bool is_iec559 = false; static constexpr bool is_bounded = true; static constexpr bool is_modulo = false; static constexpr bool traps = true; static constexpr bool tinyness_before = false; static constexpr float_round_style round_style = round_toward_zero; }; __extension__ template<> struct numeric_limits<unsigned __int128> { static constexpr bool is_specialized = true; static constexpr unsigned __int128 min() noexcept { return 0; } static constexpr unsigned __int128 max() noexcept { return (((unsigned __int128)(-1) < 0) ? (((((unsigned __int128)1 << ((128 - ((unsigned __int128)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(unsigned __int128)0); } static constexpr unsigned __int128 lowest() noexcept { return min(); } static constexpr int max_digits10 = 0; static constexpr int digits = 128; static constexpr int digits10 = 128 * 643L / 2136; static constexpr bool is_signed = false; static constexpr bool is_integer = true; static constexpr bool is_exact = true; static constexpr int radix = 2; static constexpr unsigned __int128 epsilon() noexcept { return 0; } static constexpr unsigned __int128 round_error() noexcept { return 0; } static constexpr int min_exponent = 0; static constexpr int min_exponent10 = 0; static constexpr int max_exponent = 0; static constexpr int max_exponent10 = 0; static constexpr bool has_infinity = false; static constexpr bool has_quiet_NaN = false; static constexpr bool has_signaling_NaN = false; static constexpr float_denorm_style has_denorm = denorm_absent; static constexpr bool has_denorm_loss = false; static constexpr unsigned __int128 infinity() noexcept { return static_cast<unsigned __int128>(0); } static constexpr unsigned __int128 quiet_NaN() noexcept { return static_cast<unsigned __int128>(0); } static constexpr unsigned __int128 signaling_NaN() noexcept { return static_cast<unsigned __int128>(0); } static constexpr unsigned __int128 denorm_min() noexcept { return static_cast<unsigned __int128>(0); } static constexpr bool is_iec559 = false; static constexpr bool is_bounded = true; static constexpr bool is_modulo = true; static constexpr bool traps = true; static constexpr bool tinyness_before = false; static constexpr float_round_style round_style = round_toward_zero; };
# 1669 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
  template<>
    struct numeric_limits<float>
    {
      static constexpr bool is_specialized = true;

      static constexpr float
      min() noexcept { return 1.17549435082228750796873653722224568e-38F; }

      static constexpr float
      max() noexcept { return 3.40282346638528859811704183484516925e+38F; }


      static constexpr float
      lowest() noexcept { return -3.40282346638528859811704183484516925e+38F; }


      static constexpr int digits = 24;
      static constexpr int digits10 = 6;

      static constexpr int max_digits10
  = (2 + (24) * 643L / 2136);

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr float
      epsilon() noexcept { return 1.19209289550781250000000000000000000e-7F; }

      static constexpr float
      round_error() noexcept { return 0.5F; }

      static constexpr int min_exponent = (-125);
      static constexpr int min_exponent10 = (-37);
      static constexpr int max_exponent = 128;
      static constexpr int max_exponent10 = 38;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;
      static constexpr bool has_signaling_NaN = has_quiet_NaN;
      static constexpr float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static constexpr bool has_denorm_loss
       = false;

      static constexpr float
      infinity() noexcept { return __builtin_huge_valf(); }

      static constexpr float
      quiet_NaN() noexcept { return __builtin_nanf(""); }

      static constexpr float
      signaling_NaN() noexcept { return __builtin_nansf(""); }

      static constexpr float
      denorm_min() noexcept { return 1.40129846432481707092372958328991613e-45F; }

      static constexpr bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before
       = false;
      static constexpr float_round_style round_style
       = round_to_nearest;
    };






  template<>
    struct numeric_limits<double>
    {
      static constexpr bool is_specialized = true;

      static constexpr double
      min() noexcept { return double(2.22507385850720138309023271733240406e-308L); }

      static constexpr double
      max() noexcept { return double(1.79769313486231570814527423731704357e+308L); }


      static constexpr double
      lowest() noexcept { return -double(1.79769313486231570814527423731704357e+308L); }


      static constexpr int digits = 53;
      static constexpr int digits10 = 15;

      static constexpr int max_digits10
  = (2 + (53) * 643L / 2136);

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr double
      epsilon() noexcept { return double(2.22044604925031308084726333618164062e-16L); }

      static constexpr double
      round_error() noexcept { return 0.5; }

      static constexpr int min_exponent = (-1021);
      static constexpr int min_exponent10 = (-307);
      static constexpr int max_exponent = 1024;
      static constexpr int max_exponent10 = 308;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;
      static constexpr bool has_signaling_NaN = has_quiet_NaN;
      static constexpr float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static constexpr bool has_denorm_loss
        = false;

      static constexpr double
      infinity() noexcept { return __builtin_huge_val(); }

      static constexpr double
      quiet_NaN() noexcept { return __builtin_nan(""); }

      static constexpr double
      signaling_NaN() noexcept { return __builtin_nans(""); }

      static constexpr double
      denorm_min() noexcept { return double(4.94065645841246544176568792868221372e-324L); }

      static constexpr bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before
       = false;
      static constexpr float_round_style round_style
       = round_to_nearest;
    };






  template<>
    struct numeric_limits<long double>
    {
      static constexpr bool is_specialized = true;

      static constexpr long double
      min() noexcept { return 3.36210314311209350626267781732175260e-4932L; }

      static constexpr long double
      max() noexcept { return 1.18973149535723176502126385303097021e+4932L; }


      static constexpr long double
      lowest() noexcept { return -1.18973149535723176502126385303097021e+4932L; }


      static constexpr int digits = 64;
      static constexpr int digits10 = 18;

      static constexpr int max_digits10
  = (2 + (64) * 643L / 2136);

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr long double
      epsilon() noexcept { return 1.08420217248550443400745280086994171e-19L; }

      static constexpr long double
      round_error() noexcept { return 0.5L; }

      static constexpr int min_exponent = (-16381);
      static constexpr int min_exponent10 = (-4931);
      static constexpr int max_exponent = 16384;
      static constexpr int max_exponent10 = 4932;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;
      static constexpr bool has_signaling_NaN = has_quiet_NaN;
      static constexpr float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static constexpr bool has_denorm_loss
 = false;

      static constexpr long double
      infinity() noexcept { return __builtin_huge_vall(); }

      static constexpr long double
      quiet_NaN() noexcept { return __builtin_nanl(""); }

      static constexpr long double
      signaling_NaN() noexcept { return __builtin_nansl(""); }

      static constexpr long double
      denorm_min() noexcept { return 3.64519953188247460252840593361941982e-4951L; }

      static constexpr bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before =
      false;
      static constexpr float_round_style round_style =
            round_to_nearest;
    };
# 1989 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
__extension__ template<> struct numeric_limits<_Float32> { static constexpr bool is_specialized = true; static constexpr _Float32 min() noexcept { return 1.17549435082228750796873653722224568e-38F32; } static constexpr _Float32 max() noexcept { return 3.40282346638528859811704183484516925e+38F32; } static constexpr _Float32 lowest() noexcept { return -3.40282346638528859811704183484516925e+38F32; } static constexpr int digits = 24; static constexpr int digits10 = 6; static constexpr int max_digits10 = (2 + (24) * 643L / 2136); static constexpr bool is_signed = true; static constexpr bool is_integer = false; static constexpr bool is_exact = false; static constexpr int radix = 2; static constexpr _Float32 epsilon() noexcept { return 1.19209289550781250000000000000000000e-7F32; } static constexpr _Float32 round_error() noexcept { return 0.5F32; } static constexpr int min_exponent = (-125); static constexpr int min_exponent10 = (-37); static constexpr int max_exponent = 128; static constexpr int max_exponent10 = 38; static constexpr bool has_infinity = 1; static constexpr bool has_quiet_NaN = 1; static constexpr bool has_signaling_NaN = has_quiet_NaN; static constexpr float_denorm_style has_denorm = bool(1) ? denorm_present : denorm_absent; static constexpr bool has_denorm_loss = false; static constexpr _Float32 infinity() noexcept { return __builtin_huge_valf32(); } static constexpr _Float32 quiet_NaN() noexcept { return __builtin_nanf32(""); } static constexpr _Float32 signaling_NaN() noexcept { return __builtin_nansf32(""); } static constexpr _Float32 denorm_min() noexcept { return 1.40129846432481707092372958328991613e-45F32; } static constexpr bool is_iec559 = has_infinity && has_quiet_NaN && has_denorm == denorm_present; static constexpr bool is_bounded = true; static constexpr bool is_modulo = false; static constexpr bool traps = false; static constexpr bool tinyness_before = false; static constexpr float_round_style round_style = round_to_nearest; };


__extension__ template<> struct numeric_limits<_Float64> { static constexpr bool is_specialized = true; static constexpr _Float64 min() noexcept { return 2.22507385850720138309023271733240406e-308F64; } static constexpr _Float64 max() noexcept { return 1.79769313486231570814527423731704357e+308F64; } static constexpr _Float64 lowest() noexcept { return -1.79769313486231570814527423731704357e+308F64; } static constexpr int digits = 53; static constexpr int digits10 = 15; static constexpr int max_digits10 = (2 + (53) * 643L / 2136); static constexpr bool is_signed = true; static constexpr bool is_integer = false; static constexpr bool is_exact = false; static constexpr int radix = 2; static constexpr _Float64 epsilon() noexcept { return 2.22044604925031308084726333618164062e-16F64; } static constexpr _Float64 round_error() noexcept { return 0.5F64; } static constexpr int min_exponent = (-1021); static constexpr int min_exponent10 = (-307); static constexpr int max_exponent = 1024; static constexpr int max_exponent10 = 308; static constexpr bool has_infinity = 1; static constexpr bool has_quiet_NaN = 1; static constexpr bool has_signaling_NaN = has_quiet_NaN; static constexpr float_denorm_style has_denorm = bool(1) ? denorm_present : denorm_absent; static constexpr bool has_denorm_loss = false; static constexpr _Float64 infinity() noexcept { return __builtin_huge_valf64(); } static constexpr _Float64 quiet_NaN() noexcept { return __builtin_nanf64(""); } static constexpr _Float64 signaling_NaN() noexcept { return __builtin_nansf64(""); } static constexpr _Float64 denorm_min() noexcept { return 4.94065645841246544176568792868221372e-324F64; } static constexpr bool is_iec559 = has_infinity && has_quiet_NaN && has_denorm == denorm_present; static constexpr bool is_bounded = true; static constexpr bool is_modulo = false; static constexpr bool traps = false; static constexpr bool tinyness_before = false; static constexpr float_round_style round_style = round_to_nearest; };


__extension__ template<> struct numeric_limits<_Float128> { static constexpr bool is_specialized = true; static constexpr _Float128 min() noexcept { return 3.36210314311209350626267781732175260e-4932F128; } static constexpr _Float128 max() noexcept { return 1.18973149535723176508575932662800702e+4932F128; } static constexpr _Float128 lowest() noexcept { return -1.18973149535723176508575932662800702e+4932F128; } static constexpr int digits = 113; static constexpr int digits10 = 33; static constexpr int max_digits10 = (2 + (113) * 643L / 2136); static constexpr bool is_signed = true; static constexpr bool is_integer = false; static constexpr bool is_exact = false; static constexpr int radix = 2; static constexpr _Float128 epsilon() noexcept { return 1.92592994438723585305597794258492732e-34F128; } static constexpr _Float128 round_error() noexcept { return 0.5F128; } static constexpr int min_exponent = (-16381); static constexpr int min_exponent10 = (-4931); static constexpr int max_exponent = 16384; static constexpr int max_exponent10 = 4932; static constexpr bool has_infinity = 1; static constexpr bool has_quiet_NaN = 1; static constexpr bool has_signaling_NaN = has_quiet_NaN; static constexpr float_denorm_style has_denorm = bool(1) ? denorm_present : denorm_absent; static constexpr bool has_denorm_loss = false; static constexpr _Float128 infinity() noexcept { return __builtin_huge_valf128(); } static constexpr _Float128 quiet_NaN() noexcept { return __builtin_nanf128(""); } static constexpr _Float128 signaling_NaN() noexcept { return __builtin_nansf128(""); } static constexpr _Float128 denorm_min() noexcept { return 6.47517511943802511092443895822764655e-4966F128; } static constexpr bool is_iec559 = has_infinity && has_quiet_NaN && has_denorm == denorm_present; static constexpr bool is_bounded = true; static constexpr bool is_modulo = false; static constexpr bool traps = false; static constexpr bool tinyness_before = false; static constexpr float_round_style round_style = round_to_nearest; };
# 2087 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
  __extension__
  template<>
    struct numeric_limits<__float128>
    {
      static constexpr bool is_specialized = true;

      static constexpr __float128
      min() noexcept
      {




 return __extension__ 0x1.0p-16382Q;

      }

      static constexpr __float128
      max() noexcept
      {







 return __extension__ 0x1.ffffffffffffffffffffffffffffp+16383Q;

      }

      static constexpr __float128
      lowest() noexcept
      { return -max(); }

      static constexpr int digits = 113;
      static constexpr int digits10 = 33;

      static constexpr int max_digits10 = 35;

      static constexpr bool is_signed = true;
      static constexpr bool is_integer = false;
      static constexpr bool is_exact = false;
      static constexpr int radix = 2;

      static constexpr __float128
      epsilon() noexcept
      { return double(1.9259299443872359e-34); }

      static constexpr __float128
      round_error() noexcept { return 0.5; }

      static constexpr int min_exponent = -16381;
      static constexpr int min_exponent10 = -4931;
      static constexpr int max_exponent = 16384;
      static constexpr int max_exponent10 = 4932;

      static constexpr bool has_infinity = 1;
      static constexpr bool has_quiet_NaN = 1;


      static constexpr bool has_signaling_NaN = true;



      static constexpr float_denorm_style has_denorm
 = denorm_present;
      static constexpr bool has_denorm_loss = false;

      static constexpr __float128
      infinity() noexcept
      { return __builtin_huge_val(); }

      static constexpr __float128
      quiet_NaN() noexcept
      { return __builtin_nan(""); }

      static constexpr __float128
      signaling_NaN() noexcept
      {

 return __builtin_nansq("");





      }

      static constexpr __float128
      denorm_min() noexcept
      {




 return __extension__ 0x1.0p-16494Q;

      }

      static constexpr bool is_iec559 = has_signaling_NaN;
      static constexpr bool is_bounded = true;
      static constexpr bool is_modulo = false;

      static constexpr bool traps = false;
      static constexpr bool tinyness_before = false;
      static constexpr float_round_style round_style
 = round_to_nearest;
# 2218 "C:/msys64/ucrt64/include/c++/14.2.0/limits" 3
    };




}
# 45 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3


# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 1 3
# 49 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/special_function_util.h" 1 3
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/special_function_util.h" 3
namespace std
{

# 50 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/special_function_util.h" 3
  namespace __detail
  {



    template<typename _Tp>
    struct __floating_point_constant
    {
      static const _Tp __value;
    };



    template<typename _Tp>
      struct __numeric_constants
      {

        static _Tp __pi() throw()
        { return static_cast<_Tp>(3.1415926535897932384626433832795029L); }

        static _Tp __pi_2() throw()
        { return static_cast<_Tp>(1.5707963267948966192313216916397514L); }

        static _Tp __pi_3() throw()
        { return static_cast<_Tp>(1.0471975511965977461542144610931676L); }

        static _Tp __pi_4() throw()
        { return static_cast<_Tp>(0.7853981633974483096156608458198757L); }

        static _Tp __1_pi() throw()
        { return static_cast<_Tp>(0.3183098861837906715377675267450287L); }

        static _Tp __2_sqrtpi() throw()
        { return static_cast<_Tp>(1.1283791670955125738961589031215452L); }

        static _Tp __sqrt2() throw()
        { return static_cast<_Tp>(1.4142135623730950488016887242096981L); }

        static _Tp __sqrt3() throw()
        { return static_cast<_Tp>(1.7320508075688772935274463415058723L); }

        static _Tp __sqrtpio2() throw()
        { return static_cast<_Tp>(1.2533141373155002512078826424055226L); }

        static _Tp __sqrt1_2() throw()
        { return static_cast<_Tp>(0.7071067811865475244008443621048490L); }

        static _Tp __lnpi() throw()
        { return static_cast<_Tp>(1.1447298858494001741434273513530587L); }

        static _Tp __gamma_e() throw()
        { return static_cast<_Tp>(0.5772156649015328606065120900824024L); }

        static _Tp __euler() throw()
        { return static_cast<_Tp>(2.7182818284590452353602874713526625L); }
      };
# 114 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/special_function_util.h" 3
    template<typename _Tp>
    inline bool __isnan(_Tp __x)
    { return std::isnan(__x); }
# 133 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/special_function_util.h" 3
  }





}
# 50 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 2 3

namespace std
{

# 65 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
  namespace __detail
  {
# 76 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template <typename _Tp>
    _Tp
    __bernoulli_series(unsigned int __n)
    {

      static const _Tp __num[28] = {
        _Tp(1UL), -_Tp(1UL) / _Tp(2UL),
        _Tp(1UL) / _Tp(6UL), _Tp(0UL),
        -_Tp(1UL) / _Tp(30UL), _Tp(0UL),
        _Tp(1UL) / _Tp(42UL), _Tp(0UL),
        -_Tp(1UL) / _Tp(30UL), _Tp(0UL),
        _Tp(5UL) / _Tp(66UL), _Tp(0UL),
        -_Tp(691UL) / _Tp(2730UL), _Tp(0UL),
        _Tp(7UL) / _Tp(6UL), _Tp(0UL),
        -_Tp(3617UL) / _Tp(510UL), _Tp(0UL),
        _Tp(43867UL) / _Tp(798UL), _Tp(0UL),
        -_Tp(174611) / _Tp(330UL), _Tp(0UL),
        _Tp(854513UL) / _Tp(138UL), _Tp(0UL),
        -_Tp(236364091UL) / _Tp(2730UL), _Tp(0UL),
        _Tp(8553103UL) / _Tp(6UL), _Tp(0UL)
      };

      if (__n == 0)
        return _Tp(1);

      if (__n == 1)
        return -_Tp(1) / _Tp(2);


      if (__n % 2 == 1)
        return _Tp(0);


      if (__n < 28)
        return __num[__n];


      _Tp __fact = _Tp(1);
      if ((__n / 2) % 2 == 0)
        __fact *= _Tp(-1);
      for (unsigned int __k = 1; __k <= __n; ++__k)
        __fact *= __k / (_Tp(2) * __numeric_constants<_Tp>::__pi());
      __fact *= _Tp(2);

      _Tp __sum = _Tp(0);
      for (unsigned int __i = 1; __i < 1000; ++__i)
        {
          _Tp __term = std::pow(_Tp(__i), -_Tp(__n));
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term;
        }

      return __fact * __sum;
    }
# 139 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    inline _Tp
    __bernoulli(int __n)
    { return __bernoulli_series<_Tp>(__n); }
# 153 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma_bernoulli(_Tp __x)
    {
      _Tp __lg = (__x - _Tp(0.5L)) * std::log(__x) - __x
               + _Tp(0.5L) * std::log(_Tp(2)
               * __numeric_constants<_Tp>::__pi());

      const _Tp __xx = __x * __x;
      _Tp __help = _Tp(1) / __x;
      for ( unsigned int __i = 1; __i < 20; ++__i )
        {
          const _Tp __2i = _Tp(2 * __i);
          __help /= __2i * (__2i - _Tp(1)) * __xx;
          __lg += __bernoulli<_Tp>(2 * __i) * __help;
        }

      return __lg;
    }
# 181 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma_lanczos(_Tp __x)
    {
      const _Tp __xm1 = __x - _Tp(1);

      static const _Tp __lanczos_cheb_7[9] = {
       _Tp( 0.99999999999980993227684700473478L),
       _Tp( 676.520368121885098567009190444019L),
       _Tp(-1259.13921672240287047156078755283L),
       _Tp( 771.3234287776530788486528258894L),
       _Tp(-176.61502916214059906584551354L),
       _Tp( 12.507343278686904814458936853L),
       _Tp(-0.13857109526572011689554707L),
       _Tp( 9.984369578019570859563e-6L),
       _Tp( 1.50563273514931155834e-7L)
      };

      static const _Tp __LOGROOT2PI
          = _Tp(0.9189385332046727417803297364056176L);

      _Tp __sum = __lanczos_cheb_7[0];
      for(unsigned int __k = 1; __k < 9; ++__k)
        __sum += __lanczos_cheb_7[__k] / (__xm1 + __k);

      const _Tp __term1 = (__xm1 + _Tp(0.5L))
                        * std::log((__xm1 + _Tp(7.5L))
                       / __numeric_constants<_Tp>::__euler());
      const _Tp __term2 = __LOGROOT2PI + std::log(__sum);
      const _Tp __result = __term1 + (__term2 - _Tp(7));

      return __result;
    }
# 225 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma(_Tp __x)
    {
      if (__x > _Tp(0.5L))
        return __log_gamma_lanczos(__x);
      else
        {
          const _Tp __sin_fact
                 = std::abs(std::sin(__numeric_constants<_Tp>::__pi() * __x));
          if (__sin_fact == _Tp(0))
            std::__throw_domain_error(("Argument is nonpositive integer " "in __log_gamma")
                                                           );
          return __numeric_constants<_Tp>::__lnpi()
                     - std::log(__sin_fact)
                     - __log_gamma_lanczos(_Tp(1) - __x);
        }
    }
# 252 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_gamma_sign(_Tp __x)
    {
      if (__x > _Tp(0))
        return _Tp(1);
      else
        {
          const _Tp __sin_fact
                  = std::sin(__numeric_constants<_Tp>::__pi() * __x);
          if (__sin_fact > _Tp(0))
            return (1);
          else if (__sin_fact < _Tp(0))
            return -_Tp(1);
          else
            return _Tp(0);
        }
    }
# 283 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __log_bincoef(unsigned int __n, unsigned int __k)
    {

      static const _Tp __max_bincoeff
                      = std::numeric_limits<_Tp>::max_exponent10
                      * std::log(_Tp(10)) - _Tp(1);

      _Tp __coeff = ::std::lgamma(_Tp(1 + __n))
                  - ::std::lgamma(_Tp(1 + __k))
                  - ::std::lgamma(_Tp(1 + __n - __k));





    }
# 314 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __bincoef(unsigned int __n, unsigned int __k)
    {

      static const _Tp __max_bincoeff
                      = std::numeric_limits<_Tp>::max_exponent10
                      * std::log(_Tp(10)) - _Tp(1);

      const _Tp __log_coeff = __log_bincoef<_Tp>(__n, __k);
      if (__log_coeff > __max_bincoeff)
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return std::exp(__log_coeff);
    }
# 337 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    inline _Tp
    __gamma(_Tp __x)
    { return std::exp(__log_gamma(__x)); }
# 356 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi_series(_Tp __x)
    {
      _Tp __sum = -__numeric_constants<_Tp>::__gamma_e() - _Tp(1) / __x;
      const unsigned int __max_iter = 100000;
      for (unsigned int __k = 1; __k < __max_iter; ++__k)
        {
          const _Tp __term = __x / (__k * (__k + __x));
          __sum += __term;
          if (std::abs(__term / __sum) < std::numeric_limits<_Tp>::epsilon())
            break;
        }
      return __sum;
    }
# 386 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi_asymp(_Tp __x)
    {
      _Tp __sum = std::log(__x) - _Tp(0.5L) / __x;
      const _Tp __xx = __x * __x;
      _Tp __xp = __xx;
      const unsigned int __max_iter = 100;
      for (unsigned int __k = 1; __k < __max_iter; ++__k)
        {
          const _Tp __term = __bernoulli<_Tp>(2 * __k) / (2 * __k * __xp);
          __sum -= __term;
          if (std::abs(__term / __sum) < std::numeric_limits<_Tp>::epsilon())
            break;
          __xp *= __xx;
        }
      return __sum;
    }
# 417 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi(_Tp __x)
    {
      const int __n = static_cast<int>(__x + 0.5L);
      const _Tp __eps = _Tp(4) * std::numeric_limits<_Tp>::epsilon();
      if (__n <= 0 && std::abs(__x - _Tp(__n)) < __eps)
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x < _Tp(0))
        {
          const _Tp __pi = __numeric_constants<_Tp>::__pi();
          return __psi(_Tp(1) - __x)
               - __pi * std::cos(__pi * __x) / std::sin(__pi * __x);
        }
      else if (__x > _Tp(100))
        return __psi_asymp(__x);
      else
        return __psi_series(__x);
    }
# 446 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/gamma.tcc" 3
    template<typename _Tp>
    _Tp
    __psi(unsigned int __n, _Tp __x)
    {
      if (__x <= _Tp(0))
        std::__throw_domain_error(("Argument out of range " "in __psi")
                                                 );
      else if (__n == 0)
        return __psi(__x);
      else
        {
          const _Tp __hzeta = __hurwitz_zeta(_Tp(__n + 1), __x);

          const _Tp __ln_nfact = ::std::lgamma(_Tp(__n + 1));



          _Tp __result = std::exp(__ln_nfact) * __hzeta;
          if (__n % 2 == 1)
            __result = -__result;
          return __result;
        }
    }
  }






}
# 48 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 1 3
# 55 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
namespace std
{

# 71 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
  namespace __detail
  {
# 98 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __gamma_temme(_Tp __mu,
                  _Tp & __gam1, _Tp & __gam2, _Tp & __gampl, _Tp & __gammi)
    {

      __gampl = _Tp(1) / ::std::tgamma(_Tp(1) + __mu);
      __gammi = _Tp(1) / ::std::tgamma(_Tp(1) - __mu);





      if (std::abs(__mu) < std::numeric_limits<_Tp>::epsilon())
        __gam1 = -_Tp(__numeric_constants<_Tp>::__gamma_e());
      else
        __gam1 = (__gammi - __gampl) / (_Tp(2) * __mu);

      __gam2 = (__gammi + __gampl) / (_Tp(2));

      return;
    }
# 136 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __bessel_jn(_Tp __nu, _Tp __x,
                _Tp & __Jnu, _Tp & __Nnu, _Tp & __Jpnu, _Tp & __Npnu)
    {
      if (__x == _Tp(0))
        {
          if (__nu == _Tp(0))
            {
              __Jnu = _Tp(1);
              __Jpnu = _Tp(0);
            }
          else if (__nu == _Tp(1))
            {
              __Jnu = _Tp(0);
              __Jpnu = _Tp(0.5L);
            }
          else
            {
              __Jnu = _Tp(0);
              __Jpnu = _Tp(0);
            }
          __Nnu = -std::numeric_limits<_Tp>::infinity();
          __Npnu = std::numeric_limits<_Tp>::infinity();
          return;
        }

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();




      const _Tp __fp_min = std::sqrt(std::numeric_limits<_Tp>::min());
      const int __max_iter = 15000;
      const _Tp __x_min = _Tp(2);

      const int __nl = (__x < __x_min
                    ? static_cast<int>(__nu + _Tp(0.5L))
                    : std::max(0, static_cast<int>(__nu - __x + _Tp(1.5L))));

      const _Tp __mu = __nu - __nl;
      const _Tp __mu2 = __mu * __mu;
      const _Tp __xi = _Tp(1) / __x;
      const _Tp __xi2 = _Tp(2) * __xi;
      _Tp __w = __xi2 / __numeric_constants<_Tp>::__pi();
      int __isign = 1;
      _Tp __h = __nu * __xi;
      if (__h < __fp_min)
        __h = __fp_min;
      _Tp __b = __xi2 * __nu;
      _Tp __d = _Tp(0);
      _Tp __c = __h;
      int __i;
      for (__i = 1; __i <= __max_iter; ++__i)
        {
          __b += __xi2;
          __d = __b - __d;
          if (std::abs(__d) < __fp_min)
            __d = __fp_min;
          __c = __b - _Tp(1) / __c;
          if (std::abs(__c) < __fp_min)
            __c = __fp_min;
          __d = _Tp(1) / __d;
          const _Tp __del = __c * __d;
          __h *= __del;
          if (__d < _Tp(0))
            __isign = -__isign;
          if (std::abs(__del - _Tp(1)) < __eps)
            break;
        }
      if (__i > __max_iter)
        std::__throw_runtime_error(("Argument x too large in __bessel_jn; " "try asymptotic expansion.")
                                                                   );
      _Tp __Jnul = __isign * __fp_min;
      _Tp __Jpnul = __h * __Jnul;
      _Tp __Jnul1 = __Jnul;
      _Tp __Jpnu1 = __Jpnul;
      _Tp __fact = __nu * __xi;
      for ( int __l = __nl; __l >= 1; --__l )
        {
          const _Tp __Jnutemp = __fact * __Jnul + __Jpnul;
          __fact -= __xi;
          __Jpnul = __fact * __Jnutemp - __Jnul;
          __Jnul = __Jnutemp;
        }
      if (__Jnul == _Tp(0))
        __Jnul = __eps;
      _Tp __f= __Jpnul / __Jnul;
      _Tp __Nmu, __Nnu1, __Npmu, __Jmu;
      if (__x < __x_min)
        {
          const _Tp __x2 = __x / _Tp(2);
          const _Tp __pimu = __numeric_constants<_Tp>::__pi() * __mu;
          _Tp __fact = (std::abs(__pimu) < __eps
                      ? _Tp(1) : __pimu / std::sin(__pimu));
          _Tp __d = -std::log(__x2);
          _Tp __e = __mu * __d;
          _Tp __fact2 = (std::abs(__e) < __eps
                       ? _Tp(1) : std::sinh(__e) / __e);
          _Tp __gam1, __gam2, __gampl, __gammi;
          __gamma_temme(__mu, __gam1, __gam2, __gampl, __gammi);
          _Tp __ff = (_Tp(2) / __numeric_constants<_Tp>::__pi())
                   * __fact * (__gam1 * std::cosh(__e) + __gam2 * __fact2 * __d);
          __e = std::exp(__e);
          _Tp __p = __e / (__numeric_constants<_Tp>::__pi() * __gampl);
          _Tp __q = _Tp(1) / (__e * __numeric_constants<_Tp>::__pi() * __gammi);
          const _Tp __pimu2 = __pimu / _Tp(2);
          _Tp __fact3 = (std::abs(__pimu2) < __eps
                       ? _Tp(1) : std::sin(__pimu2) / __pimu2 );
          _Tp __r = __numeric_constants<_Tp>::__pi() * __pimu2 * __fact3 * __fact3;
          _Tp __c = _Tp(1);
          __d = -__x2 * __x2;
          _Tp __sum = __ff + __r * __q;
          _Tp __sum1 = __p;
          for (__i = 1; __i <= __max_iter; ++__i)
            {
              __ff = (__i * __ff + __p + __q) / (__i * __i - __mu2);
              __c *= __d / _Tp(__i);
              __p /= _Tp(__i) - __mu;
              __q /= _Tp(__i) + __mu;
              const _Tp __del = __c * (__ff + __r * __q);
              __sum += __del;
              const _Tp __del1 = __c * __p - __i * __del;
              __sum1 += __del1;
              if ( std::abs(__del) < __eps * (_Tp(1) + std::abs(__sum)) )
                break;
            }
          if ( __i > __max_iter )
            std::__throw_runtime_error(("Bessel y series failed to converge " "in __bessel_jn.")
                                                             );
          __Nmu = -__sum;
          __Nnu1 = -__sum1 * __xi2;
          __Npmu = __mu * __xi * __Nmu - __Nnu1;
          __Jmu = __w / (__Npmu - __f * __Nmu);
        }
      else
        {
          _Tp __a = _Tp(0.25L) - __mu2;
          _Tp __q = _Tp(1);
          _Tp __p = -__xi / _Tp(2);
          _Tp __br = _Tp(2) * __x;
          _Tp __bi = _Tp(2);
          _Tp __fact = __a * __xi / (__p * __p + __q * __q);
          _Tp __cr = __br + __q * __fact;
          _Tp __ci = __bi + __p * __fact;
          _Tp __den = __br * __br + __bi * __bi;
          _Tp __dr = __br / __den;
          _Tp __di = -__bi / __den;
          _Tp __dlr = __cr * __dr - __ci * __di;
          _Tp __dli = __cr * __di + __ci * __dr;
          _Tp __temp = __p * __dlr - __q * __dli;
          __q = __p * __dli + __q * __dlr;
          __p = __temp;
          int __i;
          for (__i = 2; __i <= __max_iter; ++__i)
            {
              __a += _Tp(2 * (__i - 1));
              __bi += _Tp(2);
              __dr = __a * __dr + __br;
              __di = __a * __di + __bi;
              if (std::abs(__dr) + std::abs(__di) < __fp_min)
                __dr = __fp_min;
              __fact = __a / (__cr * __cr + __ci * __ci);
              __cr = __br + __cr * __fact;
              __ci = __bi - __ci * __fact;
              if (std::abs(__cr) + std::abs(__ci) < __fp_min)
                __cr = __fp_min;
              __den = __dr * __dr + __di * __di;
              __dr /= __den;
              __di /= -__den;
              __dlr = __cr * __dr - __ci * __di;
              __dli = __cr * __di + __ci * __dr;
              __temp = __p * __dlr - __q * __dli;
              __q = __p * __dli + __q * __dlr;
              __p = __temp;
              if (std::abs(__dlr - _Tp(1)) + std::abs(__dli) < __eps)
                break;
          }
          if (__i > __max_iter)
            std::__throw_runtime_error(("Lentz's method failed " "in __bessel_jn.")
                                                             );
          const _Tp __gam = (__p - __f) / __q;
          __Jmu = std::sqrt(__w / ((__p - __f) * __gam + __q));

          __Jmu = ::std::copysign(__Jmu, __Jnul);




          __Nmu = __gam * __Jmu;
          __Npmu = (__p + __q / __gam) * __Nmu;
          __Nnu1 = __mu * __xi * __Nmu - __Npmu;
      }
      __fact = __Jmu / __Jnul;
      __Jnu = __fact * __Jnul1;
      __Jpnu = __fact * __Jpnu1;
      for (__i = 1; __i <= __nl; ++__i)
        {
          const _Tp __Nnutemp = (__mu + __i) * __xi2 * __Nnu1 - __Nmu;
          __Nmu = __Nnu1;
          __Nnu1 = __Nnutemp;
        }
      __Nnu = __Nmu;
      __Npnu = __nu * __xi * __Nmu - __Nnu1;

      return;
    }
# 361 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __cyl_bessel_jn_asymp(_Tp __nu, _Tp __x, _Tp & __Jnu, _Tp & __Nnu)
    {
      const _Tp __mu = _Tp(4) * __nu * __nu;
      const _Tp __8x = _Tp(8) * __x;

      _Tp __P = _Tp(0);
      _Tp __Q = _Tp(0);

      _Tp __k = _Tp(0);
      _Tp __term = _Tp(1);

      int __epsP = 0;
      int __epsQ = 0;

      _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      do
        {
          __term *= (__k == 0
                     ? _Tp(1)
                     : -(__mu - (2 * __k - 1) * (2 * __k - 1)) / (__k * __8x));

          __epsP = std::abs(__term) < __eps * std::abs(__P);
          __P += __term;

          __k++;

          __term *= (__mu - (2 * __k - 1) * (2 * __k - 1)) / (__k * __8x);
          __epsQ = std::abs(__term) < __eps * std::abs(__Q);
          __Q += __term;

          if (__epsP && __epsQ && __k > (__nu / 2.))
            break;

          __k++;
        }
      while (__k < 1000);

      const _Tp __chi = __x - (__nu + _Tp(0.5L))
                             * __numeric_constants<_Tp>::__pi_2();

      const _Tp __c = std::cos(__chi);
      const _Tp __s = std::sin(__chi);

      const _Tp __coef = std::sqrt(_Tp(2)
                             / (__numeric_constants<_Tp>::__pi() * __x));

      __Jnu = __coef * (__c * __P - __s * __Q);
      __Nnu = __coef * (__s * __P + __c * __Q);

      return;
    }
# 444 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    _Tp
    __cyl_bessel_ij_series(_Tp __nu, _Tp __x, _Tp __sgn,
                           unsigned int __max_iter)
    {
      if (__x == _Tp(0))
 return __nu == _Tp(0) ? _Tp(1) : _Tp(0);

      const _Tp __x2 = __x / _Tp(2);
      _Tp __fact = __nu * std::log(__x2);

      __fact -= ::std::lgamma(__nu + _Tp(1));



      __fact = std::exp(__fact);
      const _Tp __xx4 = __sgn * __x2 * __x2;
      _Tp __Jn = _Tp(1);
      _Tp __term = _Tp(1);

      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          __term *= __xx4 / (_Tp(__i) * (__nu + _Tp(__i)));
          __Jn += __term;
          if (std::abs(__term / __Jn) < std::numeric_limits<_Tp>::epsilon())
            break;
        }

      return __fact * __Jn;
    }
# 490 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_bessel_j(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_bessel_j.")
                                                           );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x * __x < _Tp(10) * (__nu + _Tp(1)))
        return __cyl_bessel_ij_series(__nu, __x, -_Tp(1), 200);
      else if (__x > _Tp(1000))
        {
          _Tp __J_nu, __N_nu;
          __cyl_bessel_jn_asymp(__nu, __x, __J_nu, __N_nu);
          return __J_nu;
        }
      else
        {
          _Tp __J_nu, __N_nu, __Jp_nu, __Np_nu;
          __bessel_jn(__nu, __x, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          return __J_nu;
        }
    }
# 532 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_neumann_n(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_neumann_n.")
                                                            );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x > _Tp(1000))
        {
          _Tp __J_nu, __N_nu;
          __cyl_bessel_jn_asymp(__nu, __x, __J_nu, __N_nu);
          return __N_nu;
        }
      else
        {
          _Tp __J_nu, __N_nu, __Jp_nu, __Np_nu;
          __bessel_jn(__nu, __x, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          return __N_nu;
        }
    }
# 569 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    void
    __sph_bessel_jn(unsigned int __n, _Tp __x,
                    _Tp & __j_n, _Tp & __n_n, _Tp & __jp_n, _Tp & __np_n)
    {
      const _Tp __nu = _Tp(__n) + _Tp(0.5L);

      _Tp __J_nu, __N_nu, __Jp_nu, __Np_nu;
      __bessel_jn(__nu, __x, __J_nu, __N_nu, __Jp_nu, __Np_nu);

      const _Tp __factor = __numeric_constants<_Tp>::__sqrtpio2()
                         / std::sqrt(__x);

      __j_n = __factor * __J_nu;
      __n_n = __factor * __N_nu;
      __jp_n = __factor * __Jp_nu - __j_n / (_Tp(2) * __x);
      __np_n = __factor * __Np_nu - __n_n / (_Tp(2) * __x);

      return;
    }
# 604 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    _Tp
    __sph_bessel(unsigned int __n, _Tp __x)
    {
      if (__x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __sph_bessel.")
                                                         );
      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x == _Tp(0))
        {
          if (__n == 0)
            return _Tp(1);
          else
            return _Tp(0);
        }
      else
        {
          _Tp __j_n, __n_n, __jp_n, __np_n;
          __sph_bessel_jn(__n, __x, __j_n, __n_n, __jp_n, __np_n);
          return __j_n;
        }
    }
# 642 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/bessel_function.tcc" 3
    template <typename _Tp>
    _Tp
    __sph_neumann(unsigned int __n, _Tp __x)
    {
      if (__x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __sph_neumann.")
                                                          );
      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x == _Tp(0))
        return -std::numeric_limits<_Tp>::infinity();
      else
        {
          _Tp __j_n, __n_n, __jp_n, __np_n;
          __sph_bessel_jn(__n, __x, __j_n, __n_n, __jp_n, __np_n);
          return __n_n;
        }
    }
  }






}
# 49 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 1 3
# 49 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
namespace std
{

# 65 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
  namespace __detail
  {
# 79 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
    template<typename _Tp>
    _Tp
    __beta_gamma(_Tp __x, _Tp __y)
    {

      _Tp __bet;

      if (__x > __y)
        {
          __bet = ::std::tgamma(__x)
                / ::std::tgamma(__x + __y);
          __bet *= ::std::tgamma(__y);
        }
      else
        {
          __bet = ::std::tgamma(__y)
                / ::std::tgamma(__x + __y);
          __bet *= ::std::tgamma(__x);
        }
# 111 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
      return __bet;
    }
# 127 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
    template<typename _Tp>
    _Tp
    __beta_lgamma(_Tp __x, _Tp __y)
    {

      _Tp __bet = ::std::lgamma(__x)
                + ::std::lgamma(__y)
                - ::std::lgamma(__x + __y);





      __bet = std::exp(__bet);
      return __bet;
    }
# 158 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
    template<typename _Tp>
    _Tp
    __beta_product(_Tp __x, _Tp __y)
    {

      _Tp __bet = (__x + __y) / (__x * __y);

      unsigned int __max_iter = 1000000;
      for (unsigned int __k = 1; __k < __max_iter; ++__k)
        {
          _Tp __term = (_Tp(1) + (__x + __y) / __k)
                     / ((_Tp(1) + __x / __k) * (_Tp(1) + __y / __k));
          __bet *= __term;
        }

      return __bet;
    }
# 189 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/beta_function.tcc" 3
    template<typename _Tp>
    inline _Tp
    __beta(_Tp __x, _Tp __y)
    {
      if (__isnan(__x) || __isnan(__y))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __beta_lgamma(__x, __y);
    }
  }






}
# 50 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 1 3
# 45 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
namespace std
{

# 59 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
  namespace __detail
  {
# 76 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rf(_Tp __x, _Tp __y, _Tp __z)
    {
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __lolim = _Tp(5) * __min;

      if (__x < _Tp(0) || __y < _Tp(0) || __z < _Tp(0))
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rf.")
                                                        );
      else if (__x + __y < __lolim || __x + __z < __lolim
            || __y + __z < __lolim)
        std::__throw_domain_error(("Argument too small in __ellint_rf"));
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(1) / _Tp(24);
          const _Tp __c2 = _Tp(1) / _Tp(10);
          const _Tp __c3 = _Tp(3) / _Tp(44);
          const _Tp __c4 = _Tp(1) / _Tp(14);

          _Tp __xn = __x;
          _Tp __yn = __y;
          _Tp __zn = __z;

          const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
          const _Tp __errtol = std::pow(__eps, _Tp(1) / _Tp(6));
          _Tp __mu;
          _Tp __xndev, __yndev, __zndev;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + __yn + __zn) / _Tp(3);
              __xndev = 2 - (__mu + __xn) / __mu;
              __yndev = 2 - (__mu + __yn) / __mu;
              __zndev = 2 - (__mu + __zn) / __mu;
              _Tp __epsilon = std::max(std::abs(__xndev), std::abs(__yndev));
              __epsilon = std::max(__epsilon, std::abs(__zndev));
              if (__epsilon < __errtol)
                break;
              const _Tp __xnroot = std::sqrt(__xn);
              const _Tp __ynroot = std::sqrt(__yn);
              const _Tp __znroot = std::sqrt(__zn);
              const _Tp __lambda = __xnroot * (__ynroot + __znroot)
                                 + __ynroot * __znroot;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
              __zn = __c0 * (__zn + __lambda);
            }

          const _Tp __e2 = __xndev * __yndev - __zndev * __zndev;
          const _Tp __e3 = __xndev * __yndev * __zndev;
          const _Tp __s = _Tp(1) + (__c1 * __e2 - __c2 - __c3 * __e3) * __e2
                   + __c4 * __e3;

          return __s / std::sqrt(__mu);
        }
    }
# 153 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_1_series(_Tp __k)
    {

      const _Tp __kk = __k * __k;

      _Tp __term = __kk / _Tp(4);
      _Tp __sum = _Tp(1) + __term;

      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 2; __i < __max_iter; ++__i)
        {
          __term *= (2 * __i - 1) * __kk / (2 * __i);
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term;
        }

      return __numeric_constants<_Tp>::__pi_2() * __sum;
    }
# 191 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_1(_Tp __k)
    {

      if (__isnan(__k))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) >= _Tp(1))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __ellint_rf(_Tp(0), _Tp(1) - __k * __k, _Tp(1));
    }
# 219 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_1(_Tp __k, _Tp __phi)
    {

      if (__isnan(__k) || __isnan(__phi))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __ellint_1."));
      else
        {

          const int __n = std::floor(__phi / __numeric_constants<_Tp>::__pi()
                                   + _Tp(0.5L));
          const _Tp __phi_red = __phi
                              - __n * __numeric_constants<_Tp>::__pi();

          const _Tp __s = std::sin(__phi_red);
          const _Tp __c = std::cos(__phi_red);

          const _Tp __F = __s
                        * __ellint_rf(__c * __c,
                                _Tp(1) - __k * __k * __s * __s, _Tp(1));

          if (__n == 0)
            return __F;
          else
            return __F + _Tp(2) * __n * __comp_ellint_1(__k);
        }
    }
# 266 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_2_series(_Tp __k)
    {

      const _Tp __kk = __k * __k;

      _Tp __term = __kk;
      _Tp __sum = __term;

      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 2; __i < __max_iter; ++__i)
        {
          const _Tp __i2m = 2 * __i - 1;
          const _Tp __i2 = 2 * __i;
          __term *= __i2m * __i2m * __kk / (__i2 * __i2);
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term / __i2m;
        }

      return __numeric_constants<_Tp>::__pi_2() * (_Tp(1) - __sum);
    }
# 314 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rd(_Tp __x, _Tp __y, _Tp __z)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __errtol = std::pow(__eps / _Tp(8), _Tp(1) / _Tp(6));
      const _Tp __max = std::numeric_limits<_Tp>::max();
      const _Tp __lolim = _Tp(2) / std::pow(__max, _Tp(2) / _Tp(3));

      if (__x < _Tp(0) || __y < _Tp(0))
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rd.")
                                                        );
      else if (__x + __y < __lolim || __z < __lolim)
        std::__throw_domain_error(("Argument too small " "in __ellint_rd.")
                                                        );
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(3) / _Tp(14);
          const _Tp __c2 = _Tp(1) / _Tp(6);
          const _Tp __c3 = _Tp(9) / _Tp(22);
          const _Tp __c4 = _Tp(3) / _Tp(26);

          _Tp __xn = __x;
          _Tp __yn = __y;
          _Tp __zn = __z;
          _Tp __sigma = _Tp(0);
          _Tp __power4 = _Tp(1);

          _Tp __mu;
          _Tp __xndev, __yndev, __zndev;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + __yn + _Tp(3) * __zn) / _Tp(5);
              __xndev = (__mu - __xn) / __mu;
              __yndev = (__mu - __yn) / __mu;
              __zndev = (__mu - __zn) / __mu;
              _Tp __epsilon = std::max(std::abs(__xndev), std::abs(__yndev));
              __epsilon = std::max(__epsilon, std::abs(__zndev));
              if (__epsilon < __errtol)
                break;
              _Tp __xnroot = std::sqrt(__xn);
              _Tp __ynroot = std::sqrt(__yn);
              _Tp __znroot = std::sqrt(__zn);
              _Tp __lambda = __xnroot * (__ynroot + __znroot)
                           + __ynroot * __znroot;
              __sigma += __power4 / (__znroot * (__zn + __lambda));
              __power4 *= __c0;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
              __zn = __c0 * (__zn + __lambda);
            }

          _Tp __ea = __xndev * __yndev;
          _Tp __eb = __zndev * __zndev;
          _Tp __ec = __ea - __eb;
          _Tp __ed = __ea - _Tp(6) * __eb;
          _Tp __ef = __ed + __ec + __ec;
          _Tp __s1 = __ed * (-__c1 + __c3 * __ed
                                   / _Tp(3) - _Tp(3) * __c4 * __zndev * __ef
                                   / _Tp(2));
          _Tp __s2 = __zndev
                   * (__c2 * __ef
                    + __zndev * (-__c3 * __ec - __zndev * __c4 - __ea));

          return _Tp(3) * __sigma + __power4 * (_Tp(1) + __s1 + __s2)
                                        / (__mu * std::sqrt(__mu));
        }
    }
# 399 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_2(_Tp __k)
    {

      if (__isnan(__k))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) == 1)
        return _Tp(1);
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __comp_ellint_2."));
      else
        {
          const _Tp __kk = __k * __k;

          return __ellint_rf(_Tp(0), _Tp(1) - __kk, _Tp(1))
               - __kk * __ellint_rd(_Tp(0), _Tp(1) - __kk, _Tp(1)) / _Tp(3);
        }
    }
# 433 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_2(_Tp __k, _Tp __phi)
    {

      if (__isnan(__k) || __isnan(__phi))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __ellint_2."));
      else
        {

          const int __n = std::floor(__phi / __numeric_constants<_Tp>::__pi()
                                   + _Tp(0.5L));
          const _Tp __phi_red = __phi
                              - __n * __numeric_constants<_Tp>::__pi();

          const _Tp __kk = __k * __k;
          const _Tp __s = std::sin(__phi_red);
          const _Tp __ss = __s * __s;
          const _Tp __sss = __ss * __s;
          const _Tp __c = std::cos(__phi_red);
          const _Tp __cc = __c * __c;

          const _Tp __E = __s
                        * __ellint_rf(__cc, _Tp(1) - __kk * __ss, _Tp(1))
                        - __kk * __sss
                        * __ellint_rd(__cc, _Tp(1) - __kk * __ss, _Tp(1))
                        / _Tp(3);

          if (__n == 0)
            return __E;
          else
            return __E + _Tp(2) * __n * __comp_ellint_2(__k);
        }
    }
# 492 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rc(_Tp __x, _Tp __y)
    {
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __lolim = _Tp(5) * __min;

      if (__x < _Tp(0) || __y < _Tp(0) || __x + __y < __lolim)
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rc.")
                                                        );
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(1) / _Tp(7);
          const _Tp __c2 = _Tp(9) / _Tp(22);
          const _Tp __c3 = _Tp(3) / _Tp(10);
          const _Tp __c4 = _Tp(3) / _Tp(8);

          _Tp __xn = __x;
          _Tp __yn = __y;

          const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
          const _Tp __errtol = std::pow(__eps / _Tp(30), _Tp(1) / _Tp(6));
          _Tp __mu;
          _Tp __sn;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + _Tp(2) * __yn) / _Tp(3);
              __sn = (__yn + __mu) / __mu - _Tp(2);
              if (std::abs(__sn) < __errtol)
                break;
              const _Tp __lambda = _Tp(2) * std::sqrt(__xn) * std::sqrt(__yn)
                             + __yn;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
            }

          _Tp __s = __sn * __sn
                  * (__c3 + __sn*(__c1 + __sn * (__c4 + __sn * __c2)));

          return (_Tp(1) + __s) / std::sqrt(__mu);
        }
    }
# 561 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_rj(_Tp __x, _Tp __y, _Tp __z, _Tp __p)
    {
      const _Tp __min = std::numeric_limits<_Tp>::min();
      const _Tp __lolim = std::pow(_Tp(5) * __min, _Tp(1)/_Tp(3));

      if (__x < _Tp(0) || __y < _Tp(0) || __z < _Tp(0))
        std::__throw_domain_error(("Argument less than zero " "in __ellint_rj.")
                                                        );
      else if (__x + __y < __lolim || __x + __z < __lolim
            || __y + __z < __lolim || __p < __lolim)
        std::__throw_domain_error(("Argument too small " "in __ellint_rj")
                                                       );
      else
        {
          const _Tp __c0 = _Tp(1) / _Tp(4);
          const _Tp __c1 = _Tp(3) / _Tp(14);
          const _Tp __c2 = _Tp(1) / _Tp(3);
          const _Tp __c3 = _Tp(3) / _Tp(22);
          const _Tp __c4 = _Tp(3) / _Tp(26);

          _Tp __xn = __x;
          _Tp __yn = __y;
          _Tp __zn = __z;
          _Tp __pn = __p;
          _Tp __sigma = _Tp(0);
          _Tp __power4 = _Tp(1);

          const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
          const _Tp __errtol = std::pow(__eps / _Tp(8), _Tp(1) / _Tp(6));

          _Tp __mu;
          _Tp __xndev, __yndev, __zndev, __pndev;

          const unsigned int __max_iter = 100;
          for (unsigned int __iter = 0; __iter < __max_iter; ++__iter)
            {
              __mu = (__xn + __yn + __zn + _Tp(2) * __pn) / _Tp(5);
              __xndev = (__mu - __xn) / __mu;
              __yndev = (__mu - __yn) / __mu;
              __zndev = (__mu - __zn) / __mu;
              __pndev = (__mu - __pn) / __mu;
              _Tp __epsilon = std::max(std::abs(__xndev), std::abs(__yndev));
              __epsilon = std::max(__epsilon, std::abs(__zndev));
              __epsilon = std::max(__epsilon, std::abs(__pndev));
              if (__epsilon < __errtol)
                break;
              const _Tp __xnroot = std::sqrt(__xn);
              const _Tp __ynroot = std::sqrt(__yn);
              const _Tp __znroot = std::sqrt(__zn);
              const _Tp __lambda = __xnroot * (__ynroot + __znroot)
                                 + __ynroot * __znroot;
              const _Tp __alpha1 = __pn * (__xnroot + __ynroot + __znroot)
                                + __xnroot * __ynroot * __znroot;
              const _Tp __alpha2 = __alpha1 * __alpha1;
              const _Tp __beta = __pn * (__pn + __lambda)
                                      * (__pn + __lambda);
              __sigma += __power4 * __ellint_rc(__alpha2, __beta);
              __power4 *= __c0;
              __xn = __c0 * (__xn + __lambda);
              __yn = __c0 * (__yn + __lambda);
              __zn = __c0 * (__zn + __lambda);
              __pn = __c0 * (__pn + __lambda);
            }

          _Tp __ea = __xndev * (__yndev + __zndev) + __yndev * __zndev;
          _Tp __eb = __xndev * __yndev * __zndev;
          _Tp __ec = __pndev * __pndev;
          _Tp __e2 = __ea - _Tp(3) * __ec;
          _Tp __e3 = __eb + _Tp(2) * __pndev * (__ea - __ec);
          _Tp __s1 = _Tp(1) + __e2 * (-__c1 + _Tp(3) * __c3 * __e2 / _Tp(4)
                            - _Tp(3) * __c4 * __e3 / _Tp(2));
          _Tp __s2 = __eb * (__c2 / _Tp(2)
                   + __pndev * (-__c3 - __c3 + __pndev * __c4));
          _Tp __s3 = __pndev * __ea * (__c2 - __pndev * __c3)
                   - __c2 * __pndev * __ec;

          return _Tp(3) * __sigma + __power4 * (__s1 + __s2 + __s3)
                                             / (__mu * std::sqrt(__mu));
        }
    }
# 661 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __comp_ellint_3(_Tp __k, _Tp __nu)
    {

      if (__isnan(__k) || __isnan(__nu))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__nu == _Tp(1))
        return std::numeric_limits<_Tp>::infinity();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __comp_ellint_3."));
      else
        {
          const _Tp __kk = __k * __k;

          return __ellint_rf(_Tp(0), _Tp(1) - __kk, _Tp(1))
               + __nu
               * __ellint_rj(_Tp(0), _Tp(1) - __kk, _Tp(1), _Tp(1) - __nu)
               / _Tp(3);
        }
    }
# 701 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/ell_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __ellint_3(_Tp __k, _Tp __nu, _Tp __phi)
    {

      if (__isnan(__k) || __isnan(__nu) || __isnan(__phi))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (std::abs(__k) > _Tp(1))
        std::__throw_domain_error(("Bad argument in __ellint_3."));
      else
        {

          const int __n = std::floor(__phi / __numeric_constants<_Tp>::__pi()
                                   + _Tp(0.5L));
          const _Tp __phi_red = __phi
                              - __n * __numeric_constants<_Tp>::__pi();

          const _Tp __kk = __k * __k;
          const _Tp __s = std::sin(__phi_red);
          const _Tp __ss = __s * __s;
          const _Tp __sss = __ss * __s;
          const _Tp __c = std::cos(__phi_red);
          const _Tp __cc = __c * __c;

          const _Tp __Pi = __s
                         * __ellint_rf(__cc, _Tp(1) - __kk * __ss, _Tp(1))
                         + __nu * __sss
                         * __ellint_rj(__cc, _Tp(1) - __kk * __ss, _Tp(1),
                                       _Tp(1) - __nu * __ss) / _Tp(3);

          if (__n == 0)
            return __Pi;
          else
            return __Pi + _Tp(2) * __n * __comp_ellint_3(__k, __nu);
        }
    }
  }





}
# 51 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 1 3
# 50 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
namespace std
{

# 64 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
  namespace __detail
  {
    template<typename _Tp> _Tp __expint_E1(_Tp);
# 81 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_E1_series(_Tp __x)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      _Tp __term = _Tp(1);
      _Tp __esum = _Tp(0);
      _Tp __osum = _Tp(0);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          __term *= - __x / __i;
          if (std::abs(__term) < __eps)
            break;
          if (__term >= _Tp(0))
            __esum += __term / __i;
          else
            __osum += __term / __i;
        }

      return - __esum - __osum
             - __numeric_constants<_Tp>::__gamma_e() - std::log(__x);
    }
# 118 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_E1_asymp(_Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __esum = _Tp(1);
      _Tp __osum = _Tp(0);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          _Tp __prev = __term;
          __term *= - __i / __x;
          if (std::abs(__term) > std::abs(__prev))
            break;
          if (__term >= _Tp(0))
            __esum += __term;
          else
            __osum += __term;
        }

      return std::exp(- __x) * (__esum + __osum) / __x;
    }
# 155 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_En_series(unsigned int __n, _Tp __x)
    {
      const unsigned int __max_iter = 1000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const int __nm1 = __n - 1;
      _Tp __ans = (__nm1 != 0
                ? _Tp(1) / __nm1 : -std::log(__x)
                                   - __numeric_constants<_Tp>::__gamma_e());
      _Tp __fact = _Tp(1);
      for (int __i = 1; __i <= __max_iter; ++__i)
        {
          __fact *= -__x / _Tp(__i);
          _Tp __del;
          if ( __i != __nm1 )
            __del = -__fact / _Tp(__i - __nm1);
          else
            {
              _Tp __psi = -__numeric_constants<_Tp>::gamma_e();
              for (int __ii = 1; __ii <= __nm1; ++__ii)
                __psi += _Tp(1) / _Tp(__ii);
              __del = __fact * (__psi - std::log(__x));
            }
          __ans += __del;
          if (std::abs(__del) < __eps * std::abs(__ans))
            return __ans;
        }
      std::__throw_runtime_error(("Series summation failed " "in __expint_En_series.")
                                                              );
    }
# 201 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_En_cont_frac(unsigned int __n, _Tp __x)
    {
      const unsigned int __max_iter = 1000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __fp_min = std::numeric_limits<_Tp>::min();
      const int __nm1 = __n - 1;
      _Tp __b = __x + _Tp(__n);
      _Tp __c = _Tp(1) / __fp_min;
      _Tp __d = _Tp(1) / __b;
      _Tp __h = __d;
      for ( unsigned int __i = 1; __i <= __max_iter; ++__i )
        {
          _Tp __a = -_Tp(__i * (__nm1 + __i));
          __b += _Tp(2);
          __d = _Tp(1) / (__a * __d + __b);
          __c = __b + __a / __c;
          const _Tp __del = __c * __d;
          __h *= __del;
          if (std::abs(__del - _Tp(1)) < __eps)
            {
              const _Tp __ans = __h * std::exp(-__x);
              return __ans;
            }
        }
      std::__throw_runtime_error(("Continued fraction failed " "in __expint_En_cont_frac.")
                                                                 );
    }
# 246 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_En_recursion(unsigned int __n, _Tp __x)
    {
      _Tp __En;
      _Tp __E1 = __expint_E1(__x);
      if (__x < _Tp(__n))
        {

          __En = __E1;
          for (unsigned int __j = 2; __j < __n; ++__j)
            __En = (std::exp(-__x) - __x * __En) / _Tp(__j - 1);
        }
      else
        {

          __En = _Tp(1);
          const int __N = __n + 20;
          _Tp __save = _Tp(0);
          for (int __j = __N; __j > 0; --__j)
            {
              __En = (std::exp(-__x) - __j * __En) / __x;
              if (__j == __n)
                __save = __En;
            }
            _Tp __norm = __En / __E1;
            __En /= __norm;
        }

      return __En;
    }
# 290 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_Ei_series(_Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(0);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          __term *= __x / __i;
          __sum += __term / __i;
          if (__term < std::numeric_limits<_Tp>::epsilon() * __sum)
            break;
        }

      return __numeric_constants<_Tp>::__gamma_e() + __sum + std::log(__x);
    }
# 321 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_Ei_asymp(_Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(1);
      const unsigned int __max_iter = 1000;
      for (unsigned int __i = 1; __i < __max_iter; ++__i)
        {
          _Tp __prev = __term;
          __term *= __i / __x;
          if (__term < std::numeric_limits<_Tp>::epsilon())
            break;
          if (__term >= __prev)
            break;
          __sum += __term;
        }

      return std::exp(__x) * __sum / __x;
    }
# 354 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_Ei(_Tp __x)
    {
      if (__x < _Tp(0))
        return -__expint_E1(-__x);
      else if (__x < -std::log(std::numeric_limits<_Tp>::epsilon()))
        return __expint_Ei_series(__x);
      else
        return __expint_Ei_asymp(__x);
    }
# 378 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_E1(_Tp __x)
    {
      if (__x < _Tp(0))
        return -__expint_Ei(-__x);
      else if (__x < _Tp(1))
        return __expint_E1_series(__x);
      else if (__x < _Tp(100))
        return __expint_En_cont_frac(1, __x);
      else
        return __expint_E1_asymp(__x);
    }
# 408 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_asymp(unsigned int __n, _Tp __x)
    {
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(1);
      for (unsigned int __i = 1; __i <= __n; ++__i)
        {
          _Tp __prev = __term;
          __term *= -(__n - __i + 1) / __x;
          if (std::abs(__term) > std::abs(__prev))
            break;
          __sum += __term;
        }

      return std::exp(-__x) * __sum / __x;
    }
# 442 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint_large_n(unsigned int __n, _Tp __x)
    {
      const _Tp __xpn = __x + __n;
      const _Tp __xpn2 = __xpn * __xpn;
      _Tp __term = _Tp(1);
      _Tp __sum = _Tp(1);
      for (unsigned int __i = 1; __i <= __n; ++__i)
        {
          _Tp __prev = __term;
          __term *= (__n - 2 * (__i - 1) * __x) / __xpn2;
          if (std::abs(__term) < std::numeric_limits<_Tp>::epsilon())
            break;
          __sum += __term;
        }

      return std::exp(-__x) * __sum / __xpn;
    }
# 476 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    _Tp
    __expint(unsigned int __n, _Tp __x)
    {

      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__n <= 1 && __x == _Tp(0))
        return std::numeric_limits<_Tp>::infinity();
      else
        {
          _Tp __E0 = std::exp(__x) / __x;
          if (__n == 0)
            return __E0;

          _Tp __E1 = __expint_E1(__x);
          if (__n == 1)
            return __E1;

          if (__x == _Tp(0))
            return _Tp(1) / static_cast<_Tp>(__n - 1);

          _Tp __En = __expint_En_recursion(__n, __x);

          return __En;
        }
    }
# 516 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/exp_integral.tcc" 3
    template<typename _Tp>
    inline _Tp
    __expint(_Tp __x)
    {
      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __expint_Ei(__x);
    }
  }





}
# 52 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 1 3
# 44 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
namespace std
{

# 60 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
  namespace __detail
  {
# 83 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __conf_hyperg_series(_Tp __a, _Tp __c, _Tp __x)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      _Tp __term = _Tp(1);
      _Tp __Fac = _Tp(1);
      const unsigned int __max_iter = 100000;
      unsigned int __i;
      for (__i = 0; __i < __max_iter; ++__i)
        {
          __term *= (__a + _Tp(__i)) * __x
                  / ((__c + _Tp(__i)) * _Tp(1 + __i));
          if (std::abs(__term) < __eps)
            {
              break;
            }
          __Fac += __term;
        }
      if (__i == __max_iter)
        std::__throw_runtime_error(("Series failed to converge " "in __conf_hyperg_series.")
                                                                  );

      return __Fac;
    }
# 120 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __conf_hyperg_luke(_Tp __a, _Tp __c, _Tp __xin)
    {
      const _Tp __big = std::pow(std::numeric_limits<_Tp>::max(), _Tp(0.16L));
      const int __nmax = 20000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __x = -__xin;
      const _Tp __x3 = __x * __x * __x;
      const _Tp __t0 = __a / __c;
      const _Tp __t1 = (__a + _Tp(1)) / (_Tp(2) * __c);
      const _Tp __t2 = (__a + _Tp(2)) / (_Tp(2) * (__c + _Tp(1)));
      _Tp __F = _Tp(1);
      _Tp __prec;

      _Tp __Bnm3 = _Tp(1);
      _Tp __Bnm2 = _Tp(1) + __t1 * __x;
      _Tp __Bnm1 = _Tp(1) + __t2 * __x * (_Tp(1) + __t1 / _Tp(3) * __x);

      _Tp __Anm3 = _Tp(1);
      _Tp __Anm2 = __Bnm2 - __t0 * __x;
      _Tp __Anm1 = __Bnm1 - __t0 * (_Tp(1) + __t2 * __x) * __x
                 + __t0 * __t1 * (__c / (__c + _Tp(1))) * __x * __x;

      int __n = 3;
      while(1)
        {
          _Tp __npam1 = _Tp(__n - 1) + __a;
          _Tp __npcm1 = _Tp(__n - 1) + __c;
          _Tp __npam2 = _Tp(__n - 2) + __a;
          _Tp __npcm2 = _Tp(__n - 2) + __c;
          _Tp __tnm1 = _Tp(2 * __n - 1);
          _Tp __tnm3 = _Tp(2 * __n - 3);
          _Tp __tnm5 = _Tp(2 * __n - 5);
          _Tp __F1 = (_Tp(__n - 2) - __a) / (_Tp(2) * __tnm3 * __npcm1);
          _Tp __F2 = (_Tp(__n) + __a) * __npam1
                   / (_Tp(4) * __tnm1 * __tnm3 * __npcm2 * __npcm1);
          _Tp __F3 = -__npam2 * __npam1 * (_Tp(__n - 2) - __a)
                   / (_Tp(8) * __tnm3 * __tnm3 * __tnm5
                   * (_Tp(__n - 3) + __c) * __npcm2 * __npcm1);
          _Tp __E = -__npam1 * (_Tp(__n - 1) - __c)
                   / (_Tp(2) * __tnm3 * __npcm2 * __npcm1);

          _Tp __An = (_Tp(1) + __F1 * __x) * __Anm1
                   + (__E + __F2 * __x) * __x * __Anm2 + __F3 * __x3 * __Anm3;
          _Tp __Bn = (_Tp(1) + __F1 * __x) * __Bnm1
                   + (__E + __F2 * __x) * __x * __Bnm2 + __F3 * __x3 * __Bnm3;
          _Tp __r = __An / __Bn;

          __prec = std::abs((__F - __r) / __F);
          __F = __r;

          if (__prec < __eps || __n > __nmax)
            break;

          if (std::abs(__An) > __big || std::abs(__Bn) > __big)
            {
              __An /= __big;
              __Bn /= __big;
              __Anm1 /= __big;
              __Bnm1 /= __big;
              __Anm2 /= __big;
              __Bnm2 /= __big;
              __Anm3 /= __big;
              __Bnm3 /= __big;
            }
          else if (std::abs(__An) < _Tp(1) / __big
                || std::abs(__Bn) < _Tp(1) / __big)
            {
              __An *= __big;
              __Bn *= __big;
              __Anm1 *= __big;
              __Bnm1 *= __big;
              __Anm2 *= __big;
              __Bnm2 *= __big;
              __Anm3 *= __big;
              __Bnm3 *= __big;
            }

          ++__n;
          __Bnm3 = __Bnm2;
          __Bnm2 = __Bnm1;
          __Bnm1 = __Bn;
          __Anm3 = __Anm2;
          __Anm2 = __Anm1;
          __Anm1 = __An;
        }

      if (__n >= __nmax)
        std::__throw_runtime_error(("Iteration failed to converge " "in __conf_hyperg_luke.")
                                                                );

      return __F;
    }
# 227 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __conf_hyperg(_Tp __a, _Tp __c, _Tp __x)
    {

      const _Tp __c_nint = ::std::nearbyint(__c);



      if (__isnan(__a) || __isnan(__c) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__c_nint == __c && __c_nint <= 0)
        return std::numeric_limits<_Tp>::infinity();
      else if (__a == _Tp(0))
        return _Tp(1);
      else if (__c == __a)
        return std::exp(__x);
      else if (__x < _Tp(0))
        return __conf_hyperg_luke(__a, __c, __x);
      else
        return __conf_hyperg_series(__a, __c, __x);
    }
# 271 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __hyperg_series(_Tp __a, _Tp __b, _Tp __c, _Tp __x)
    {
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      _Tp __term = _Tp(1);
      _Tp __Fabc = _Tp(1);
      const unsigned int __max_iter = 100000;
      unsigned int __i;
      for (__i = 0; __i < __max_iter; ++__i)
        {
          __term *= (__a + _Tp(__i)) * (__b + _Tp(__i)) * __x
                  / ((__c + _Tp(__i)) * _Tp(1 + __i));
          if (std::abs(__term) < __eps)
            {
              break;
            }
          __Fabc += __term;
        }
      if (__i == __max_iter)
        std::__throw_runtime_error(("Series failed to converge " "in __hyperg_series.")
                                                             );

      return __Fabc;
    }







    template<typename _Tp>
    _Tp
    __hyperg_luke(_Tp __a, _Tp __b, _Tp __c, _Tp __xin)
    {
      const _Tp __big = std::pow(std::numeric_limits<_Tp>::max(), _Tp(0.16L));
      const int __nmax = 20000;
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __x = -__xin;
      const _Tp __x3 = __x * __x * __x;
      const _Tp __t0 = __a * __b / __c;
      const _Tp __t1 = (__a + _Tp(1)) * (__b + _Tp(1)) / (_Tp(2) * __c);
      const _Tp __t2 = (__a + _Tp(2)) * (__b + _Tp(2))
                     / (_Tp(2) * (__c + _Tp(1)));

      _Tp __F = _Tp(1);

      _Tp __Bnm3 = _Tp(1);
      _Tp __Bnm2 = _Tp(1) + __t1 * __x;
      _Tp __Bnm1 = _Tp(1) + __t2 * __x * (_Tp(1) + __t1 / _Tp(3) * __x);

      _Tp __Anm3 = _Tp(1);
      _Tp __Anm2 = __Bnm2 - __t0 * __x;
      _Tp __Anm1 = __Bnm1 - __t0 * (_Tp(1) + __t2 * __x) * __x
                 + __t0 * __t1 * (__c / (__c + _Tp(1))) * __x * __x;

      int __n = 3;
      while (1)
        {
          const _Tp __npam1 = _Tp(__n - 1) + __a;
          const _Tp __npbm1 = _Tp(__n - 1) + __b;
          const _Tp __npcm1 = _Tp(__n - 1) + __c;
          const _Tp __npam2 = _Tp(__n - 2) + __a;
          const _Tp __npbm2 = _Tp(__n - 2) + __b;
          const _Tp __npcm2 = _Tp(__n - 2) + __c;
          const _Tp __tnm1 = _Tp(2 * __n - 1);
          const _Tp __tnm3 = _Tp(2 * __n - 3);
          const _Tp __tnm5 = _Tp(2 * __n - 5);
          const _Tp __n2 = __n * __n;
          const _Tp __F1 = (_Tp(3) * __n2 + (__a + __b - _Tp(6)) * __n
                         + _Tp(2) - __a * __b - _Tp(2) * (__a + __b))
                         / (_Tp(2) * __tnm3 * __npcm1);
          const _Tp __F2 = -(_Tp(3) * __n2 - (__a + __b + _Tp(6)) * __n
                         + _Tp(2) - __a * __b) * __npam1 * __npbm1
                         / (_Tp(4) * __tnm1 * __tnm3 * __npcm2 * __npcm1);
          const _Tp __F3 = (__npam2 * __npam1 * __npbm2 * __npbm1
                         * (_Tp(__n - 2) - __a) * (_Tp(__n - 2) - __b))
                         / (_Tp(8) * __tnm3 * __tnm3 * __tnm5
                         * (_Tp(__n - 3) + __c) * __npcm2 * __npcm1);
          const _Tp __E = -__npam1 * __npbm1 * (_Tp(__n - 1) - __c)
                         / (_Tp(2) * __tnm3 * __npcm2 * __npcm1);

          _Tp __An = (_Tp(1) + __F1 * __x) * __Anm1
                   + (__E + __F2 * __x) * __x * __Anm2 + __F3 * __x3 * __Anm3;
          _Tp __Bn = (_Tp(1) + __F1 * __x) * __Bnm1
                   + (__E + __F2 * __x) * __x * __Bnm2 + __F3 * __x3 * __Bnm3;
          const _Tp __r = __An / __Bn;

          const _Tp __prec = std::abs((__F - __r) / __F);
          __F = __r;

          if (__prec < __eps || __n > __nmax)
            break;

          if (std::abs(__An) > __big || std::abs(__Bn) > __big)
            {
              __An /= __big;
              __Bn /= __big;
              __Anm1 /= __big;
              __Bnm1 /= __big;
              __Anm2 /= __big;
              __Bnm2 /= __big;
              __Anm3 /= __big;
              __Bnm3 /= __big;
            }
          else if (std::abs(__An) < _Tp(1) / __big
                || std::abs(__Bn) < _Tp(1) / __big)
            {
              __An *= __big;
              __Bn *= __big;
              __Anm1 *= __big;
              __Bnm1 *= __big;
              __Anm2 *= __big;
              __Bnm2 *= __big;
              __Anm3 *= __big;
              __Bnm3 *= __big;
            }

          ++__n;
          __Bnm3 = __Bnm2;
          __Bnm2 = __Bnm1;
          __Bnm1 = __Bn;
          __Anm3 = __Anm2;
          __Anm2 = __Anm1;
          __Anm1 = __An;
        }

      if (__n >= __nmax)
        std::__throw_runtime_error(("Iteration failed to converge " "in __hyperg_luke.")
                                                           );

      return __F;
    }
# 438 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __hyperg_reflect(_Tp __a, _Tp __b, _Tp __c, _Tp __x)
    {
      const _Tp __d = __c - __a - __b;
      const int __intd = std::floor(__d + _Tp(0.5L));
      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __toler = _Tp(1000) * __eps;
      const _Tp __log_max = std::log(std::numeric_limits<_Tp>::max());
      const bool __d_integer = (std::abs(__d - __intd) < __toler);

      if (__d_integer)
        {
          const _Tp __ln_omx = std::log(_Tp(1) - __x);
          const _Tp __ad = std::abs(__d);
          _Tp __F1, __F2;

          _Tp __d1, __d2;
          if (__d >= _Tp(0))
            {
              __d1 = __d;
              __d2 = _Tp(0);
            }
          else
            {
              __d1 = _Tp(0);
              __d2 = __d;
            }

          const _Tp __lng_c = __log_gamma(__c);


          if (__ad < __eps)
            {

              __F1 = _Tp(0);
            }
          else
            {

              bool __ok_d1 = true;
              _Tp __lng_ad, __lng_ad1, __lng_bd1;
              try
                {
                  __lng_ad = __log_gamma(__ad);
                  __lng_ad1 = __log_gamma(__a + __d1);
                  __lng_bd1 = __log_gamma(__b + __d1);
                }
              catch(...)
                {
                  __ok_d1 = false;
                }

              if (__ok_d1)
                {



                  _Tp __sum1 = _Tp(1);
                  _Tp __term = _Tp(1);
                  _Tp __ln_pre1 = __lng_ad + __lng_c + __d2 * __ln_omx
                                - __lng_ad1 - __lng_bd1;



                  for (int __i = 1; __i < __ad; ++__i)
                    {
                      const int __j = __i - 1;
                      __term *= (__a + __d2 + __j) * (__b + __d2 + __j)
                              / (_Tp(1) + __d2 + __j) / __i * (_Tp(1) - __x);
                      __sum1 += __term;
                    }

                  if (__ln_pre1 > __log_max)
                    std::__throw_runtime_error(("Overflow of gamma functions" " in __hyperg_luke.")
                                                                        );
                  else
                    __F1 = std::exp(__ln_pre1) * __sum1;
                }
              else
                {


                  __F1 = _Tp(0);
                }
            }


          bool __ok_d2 = true;
          _Tp __lng_ad2, __lng_bd2;
          try
            {
              __lng_ad2 = __log_gamma(__a + __d2);
              __lng_bd2 = __log_gamma(__b + __d2);
            }
          catch(...)
            {
              __ok_d2 = false;
            }

          if (__ok_d2)
            {


              const int __maxiter = 2000;
              const _Tp __psi_1 = -__numeric_constants<_Tp>::__gamma_e();
              const _Tp __psi_1pd = __psi(_Tp(1) + __ad);
              const _Tp __psi_apd1 = __psi(__a + __d1);
              const _Tp __psi_bpd1 = __psi(__b + __d1);

              _Tp __psi_term = __psi_1 + __psi_1pd - __psi_apd1
                             - __psi_bpd1 - __ln_omx;
              _Tp __fact = _Tp(1);
              _Tp __sum2 = __psi_term;
              _Tp __ln_pre2 = __lng_c + __d1 * __ln_omx
                            - __lng_ad2 - __lng_bd2;


              int __j;
              for (__j = 1; __j < __maxiter; ++__j)
                {


                  const _Tp __term1 = _Tp(1) / _Tp(__j)
                                    + _Tp(1) / (__ad + __j);
                  const _Tp __term2 = _Tp(1) / (__a + __d1 + _Tp(__j - 1))
                                    + _Tp(1) / (__b + __d1 + _Tp(__j - 1));
                  __psi_term += __term1 - __term2;
                  __fact *= (__a + __d1 + _Tp(__j - 1))
                          * (__b + __d1 + _Tp(__j - 1))
                          / ((__ad + __j) * __j) * (_Tp(1) - __x);
                  const _Tp __delta = __fact * __psi_term;
                  __sum2 += __delta;
                  if (std::abs(__delta) < __eps * std::abs(__sum2))
                    break;
                }
              if (__j == __maxiter)
                std::__throw_runtime_error(("Sum F2 failed to converge " "in __hyperg_reflect")
                                                                     );

              if (__sum2 == _Tp(0))
                __F2 = _Tp(0);
              else
                __F2 = std::exp(__ln_pre2) * __sum2;
            }
          else
            {


              __F2 = _Tp(0);
            }

          const _Tp __sgn_2 = (__intd % 2 == 1 ? -_Tp(1) : _Tp(1));
          const _Tp __F = __F1 + __sgn_2 * __F2;

          return __F;
        }
      else
        {




          bool __ok1 = true;
          _Tp __sgn_g1ca = _Tp(0), __ln_g1ca = _Tp(0);
          _Tp __sgn_g1cb = _Tp(0), __ln_g1cb = _Tp(0);
          try
            {
              __sgn_g1ca = __log_gamma_sign(__c - __a);
              __ln_g1ca = __log_gamma(__c - __a);
              __sgn_g1cb = __log_gamma_sign(__c - __b);
              __ln_g1cb = __log_gamma(__c - __b);
            }
          catch(...)
            {
              __ok1 = false;
            }

          bool __ok2 = true;
          _Tp __sgn_g2a = _Tp(0), __ln_g2a = _Tp(0);
          _Tp __sgn_g2b = _Tp(0), __ln_g2b = _Tp(0);
          try
            {
              __sgn_g2a = __log_gamma_sign(__a);
              __ln_g2a = __log_gamma(__a);
              __sgn_g2b = __log_gamma_sign(__b);
              __ln_g2b = __log_gamma(__b);
            }
          catch(...)
            {
              __ok2 = false;
            }

          const _Tp __sgn_gc = __log_gamma_sign(__c);
          const _Tp __ln_gc = __log_gamma(__c);
          const _Tp __sgn_gd = __log_gamma_sign(__d);
          const _Tp __ln_gd = __log_gamma(__d);
          const _Tp __sgn_gmd = __log_gamma_sign(-__d);
          const _Tp __ln_gmd = __log_gamma(-__d);

          const _Tp __sgn1 = __sgn_gc * __sgn_gd * __sgn_g1ca * __sgn_g1cb;
          const _Tp __sgn2 = __sgn_gc * __sgn_gmd * __sgn_g2a * __sgn_g2b;

          _Tp __pre1, __pre2;
          if (__ok1 && __ok2)
            {
              _Tp __ln_pre1 = __ln_gc + __ln_gd - __ln_g1ca - __ln_g1cb;
              _Tp __ln_pre2 = __ln_gc + __ln_gmd - __ln_g2a - __ln_g2b
                            + __d * std::log(_Tp(1) - __x);
              if (__ln_pre1 < __log_max && __ln_pre2 < __log_max)
                {
                  __pre1 = std::exp(__ln_pre1);
                  __pre2 = std::exp(__ln_pre2);
                  __pre1 *= __sgn1;
                  __pre2 *= __sgn2;
                }
              else
                {
                  std::__throw_runtime_error(("Overflow of gamma functions " "in __hyperg_reflect")
                                                                       );
                }
            }
          else if (__ok1 && !__ok2)
            {
              _Tp __ln_pre1 = __ln_gc + __ln_gd - __ln_g1ca - __ln_g1cb;
              if (__ln_pre1 < __log_max)
                {
                  __pre1 = std::exp(__ln_pre1);
                  __pre1 *= __sgn1;
                  __pre2 = _Tp(0);
                }
              else
                {
                  std::__throw_runtime_error(("Overflow of gamma functions " "in __hyperg_reflect")
                                                                       );
                }
            }
          else if (!__ok1 && __ok2)
            {
              _Tp __ln_pre2 = __ln_gc + __ln_gmd - __ln_g2a - __ln_g2b
                            + __d * std::log(_Tp(1) - __x);
              if (__ln_pre2 < __log_max)
                {
                  __pre1 = _Tp(0);
                  __pre2 = std::exp(__ln_pre2);
                  __pre2 *= __sgn2;
                }
              else
                {
                  std::__throw_runtime_error(("Overflow of gamma functions " "in __hyperg_reflect")
                                                                       );
                }
            }
          else
            {
              __pre1 = _Tp(0);
              __pre2 = _Tp(0);
              std::__throw_runtime_error(("Underflow of gamma functions " "in __hyperg_reflect")
                                                                   );
            }

          const _Tp __F1 = __hyperg_series(__a, __b, _Tp(1) - __d,
                                           _Tp(1) - __x);
          const _Tp __F2 = __hyperg_series(__c - __a, __c - __b, _Tp(1) + __d,
                                           _Tp(1) - __x);

          const _Tp __F = __pre1 * __F1 + __pre2 * __F2;

          return __F;
        }
    }
# 728 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/hypergeometric.tcc" 3
    template<typename _Tp>
    _Tp
    __hyperg(_Tp __a, _Tp __b, _Tp __c, _Tp __x)
    {

      const _Tp __a_nint = ::std::nearbyint(__a);
      const _Tp __b_nint = ::std::nearbyint(__b);
      const _Tp __c_nint = ::std::nearbyint(__c);





      const _Tp __toler = _Tp(1000) * std::numeric_limits<_Tp>::epsilon();
      if (std::abs(__x) >= _Tp(1))
        std::__throw_domain_error(("Argument outside unit circle " "in __hyperg.")
                                                     );
      else if (__isnan(__a) || __isnan(__b)
            || __isnan(__c) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__c_nint == __c && __c_nint <= _Tp(0))
        return std::numeric_limits<_Tp>::infinity();
      else if (std::abs(__c - __b) < __toler || std::abs(__c - __a) < __toler)
        return std::pow(_Tp(1) - __x, __c - __a - __b);
      else if (__a >= _Tp(0) && __b >= _Tp(0) && __c >= _Tp(0)
            && __x >= _Tp(0) && __x < _Tp(0.995L))
        return __hyperg_series(__a, __b, __c, __x);
      else if (std::abs(__a) < _Tp(10) && std::abs(__b) < _Tp(10))
        {


          if (__a < _Tp(0) && std::abs(__a - __a_nint) < __toler)
            return __hyperg_series(__a_nint, __b, __c, __x);
          else if (__b < _Tp(0) && std::abs(__b - __b_nint) < __toler)
            return __hyperg_series(__a, __b_nint, __c, __x);
          else if (__x < -_Tp(0.25L))
            return __hyperg_luke(__a, __b, __c, __x);
          else if (__x < _Tp(0.5L))
            return __hyperg_series(__a, __b, __c, __x);
          else
            if (std::abs(__c) > _Tp(10))
              return __hyperg_series(__a, __b, __c, __x);
            else
              return __hyperg_reflect(__a, __b, __c, __x);
        }
      else
        return __hyperg_luke(__a, __b, __c, __x);
    }
  }






}
# 53 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/legendre_function.tcc" 1 3
# 49 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/legendre_function.tcc" 3
namespace std
{

# 65 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/legendre_function.tcc" 3
  namespace __detail
  {
# 80 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/legendre_function.tcc" 3
    template<typename _Tp>
    _Tp
    __poly_legendre_p(unsigned int __l, _Tp __x)
    {

      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x == +_Tp(1))
        return +_Tp(1);
      else if (__x == -_Tp(1))
        return (__l % 2 == 1 ? -_Tp(1) : +_Tp(1));
      else
        {
          _Tp __p_lm2 = _Tp(1);
          if (__l == 0)
            return __p_lm2;

          _Tp __p_lm1 = __x;
          if (__l == 1)
            return __p_lm1;

          _Tp __p_l = 0;
          for (unsigned int __ll = 2; __ll <= __l; ++__ll)
            {


              __p_l = _Tp(2) * __x * __p_lm1 - __p_lm2
                    - (__x * __p_lm1 - __p_lm2) / _Tp(__ll);
              __p_lm2 = __p_lm1;
              __p_lm1 = __p_l;
            }

          return __p_l;
        }
    }
# 136 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/legendre_function.tcc" 3
    template<typename _Tp>
    _Tp
    __assoc_legendre_p(unsigned int __l, unsigned int __m, _Tp __x,
         _Tp __phase = _Tp(+1))
    {

      if (__m > __l)
        return _Tp(0);
      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__m == 0)
        return __poly_legendre_p(__l, __x);
      else
        {
          _Tp __p_mm = _Tp(1);
          if (__m > 0)
            {


              _Tp __root = std::sqrt(_Tp(1) - __x) * std::sqrt(_Tp(1) + __x);
              _Tp __fact = _Tp(1);
              for (unsigned int __i = 1; __i <= __m; ++__i)
                {
                  __p_mm *= __phase * __fact * __root;
                  __fact += _Tp(2);
                }
            }
          if (__l == __m)
            return __p_mm;

          _Tp __p_mp1m = _Tp(2 * __m + 1) * __x * __p_mm;
          if (__l == __m + 1)
            return __p_mp1m;

          _Tp __p_lm2m = __p_mm;
          _Tp __P_lm1m = __p_mp1m;
          _Tp __p_lm = _Tp(0);
          for (unsigned int __j = __m + 2; __j <= __l; ++__j)
            {
              __p_lm = (_Tp(2 * __j - 1) * __x * __P_lm1m
                      - _Tp(__j + __m - 1) * __p_lm2m) / _Tp(__j - __m);
              __p_lm2m = __P_lm1m;
              __P_lm1m = __p_lm;
            }

          return __p_lm;
        }
    }
# 214 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/legendre_function.tcc" 3
    template <typename _Tp>
    _Tp
    __sph_legendre(unsigned int __l, unsigned int __m, _Tp __theta)
    {
      if (__isnan(__theta))
        return std::numeric_limits<_Tp>::quiet_NaN();

      const _Tp __x = std::cos(__theta);

      if (__m > __l)
        return _Tp(0);
      else if (__m == 0)
        {
          _Tp __P = __poly_legendre_p(__l, __x);
          _Tp __fact = std::sqrt(_Tp(2 * __l + 1)
                     / (_Tp(4) * __numeric_constants<_Tp>::__pi()));
          __P *= __fact;
          return __P;
        }
      else if (__x == _Tp(1) || __x == -_Tp(1))
        {

          return _Tp(0);
        }
      else
        {





          const _Tp __sgn = ( __m % 2 == 1 ? -_Tp(1) : _Tp(1));
          const _Tp __y_mp1m_factor = __x * std::sqrt(_Tp(2 * __m + 3));

          const _Tp __lncirc = ::std::log1p(-__x * __x);





          const _Tp __lnpoch = ::std::lgamma(_Tp(__m + _Tp(0.5L)))
                             - ::std::lgamma(_Tp(__m));




          const _Tp __lnpre_val =
                    -_Tp(0.25L) * __numeric_constants<_Tp>::__lnpi()
                    + _Tp(0.5L) * (__lnpoch + __m * __lncirc);
          const _Tp __sr = std::sqrt((_Tp(2) + _Tp(1) / __m)
                         / (_Tp(4) * __numeric_constants<_Tp>::__pi()));
          _Tp __y_mm = __sgn * __sr * std::exp(__lnpre_val);
          _Tp __y_mp1m = __y_mp1m_factor * __y_mm;

          if (__l == __m)
            return __y_mm;
          else if (__l == __m + 1)
            return __y_mp1m;
          else
            {
              _Tp __y_lm = _Tp(0);


              for (unsigned int __ll = __m + 2; __ll <= __l; ++__ll)
                {
                  const _Tp __rat1 = _Tp(__ll - __m) / _Tp(__ll + __m);
                  const _Tp __rat2 = _Tp(__ll - __m - 1) / _Tp(__ll + __m - 1);
                  const _Tp __fact1 = std::sqrt(__rat1 * _Tp(2 * __ll + 1)
                                                       * _Tp(2 * __ll - 1));
                  const _Tp __fact2 = std::sqrt(__rat1 * __rat2 * _Tp(2 * __ll + 1)
                                                                / _Tp(2 * __ll - 3));
                  __y_lm = (__x * __y_mp1m * __fact1
                         - (__ll + __m - 1) * __y_mm * __fact2) / _Tp(__ll - __m);
                  __y_mm = __y_mp1m;
                  __y_mp1m = __y_lm;
                }

              return __y_lm;
            }
        }
    }
  }






}
# 54 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 1 3
# 51 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
namespace std
{

# 65 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
  namespace __detail
  {
# 83 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
    template <typename _Tp>
    void
    __bessel_ik(_Tp __nu, _Tp __x,
                _Tp & __Inu, _Tp & __Knu, _Tp & __Ipnu, _Tp & __Kpnu)
    {
      if (__x == _Tp(0))
        {
          if (__nu == _Tp(0))
            {
              __Inu = _Tp(1);
              __Ipnu = _Tp(0);
            }
          else if (__nu == _Tp(1))
            {
              __Inu = _Tp(0);
              __Ipnu = _Tp(0.5L);
            }
          else
            {
              __Inu = _Tp(0);
              __Ipnu = _Tp(0);
            }
          __Knu = std::numeric_limits<_Tp>::infinity();
          __Kpnu = -std::numeric_limits<_Tp>::infinity();
          return;
        }

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();
      const _Tp __fp_min = _Tp(10) * std::numeric_limits<_Tp>::epsilon();
      const int __max_iter = 15000;
      const _Tp __x_min = _Tp(2);

      const int __nl = static_cast<int>(__nu + _Tp(0.5L));

      const _Tp __mu = __nu - __nl;
      const _Tp __mu2 = __mu * __mu;
      const _Tp __xi = _Tp(1) / __x;
      const _Tp __xi2 = _Tp(2) * __xi;
      _Tp __h = __nu * __xi;
      if ( __h < __fp_min )
        __h = __fp_min;
      _Tp __b = __xi2 * __nu;
      _Tp __d = _Tp(0);
      _Tp __c = __h;
      int __i;
      for ( __i = 1; __i <= __max_iter; ++__i )
        {
          __b += __xi2;
          __d = _Tp(1) / (__b + __d);
          __c = __b + _Tp(1) / __c;
          const _Tp __del = __c * __d;
          __h *= __del;
          if (std::abs(__del - _Tp(1)) < __eps)
            break;
        }
      if (__i > __max_iter)
        std::__throw_runtime_error(("Argument x too large " "in __bessel_ik; " "try asymptotic expansion.")

                                                                   );
      _Tp __Inul = __fp_min;
      _Tp __Ipnul = __h * __Inul;
      _Tp __Inul1 = __Inul;
      _Tp __Ipnu1 = __Ipnul;
      _Tp __fact = __nu * __xi;
      for (int __l = __nl; __l >= 1; --__l)
        {
          const _Tp __Inutemp = __fact * __Inul + __Ipnul;
          __fact -= __xi;
          __Ipnul = __fact * __Inutemp + __Inul;
          __Inul = __Inutemp;
        }
      _Tp __f = __Ipnul / __Inul;
      _Tp __Kmu, __Knu1;
      if (__x < __x_min)
        {
          const _Tp __x2 = __x / _Tp(2);
          const _Tp __pimu = __numeric_constants<_Tp>::__pi() * __mu;
          const _Tp __fact = (std::abs(__pimu) < __eps
                            ? _Tp(1) : __pimu / std::sin(__pimu));
          _Tp __d = -std::log(__x2);
          _Tp __e = __mu * __d;
          const _Tp __fact2 = (std::abs(__e) < __eps
                            ? _Tp(1) : std::sinh(__e) / __e);
          _Tp __gam1, __gam2, __gampl, __gammi;
          __gamma_temme(__mu, __gam1, __gam2, __gampl, __gammi);
          _Tp __ff = __fact
                   * (__gam1 * std::cosh(__e) + __gam2 * __fact2 * __d);
          _Tp __sum = __ff;
          __e = std::exp(__e);
          _Tp __p = __e / (_Tp(2) * __gampl);
          _Tp __q = _Tp(1) / (_Tp(2) * __e * __gammi);
          _Tp __c = _Tp(1);
          __d = __x2 * __x2;
          _Tp __sum1 = __p;
          int __i;
          for (__i = 1; __i <= __max_iter; ++__i)
            {
              __ff = (__i * __ff + __p + __q) / (__i * __i - __mu2);
              __c *= __d / __i;
              __p /= __i - __mu;
              __q /= __i + __mu;
              const _Tp __del = __c * __ff;
              __sum += __del;
              const _Tp __del1 = __c * (__p - __i * __ff);
              __sum1 += __del1;
              if (std::abs(__del) < __eps * std::abs(__sum))
                break;
            }
          if (__i > __max_iter)
            std::__throw_runtime_error(("Bessel k series failed to converge " "in __bessel_ik.")
                                                             );
          __Kmu = __sum;
          __Knu1 = __sum1 * __xi2;
        }
      else
        {
          _Tp __b = _Tp(2) * (_Tp(1) + __x);
          _Tp __d = _Tp(1) / __b;
          _Tp __delh = __d;
          _Tp __h = __delh;
          _Tp __q1 = _Tp(0);
          _Tp __q2 = _Tp(1);
          _Tp __a1 = _Tp(0.25L) - __mu2;
          _Tp __q = __c = __a1;
          _Tp __a = -__a1;
          _Tp __s = _Tp(1) + __q * __delh;
          int __i;
          for (__i = 2; __i <= __max_iter; ++__i)
            {
              __a -= 2 * (__i - 1);
              __c = -__a * __c / __i;
              const _Tp __qnew = (__q1 - __b * __q2) / __a;
              __q1 = __q2;
              __q2 = __qnew;
              __q += __c * __qnew;
              __b += _Tp(2);
              __d = _Tp(1) / (__b + __a * __d);
              __delh = (__b * __d - _Tp(1)) * __delh;
              __h += __delh;
              const _Tp __dels = __q * __delh;
              __s += __dels;
              if ( std::abs(__dels / __s) < __eps )
                break;
            }
          if (__i > __max_iter)
            std::__throw_runtime_error(("Steed's method failed " "in __bessel_ik.")
                                                             );
          __h = __a1 * __h;
          __Kmu = std::sqrt(__numeric_constants<_Tp>::__pi() / (_Tp(2) * __x))
                * std::exp(-__x) / __s;
          __Knu1 = __Kmu * (__mu + __x + _Tp(0.5L) - __h) * __xi;
        }

      _Tp __Kpmu = __mu * __xi * __Kmu - __Knu1;
      _Tp __Inumu = __xi / (__f * __Kmu - __Kpmu);
      __Inu = __Inumu * __Inul1 / __Inul;
      __Ipnu = __Inumu * __Ipnu1 / __Inul;
      for ( __i = 1; __i <= __nl; ++__i )
        {
          const _Tp __Knutemp = (__mu + __i) * __xi2 * __Knu1 + __Kmu;
          __Kmu = __Knu1;
          __Knu1 = __Knutemp;
        }
      __Knu = __Kmu;
      __Kpnu = __nu * __xi * __Kmu - __Knu1;

      return;
    }
# 267 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_bessel_i(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_bessel_i.")
                                                           );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__x * __x < _Tp(10) * (__nu + _Tp(1)))
        return __cyl_bessel_ij_series(__nu, __x, +_Tp(1), 200);
      else
        {
          _Tp __I_nu, __K_nu, __Ip_nu, __Kp_nu;
          __bessel_ik(__nu, __x, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          return __I_nu;
        }
    }
# 303 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
    template<typename _Tp>
    _Tp
    __cyl_bessel_k(_Tp __nu, _Tp __x)
    {
      if (__nu < _Tp(0) || __x < _Tp(0))
        std::__throw_domain_error(("Bad argument " "in __cyl_bessel_k.")
                                                           );
      else if (__isnan(__nu) || __isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        {
          _Tp __I_nu, __K_nu, __Ip_nu, __Kp_nu;
          __bessel_ik(__nu, __x, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          return __K_nu;
        }
    }
# 337 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
    template <typename _Tp>
    void
    __sph_bessel_ik(unsigned int __n, _Tp __x,
                    _Tp & __i_n, _Tp & __k_n, _Tp & __ip_n, _Tp & __kp_n)
    {
      const _Tp __nu = _Tp(__n) + _Tp(0.5L);

      _Tp __I_nu, __Ip_nu, __K_nu, __Kp_nu;
      __bessel_ik(__nu, __x, __I_nu, __K_nu, __Ip_nu, __Kp_nu);

      const _Tp __factor = __numeric_constants<_Tp>::__sqrtpio2()
                         / std::sqrt(__x);

      __i_n = __factor * __I_nu;
      __k_n = __factor * __K_nu;
      __ip_n = __factor * __Ip_nu - __i_n / (_Tp(2) * __x);
      __kp_n = __factor * __Kp_nu - __k_n / (_Tp(2) * __x);

      return;
    }
# 373 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/modified_bessel_func.tcc" 3
    template <typename _Tp>
    void
    __airy(_Tp __x, _Tp & __Ai, _Tp & __Bi, _Tp & __Aip, _Tp & __Bip)
    {
      const _Tp __absx = std::abs(__x);
      const _Tp __rootx = std::sqrt(__absx);
      const _Tp __z = _Tp(2) * __absx * __rootx / _Tp(3);
      const _Tp _S_inf = std::numeric_limits<_Tp>::infinity();

      if (__isnan(__x))
        __Bip = __Aip = __Bi = __Ai = std::numeric_limits<_Tp>::quiet_NaN();
      else if (__z == _S_inf)
        {
   __Aip = __Ai = _Tp(0);
   __Bip = __Bi = _S_inf;
 }
      else if (__z == -_S_inf)
 __Bip = __Aip = __Bi = __Ai = _Tp(0);
      else if (__x > _Tp(0))
        {
          _Tp __I_nu, __Ip_nu, __K_nu, __Kp_nu;

          __bessel_ik(_Tp(1) / _Tp(3), __z, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          __Ai = __rootx * __K_nu
               / (__numeric_constants<_Tp>::__sqrt3()
                * __numeric_constants<_Tp>::__pi());
          __Bi = __rootx * (__K_nu / __numeric_constants<_Tp>::__pi()
                 + _Tp(2) * __I_nu / __numeric_constants<_Tp>::__sqrt3());

          __bessel_ik(_Tp(2) / _Tp(3), __z, __I_nu, __K_nu, __Ip_nu, __Kp_nu);
          __Aip = -__x * __K_nu
                / (__numeric_constants<_Tp>::__sqrt3()
                 * __numeric_constants<_Tp>::__pi());
          __Bip = __x * (__K_nu / __numeric_constants<_Tp>::__pi()
                      + _Tp(2) * __I_nu
                      / __numeric_constants<_Tp>::__sqrt3());
        }
      else if (__x < _Tp(0))
        {
          _Tp __J_nu, __Jp_nu, __N_nu, __Np_nu;

          __bessel_jn(_Tp(1) / _Tp(3), __z, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          __Ai = __rootx * (__J_nu
                    - __N_nu / __numeric_constants<_Tp>::__sqrt3()) / _Tp(2);
          __Bi = -__rootx * (__N_nu
                    + __J_nu / __numeric_constants<_Tp>::__sqrt3()) / _Tp(2);

          __bessel_jn(_Tp(2) / _Tp(3), __z, __J_nu, __N_nu, __Jp_nu, __Np_nu);
          __Aip = __absx * (__N_nu / __numeric_constants<_Tp>::__sqrt3()
                          + __J_nu) / _Tp(2);
          __Bip = __absx * (__J_nu / __numeric_constants<_Tp>::__sqrt3()
                          - __N_nu) / _Tp(2);
        }
      else
        {



          __Ai = _Tp(0.35502805388781723926L);
          __Bi = __Ai * __numeric_constants<_Tp>::__sqrt3();




          __Aip = -_Tp(0.25881940379280679840L);
          __Bip = -__Aip * __numeric_constants<_Tp>::__sqrt3();
        }

      return;
    }
  }





}
# 55 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_hermite.tcc" 1 3
# 42 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_hermite.tcc" 3
namespace std
{

# 56 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_hermite.tcc" 3
  namespace __detail
  {
# 72 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_hermite.tcc" 3
    template<typename _Tp>
    _Tp
    __poly_hermite_recursion(unsigned int __n, _Tp __x)
    {

      _Tp __H_0 = 1;
      if (__n == 0)
        return __H_0;


      _Tp __H_1 = 2 * __x;
      if (__n == 1)
        return __H_1;


      _Tp __H_n, __H_nm1, __H_nm2;
      unsigned int __i;
      for (__H_nm2 = __H_0, __H_nm1 = __H_1, __i = 2; __i <= __n; ++__i)
        {
          __H_n = 2 * (__x * __H_nm1 - (__i - 1) * __H_nm2);
          __H_nm2 = __H_nm1;
          __H_nm1 = __H_n;
        }

      return __H_n;
    }
# 114 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_hermite.tcc" 3
    template<typename _Tp>
    inline _Tp
    __poly_hermite(unsigned int __n, _Tp __x)
    {
      if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else
        return __poly_hermite_recursion(__n, __x);
    }
  }





}
# 56 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 1 3
# 44 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
namespace std
{

# 60 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
  namespace __detail
  {
# 75 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre_large_n(unsigned __n, _Tpa __alpha1, _Tp __x)
    {
      const _Tp __a = -_Tp(__n);
      const _Tp __b = _Tp(__alpha1) + _Tp(1);
      const _Tp __eta = _Tp(2) * __b - _Tp(4) * __a;
      const _Tp __cos2th = __x / __eta;
      const _Tp __sin2th = _Tp(1) - __cos2th;
      const _Tp __th = std::acos(std::sqrt(__cos2th));
      const _Tp __pre_h = __numeric_constants<_Tp>::__pi_2()
                        * __numeric_constants<_Tp>::__pi_2()
                        * __eta * __eta * __cos2th * __sin2th;


      const _Tp __lg_b = ::std::lgamma(_Tp(__n) + __b);
      const _Tp __lnfact = ::std::lgamma(_Tp(__n + 1));





      _Tp __pre_term1 = _Tp(0.5L) * (_Tp(1) - __b)
                      * std::log(_Tp(0.25L) * __x * __eta);
      _Tp __pre_term2 = _Tp(0.25L) * std::log(__pre_h);
      _Tp __lnpre = __lg_b - __lnfact + _Tp(0.5L) * __x
                      + __pre_term1 - __pre_term2;
      _Tp __ser_term1 = std::sin(__a * __numeric_constants<_Tp>::__pi());
      _Tp __ser_term2 = std::sin(_Tp(0.25L) * __eta
                              * (_Tp(2) * __th
                               - std::sin(_Tp(2) * __th))
                               + __numeric_constants<_Tp>::__pi_4());
      _Tp __ser = __ser_term1 + __ser_term2;

      return std::exp(__lnpre) * __ser;
    }
# 129 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre_hyperg(unsigned int __n, _Tpa __alpha1, _Tp __x)
    {
      const _Tp __b = _Tp(__alpha1) + _Tp(1);
      const _Tp __mx = -__x;
      const _Tp __tc_sgn = (__x < _Tp(0) ? _Tp(1)
                         : ((__n % 2 == 1) ? -_Tp(1) : _Tp(1)));

      _Tp __tc = _Tp(1);
      const _Tp __ax = std::abs(__x);
      for (unsigned int __k = 1; __k <= __n; ++__k)
        __tc *= (__ax / __k);

      _Tp __term = __tc * __tc_sgn;
      _Tp __sum = __term;
      for (int __k = int(__n) - 1; __k >= 0; --__k)
        {
          __term *= ((__b + _Tp(__k)) / _Tp(int(__n) - __k))
                  * _Tp(__k + 1) / __mx;
          __sum += __term;
        }

      return __sum;
    }
# 185 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre_recursion(unsigned int __n, _Tpa __alpha1, _Tp __x)
    {

      _Tp __l_0 = _Tp(1);
      if (__n == 0)
        return __l_0;


      _Tp __l_1 = -__x + _Tp(1) + _Tp(__alpha1);
      if (__n == 1)
        return __l_1;


      _Tp __l_n2 = __l_0;
      _Tp __l_n1 = __l_1;
      _Tp __l_n = _Tp(0);
      for (unsigned int __nn = 2; __nn <= __n; ++__nn)
        {
            __l_n = (_Tp(2 * __nn - 1) + _Tp(__alpha1) - __x)
                  * __l_n1 / _Tp(__nn)
                  - (_Tp(__nn - 1) + _Tp(__alpha1)) * __l_n2 / _Tp(__nn);
            __l_n2 = __l_n1;
            __l_n1 = __l_n;
        }

      return __l_n;
    }
# 244 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
    template<typename _Tpa, typename _Tp>
    _Tp
    __poly_laguerre(unsigned int __n, _Tpa __alpha1, _Tp __x)
    {
      if (__x < _Tp(0))
        std::__throw_domain_error(("Negative argument " "in __poly_laguerre.")
                                                            );

      else if (__isnan(__x))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__n == 0)
        return _Tp(1);
      else if (__n == 1)
        return _Tp(1) + _Tp(__alpha1) - __x;
      else if (__x == _Tp(0))
        {
          _Tp __prod = _Tp(__alpha1) + _Tp(1);
          for (unsigned int __k = 2; __k <= __n; ++__k)
            __prod *= (_Tp(__alpha1) + _Tp(__k)) / _Tp(__k);
          return __prod;
        }
      else if (__n > 10000000 && _Tp(__alpha1) > -_Tp(1)
            && __x < _Tp(2) * (_Tp(__alpha1) + _Tp(1)) + _Tp(4 * __n))
        return __poly_laguerre_large_n(__n, __alpha1, __x);
      else if (_Tp(__alpha1) >= _Tp(0)
           || (__x > _Tp(0) && _Tp(__alpha1) < -_Tp(__n + 1)))
        return __poly_laguerre_recursion(__n, __alpha1, __x);
      else
        return __poly_laguerre_hyperg(__n, __alpha1, __x);
    }
# 296 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
    template<typename _Tp>
    inline _Tp
    __assoc_laguerre(unsigned int __n, unsigned int __m, _Tp __x)
    { return __poly_laguerre<unsigned int, _Tp>(__n, __m, __x); }
# 316 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/poly_laguerre.tcc" 3
    template<typename _Tp>
    inline _Tp
    __laguerre(unsigned int __n, _Tp __x)
    { return __poly_laguerre<unsigned int, _Tp>(__n, 0, __x); }
  }






}
# 57 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 1 3
# 47 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
namespace std
{

# 63 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
  namespace __detail
  {
# 78 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_sum(_Tp __s)
    {

      if (__s < _Tp(1))
        std::__throw_domain_error(("Bad argument in zeta sum."));

      const unsigned int max_iter = 10000;
      _Tp __zeta = _Tp(0);
      for (unsigned int __k = 1; __k < max_iter; ++__k)
        {
          _Tp __term = std::pow(static_cast<_Tp>(__k), -__s);
          if (__term < std::numeric_limits<_Tp>::epsilon())
            {
              break;
            }
          __zeta += __term;
        }

      return __zeta;
    }
# 115 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_alt(_Tp __s)
    {
      _Tp __sgn = _Tp(1);
      _Tp __zeta = _Tp(0);
      for (unsigned int __i = 1; __i < 10000000; ++__i)
        {
          _Tp __term = __sgn / std::pow(__i, __s);
          if (std::abs(__term) < std::numeric_limits<_Tp>::epsilon())
            break;
          __zeta += __term;
          __sgn *= _Tp(-1);
        }
      __zeta /= _Tp(1) - std::pow(_Tp(2), _Tp(1) - __s);

      return __zeta;
    }
# 157 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_glob(_Tp __s)
    {
      _Tp __zeta = _Tp(0);

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      const _Tp __max_bincoeff = std::numeric_limits<_Tp>::max_exponent10
                               * std::log(_Tp(10)) - _Tp(1);



      if (__s < _Tp(0))
        {

          if (::std::fmod(__s,_Tp(2)) == _Tp(0))
            return _Tp(0);
          else

            {
              _Tp __zeta = __riemann_zeta_glob(_Tp(1) - __s);
              __zeta *= std::pow(_Tp(2)
                     * __numeric_constants<_Tp>::__pi(), __s)
                     * std::sin(__numeric_constants<_Tp>::__pi_2() * __s)

                     * std::exp(::std::lgamma(_Tp(1) - __s))



                     / __numeric_constants<_Tp>::__pi();
              return __zeta;
            }
        }

      _Tp __num = _Tp(0.5L);
      const unsigned int __maxit = 10000;
      for (unsigned int __i = 0; __i < __maxit; ++__i)
        {
          bool __punt = false;
          _Tp __sgn = _Tp(1);
          _Tp __term = _Tp(0);
          for (unsigned int __j = 0; __j <= __i; ++__j)
            {

              _Tp __bincoeff = ::std::lgamma(_Tp(1 + __i))
                              - ::std::lgamma(_Tp(1 + __j))
                              - ::std::lgamma(_Tp(1 + __i - __j));





              if (__bincoeff > __max_bincoeff)
                {

                  __punt = true;
                  break;
                }
              __bincoeff = std::exp(__bincoeff);
              __term += __sgn * __bincoeff * std::pow(_Tp(1 + __j), -__s);
              __sgn *= _Tp(-1);
            }
          if (__punt)
            break;
          __term *= __num;
          __zeta += __term;
          if (std::abs(__term/__zeta) < __eps)
            break;
          __num *= _Tp(0.5L);
        }

      __zeta /= _Tp(1) - std::pow(_Tp(2), _Tp(1) - __s);

      return __zeta;
    }
# 252 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta_product(_Tp __s)
    {
      static const _Tp __prime[] = {
        _Tp(2), _Tp(3), _Tp(5), _Tp(7), _Tp(11), _Tp(13), _Tp(17), _Tp(19),
        _Tp(23), _Tp(29), _Tp(31), _Tp(37), _Tp(41), _Tp(43), _Tp(47),
        _Tp(53), _Tp(59), _Tp(61), _Tp(67), _Tp(71), _Tp(73), _Tp(79),
        _Tp(83), _Tp(89), _Tp(97), _Tp(101), _Tp(103), _Tp(107), _Tp(109)
      };
      static const unsigned int __num_primes = sizeof(__prime) / sizeof(_Tp);

      _Tp __zeta = _Tp(1);
      for (unsigned int __i = 0; __i < __num_primes; ++__i)
        {
          const _Tp __fact = _Tp(1) - std::pow(__prime[__i], -__s);
          __zeta *= __fact;
          if (_Tp(1) - __fact < std::numeric_limits<_Tp>::epsilon())
            break;
        }

      __zeta = _Tp(1) / __zeta;

      return __zeta;
    }
# 293 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __riemann_zeta(_Tp __s)
    {
      if (__isnan(__s))
        return std::numeric_limits<_Tp>::quiet_NaN();
      else if (__s == _Tp(1))
        return std::numeric_limits<_Tp>::infinity();
      else if (__s < -_Tp(19))
        {
          _Tp __zeta = __riemann_zeta_product(_Tp(1) - __s);
          __zeta *= std::pow(_Tp(2) * __numeric_constants<_Tp>::__pi(), __s)
                 * std::sin(__numeric_constants<_Tp>::__pi_2() * __s)

                 * std::exp(::std::lgamma(_Tp(1) - __s))



                 / __numeric_constants<_Tp>::__pi();
          return __zeta;
        }
      else if (__s < _Tp(20))
        {

          bool __glob = true;
          if (__glob)
            return __riemann_zeta_glob(__s);
          else
            {
              if (__s > _Tp(1))
                return __riemann_zeta_sum(__s);
              else
                {
                  _Tp __zeta = std::pow(_Tp(2)
                                * __numeric_constants<_Tp>::__pi(), __s)
                         * std::sin(__numeric_constants<_Tp>::__pi_2() * __s)

                             * ::std::tgamma(_Tp(1) - __s)



                             * __riemann_zeta_sum(_Tp(1) - __s);
                  return __zeta;
                }
            }
        }
      else
        return __riemann_zeta_product(__s);
    }
# 365 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    _Tp
    __hurwitz_zeta_glob(_Tp __a, _Tp __s)
    {
      _Tp __zeta = _Tp(0);

      const _Tp __eps = std::numeric_limits<_Tp>::epsilon();

      const _Tp __max_bincoeff = std::numeric_limits<_Tp>::max_exponent10
                               * std::log(_Tp(10)) - _Tp(1);

      const unsigned int __maxit = 10000;
      for (unsigned int __i = 0; __i < __maxit; ++__i)
        {
          bool __punt = false;
          _Tp __sgn = _Tp(1);
          _Tp __term = _Tp(0);
          for (unsigned int __j = 0; __j <= __i; ++__j)
            {

              _Tp __bincoeff = ::std::lgamma(_Tp(1 + __i))
                              - ::std::lgamma(_Tp(1 + __j))
                              - ::std::lgamma(_Tp(1 + __i - __j));





              if (__bincoeff > __max_bincoeff)
                {

                  __punt = true;
                  break;
                }
              __bincoeff = std::exp(__bincoeff);
              __term += __sgn * __bincoeff * std::pow(_Tp(__a + __j), -__s);
              __sgn *= _Tp(-1);
            }
          if (__punt)
            break;
          __term /= _Tp(__i + 1);
          if (std::abs(__term / __zeta) < __eps)
            break;
          __zeta += __term;
        }

      __zeta /= __s - _Tp(1);

      return __zeta;
    }
# 430 "C:/msys64/ucrt64/include/c++/14.2.0/tr1/riemann_zeta.tcc" 3
    template<typename _Tp>
    inline _Tp
    __hurwitz_zeta(_Tp __a, _Tp __s)
    { return __hurwitz_zeta_glob(__a, __s); }
  }






}
# 58 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 2 3

namespace std
{

# 203 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  assoc_laguerref(unsigned int __n, unsigned int __m, float __x)
  { return __detail::__assoc_laguerre<float>(__n, __m, __x); }







  inline long double
  assoc_laguerrel(unsigned int __n, unsigned int __m, long double __x)
  { return __detail::__assoc_laguerre<long double>(__n, __m, __x); }
# 248 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    assoc_laguerre(unsigned int __n, unsigned int __m, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__assoc_laguerre<__type>(__n, __m, __x);
    }
# 264 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  assoc_legendref(unsigned int __l, unsigned int __m, float __x)
  { return __detail::__assoc_legendre_p<float>(__l, __m, __x); }






  inline long double
  assoc_legendrel(unsigned int __l, unsigned int __m, long double __x)
  { return __detail::__assoc_legendre_p<long double>(__l, __m, __x); }
# 294 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    assoc_legendre(unsigned int __l, unsigned int __m, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__assoc_legendre_p<__type>(__l, __m, __x);
    }
# 309 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  betaf(float __a, float __b)
  { return __detail::__beta<float>(__a, __b); }







  inline long double
  betal(long double __a, long double __b)
  { return __detail::__beta<long double>(__a, __b); }
# 339 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpa, typename _Tpb>
    inline typename __gnu_cxx::__promote_2<_Tpa, _Tpb>::__type
    beta(_Tpa __a, _Tpb __b)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpa, _Tpb>::__type __type;
      return __detail::__beta<__type>(__a, __b);
    }
# 355 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  comp_ellint_1f(float __k)
  { return __detail::__comp_ellint_1<float>(__k); }







  inline long double
  comp_ellint_1l(long double __k)
  { return __detail::__comp_ellint_1<long double>(__k); }
# 387 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    comp_ellint_1(_Tp __k)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__comp_ellint_1<__type>(__k);
    }
# 403 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  comp_ellint_2f(float __k)
  { return __detail::__comp_ellint_2<float>(__k); }







  inline long double
  comp_ellint_2l(long double __k)
  { return __detail::__comp_ellint_2<long double>(__k); }
# 434 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    comp_ellint_2(_Tp __k)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__comp_ellint_2<__type>(__k);
    }
# 450 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  comp_ellint_3f(float __k, float __nu)
  { return __detail::__comp_ellint_3<float>(__k, __nu); }







  inline long double
  comp_ellint_3l(long double __k, long double __nu)
  { return __detail::__comp_ellint_3<long double>(__k, __nu); }
# 485 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp, typename _Tpn>
    inline typename __gnu_cxx::__promote_2<_Tp, _Tpn>::__type
    comp_ellint_3(_Tp __k, _Tpn __nu)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Tpn>::__type __type;
      return __detail::__comp_ellint_3<__type>(__k, __nu);
    }
# 501 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  cyl_bessel_if(float __nu, float __x)
  { return __detail::__cyl_bessel_i<float>(__nu, __x); }







  inline long double
  cyl_bessel_il(long double __nu, long double __x)
  { return __detail::__cyl_bessel_i<long double>(__nu, __x); }
# 531 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_bessel_i(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_bessel_i<__type>(__nu, __x);
    }
# 547 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  cyl_bessel_jf(float __nu, float __x)
  { return __detail::__cyl_bessel_j<float>(__nu, __x); }







  inline long double
  cyl_bessel_jl(long double __nu, long double __x)
  { return __detail::__cyl_bessel_j<long double>(__nu, __x); }
# 577 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_bessel_j(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_bessel_j<__type>(__nu, __x);
    }
# 593 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  cyl_bessel_kf(float __nu, float __x)
  { return __detail::__cyl_bessel_k<float>(__nu, __x); }







  inline long double
  cyl_bessel_kl(long double __nu, long double __x)
  { return __detail::__cyl_bessel_k<long double>(__nu, __x); }
# 629 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_bessel_k(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_bessel_k<__type>(__nu, __x);
    }
# 645 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  cyl_neumannf(float __nu, float __x)
  { return __detail::__cyl_neumann_n<float>(__nu, __x); }







  inline long double
  cyl_neumannl(long double __nu, long double __x)
  { return __detail::__cyl_neumann_n<long double>(__nu, __x); }
# 677 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpnu, typename _Tp>
    inline typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type
    cyl_neumann(_Tpnu __nu, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tpnu, _Tp>::__type __type;
      return __detail::__cyl_neumann_n<__type>(__nu, __x);
    }
# 693 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  ellint_1f(float __k, float __phi)
  { return __detail::__ellint_1<float>(__k, __phi); }







  inline long double
  ellint_1l(long double __k, long double __phi)
  { return __detail::__ellint_1<long double>(__k, __phi); }
# 725 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp, typename _Tpp>
    inline typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type
    ellint_1(_Tp __k, _Tpp __phi)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type __type;
      return __detail::__ellint_1<__type>(__k, __phi);
    }
# 741 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  ellint_2f(float __k, float __phi)
  { return __detail::__ellint_2<float>(__k, __phi); }







  inline long double
  ellint_2l(long double __k, long double __phi)
  { return __detail::__ellint_2<long double>(__k, __phi); }
# 773 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp, typename _Tpp>
    inline typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type
    ellint_2(_Tp __k, _Tpp __phi)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Tpp>::__type __type;
      return __detail::__ellint_2<__type>(__k, __phi);
    }
# 789 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  ellint_3f(float __k, float __nu, float __phi)
  { return __detail::__ellint_3<float>(__k, __nu, __phi); }







  inline long double
  ellint_3l(long double __k, long double __nu, long double __phi)
  { return __detail::__ellint_3<long double>(__k, __nu, __phi); }
# 826 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp, typename _Tpn, typename _Tpp>
    inline typename __gnu_cxx::__promote_3<_Tp, _Tpn, _Tpp>::__type
    ellint_3(_Tp __k, _Tpn __nu, _Tpp __phi)
    {
      typedef typename __gnu_cxx::__promote_3<_Tp, _Tpn, _Tpp>::__type __type;
      return __detail::__ellint_3<__type>(__k, __nu, __phi);
    }
# 841 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  expintf(float __x)
  { return __detail::__expint<float>(__x); }







  inline long double
  expintl(long double __x)
  { return __detail::__expint<long double>(__x); }
# 866 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    expint(_Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__expint<__type>(__x);
    }
# 882 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  hermitef(unsigned int __n, float __x)
  { return __detail::__poly_hermite<float>(__n, __x); }







  inline long double
  hermitel(unsigned int __n, long double __x)
  { return __detail::__poly_hermite<long double>(__n, __x); }
# 914 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    hermite(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__poly_hermite<__type>(__n, __x);
    }
# 930 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  laguerref(unsigned int __n, float __x)
  { return __detail::__laguerre<float>(__n, __x); }







  inline long double
  laguerrel(unsigned int __n, long double __x)
  { return __detail::__laguerre<long double>(__n, __x); }
# 958 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    laguerre(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__laguerre<__type>(__n, __x);
    }
# 974 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  legendref(unsigned int __l, float __x)
  { return __detail::__poly_legendre_p<float>(__l, __x); }







  inline long double
  legendrel(unsigned int __l, long double __x)
  { return __detail::__poly_legendre_p<long double>(__l, __x); }
# 1003 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    legendre(unsigned int __l, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__poly_legendre_p<__type>(__l, __x);
    }
# 1019 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  riemann_zetaf(float __s)
  { return __detail::__riemann_zeta<float>(__s); }







  inline long double
  riemann_zetal(long double __s)
  { return __detail::__riemann_zeta<long double>(__s); }
# 1054 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    riemann_zeta(_Tp __s)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__riemann_zeta<__type>(__s);
    }
# 1070 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  sph_besself(unsigned int __n, float __x)
  { return __detail::__sph_bessel<float>(__n, __x); }







  inline long double
  sph_bessell(unsigned int __n, long double __x)
  { return __detail::__sph_bessel<long double>(__n, __x); }
# 1098 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    sph_bessel(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__sph_bessel<__type>(__n, __x);
    }
# 1114 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  sph_legendref(unsigned int __l, unsigned int __m, float __theta)
  { return __detail::__sph_legendre<float>(__l, __m, __theta); }
# 1125 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline long double
  sph_legendrel(unsigned int __l, unsigned int __m, long double __theta)
  { return __detail::__sph_legendre<long double>(__l, __m, __theta); }
# 1145 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    sph_legendre(unsigned int __l, unsigned int __m, _Tp __theta)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__sph_legendre<__type>(__l, __m, __theta);
    }
# 1161 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  sph_neumannf(unsigned int __n, float __x)
  { return __detail::__sph_neumann<float>(__n, __x); }







  inline long double
  sph_neumannl(unsigned int __n, long double __x)
  { return __detail::__sph_neumann<long double>(__n, __x); }
# 1189 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    sph_neumann(unsigned int __n, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __detail::__sph_neumann<__type>(__n, __x);
    }




}


namespace __gnu_cxx
{

# 1216 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  airy_aif(float __x)
  {
    float __Ai, __Bi, __Aip, __Bip;
    std::__detail::__airy<float>(__x, __Ai, __Bi, __Aip, __Bip);
    return __Ai;
  }




  inline long double
  airy_ail(long double __x)
  {
    long double __Ai, __Bi, __Aip, __Bip;
    std::__detail::__airy<long double>(__x, __Ai, __Bi, __Aip, __Bip);
    return __Ai;
  }




  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    airy_ai(_Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      __type __Ai, __Bi, __Aip, __Bip;
      std::__detail::__airy<__type>(__x, __Ai, __Bi, __Aip, __Bip);
      return __Ai;
    }




  inline float
  airy_bif(float __x)
  {
    float __Ai, __Bi, __Aip, __Bip;
    std::__detail::__airy<float>(__x, __Ai, __Bi, __Aip, __Bip);
    return __Bi;
  }




  inline long double
  airy_bil(long double __x)
  {
    long double __Ai, __Bi, __Aip, __Bip;
    std::__detail::__airy<long double>(__x, __Ai, __Bi, __Aip, __Bip);
    return __Bi;
  }




  template<typename _Tp>
    inline typename __gnu_cxx::__promote<_Tp>::__type
    airy_bi(_Tp __x)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      __type __Ai, __Bi, __Aip, __Bip;
      std::__detail::__airy<__type>(__x, __Ai, __Bi, __Aip, __Bip);
      return __Bi;
    }
# 1292 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  conf_hypergf(float __a, float __c, float __x)
  { return std::__detail::__conf_hyperg<float>(__a, __c, __x); }
# 1303 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline long double
  conf_hypergl(long double __a, long double __c, long double __x)
  { return std::__detail::__conf_hyperg<long double>(__a, __c, __x); }
# 1323 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpa, typename _Tpc, typename _Tp>
    inline typename __gnu_cxx::__promote_3<_Tpa, _Tpc, _Tp>::__type
    conf_hyperg(_Tpa __a, _Tpc __c, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_3<_Tpa, _Tpc, _Tp>::__type __type;
      return std::__detail::__conf_hyperg<__type>(__a, __c, __x);
    }
# 1340 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline float
  hypergf(float __a, float __b, float __c, float __x)
  { return std::__detail::__hyperg<float>(__a, __b, __c, __x); }
# 1351 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  inline long double
  hypergl(long double __a, long double __b, long double __c, long double __x)
  { return std::__detail::__hyperg<long double>(__a, __b, __c, __x); }
# 1372 "C:/msys64/ucrt64/include/c++/14.2.0/bits/specfun.h" 3
  template<typename _Tpa, typename _Tpb, typename _Tpc, typename _Tp>
    inline typename __gnu_cxx::__promote_4<_Tpa, _Tpb, _Tpc, _Tp>::__type
    hyperg(_Tpa __a, _Tpb __b, _Tpc __c, _Tp __x)
    {
      typedef typename __gnu_cxx::__promote_4<_Tpa, _Tpb, _Tpc, _Tp>
  ::__type __type;
      return std::__detail::__hyperg<__type>(__a, __b, __c, __x);
    }



}
# 3899 "C:/msys64/ucrt64/include/c++/14.2.0/cmath" 2 3


}
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/math.h" 2 3

using std::abs;
using std::acos;
using std::asin;
using std::atan;
using std::atan2;
using std::cos;
using std::sin;
using std::tan;
using std::cosh;
using std::sinh;
using std::tanh;
using std::exp;
using std::frexp;
using std::ldexp;
using std::log;
using std::log10;
using std::modf;
using std::pow;
using std::sqrt;
using std::ceil;
using std::fabs;
using std::floor;
using std::fmod;


using std::fpclassify;
using std::isfinite;
using std::isinf;
using std::isnan;
using std::isnormal;
using std::signbit;
using std::isgreater;
using std::isgreaterequal;
using std::isless;
using std::islessequal;
using std::islessgreater;
using std::isunordered;



using std::acosh;
using std::asinh;
using std::atanh;
using std::cbrt;
using std::copysign;
using std::erf;
using std::erfc;
using std::exp2;
using std::expm1;
using std::fdim;
using std::fma;
using std::fmax;
using std::fmin;
using std::hypot;
using std::ilogb;
using std::lgamma;
using std::llrint;
using std::llround;
using std::log1p;
using std::log2;
using std::logb;
using std::lrint;
using std::lround;
using std::nearbyint;
using std::nextafter;
using std::nexttoward;
using std::remainder;
using std::remquo;
using std::rint;
using std::round;
using std::scalbln;
using std::scalbn;
using std::tgamma;
using std::trunc;
# 183 "C:/msys64/ucrt64/include/c++/14.2.0/math.h" 3
using std::lerp;
# 167 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raymath.h" 2







# 173 "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/raylib-src/src/raymath.h"
inline float Clamp(float value, float min, float max)
{
    float result = (value < min)? min : value;

    if (result > max) result = max;

    return result;
}


inline float Lerp(float start, float end, float amount)
{
    float result = start + amount*(end - start);

    return result;
}


inline float Normalize(float value, float start, float end)
{
    float result = (value - start)/(end - start);

    return result;
}


inline float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd)
{
    float result = (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;

    return result;
}


inline float Wrap(float value, float min, float max)
{
    float result = value - (max - min)*floorf((value - min)/(max - min));

    return result;
}


inline int FloatEquals(float x, float y)
{




    int result = (fabsf(x - y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(x), fabsf(y))));

    return result;
}






inline Vector2 Vector2Zero(void)
{
    Vector2 result = { 0.0f, 0.0f };

    return result;
}


inline Vector2 Vector2One(void)
{
    Vector2 result = { 1.0f, 1.0f };

    return result;
}


inline Vector2 Vector2Add(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x + v2.x, v1.y + v2.y };

    return result;
}


inline Vector2 Vector2AddValue(Vector2 v, float add)
{
    Vector2 result = { v.x + add, v.y + add };

    return result;
}


inline Vector2 Vector2Subtract(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x - v2.x, v1.y - v2.y };

    return result;
}


inline Vector2 Vector2SubtractValue(Vector2 v, float sub)
{
    Vector2 result = { v.x - sub, v.y - sub };

    return result;
}


inline float Vector2Length(Vector2 v)
{
    float result = sqrtf((v.x*v.x) + (v.y*v.y));

    return result;
}


inline float Vector2LengthSqr(Vector2 v)
{
    float result = (v.x*v.x) + (v.y*v.y);

    return result;
}


inline float Vector2DotProduct(Vector2 v1, Vector2 v2)
{
    float result = (v1.x*v2.x + v1.y*v2.y);

    return result;
}


inline float Vector2Distance(Vector2 v1, Vector2 v2)
{
    float result = sqrtf((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y));

    return result;
}


inline float Vector2DistanceSqr(Vector2 v1, Vector2 v2)
{
    float result = ((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y));

    return result;
}



inline float Vector2Angle(Vector2 v1, Vector2 v2)
{
    float result = 0.0f;

    float dot = v1.x*v2.x + v1.y*v2.y;
    float det = v1.x*v2.y - v1.y*v2.x;

    result = atan2f(det, dot);

    return result;
}




inline float Vector2LineAngle(Vector2 start, Vector2 end)
{
    float result = 0.0f;


    result = -atan2f(end.y - start.y, end.x - start.x);

    return result;
}


inline Vector2 Vector2Scale(Vector2 v, float scale)
{
    Vector2 result = { v.x*scale, v.y*scale };

    return result;
}


inline Vector2 Vector2Multiply(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x*v2.x, v1.y*v2.y };

    return result;
}


inline Vector2 Vector2Negate(Vector2 v)
{
    Vector2 result = { -v.x, -v.y };

    return result;
}


inline Vector2 Vector2Divide(Vector2 v1, Vector2 v2)
{
    Vector2 result = { v1.x/v2.x, v1.y/v2.y };

    return result;
}


inline Vector2 Vector2Normalize(Vector2 v)
{
    Vector2 result = { 0 };
    float length = sqrtf((v.x*v.x) + (v.y*v.y));

    if (length > 0)
    {
        float ilength = 1.0f/length;
        result.x = v.x*ilength;
        result.y = v.y*ilength;
    }

    return result;
}


inline Vector2 Vector2Transform(Vector2 v, Matrix mat)
{
    Vector2 result = { 0 };

    float x = v.x;
    float y = v.y;
    float z = 0;

    result.x = mat.m0*x + mat.m4*y + mat.m8*z + mat.m12;
    result.y = mat.m1*x + mat.m5*y + mat.m9*z + mat.m13;

    return result;
}


inline Vector2 Vector2Lerp(Vector2 v1, Vector2 v2, float amount)
{
    Vector2 result = { 0 };

    result.x = v1.x + amount*(v2.x - v1.x);
    result.y = v1.y + amount*(v2.y - v1.y);

    return result;
}


inline Vector2 Vector2Reflect(Vector2 v, Vector2 normal)
{
    Vector2 result = { 0 };

    float dotProduct = (v.x*normal.x + v.y*normal.y);

    result.x = v.x - (2.0f*normal.x)*dotProduct;
    result.y = v.y - (2.0f*normal.y)*dotProduct;

    return result;
}


inline Vector2 Vector2Rotate(Vector2 v, float angle)
{
    Vector2 result = { 0 };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.x = v.x*cosres - v.y*sinres;
    result.y = v.x*sinres + v.y*cosres;

    return result;
}


inline Vector2 Vector2MoveTowards(Vector2 v, Vector2 target, float maxDistance)
{
    Vector2 result = { 0 };

    float dx = target.x - v.x;
    float dy = target.y - v.y;
    float value = (dx*dx) + (dy*dy);

    if ((value == 0) || ((maxDistance >= 0) && (value <= maxDistance*maxDistance))) return target;

    float dist = sqrtf(value);

    result.x = v.x + dx/dist*maxDistance;
    result.y = v.y + dy/dist*maxDistance;

    return result;
}


inline Vector2 Vector2Invert(Vector2 v)
{
    Vector2 result = { 1.0f/v.x, 1.0f/v.y };

    return result;
}



inline Vector2 Vector2Clamp(Vector2 v, Vector2 min, Vector2 max)
{
    Vector2 result = { 0 };

    result.x = fminf(max.x, fmaxf(min.x, v.x));
    result.y = fminf(max.y, fmaxf(min.y, v.y));

    return result;
}


inline Vector2 Vector2ClampValue(Vector2 v, float min, float max)
{
    Vector2 result = v;

    float length = (v.x*v.x) + (v.y*v.y);
    if (length > 0.0f)
    {
        length = sqrtf(length);

        if (length < min)
        {
            float scale = min/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
        }
        else if (length > max)
        {
            float scale = max/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
        }
    }

    return result;
}


inline int Vector2Equals(Vector2 p, Vector2 q)
{




    int result = ((fabsf(p.x - q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                  ((fabsf(p.y - q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y)))));

    return result;
}






inline Vector3 Vector3Zero(void)
{
    Vector3 result = { 0.0f, 0.0f, 0.0f };

    return result;
}


inline Vector3 Vector3One(void)
{
    Vector3 result = { 1.0f, 1.0f, 1.0f };

    return result;
}


inline Vector3 Vector3Add(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x + v2.x, v1.y + v2.y, v1.z + v2.z };

    return result;
}


inline Vector3 Vector3AddValue(Vector3 v, float add)
{
    Vector3 result = { v.x + add, v.y + add, v.z + add };

    return result;
}


inline Vector3 Vector3Subtract(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x - v2.x, v1.y - v2.y, v1.z - v2.z };

    return result;
}


inline Vector3 Vector3SubtractValue(Vector3 v, float sub)
{
    Vector3 result = { v.x - sub, v.y - sub, v.z - sub };

    return result;
}


inline Vector3 Vector3Scale(Vector3 v, float scalar)
{
    Vector3 result = { v.x*scalar, v.y*scalar, v.z*scalar };

    return result;
}


inline Vector3 Vector3Multiply(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x*v2.x, v1.y*v2.y, v1.z*v2.z };

    return result;
}


inline Vector3 Vector3CrossProduct(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.y*v2.z - v1.z*v2.y, v1.z*v2.x - v1.x*v2.z, v1.x*v2.y - v1.y*v2.x };

    return result;
}


inline Vector3 Vector3Perpendicular(Vector3 v)
{
    Vector3 result = { 0 };

    float min = (float) fabs(v.x);
    Vector3 cardinalAxis = {1.0f, 0.0f, 0.0f};

    if (fabsf(v.y) < min)
    {
        min = (float) fabs(v.y);
        Vector3 tmp = {0.0f, 1.0f, 0.0f};
        cardinalAxis = tmp;
    }

    if (fabsf(v.z) < min)
    {
        Vector3 tmp = {0.0f, 0.0f, 1.0f};
        cardinalAxis = tmp;
    }


    result.x = v.y*cardinalAxis.z - v.z*cardinalAxis.y;
    result.y = v.z*cardinalAxis.x - v.x*cardinalAxis.z;
    result.z = v.x*cardinalAxis.y - v.y*cardinalAxis.x;

    return result;
}


inline float Vector3Length(const Vector3 v)
{
    float result = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);

    return result;
}


inline float Vector3LengthSqr(const Vector3 v)
{
    float result = v.x*v.x + v.y*v.y + v.z*v.z;

    return result;
}


inline float Vector3DotProduct(Vector3 v1, Vector3 v2)
{
    float result = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);

    return result;
}


inline float Vector3Distance(Vector3 v1, Vector3 v2)
{
    float result = 0.0f;

    float dx = v2.x - v1.x;
    float dy = v2.y - v1.y;
    float dz = v2.z - v1.z;
    result = sqrtf(dx*dx + dy*dy + dz*dz);

    return result;
}


inline float Vector3DistanceSqr(Vector3 v1, Vector3 v2)
{
    float result = 0.0f;

    float dx = v2.x - v1.x;
    float dy = v2.y - v1.y;
    float dz = v2.z - v1.z;
    result = dx*dx + dy*dy + dz*dz;

    return result;
}


inline float Vector3Angle(Vector3 v1, Vector3 v2)
{
    float result = 0.0f;

    Vector3 cross = { v1.y*v2.z - v1.z*v2.y, v1.z*v2.x - v1.x*v2.z, v1.x*v2.y - v1.y*v2.x };
    float len = sqrtf(cross.x*cross.x + cross.y*cross.y + cross.z*cross.z);
    float dot = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);
    result = atan2f(len, dot);

    return result;
}


inline Vector3 Vector3Negate(Vector3 v)
{
    Vector3 result = { -v.x, -v.y, -v.z };

    return result;
}


inline Vector3 Vector3Divide(Vector3 v1, Vector3 v2)
{
    Vector3 result = { v1.x/v2.x, v1.y/v2.y, v1.z/v2.z };

    return result;
}


inline Vector3 Vector3Normalize(Vector3 v)
{
    Vector3 result = v;

    float length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length != 0.0f)
    {
        float ilength = 1.0f/length;

        result.x *= ilength;
        result.y *= ilength;
        result.z *= ilength;
    }

    return result;
}


inline Vector3 Vector3Project(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    float v1dv2 = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);
    float v2dv2 = (v2.x*v2.x + v2.y*v2.y + v2.z*v2.z);

    float mag = v1dv2/v2dv2;

    result.x = v2.x*mag;
    result.y = v2.y*mag;
    result.z = v2.z*mag;

    return result;
}


inline Vector3 Vector3Reject(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    float v1dv2 = (v1.x*v2.x + v1.y*v2.y + v1.z*v2.z);
    float v2dv2 = (v2.x*v2.x + v2.y*v2.y + v2.z*v2.z);

    float mag = v1dv2/v2dv2;

    result.x = v1.x - (v2.x*mag);
    result.y = v1.y - (v2.y*mag);
    result.z = v1.z - (v2.z*mag);

    return result;
}




inline void Vector3OrthoNormalize(Vector3 *v1, Vector3 *v2)
{
    float length = 0.0f;
    float ilength = 0.0f;


    Vector3 v = *v1;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    v1->x *= ilength;
    v1->y *= ilength;
    v1->z *= ilength;


    Vector3 vn1 = { v1->y*v2->z - v1->z*v2->y, v1->z*v2->x - v1->x*v2->z, v1->x*v2->y - v1->y*v2->x };


    v = vn1;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    vn1.x *= ilength;
    vn1.y *= ilength;
    vn1.z *= ilength;


    Vector3 vn2 = { vn1.y*v1->z - vn1.z*v1->y, vn1.z*v1->x - vn1.x*v1->z, vn1.x*v1->y - vn1.y*v1->x };

    *v2 = vn2;
}


inline Vector3 Vector3Transform(Vector3 v, Matrix mat)
{
    Vector3 result = { 0 };

    float x = v.x;
    float y = v.y;
    float z = v.z;

    result.x = mat.m0*x + mat.m4*y + mat.m8*z + mat.m12;
    result.y = mat.m1*x + mat.m5*y + mat.m9*z + mat.m13;
    result.z = mat.m2*x + mat.m6*y + mat.m10*z + mat.m14;

    return result;
}


inline Vector3 Vector3RotateByQuaternion(Vector3 v, Quaternion q)
{
    Vector3 result = { 0 };

    result.x = v.x*(q.x*q.x + q.w*q.w - q.y*q.y - q.z*q.z) + v.y*(2*q.x*q.y - 2*q.w*q.z) + v.z*(2*q.x*q.z + 2*q.w*q.y);
    result.y = v.x*(2*q.w*q.z + 2*q.x*q.y) + v.y*(q.w*q.w - q.x*q.x + q.y*q.y - q.z*q.z) + v.z*(-2*q.w*q.x + 2*q.y*q.z);
    result.z = v.x*(-2*q.w*q.y + 2*q.x*q.z) + v.y*(2*q.w*q.x + 2*q.y*q.z)+ v.z*(q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z);

    return result;
}


inline Vector3 Vector3RotateByAxisAngle(Vector3 v, Vector3 axis, float angle)
{



    Vector3 result = v;


    float length = sqrtf(axis.x*axis.x + axis.y*axis.y + axis.z*axis.z);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f / length;
    axis.x *= ilength;
    axis.y *= ilength;
    axis.z *= ilength;

    angle /= 2.0f;
    float a = sinf(angle);
    float b = axis.x*a;
    float c = axis.y*a;
    float d = axis.z*a;
    a = cosf(angle);
    Vector3 w = { b, c, d };


    Vector3 wv = { w.y*v.z - w.z*v.y, w.z*v.x - w.x*v.z, w.x*v.y - w.y*v.x };


    Vector3 wwv = { w.y*wv.z - w.z*wv.y, w.z*wv.x - w.x*wv.z, w.x*wv.y - w.y*wv.x };


    a *= 2;
    wv.x *= a;
    wv.y *= a;
    wv.z *= a;


    wwv.x *= 2;
    wwv.y *= 2;
    wwv.z *= 2;

    result.x += wv.x;
    result.y += wv.y;
    result.z += wv.z;

    result.x += wwv.x;
    result.y += wwv.y;
    result.z += wwv.z;

    return result;
}


inline Vector3 Vector3Lerp(Vector3 v1, Vector3 v2, float amount)
{
    Vector3 result = { 0 };

    result.x = v1.x + amount*(v2.x - v1.x);
    result.y = v1.y + amount*(v2.y - v1.y);
    result.z = v1.z + amount*(v2.z - v1.z);

    return result;
}


inline Vector3 Vector3Reflect(Vector3 v, Vector3 normal)
{
    Vector3 result = { 0 };





    float dotProduct = (v.x*normal.x + v.y*normal.y + v.z*normal.z);

    result.x = v.x - (2.0f*normal.x)*dotProduct;
    result.y = v.y - (2.0f*normal.y)*dotProduct;
    result.z = v.z - (2.0f*normal.z)*dotProduct;

    return result;
}


inline Vector3 Vector3Min(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    result.x = fminf(v1.x, v2.x);
    result.y = fminf(v1.y, v2.y);
    result.z = fminf(v1.z, v2.z);

    return result;
}


inline Vector3 Vector3Max(Vector3 v1, Vector3 v2)
{
    Vector3 result = { 0 };

    result.x = fmaxf(v1.x, v2.x);
    result.y = fmaxf(v1.y, v2.y);
    result.z = fmaxf(v1.z, v2.z);

    return result;
}



inline Vector3 Vector3Barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c)
{
    Vector3 result = { 0 };

    Vector3 v0 = { b.x - a.x, b.y - a.y, b.z - a.z };
    Vector3 v1 = { c.x - a.x, c.y - a.y, c.z - a.z };
    Vector3 v2 = { p.x - a.x, p.y - a.y, p.z - a.z };
    float d00 = (v0.x*v0.x + v0.y*v0.y + v0.z*v0.z);
    float d01 = (v0.x*v1.x + v0.y*v1.y + v0.z*v1.z);
    float d11 = (v1.x*v1.x + v1.y*v1.y + v1.z*v1.z);
    float d20 = (v2.x*v0.x + v2.y*v0.y + v2.z*v0.z);
    float d21 = (v2.x*v1.x + v2.y*v1.y + v2.z*v1.z);

    float denom = d00*d11 - d01*d01;

    result.y = (d11*d20 - d01*d21)/denom;
    result.z = (d00*d21 - d01*d20)/denom;
    result.x = 1.0f - (result.z + result.y);

    return result;
}



inline Vector3 Vector3Unproject(Vector3 source, Matrix projection, Matrix view)
{
    Vector3 result = { 0 };


    Matrix matViewProj = {
        view.m0*projection.m0 + view.m1*projection.m4 + view.m2*projection.m8 + view.m3*projection.m12,
        view.m0*projection.m1 + view.m1*projection.m5 + view.m2*projection.m9 + view.m3*projection.m13,
        view.m0*projection.m2 + view.m1*projection.m6 + view.m2*projection.m10 + view.m3*projection.m14,
        view.m0*projection.m3 + view.m1*projection.m7 + view.m2*projection.m11 + view.m3*projection.m15,
        view.m4*projection.m0 + view.m5*projection.m4 + view.m6*projection.m8 + view.m7*projection.m12,
        view.m4*projection.m1 + view.m5*projection.m5 + view.m6*projection.m9 + view.m7*projection.m13,
        view.m4*projection.m2 + view.m5*projection.m6 + view.m6*projection.m10 + view.m7*projection.m14,
        view.m4*projection.m3 + view.m5*projection.m7 + view.m6*projection.m11 + view.m7*projection.m15,
        view.m8*projection.m0 + view.m9*projection.m4 + view.m10*projection.m8 + view.m11*projection.m12,
        view.m8*projection.m1 + view.m9*projection.m5 + view.m10*projection.m9 + view.m11*projection.m13,
        view.m8*projection.m2 + view.m9*projection.m6 + view.m10*projection.m10 + view.m11*projection.m14,
        view.m8*projection.m3 + view.m9*projection.m7 + view.m10*projection.m11 + view.m11*projection.m15,
        view.m12*projection.m0 + view.m13*projection.m4 + view.m14*projection.m8 + view.m15*projection.m12,
        view.m12*projection.m1 + view.m13*projection.m5 + view.m14*projection.m9 + view.m15*projection.m13,
        view.m12*projection.m2 + view.m13*projection.m6 + view.m14*projection.m10 + view.m15*projection.m14,
        view.m12*projection.m3 + view.m13*projection.m7 + view.m14*projection.m11 + view.m15*projection.m15 };



    float a00 = matViewProj.m0, a01 = matViewProj.m1, a02 = matViewProj.m2, a03 = matViewProj.m3;
    float a10 = matViewProj.m4, a11 = matViewProj.m5, a12 = matViewProj.m6, a13 = matViewProj.m7;
    float a20 = matViewProj.m8, a21 = matViewProj.m9, a22 = matViewProj.m10, a23 = matViewProj.m11;
    float a30 = matViewProj.m12, a31 = matViewProj.m13, a32 = matViewProj.m14, a33 = matViewProj.m15;

    float b00 = a00*a11 - a01*a10;
    float b01 = a00*a12 - a02*a10;
    float b02 = a00*a13 - a03*a10;
    float b03 = a01*a12 - a02*a11;
    float b04 = a01*a13 - a03*a11;
    float b05 = a02*a13 - a03*a12;
    float b06 = a20*a31 - a21*a30;
    float b07 = a20*a32 - a22*a30;
    float b08 = a20*a33 - a23*a30;
    float b09 = a21*a32 - a22*a31;
    float b10 = a21*a33 - a23*a31;
    float b11 = a22*a33 - a23*a32;


    float invDet = 1.0f/(b00*b11 - b01*b10 + b02*b09 + b03*b08 - b04*b07 + b05*b06);

    Matrix matViewProjInv = {
        (a11*b11 - a12*b10 + a13*b09)*invDet,
        (-a01*b11 + a02*b10 - a03*b09)*invDet,
        (a31*b05 - a32*b04 + a33*b03)*invDet,
        (-a21*b05 + a22*b04 - a23*b03)*invDet,
        (-a10*b11 + a12*b08 - a13*b07)*invDet,
        (a00*b11 - a02*b08 + a03*b07)*invDet,
        (-a30*b05 + a32*b02 - a33*b01)*invDet,
        (a20*b05 - a22*b02 + a23*b01)*invDet,
        (a10*b10 - a11*b08 + a13*b06)*invDet,
        (-a00*b10 + a01*b08 - a03*b06)*invDet,
        (a30*b04 - a31*b02 + a33*b00)*invDet,
        (-a20*b04 + a21*b02 - a23*b00)*invDet,
        (-a10*b09 + a11*b07 - a12*b06)*invDet,
        (a00*b09 - a01*b07 + a02*b06)*invDet,
        (-a30*b03 + a31*b01 - a32*b00)*invDet,
        (a20*b03 - a21*b01 + a22*b00)*invDet };


    Quaternion quat = { source.x, source.y, source.z, 1.0f };


    Quaternion qtransformed = {
        matViewProjInv.m0*quat.x + matViewProjInv.m4*quat.y + matViewProjInv.m8*quat.z + matViewProjInv.m12*quat.w,
        matViewProjInv.m1*quat.x + matViewProjInv.m5*quat.y + matViewProjInv.m9*quat.z + matViewProjInv.m13*quat.w,
        matViewProjInv.m2*quat.x + matViewProjInv.m6*quat.y + matViewProjInv.m10*quat.z + matViewProjInv.m14*quat.w,
        matViewProjInv.m3*quat.x + matViewProjInv.m7*quat.y + matViewProjInv.m11*quat.z + matViewProjInv.m15*quat.w };


    result.x = qtransformed.x/qtransformed.w;
    result.y = qtransformed.y/qtransformed.w;
    result.z = qtransformed.z/qtransformed.w;

    return result;
}


inline float3 Vector3ToFloatV(Vector3 v)
{
    float3 buffer = { 0 };

    buffer.v[0] = v.x;
    buffer.v[1] = v.y;
    buffer.v[2] = v.z;

    return buffer;
}


inline Vector3 Vector3Invert(Vector3 v)
{
    Vector3 result = { 1.0f/v.x, 1.0f/v.y, 1.0f/v.z };

    return result;
}



inline Vector3 Vector3Clamp(Vector3 v, Vector3 min, Vector3 max)
{
    Vector3 result = { 0 };

    result.x = fminf(max.x, fmaxf(min.x, v.x));
    result.y = fminf(max.y, fmaxf(min.y, v.y));
    result.z = fminf(max.z, fmaxf(min.z, v.z));

    return result;
}


inline Vector3 Vector3ClampValue(Vector3 v, float min, float max)
{
    Vector3 result = v;

    float length = (v.x*v.x) + (v.y*v.y) + (v.z*v.z);
    if (length > 0.0f)
    {
        length = sqrtf(length);

        if (length < min)
        {
            float scale = min/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
            result.z = v.z*scale;
        }
        else if (length > max)
        {
            float scale = max/length;
            result.x = v.x*scale;
            result.y = v.y*scale;
            result.z = v.z*scale;
        }
    }

    return result;
}


inline int Vector3Equals(Vector3 p, Vector3 q)
{




    int result = ((fabsf(p.x - q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                 ((fabsf(p.y - q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))) &&
                 ((fabsf(p.z - q.z)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z)))));

    return result;
}






inline Vector3 Vector3Refract(Vector3 v, Vector3 n, float r)
{
    Vector3 result = { 0 };

    float dot = v.x*n.x + v.y*n.y + v.z*n.z;
    float d = 1.0f - r*r*(1.0f - dot*dot);

    if (d >= 0.0f)
    {
        d = sqrtf(d);
        v.x = r*v.x - (r*dot + d)*n.x;
        v.y = r*v.y - (r*dot + d)*n.y;
        v.z = r*v.z - (r*dot + d)*n.z;

        result = v;
    }

    return result;
}






inline float MatrixDeterminant(Matrix mat)
{
    float result = 0.0f;


    float a00 = mat.m0, a01 = mat.m1, a02 = mat.m2, a03 = mat.m3;
    float a10 = mat.m4, a11 = mat.m5, a12 = mat.m6, a13 = mat.m7;
    float a20 = mat.m8, a21 = mat.m9, a22 = mat.m10, a23 = mat.m11;
    float a30 = mat.m12, a31 = mat.m13, a32 = mat.m14, a33 = mat.m15;

    result = a30*a21*a12*a03 - a20*a31*a12*a03 - a30*a11*a22*a03 + a10*a31*a22*a03 +
             a20*a11*a32*a03 - a10*a21*a32*a03 - a30*a21*a02*a13 + a20*a31*a02*a13 +
             a30*a01*a22*a13 - a00*a31*a22*a13 - a20*a01*a32*a13 + a00*a21*a32*a13 +
             a30*a11*a02*a23 - a10*a31*a02*a23 - a30*a01*a12*a23 + a00*a31*a12*a23 +
             a10*a01*a32*a23 - a00*a11*a32*a23 - a20*a11*a02*a33 + a10*a21*a02*a33 +
             a20*a01*a12*a33 - a00*a21*a12*a33 - a10*a01*a22*a33 + a00*a11*a22*a33;

    return result;
}


inline float MatrixTrace(Matrix mat)
{
    float result = (mat.m0 + mat.m5 + mat.m10 + mat.m15);

    return result;
}


inline Matrix MatrixTranspose(Matrix mat)
{
    Matrix result = { 0 };

    result.m0 = mat.m0;
    result.m1 = mat.m4;
    result.m2 = mat.m8;
    result.m3 = mat.m12;
    result.m4 = mat.m1;
    result.m5 = mat.m5;
    result.m6 = mat.m9;
    result.m7 = mat.m13;
    result.m8 = mat.m2;
    result.m9 = mat.m6;
    result.m10 = mat.m10;
    result.m11 = mat.m14;
    result.m12 = mat.m3;
    result.m13 = mat.m7;
    result.m14 = mat.m11;
    result.m15 = mat.m15;

    return result;
}


inline Matrix MatrixInvert(Matrix mat)
{
    Matrix result = { 0 };


    float a00 = mat.m0, a01 = mat.m1, a02 = mat.m2, a03 = mat.m3;
    float a10 = mat.m4, a11 = mat.m5, a12 = mat.m6, a13 = mat.m7;
    float a20 = mat.m8, a21 = mat.m9, a22 = mat.m10, a23 = mat.m11;
    float a30 = mat.m12, a31 = mat.m13, a32 = mat.m14, a33 = mat.m15;

    float b00 = a00*a11 - a01*a10;
    float b01 = a00*a12 - a02*a10;
    float b02 = a00*a13 - a03*a10;
    float b03 = a01*a12 - a02*a11;
    float b04 = a01*a13 - a03*a11;
    float b05 = a02*a13 - a03*a12;
    float b06 = a20*a31 - a21*a30;
    float b07 = a20*a32 - a22*a30;
    float b08 = a20*a33 - a23*a30;
    float b09 = a21*a32 - a22*a31;
    float b10 = a21*a33 - a23*a31;
    float b11 = a22*a33 - a23*a32;


    float invDet = 1.0f/(b00*b11 - b01*b10 + b02*b09 + b03*b08 - b04*b07 + b05*b06);

    result.m0 = (a11*b11 - a12*b10 + a13*b09)*invDet;
    result.m1 = (-a01*b11 + a02*b10 - a03*b09)*invDet;
    result.m2 = (a31*b05 - a32*b04 + a33*b03)*invDet;
    result.m3 = (-a21*b05 + a22*b04 - a23*b03)*invDet;
    result.m4 = (-a10*b11 + a12*b08 - a13*b07)*invDet;
    result.m5 = (a00*b11 - a02*b08 + a03*b07)*invDet;
    result.m6 = (-a30*b05 + a32*b02 - a33*b01)*invDet;
    result.m7 = (a20*b05 - a22*b02 + a23*b01)*invDet;
    result.m8 = (a10*b10 - a11*b08 + a13*b06)*invDet;
    result.m9 = (-a00*b10 + a01*b08 - a03*b06)*invDet;
    result.m10 = (a30*b04 - a31*b02 + a33*b00)*invDet;
    result.m11 = (-a20*b04 + a21*b02 - a23*b00)*invDet;
    result.m12 = (-a10*b09 + a11*b07 - a12*b06)*invDet;
    result.m13 = (a00*b09 - a01*b07 + a02*b06)*invDet;
    result.m14 = (-a30*b03 + a31*b01 - a32*b00)*invDet;
    result.m15 = (a20*b03 - a21*b01 + a22*b00)*invDet;

    return result;
}


inline Matrix MatrixIdentity(void)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}


inline Matrix MatrixAdd(Matrix left, Matrix right)
{
    Matrix result = { 0 };

    result.m0 = left.m0 + right.m0;
    result.m1 = left.m1 + right.m1;
    result.m2 = left.m2 + right.m2;
    result.m3 = left.m3 + right.m3;
    result.m4 = left.m4 + right.m4;
    result.m5 = left.m5 + right.m5;
    result.m6 = left.m6 + right.m6;
    result.m7 = left.m7 + right.m7;
    result.m8 = left.m8 + right.m8;
    result.m9 = left.m9 + right.m9;
    result.m10 = left.m10 + right.m10;
    result.m11 = left.m11 + right.m11;
    result.m12 = left.m12 + right.m12;
    result.m13 = left.m13 + right.m13;
    result.m14 = left.m14 + right.m14;
    result.m15 = left.m15 + right.m15;

    return result;
}


inline Matrix MatrixSubtract(Matrix left, Matrix right)
{
    Matrix result = { 0 };

    result.m0 = left.m0 - right.m0;
    result.m1 = left.m1 - right.m1;
    result.m2 = left.m2 - right.m2;
    result.m3 = left.m3 - right.m3;
    result.m4 = left.m4 - right.m4;
    result.m5 = left.m5 - right.m5;
    result.m6 = left.m6 - right.m6;
    result.m7 = left.m7 - right.m7;
    result.m8 = left.m8 - right.m8;
    result.m9 = left.m9 - right.m9;
    result.m10 = left.m10 - right.m10;
    result.m11 = left.m11 - right.m11;
    result.m12 = left.m12 - right.m12;
    result.m13 = left.m13 - right.m13;
    result.m14 = left.m14 - right.m14;
    result.m15 = left.m15 - right.m15;

    return result;
}



inline Matrix MatrixMultiply(Matrix left, Matrix right)
{
    Matrix result = { 0 };

    result.m0 = left.m0*right.m0 + left.m1*right.m4 + left.m2*right.m8 + left.m3*right.m12;
    result.m1 = left.m0*right.m1 + left.m1*right.m5 + left.m2*right.m9 + left.m3*right.m13;
    result.m2 = left.m0*right.m2 + left.m1*right.m6 + left.m2*right.m10 + left.m3*right.m14;
    result.m3 = left.m0*right.m3 + left.m1*right.m7 + left.m2*right.m11 + left.m3*right.m15;
    result.m4 = left.m4*right.m0 + left.m5*right.m4 + left.m6*right.m8 + left.m7*right.m12;
    result.m5 = left.m4*right.m1 + left.m5*right.m5 + left.m6*right.m9 + left.m7*right.m13;
    result.m6 = left.m4*right.m2 + left.m5*right.m6 + left.m6*right.m10 + left.m7*right.m14;
    result.m7 = left.m4*right.m3 + left.m5*right.m7 + left.m6*right.m11 + left.m7*right.m15;
    result.m8 = left.m8*right.m0 + left.m9*right.m4 + left.m10*right.m8 + left.m11*right.m12;
    result.m9 = left.m8*right.m1 + left.m9*right.m5 + left.m10*right.m9 + left.m11*right.m13;
    result.m10 = left.m8*right.m2 + left.m9*right.m6 + left.m10*right.m10 + left.m11*right.m14;
    result.m11 = left.m8*right.m3 + left.m9*right.m7 + left.m10*right.m11 + left.m11*right.m15;
    result.m12 = left.m12*right.m0 + left.m13*right.m4 + left.m14*right.m8 + left.m15*right.m12;
    result.m13 = left.m12*right.m1 + left.m13*right.m5 + left.m14*right.m9 + left.m15*right.m13;
    result.m14 = left.m12*right.m2 + left.m13*right.m6 + left.m14*right.m10 + left.m15*right.m14;
    result.m15 = left.m12*right.m3 + left.m13*right.m7 + left.m14*right.m11 + left.m15*right.m15;

    return result;
}


inline Matrix MatrixTranslate(float x, float y, float z)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, x,
                      0.0f, 1.0f, 0.0f, y,
                      0.0f, 0.0f, 1.0f, z,
                      0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}



inline Matrix MatrixRotate(Vector3 axis, float angle)
{
    Matrix result = { 0 };

    float x = axis.x, y = axis.y, z = axis.z;

    float lengthSquared = x*x + y*y + z*z;

    if ((lengthSquared != 1.0f) && (lengthSquared != 0.0f))
    {
        float ilength = 1.0f/sqrtf(lengthSquared);
        x *= ilength;
        y *= ilength;
        z *= ilength;
    }

    float sinres = sinf(angle);
    float cosres = cosf(angle);
    float t = 1.0f - cosres;

    result.m0 = x*x*t + cosres;
    result.m1 = y*x*t + z*sinres;
    result.m2 = z*x*t - y*sinres;
    result.m3 = 0.0f;

    result.m4 = x*y*t - z*sinres;
    result.m5 = y*y*t + cosres;
    result.m6 = z*y*t + x*sinres;
    result.m7 = 0.0f;

    result.m8 = x*z*t + y*sinres;
    result.m9 = y*z*t - x*sinres;
    result.m10 = z*z*t + cosres;
    result.m11 = 0.0f;

    result.m12 = 0.0f;
    result.m13 = 0.0f;
    result.m14 = 0.0f;
    result.m15 = 1.0f;

    return result;
}



inline Matrix MatrixRotateX(float angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.m5 = cosres;
    result.m6 = sinres;
    result.m9 = -sinres;
    result.m10 = cosres;

    return result;
}



inline Matrix MatrixRotateY(float angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.m0 = cosres;
    result.m2 = -sinres;
    result.m8 = sinres;
    result.m10 = cosres;

    return result;
}



inline Matrix MatrixRotateZ(float angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosres = cosf(angle);
    float sinres = sinf(angle);

    result.m0 = cosres;
    result.m1 = sinres;
    result.m4 = -sinres;
    result.m5 = cosres;

    return result;
}




inline Matrix MatrixRotateXYZ(Vector3 angle)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float cosz = cosf(-angle.z);
    float sinz = sinf(-angle.z);
    float cosy = cosf(-angle.y);
    float siny = sinf(-angle.y);
    float cosx = cosf(-angle.x);
    float sinx = sinf(-angle.x);

    result.m0 = cosz*cosy;
    result.m1 = (cosz*siny*sinx) - (sinz*cosx);
    result.m2 = (cosz*siny*cosx) + (sinz*sinx);

    result.m4 = sinz*cosy;
    result.m5 = (sinz*siny*sinx) + (cosz*cosx);
    result.m6 = (sinz*siny*cosx) - (cosz*sinx);

    result.m8 = -siny;
    result.m9 = cosy*sinx;
    result.m10= cosy*cosx;

    return result;
}



inline Matrix MatrixRotateZYX(Vector3 angle)
{
    Matrix result = { 0 };

    float cz = cosf(angle.z);
    float sz = sinf(angle.z);
    float cy = cosf(angle.y);
    float sy = sinf(angle.y);
    float cx = cosf(angle.x);
    float sx = sinf(angle.x);

    result.m0 = cz*cy;
    result.m4 = cz*sy*sx - cx*sz;
    result.m8 = sz*sx + cz*cx*sy;
    result.m12 = 0;

    result.m1 = cy*sz;
    result.m5 = cz*cx + sz*sy*sx;
    result.m9 = cx*sz*sy - cz*sx;
    result.m13 = 0;

    result.m2 = -sy;
    result.m6 = cy*sx;
    result.m10 = cy*cx;
    result.m14 = 0;

    result.m3 = 0;
    result.m7 = 0;
    result.m11 = 0;
    result.m15 = 1;

    return result;
}


inline Matrix MatrixScale(float x, float y, float z)
{
    Matrix result = { x, 0.0f, 0.0f, 0.0f,
                      0.0f, y, 0.0f, 0.0f,
                      0.0f, 0.0f, z, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}


inline Matrix MatrixFrustum(double left, double right, double bottom, double top, double near, double far)
{
    Matrix result = { 0 };

    float rl = (float)(right - left);
    float tb = (float)(top - bottom);
    float fn = (float)(far - near);

    result.m0 = ((float)near*2.0f)/rl;
    result.m1 = 0.0f;
    result.m2 = 0.0f;
    result.m3 = 0.0f;

    result.m4 = 0.0f;
    result.m5 = ((float)near*2.0f)/tb;
    result.m6 = 0.0f;
    result.m7 = 0.0f;

    result.m8 = ((float)right + (float)left)/rl;
    result.m9 = ((float)top + (float)bottom)/tb;
    result.m10 = -((float)far + (float)near)/fn;
    result.m11 = -1.0f;

    result.m12 = 0.0f;
    result.m13 = 0.0f;
    result.m14 = -((float)far*(float)near*2.0f)/fn;
    result.m15 = 0.0f;

    return result;
}



inline Matrix MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
{
    Matrix result = { 0 };

    double top = nearPlane*tan(fovY*0.5);
    double bottom = -top;
    double right = top*aspect;
    double left = -right;


    float rl = (float)(right - left);
    float tb = (float)(top - bottom);
    float fn = (float)(farPlane - nearPlane);

    result.m0 = ((float)nearPlane*2.0f)/rl;
    result.m5 = ((float)nearPlane*2.0f)/tb;
    result.m8 = ((float)right + (float)left)/rl;
    result.m9 = ((float)top + (float)bottom)/tb;
    result.m10 = -((float)farPlane + (float)nearPlane)/fn;
    result.m11 = -1.0f;
    result.m14 = -((float)farPlane*(float)nearPlane*2.0f)/fn;

    return result;
}


inline Matrix MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
{
    Matrix result = { 0 };

    float rl = (float)(right - left);
    float tb = (float)(top - bottom);
    float fn = (float)(farPlane - nearPlane);

    result.m0 = 2.0f/rl;
    result.m1 = 0.0f;
    result.m2 = 0.0f;
    result.m3 = 0.0f;
    result.m4 = 0.0f;
    result.m5 = 2.0f/tb;
    result.m6 = 0.0f;
    result.m7 = 0.0f;
    result.m8 = 0.0f;
    result.m9 = 0.0f;
    result.m10 = -2.0f/fn;
    result.m11 = 0.0f;
    result.m12 = -((float)left + (float)right)/rl;
    result.m13 = -((float)top + (float)bottom)/tb;
    result.m14 = -((float)farPlane + (float)nearPlane)/fn;
    result.m15 = 1.0f;

    return result;
}


inline Matrix MatrixLookAt(Vector3 eye, Vector3 target, Vector3 up)
{
    Matrix result = { 0 };

    float length = 0.0f;
    float ilength = 0.0f;


    Vector3 vz = { eye.x - target.x, eye.y - target.y, eye.z - target.z };


    Vector3 v = vz;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    vz.x *= ilength;
    vz.y *= ilength;
    vz.z *= ilength;


    Vector3 vx = { up.y*vz.z - up.z*vz.y, up.z*vz.x - up.x*vz.z, up.x*vz.y - up.y*vz.x };


    v = vx;
    length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
    if (length == 0.0f) length = 1.0f;
    ilength = 1.0f/length;
    vx.x *= ilength;
    vx.y *= ilength;
    vx.z *= ilength;


    Vector3 vy = { vz.y*vx.z - vz.z*vx.y, vz.z*vx.x - vz.x*vx.z, vz.x*vx.y - vz.y*vx.x };

    result.m0 = vx.x;
    result.m1 = vy.x;
    result.m2 = vz.x;
    result.m3 = 0.0f;
    result.m4 = vx.y;
    result.m5 = vy.y;
    result.m6 = vz.y;
    result.m7 = 0.0f;
    result.m8 = vx.z;
    result.m9 = vy.z;
    result.m10 = vz.z;
    result.m11 = 0.0f;
    result.m12 = -(vx.x*eye.x + vx.y*eye.y + vx.z*eye.z);
    result.m13 = -(vy.x*eye.x + vy.y*eye.y + vy.z*eye.z);
    result.m14 = -(vz.x*eye.x + vz.y*eye.y + vz.z*eye.z);
    result.m15 = 1.0f;

    return result;
}


inline float16 MatrixToFloatV(Matrix mat)
{
    float16 result = { 0 };

    result.v[0] = mat.m0;
    result.v[1] = mat.m1;
    result.v[2] = mat.m2;
    result.v[3] = mat.m3;
    result.v[4] = mat.m4;
    result.v[5] = mat.m5;
    result.v[6] = mat.m6;
    result.v[7] = mat.m7;
    result.v[8] = mat.m8;
    result.v[9] = mat.m9;
    result.v[10] = mat.m10;
    result.v[11] = mat.m11;
    result.v[12] = mat.m12;
    result.v[13] = mat.m13;
    result.v[14] = mat.m14;
    result.v[15] = mat.m15;

    return result;
}






inline Quaternion QuaternionAdd(Quaternion q1, Quaternion q2)
{
    Quaternion result = {q1.x + q2.x, q1.y + q2.y, q1.z + q2.z, q1.w + q2.w};

    return result;
}


inline Quaternion QuaternionAddValue(Quaternion q, float add)
{
    Quaternion result = {q.x + add, q.y + add, q.z + add, q.w + add};

    return result;
}


inline Quaternion QuaternionSubtract(Quaternion q1, Quaternion q2)
{
    Quaternion result = {q1.x - q2.x, q1.y - q2.y, q1.z - q2.z, q1.w - q2.w};

    return result;
}


inline Quaternion QuaternionSubtractValue(Quaternion q, float sub)
{
    Quaternion result = {q.x - sub, q.y - sub, q.z - sub, q.w - sub};

    return result;
}


inline Quaternion QuaternionIdentity(void)
{
    Quaternion result = { 0.0f, 0.0f, 0.0f, 1.0f };

    return result;
}


inline float QuaternionLength(Quaternion q)
{
    float result = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);

    return result;
}


inline Quaternion QuaternionNormalize(Quaternion q)
{
    Quaternion result = { 0 };

    float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f/length;

    result.x = q.x*ilength;
    result.y = q.y*ilength;
    result.z = q.z*ilength;
    result.w = q.w*ilength;

    return result;
}


inline Quaternion QuaternionInvert(Quaternion q)
{
    Quaternion result = q;

    float lengthSq = q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w;

    if (lengthSq != 0.0f)
    {
        float invLength = 1.0f/lengthSq;

        result.x *= -invLength;
        result.y *= -invLength;
        result.z *= -invLength;
        result.w *= invLength;
    }

    return result;
}


inline Quaternion QuaternionMultiply(Quaternion q1, Quaternion q2)
{
    Quaternion result = { 0 };

    float qax = q1.x, qay = q1.y, qaz = q1.z, qaw = q1.w;
    float qbx = q2.x, qby = q2.y, qbz = q2.z, qbw = q2.w;

    result.x = qax*qbw + qaw*qbx + qay*qbz - qaz*qby;
    result.y = qay*qbw + qaw*qby + qaz*qbx - qax*qbz;
    result.z = qaz*qbw + qaw*qbz + qax*qby - qay*qbx;
    result.w = qaw*qbw - qax*qbx - qay*qby - qaz*qbz;

    return result;
}


inline Quaternion QuaternionScale(Quaternion q, float mul)
{
    Quaternion result = { 0 };

    result.x = q.x*mul;
    result.y = q.y*mul;
    result.z = q.z*mul;
    result.w = q.w*mul;

    return result;
}


inline Quaternion QuaternionDivide(Quaternion q1, Quaternion q2)
{
    Quaternion result = { q1.x/q2.x, q1.y/q2.y, q1.z/q2.z, q1.w/q2.w };

    return result;
}


inline Quaternion QuaternionLerp(Quaternion q1, Quaternion q2, float amount)
{
    Quaternion result = { 0 };

    result.x = q1.x + amount*(q2.x - q1.x);
    result.y = q1.y + amount*(q2.y - q1.y);
    result.z = q1.z + amount*(q2.z - q1.z);
    result.w = q1.w + amount*(q2.w - q1.w);

    return result;
}


inline Quaternion QuaternionNlerp(Quaternion q1, Quaternion q2, float amount)
{
    Quaternion result = { 0 };


    result.x = q1.x + amount*(q2.x - q1.x);
    result.y = q1.y + amount*(q2.y - q1.y);
    result.z = q1.z + amount*(q2.z - q1.z);
    result.w = q1.w + amount*(q2.w - q1.w);


    Quaternion q = result;
    float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f/length;

    result.x = q.x*ilength;
    result.y = q.y*ilength;
    result.z = q.z*ilength;
    result.w = q.w*ilength;

    return result;
}


inline Quaternion QuaternionSlerp(Quaternion q1, Quaternion q2, float amount)
{
    Quaternion result = { 0 };





    float cosHalfTheta = q1.x*q2.x + q1.y*q2.y + q1.z*q2.z + q1.w*q2.w;

    if (cosHalfTheta < 0)
    {
        q2.x = -q2.x; q2.y = -q2.y; q2.z = -q2.z; q2.w = -q2.w;
        cosHalfTheta = -cosHalfTheta;
    }

    if (fabsf(cosHalfTheta) >= 1.0f) result = q1;
    else if (cosHalfTheta > 0.95f) result = QuaternionNlerp(q1, q2, amount);
    else
    {
        float halfTheta = acosf(cosHalfTheta);
        float sinHalfTheta = sqrtf(1.0f - cosHalfTheta*cosHalfTheta);

        if (fabsf(sinHalfTheta) < 0.000001f)
        {
            result.x = (q1.x*0.5f + q2.x*0.5f);
            result.y = (q1.y*0.5f + q2.y*0.5f);
            result.z = (q1.z*0.5f + q2.z*0.5f);
            result.w = (q1.w*0.5f + q2.w*0.5f);
        }
        else
        {
            float ratioA = sinf((1 - amount)*halfTheta)/sinHalfTheta;
            float ratioB = sinf(amount*halfTheta)/sinHalfTheta;

            result.x = (q1.x*ratioA + q2.x*ratioB);
            result.y = (q1.y*ratioA + q2.y*ratioB);
            result.z = (q1.z*ratioA + q2.z*ratioB);
            result.w = (q1.w*ratioA + q2.w*ratioB);
        }
    }

    return result;
}


inline Quaternion QuaternionFromVector3ToVector3(Vector3 from, Vector3 to)
{
    Quaternion result = { 0 };

    float cos2Theta = (from.x*to.x + from.y*to.y + from.z*to.z);
    Vector3 cross = { from.y*to.z - from.z*to.y, from.z*to.x - from.x*to.z, from.x*to.y - from.y*to.x };

    result.x = cross.x;
    result.y = cross.y;
    result.z = cross.z;
    result.w = 1.0f + cos2Theta;



    Quaternion q = result;
    float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
    if (length == 0.0f) length = 1.0f;
    float ilength = 1.0f/length;

    result.x = q.x*ilength;
    result.y = q.y*ilength;
    result.z = q.z*ilength;
    result.w = q.w*ilength;

    return result;
}


inline Quaternion QuaternionFromMatrix(Matrix mat)
{
    Quaternion result = { 0 };

    float fourWSquaredMinus1 = mat.m0 + mat.m5 + mat.m10;
    float fourXSquaredMinus1 = mat.m0 - mat.m5 - mat.m10;
    float fourYSquaredMinus1 = mat.m5 - mat.m0 - mat.m10;
    float fourZSquaredMinus1 = mat.m10 - mat.m0 - mat.m5;

    int biggestIndex = 0;
    float fourBiggestSquaredMinus1 = fourWSquaredMinus1;
    if (fourXSquaredMinus1 > fourBiggestSquaredMinus1)
    {
        fourBiggestSquaredMinus1 = fourXSquaredMinus1;
        biggestIndex = 1;
    }

    if (fourYSquaredMinus1 > fourBiggestSquaredMinus1)
    {
        fourBiggestSquaredMinus1 = fourYSquaredMinus1;
        biggestIndex = 2;
    }

    if (fourZSquaredMinus1 > fourBiggestSquaredMinus1)
    {
        fourBiggestSquaredMinus1 = fourZSquaredMinus1;
        biggestIndex = 3;
    }

    float biggestVal = sqrtf(fourBiggestSquaredMinus1 + 1.0f)*0.5f;
    float mult = 0.25f / biggestVal;

    switch (biggestIndex)
    {
        case 0:
            result.w = biggestVal;
            result.x = (mat.m6 - mat.m9)*mult;
            result.y = (mat.m8 - mat.m2)*mult;
            result.z = (mat.m1 - mat.m4)*mult;
            break;
        case 1:
            result.x = biggestVal;
            result.w = (mat.m6 - mat.m9)*mult;
            result.y = (mat.m1 + mat.m4)*mult;
            result.z = (mat.m8 + mat.m2)*mult;
            break;
        case 2:
            result.y = biggestVal;
            result.w = (mat.m8 - mat.m2)*mult;
            result.x = (mat.m1 + mat.m4)*mult;
            result.z = (mat.m6 + mat.m9)*mult;
            break;
        case 3:
            result.z = biggestVal;
            result.w = (mat.m1 - mat.m4)*mult;
            result.x = (mat.m8 + mat.m2)*mult;
            result.y = (mat.m6 + mat.m9)*mult;
            break;
    }

    return result;
}


inline Matrix QuaternionToMatrix(Quaternion q)
{
    Matrix result = { 1.0f, 0.0f, 0.0f, 0.0f,
                      0.0f, 1.0f, 0.0f, 0.0f,
                      0.0f, 0.0f, 1.0f, 0.0f,
                      0.0f, 0.0f, 0.0f, 1.0f };

    float a2 = q.x*q.x;
    float b2 = q.y*q.y;
    float c2 = q.z*q.z;
    float ac = q.x*q.z;
    float ab = q.x*q.y;
    float bc = q.y*q.z;
    float ad = q.w*q.x;
    float bd = q.w*q.y;
    float cd = q.w*q.z;

    result.m0 = 1 - 2*(b2 + c2);
    result.m1 = 2*(ab + cd);
    result.m2 = 2*(ac - bd);

    result.m4 = 2*(ab - cd);
    result.m5 = 1 - 2*(a2 + c2);
    result.m6 = 2*(bc + ad);

    result.m8 = 2*(ac + bd);
    result.m9 = 2*(bc - ad);
    result.m10 = 1 - 2*(a2 + b2);

    return result;
}



inline Quaternion QuaternionFromAxisAngle(Vector3 axis, float angle)
{
    Quaternion result = { 0.0f, 0.0f, 0.0f, 1.0f };

    float axisLength = sqrtf(axis.x*axis.x + axis.y*axis.y + axis.z*axis.z);

    if (axisLength != 0.0f)
    {
        angle *= 0.5f;

        float length = 0.0f;
        float ilength = 0.0f;


        Vector3 v = axis;
        length = sqrtf(v.x*v.x + v.y*v.y + v.z*v.z);
        if (length == 0.0f) length = 1.0f;
        ilength = 1.0f/length;
        axis.x *= ilength;
        axis.y *= ilength;
        axis.z *= ilength;

        float sinres = sinf(angle);
        float cosres = cosf(angle);

        result.x = axis.x*sinres;
        result.y = axis.y*sinres;
        result.z = axis.z*sinres;
        result.w = cosres;


        Quaternion q = result;
        length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
        if (length == 0.0f) length = 1.0f;
        ilength = 1.0f/length;
        result.x = q.x*ilength;
        result.y = q.y*ilength;
        result.z = q.z*ilength;
        result.w = q.w*ilength;
    }

    return result;
}


inline void QuaternionToAxisAngle(Quaternion q, Vector3 *outAxis, float *outAngle)
{
    if (fabsf(q.w) > 1.0f)
    {

        float length = sqrtf(q.x*q.x + q.y*q.y + q.z*q.z + q.w*q.w);
        if (length == 0.0f) length = 1.0f;
        float ilength = 1.0f/length;

        q.x = q.x*ilength;
        q.y = q.y*ilength;
        q.z = q.z*ilength;
        q.w = q.w*ilength;
    }

    Vector3 resAxis = { 0.0f, 0.0f, 0.0f };
    float resAngle = 2.0f*acosf(q.w);
    float den = sqrtf(1.0f - q.w*q.w);

    if (den > 0.000001f)
    {
        resAxis.x = q.x/den;
        resAxis.y = q.y/den;
        resAxis.z = q.z/den;
    }
    else
    {


        resAxis.x = 1.0f;
    }

    *outAxis = resAxis;
    *outAngle = resAngle;
}



inline Quaternion QuaternionFromEuler(float pitch, float yaw, float roll)
{
    Quaternion result = { 0 };

    float x0 = cosf(pitch*0.5f);
    float x1 = sinf(pitch*0.5f);
    float y0 = cosf(yaw*0.5f);
    float y1 = sinf(yaw*0.5f);
    float z0 = cosf(roll*0.5f);
    float z1 = sinf(roll*0.5f);

    result.x = x1*y0*z0 - x0*y1*z1;
    result.y = x0*y1*z0 + x1*y0*z1;
    result.z = x0*y0*z1 - x1*y1*z0;
    result.w = x0*y0*z0 + x1*y1*z1;

    return result;
}



inline Vector3 QuaternionToEuler(Quaternion q)
{
    Vector3 result = { 0 };


    float x0 = 2.0f*(q.w*q.x + q.y*q.z);
    float x1 = 1.0f - 2.0f*(q.x*q.x + q.y*q.y);
    result.x = atan2f(x0, x1);


    float y0 = 2.0f*(q.w*q.y - q.z*q.x);
    y0 = y0 > 1.0f ? 1.0f : y0;
    y0 = y0 < -1.0f ? -1.0f : y0;
    result.y = asinf(y0);


    float z0 = 2.0f*(q.w*q.z + q.x*q.y);
    float z1 = 1.0f - 2.0f*(q.y*q.y + q.z*q.z);
    result.z = atan2f(z0, z1);

    return result;
}


inline Quaternion QuaternionTransform(Quaternion q, Matrix mat)
{
    Quaternion result = { 0 };

    result.x = mat.m0*q.x + mat.m4*q.y + mat.m8*q.z + mat.m12*q.w;
    result.y = mat.m1*q.x + mat.m5*q.y + mat.m9*q.z + mat.m13*q.w;
    result.z = mat.m2*q.x + mat.m6*q.y + mat.m10*q.z + mat.m14*q.w;
    result.w = mat.m3*q.x + mat.m7*q.y + mat.m11*q.z + mat.m15*q.w;

    return result;
}


inline int QuaternionEquals(Quaternion p, Quaternion q)
{




    int result = (((fabsf(p.x - q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                  ((fabsf(p.y - q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))) &&
                  ((fabsf(p.z - q.z)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z))))) &&
                  ((fabsf(p.w - q.w)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w)))))) ||
                 (((fabsf(p.x + q.x)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.x), fabsf(q.x))))) &&
                  ((fabsf(p.y + q.y)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.y), fabsf(q.y))))) &&
                  ((fabsf(p.z + q.z)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.z), fabsf(q.z))))) &&
                  ((fabsf(p.w + q.w)) <= (0.000001f*fmaxf(1.0f, fmaxf(fabsf(p.w), fabsf(q.w))))));

    return result;
}
# 15 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp" 2

# 1 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 1
# 59 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
       






# 1 "C:/Users/ajost1/CLionProjects/Kup/imgui/imconfig.h" 1
# 15 "C:/Users/ajost1/CLionProjects/Kup/imgui/imconfig.h"
       
# 67 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 2
# 75 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/float.h" 1 3 4
# 632 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/float.h" 3 4
# 1 "C:/msys64/ucrt64/include/float.h" 1 3 4
# 255 "C:/msys64/ucrt64/include/float.h" 3 4

# 255 "C:/msys64/ucrt64/include/float.h" 3 4
extern "C" {





__attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _controlfp (unsigned int _NewValue, unsigned int _Mask) ;
__attribute__((dllimport)) errno_t __attribute__((__cdecl__)) _controlfp_s(unsigned int *_CurrentState, unsigned int _NewValue, unsigned int _Mask);
__attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _control87 (unsigned int _NewValue, unsigned int _Mask);


__attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _clearfp (void);
__attribute__ ((__dllimport__)) unsigned int __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _statusfp (void);
# 281 "C:/msys64/ucrt64/include/float.h" 3 4
void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) _fpreset (void);

void __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) fpreset (void);



__attribute__ ((__dllimport__)) int * __attribute__((__cdecl__)) __attribute__ ((__nothrow__)) __fpecode(void);
# 312 "C:/msys64/ucrt64/include/float.h" 3 4
}
# 633 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/float.h" 2 3 4
# 76 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 2
# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdarg.h" 1 3 4
# 1 "C:/msys64/ucrt64/include/stdarg.h" 1 3 4
# 2 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdarg.h" 2 3 4
# 77 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 2
# 1 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 1 3 4
# 1 "C:/msys64/ucrt64/include/stddef.h" 1 3 4
# 13 "C:/msys64/ucrt64/include/stddef.h" 3 4
extern "C" {
# 24 "C:/msys64/ucrt64/include/stddef.h" 3 4
  __attribute__ ((__dllimport__)) extern unsigned long __attribute__((__cdecl__)) __threadid(void);

  __attribute__ ((__dllimport__)) extern uintptr_t __attribute__((__cdecl__)) __threadhandle(void);


}
# 424 "C:/msys64/ucrt64/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
# 2 "C:/msys64/ucrt64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 2 3 4
# 78 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 2
# 1 "C:/msys64/ucrt64/include/string.h" 1 3
# 21 "C:/msys64/ucrt64/include/string.h" 3
extern "C" {
# 45 "C:/msys64/ucrt64/include/string.h" 3
  __attribute__ ((__dllimport__)) void *__attribute__((__cdecl__)) _memccpy(void *_Dst,const void *_Src,int _Val,size_t _MaxCount);
  void *__attribute__((__cdecl__)) memchr(const void *_Buf ,int _Val,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _memicmp(const void *_Buf1,const void *_Buf2,size_t _Size);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _memicmp_l(const void *_Buf1,const void *_Buf2,size_t _Size,_locale_t _Locale);
  int __attribute__((__cdecl__)) memcmp(const void *_Buf1,const void *_Buf2,size_t _Size);
  void * __attribute__((__cdecl__)) memcpy(void * __restrict__ _Dst,const void * __restrict__ _Src,size_t _Size) ;
  __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) memcpy_s (void *_dest,size_t _numberOfElements,const void *_src,size_t _count);
  void * __attribute__((__cdecl__)) mempcpy (void *_Dst, const void *_Src, size_t _Size);
  void * __attribute__((__cdecl__)) memset(void *_Dst,int _Val,size_t _Size);

  void * __attribute__((__cdecl__)) memccpy(void *_Dst,const void *_Src,int _Val,size_t _Size) ;
  int __attribute__((__cdecl__)) memicmp(const void *_Buf1,const void *_Buf2,size_t _Size) ;


  char * __attribute__((__cdecl__)) _strset(char *_Str,int _Val) ;
  char * __attribute__((__cdecl__)) _strset_l(char *_Str,int _Val,_locale_t _Locale) ;
  char * __attribute__((__cdecl__)) strcpy(char * __restrict__ _Dest,const char * __restrict__ _Source);
  char * __attribute__((__cdecl__)) strcat(char * __restrict__ _Dest,const char * __restrict__ _Source);
  int __attribute__((__cdecl__)) strcmp(const char *_Str1,const char *_Str2);
  size_t __attribute__((__cdecl__)) strlen(const char *_Str);
  size_t __attribute__((__cdecl__)) strnlen(const char *_Str,size_t _MaxCount);
  void *__attribute__((__cdecl__)) memmove(void *_Dst,const void *_Src,size_t _Size) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strdup(const char *_Src);
  char *__attribute__((__cdecl__)) strchr(const char *_Str,int _Val);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricmp(const char *_Str1,const char *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strcmpi(const char *_Str1,const char *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricmp_l(const char *_Str1,const char *_Str2,_locale_t _Locale);
  int __attribute__((__cdecl__)) strcoll(const char *_Str1,const char *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strcoll_l(const char *_Str1,const char *_Str2,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricoll(const char *_Str1,const char *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricoll_l(const char *_Str1,const char *_Str2,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strncoll (const char *_Str1,const char *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strncoll_l(const char *_Str1,const char *_Str2,size_t _MaxCount,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicoll (const char *_Str1,const char *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicoll_l(const char *_Str1,const char *_Str2,size_t _MaxCount,_locale_t _Locale);
  size_t __attribute__((__cdecl__)) strcspn(const char *_Str,const char *_Control);
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strerror(const char *_ErrMsg) ;
  char *__attribute__((__cdecl__)) strerror(int) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strlwr(char *_String) ;
  char *strlwr_l(char *_String,_locale_t _Locale) ;
  char *__attribute__((__cdecl__)) strncat(char * __restrict__ _Dest,const char * __restrict__ _Source,size_t _Count) ;
  int __attribute__((__cdecl__)) strncmp(const char *_Str1,const char *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicmp(const char *_Str1,const char *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicmp_l(const char *_Str1,const char *_Str2,size_t _MaxCount,_locale_t _Locale);
  char *strncpy(char * __restrict__ _Dest,const char * __restrict__ _Source,size_t _Count) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strnset(char *_Str,int _Val,size_t _MaxCount) ;
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strnset_l(char *str,int c,size_t count,_locale_t _Locale) ;
  char *__attribute__((__cdecl__)) strpbrk(const char *_Str,const char *_Control);
  char *__attribute__((__cdecl__)) strrchr(const char *_Str,int _Ch);
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strrev(char *_Str);
  size_t __attribute__((__cdecl__)) strspn(const char *_Str,const char *_Control);
  char *__attribute__((__cdecl__)) strstr(const char *_Str,const char *_SubStr);
  char *__attribute__((__cdecl__)) strtok(char * __restrict__ _Str,const char * __restrict__ _Delim) ;
       

  char *strtok_r(char * __restrict__ _Str, const char * __restrict__ _Delim, char ** __restrict__ __last);
       
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strupr(char *_String) ;
  __attribute__ ((__dllimport__)) char *_strupr_l(char *_String,_locale_t _Locale) ;
  size_t __attribute__((__cdecl__)) strxfrm(char * __restrict__ _Dst,const char * __restrict__ _Src,size_t _MaxCount);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _strxfrm_l(char * __restrict__ _Dst,const char * __restrict__ _Src,size_t _MaxCount,_locale_t _Locale);


  char *__attribute__((__cdecl__)) strdup(const char *_Src) ;
  int __attribute__((__cdecl__)) strcmpi(const char *_Str1,const char *_Str2) ;
  int __attribute__((__cdecl__)) stricmp(const char *_Str1,const char *_Str2) ;
  char *__attribute__((__cdecl__)) strlwr(char *_Str) ;
  int __attribute__((__cdecl__)) strnicmp(const char *_Str1,const char *_Str,size_t _MaxCount) ;
  int __attribute__((__cdecl__)) strncasecmp (const char *, const char *, size_t);
  int __attribute__((__cdecl__)) strcasecmp (const char *, const char *);







  char *__attribute__((__cdecl__)) strnset(char *_Str,int _Val,size_t _MaxCount) ;
  char *__attribute__((__cdecl__)) strrev(char *_Str) ;
  char *__attribute__((__cdecl__)) strset(char *_Str,int _Val) ;
  char *__attribute__((__cdecl__)) strupr(char *_Str) ;





  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcsdup(const wchar_t *_Str);
  wchar_t *__attribute__((__cdecl__)) wcscat(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source) ;
  wchar_t *__attribute__((__cdecl__)) wcschr(const wchar_t *_Str,wchar_t _Ch);
  int __attribute__((__cdecl__)) wcscmp(const wchar_t *_Str1,const wchar_t *_Str2);
  wchar_t *__attribute__((__cdecl__)) wcscpy(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source) ;
  size_t __attribute__((__cdecl__)) wcscspn(const wchar_t *_Str,const wchar_t *_Control);
  size_t __attribute__((__cdecl__)) wcslen(const wchar_t *_Str);
  size_t __attribute__((__cdecl__)) wcsnlen(const wchar_t *_Src,size_t _MaxCount);
  wchar_t *wcsncat(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _Count) ;
  int __attribute__((__cdecl__)) wcsncmp(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
  wchar_t *wcsncpy(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _Count) ;
  wchar_t *__attribute__((__cdecl__)) _wcsncpy_l(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _Count,_locale_t _Locale) ;
  wchar_t *__attribute__((__cdecl__)) wcspbrk(const wchar_t *_Str,const wchar_t *_Control);
  wchar_t *__attribute__((__cdecl__)) wcsrchr(const wchar_t *_Str,wchar_t _Ch);
  size_t __attribute__((__cdecl__)) wcsspn(const wchar_t *_Str,const wchar_t *_Control);
  wchar_t *__attribute__((__cdecl__)) wcsstr(const wchar_t *_Str,const wchar_t *_SubStr);

  wchar_t *__attribute__((__cdecl__)) wcstok(wchar_t * __restrict__ _Str,const wchar_t * __restrict__ _Delim,wchar_t **_Ptr) ;



  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcserror(int _ErrNum) ;
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) __wcserror(const wchar_t *_Str) ;
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicmp(const wchar_t *_Str1,const wchar_t *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicmp_l(const wchar_t *_Str1,const wchar_t *_Str2,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicmp(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicmp_l(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount,_locale_t _Locale);
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcsnset(wchar_t *_Str,wchar_t _Val,size_t _MaxCount) ;
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcsrev(wchar_t *_Str);
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcsset(wchar_t *_Str,wchar_t _Val) ;
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcslwr(wchar_t *_String) ;
  __attribute__ ((__dllimport__)) wchar_t *_wcslwr_l(wchar_t *_String,_locale_t _Locale) ;
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcsupr(wchar_t *_String) ;
  __attribute__ ((__dllimport__)) wchar_t *_wcsupr_l(wchar_t *_String,_locale_t _Locale) ;
  size_t __attribute__((__cdecl__)) wcsxfrm(wchar_t * __restrict__ _Dst,const wchar_t * __restrict__ _Src,size_t _MaxCount);
  __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _wcsxfrm_l(wchar_t * __restrict__ _Dst,const wchar_t * __restrict__ _Src,size_t _MaxCount,_locale_t _Locale);
  int __attribute__((__cdecl__)) wcscoll(const wchar_t *_Str1,const wchar_t *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcscoll_l(const wchar_t *_Str1,const wchar_t *_Str2,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicoll(const wchar_t *_Str1,const wchar_t *_Str2);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicoll_l(const wchar_t *_Str1,const wchar_t *_Str2,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsncoll(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsncoll_l(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount,_locale_t _Locale);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicoll(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
  __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicoll_l(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount,_locale_t _Locale);


  wchar_t *__attribute__((__cdecl__)) wcsdup(const wchar_t *_Str) ;

  int __attribute__((__cdecl__)) wcsicmp(const wchar_t *_Str1,const wchar_t *_Str2) ;
  int __attribute__((__cdecl__)) wcsnicmp(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount) ;
  wchar_t *__attribute__((__cdecl__)) wcsnset(wchar_t *_Str,wchar_t _Val,size_t _MaxCount) ;
  wchar_t *__attribute__((__cdecl__)) wcsrev(wchar_t *_Str) ;
  wchar_t *__attribute__((__cdecl__)) wcsset(wchar_t *_Str,wchar_t _Val) ;
  wchar_t *__attribute__((__cdecl__)) wcslwr(wchar_t *_Str) ;
  wchar_t *__attribute__((__cdecl__)) wcsupr(wchar_t *_Str) ;
  int __attribute__((__cdecl__)) wcsicoll(const wchar_t *_Str1,const wchar_t *_Str2) ;




}


# 1 "C:/msys64/ucrt64/include/sec_api/string_s.h" 1 3
# 9 "C:/msys64/ucrt64/include/sec_api/string_s.h" 3
# 1 "C:/msys64/ucrt64/include/string.h" 1 3
# 10 "C:/msys64/ucrt64/include/sec_api/string_s.h" 2 3
# 21 "C:/msys64/ucrt64/include/sec_api/string_s.h" 3
extern "C" {


  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strset_s(char *_Dst,size_t _DstSize,int _Value);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strset_s(char (&_Dst)[__size], int _Value) { return _strset_s(_Dst,__size,_Value); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strerror_s(char *_Buf,size_t _SizeInBytes,const char *_ErrMsg);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strerror_s(char (&_Buf)[__size], const char * _ErrMsg) { return _strerror_s(_Buf,__size,_ErrMsg); } }
  __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) strerror_s(char *_Buf,size_t _SizeInBytes,int _ErrNum);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) strerror_s(char (&_Buf)[__size], int _ErrNum) { return strerror_s(_Buf,__size,_ErrNum); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strlwr_s(char *_Str,size_t _Size);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strlwr_s(char (&_Str)[__size]) { return _strlwr_s(_Str,__size); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strlwr_s_l(char *_Str,size_t _Size,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strlwr_s_l(char (&_Str)[__size], _locale_t _Locale) { return _strlwr_s_l(_Str,__size,_Locale); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strnset_s(char *_Str,size_t _Size,int _Val,size_t _MaxCount);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strnset_s(char (&_Str)[__size], int _Val, size_t _MaxCount) { return _strnset_s(_Str,__size,_Val,_MaxCount); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strupr_s(char *_Str,size_t _Size);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strupr_s(char (&_Str)[__size]) { return _strupr_s(_Str,__size); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strupr_s_l(char *_Str,size_t _Size,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strupr_s_l(char (&_Str)[__size], _locale_t _Locale) { return _strupr_s_l(_Str,__size,_Locale); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) strncat_s(char *_Dst,size_t _DstSizeInChars,const char *_Src,size_t _MaxCount);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) strncat_s(char (&_Dst)[__size], const char * _Src, size_t _MaxCount) { return strncat_s(_Dst,__size,_Src,_MaxCount); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strncat_s_l(char *_Dst,size_t _DstSizeInChars,const char *_Src,size_t _MaxCount,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strncat_s_l(char (&_Dst)[__size], const char * _Src, size_t _MaxCount, _locale_t _Locale) { return _strncat_s_l(_Dst,__size,_Src,_MaxCount,_Locale); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) strcpy_s(char *_Dst, rsize_t _SizeInBytes, const char *_Src);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) strcpy_s(char (&_Dest)[__size], const char * _Source) { return strcpy_s(_Dest,__size,_Source); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) strncpy_s(char *_Dst, size_t _DstSizeInChars, const char *_Src, size_t _MaxCount);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) strncpy_s(char (&_Dest)[__size], const char * _Source, size_t _MaxCount) { return strncpy_s(_Dest,__size,_Source,_MaxCount); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _strncpy_s_l(char *_Dst, size_t _DstSizeInChars, const char *_Src, size_t _MaxCount, _locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _strncpy_s_l(char (&_Dest)[__size], const char * _Source, size_t _MaxCount, _locale_t _Locale) { return _strncpy_s_l(_Dest,__size,_Source,_MaxCount,_Locale); } }
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) strtok_s(char *_Str,const char *_Delim,char **_Context);
  __attribute__ ((__dllimport__)) char *__attribute__((__cdecl__)) _strtok_s_l(char *_Str,const char *_Delim,char **_Context,_locale_t _Locale);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) strcat_s(char *_Dst, rsize_t _SizeInBytes, const char * _Src);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) strcat_s(char (&_Dest)[__size], const char * _Source) { return strcat_s(_Dest,__size,_Source); } }

  inline __attribute__((__always_inline__)) size_t __attribute__((__cdecl__)) strnlen_s(const char * _src, size_t _count) {
    return _src ? strnlen(_src, _count) : 0;
  }

  __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) memmove_s(void *_dest,size_t _numberOfElements,const void *_src,size_t _count);


  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) wcstok_s(wchar_t *_Str,const wchar_t *_Delim,wchar_t **_Context);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcserror_s(wchar_t *_Buf,size_t _SizeInWords,int _ErrNum);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcserror_s(wchar_t (&buffer)[__size], int error) { return _wcserror_s(buffer,__size,error); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) __wcserror_s(wchar_t *_Buffer,size_t _SizeInWords,const wchar_t *_ErrMsg);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsnset_s(wchar_t *_Dst,size_t _DstSizeInWords,wchar_t _Val,size_t _MaxCount);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsset_s(wchar_t *_Str,size_t _SizeInWords,wchar_t _Val);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcslwr_s(wchar_t *_Str,size_t _SizeInWords);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcslwr_s(wchar_t (&_Str)[__size]) { return _wcslwr_s(_Str,__size); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcslwr_s_l(wchar_t *_Str,size_t _SizeInWords,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcslwr_s_l(wchar_t (&_Str)[__size], _locale_t _Locale) { return _wcslwr_s_l(_Str,__size,_Locale); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsupr_s(wchar_t *_Str,size_t _Size);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcsupr_s(wchar_t (&_Str)[__size]) { return _wcsupr_s(_Str,__size); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsupr_s_l(wchar_t *_Str,size_t _Size,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcsupr_s_l(wchar_t (&_Str)[__size], _locale_t _Locale) { return _wcsupr_s_l(_Str,__size,_Locale); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) wcscpy_s(wchar_t *_Dst, rsize_t _SizeInWords, const wchar_t *_Src);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) wcscpy_s(wchar_t (&_Dest)[__size], const wchar_t * _Source) { return wcscpy_s(_Dest,__size,_Source); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) wcscat_s(wchar_t * _Dst, rsize_t _SizeInWords, const wchar_t *_Src);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) wcscat_s(wchar_t (&_Dest)[__size], const wchar_t * _Source) { return wcscat_s(_Dest,__size,_Source); } }

  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) wcsncat_s(wchar_t *_Dst,size_t _DstSizeInChars,const wchar_t *_Src,size_t _MaxCount);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) wcsncat_s(wchar_t (&_Dst)[__size], const wchar_t * _Src, size_t _MaxCount) { return wcsncat_s(_Dst,__size,_Src,_MaxCount); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsncat_s_l(wchar_t *_Dst,size_t _DstSizeInChars,const wchar_t *_Src,size_t _MaxCount,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcsncat_s_l(wchar_t (&_Dst)[__size], const wchar_t * _Src, size_t _MaxCount, _locale_t _Locale) { return _wcsncat_s_l(_Dst,__size,_Src,_MaxCount,_Locale); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) wcsncpy_s(wchar_t *_Dst, size_t _DstSizeInChars, const wchar_t *_Src, size_t _MaxCount);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) wcsncpy_s(wchar_t (&_Dest)[__size], const wchar_t * _Source, size_t _MaxCount) { return wcsncpy_s(_Dest,__size,_Source,_MaxCount); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsncpy_s_l(wchar_t *_Dst, size_t _DstSizeInChars, const wchar_t *_Src, size_t _MaxCount, _locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcsncpy_s_l(wchar_t (&_Dest)[__size], const wchar_t * _Source, size_t _MaxCount, _locale_t _Locale) { return _wcsncpy_s_l(_Dest,__size,_Source,_MaxCount,_Locale); } }
  __attribute__ ((__dllimport__)) wchar_t *__attribute__((__cdecl__)) _wcstok_s_l(wchar_t *_Str,const wchar_t *_Delim,wchar_t **_Context,_locale_t _Locale);
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsset_s_l(wchar_t *_Str,size_t _SizeInChars,wchar_t _Val,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcsset_s_l(wchar_t (&_Str)[__size], wchar_t _Val, _locale_t _Locale) { return _wcsset_s_l(_Str,__size,_Val,_Locale); } }
  __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wcsnset_s_l(wchar_t *_Str,size_t _SizeInChars,wchar_t _Val, size_t _Count,_locale_t _Locale);
  extern "C++" { template <size_t __size> inline errno_t __attribute__((__cdecl__)) _wcsnset_s_l(wchar_t (&_Str)[__size], wchar_t _Val, size_t _Count, _locale_t _Locale) { return _wcsnset_s_l(_Str,__size,_Val,_Count,_Locale); } }

  inline __attribute__((__always_inline__)) size_t __attribute__((__cdecl__)) wcsnlen_s(const wchar_t * _src, size_t _count) {
    return _src ? wcsnlen(_src, _count) : 0;
  }



}
# 195 "C:/msys64/ucrt64/include/string.h" 2 3
# 79 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 2
# 92 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
# 1 "C:/msys64/ucrt64/include/assert.h" 1 3
# 17 "C:/msys64/ucrt64/include/assert.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 1 3
# 36 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 3
# 1 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 1 3
# 39 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 3
       
# 40 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 3
# 125 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 3
extern "C++"
{
namespace std
{


  using ::div_t;
  using ::ldiv_t;

  using ::abort;



  using ::atexit;


  using ::at_quick_exit;


  using ::atof;
  using ::atoi;
  using ::atol;
  using ::bsearch;
  using ::calloc;
  using ::div;
  using ::exit;
  using ::free;
  using ::getenv;
  using ::labs;
  using ::ldiv;
  using ::malloc;

  using ::mblen;
  using ::mbstowcs;
  using ::mbtowc;

  using ::qsort;


  using ::quick_exit;


  using ::rand;
  using ::realloc;
  using ::srand;
  using ::strtod;
  using ::strtol;
  using ::strtoul;
  using ::system;

  using ::wcstombs;
  using ::wctomb;



  inline ldiv_t
  div(long __i, long __j) noexcept { return ldiv(__i, __j); }




}
# 199 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 3
namespace __gnu_cxx
{



  using ::lldiv_t;





  using ::_Exit;



  using ::llabs;

  inline lldiv_t
  div(long long __n, long long __d)
  { lldiv_t __q; __q.quot = __n / __d; __q.rem = __n % __d; return __q; }

  using ::lldiv;
# 231 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 3
  using ::atoll;
  using ::strtoll;
  using ::strtoull;

  using ::strtof;
  using ::strtold;


}

namespace std
{

  using ::__gnu_cxx::lldiv_t;

  using ::__gnu_cxx::_Exit;

  using ::__gnu_cxx::llabs;
  using ::__gnu_cxx::div;
  using ::__gnu_cxx::lldiv;

  using ::__gnu_cxx::atoll;
  using ::__gnu_cxx::strtof;
  using ::__gnu_cxx::strtoll;
  using ::__gnu_cxx::strtoull;
  using ::__gnu_cxx::strtold;
}
# 275 "C:/msys64/ucrt64/include/c++/14.2.0/cstdlib" 3
}
# 37 "C:/msys64/ucrt64/include/c++/14.2.0/stdlib.h" 2 3

using std::abort;
using std::atexit;
using std::exit;


  using std::at_quick_exit;


  using std::quick_exit;


  using std::_Exit;




using std::div_t;
using std::ldiv_t;

using std::abs;
using std::atof;
using std::atoi;
using std::atol;
using std::bsearch;
using std::calloc;
using std::div;
using std::free;
using std::getenv;
using std::labs;
using std::ldiv;
using std::malloc;

using std::mblen;
using std::mbstowcs;
using std::mbtowc;

using std::qsort;
using std::rand;
using std::realloc;
using std::srand;
using std::strtod;
using std::strtol;
using std::strtoul;
using std::system;

using std::wcstombs;
using std::wctomb;
# 18 "C:/msys64/ucrt64/include/assert.h" 2 3



extern "C" {


__attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) _wassert(const wchar_t *_Message,const wchar_t *_File,unsigned _Line);
__attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) _assert (const char *_Message, const char *_File, unsigned _Line);


}
# 93 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 2
# 141 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpragmas"
#pragma GCC diagnostic ignored "-Wclass-memaccess"







typedef unsigned int ImGuiID;
typedef signed char ImS8;
typedef unsigned char ImU8;
typedef signed short ImS16;
typedef unsigned short ImU16;
typedef signed int ImS32;
typedef unsigned int ImU32;
typedef signed long long ImS64;
typedef unsigned long long ImU64;


struct ImDrawChannel;
struct ImDrawCmd;
struct ImDrawData;
struct ImDrawList;
struct ImDrawListSharedData;
struct ImDrawListSplitter;
struct ImDrawVert;
struct ImFont;
struct ImFontAtlas;
struct ImFontBuilderIO;
struct ImFontConfig;
struct ImFontGlyph;
struct ImFontGlyphRangesBuilder;
struct ImColor;
struct ImGuiContext;
struct ImGuiIO;
struct ImGuiInputTextCallbackData;
struct ImGuiKeyData;
struct ImGuiListClipper;
struct ImGuiMultiSelectIO;
struct ImGuiOnceUponAFrame;
struct ImGuiPayload;
struct ImGuiPlatformIO;
struct ImGuiPlatformImeData;
struct ImGuiPlatformMonitor;
struct ImGuiSelectionBasicStorage;
struct ImGuiSelectionExternalStorage;
struct ImGuiSelectionRequest;
struct ImGuiSizeCallbackData;
struct ImGuiStorage;
struct ImGuiStoragePair;
struct ImGuiStyle;
struct ImGuiTableSortSpecs;
struct ImGuiTableColumnSortSpecs;
struct ImGuiTextBuffer;
struct ImGuiTextFilter;
struct ImGuiViewport;
struct ImGuiWindowClass;







enum ImGuiDir : int;
enum ImGuiKey : int;
enum ImGuiMouseSource : int;
enum ImGuiSortDirection : ImU8;
typedef int ImGuiCol;
typedef int ImGuiCond;
typedef int ImGuiDataType;
typedef int ImGuiMouseButton;
typedef int ImGuiMouseCursor;
typedef int ImGuiStyleVar;
typedef int ImGuiTableBgTarget;






typedef int ImDrawFlags;
typedef int ImDrawListFlags;
typedef int ImFontAtlasFlags;
typedef int ImGuiBackendFlags;
typedef int ImGuiButtonFlags;
typedef int ImGuiChildFlags;
typedef int ImGuiColorEditFlags;
typedef int ImGuiConfigFlags;
typedef int ImGuiComboFlags;
typedef int ImGuiDockNodeFlags;
typedef int ImGuiDragDropFlags;
typedef int ImGuiFocusedFlags;
typedef int ImGuiHoveredFlags;
typedef int ImGuiInputFlags;
typedef int ImGuiInputTextFlags;
typedef int ImGuiItemFlags;
typedef int ImGuiKeyChord;
typedef int ImGuiPopupFlags;
typedef int ImGuiMultiSelectFlags;
typedef int ImGuiSelectableFlags;
typedef int ImGuiSliderFlags;
typedef int ImGuiTabBarFlags;
typedef int ImGuiTabItemFlags;
typedef int ImGuiTableFlags;
typedef int ImGuiTableColumnFlags;
typedef int ImGuiTableRowFlags;
typedef int ImGuiTreeNodeFlags;
typedef int ImGuiViewportFlags;
typedef int ImGuiWindowFlags;





typedef void* ImTextureID;






typedef unsigned short ImDrawIdx;




typedef unsigned int ImWchar32;
typedef unsigned short ImWchar16;



typedef ImWchar16 ImWchar;





typedef ImS64 ImGuiSelectionUserData;


typedef int (*ImGuiInputTextCallback)(ImGuiInputTextCallbackData* data);
typedef void (*ImGuiSizeCallback)(ImGuiSizeCallbackData* data);
typedef void* (*ImGuiMemAllocFunc)(size_t sz, void* user_data);
typedef void (*ImGuiMemFreeFunc)(void* ptr, void* user_data);





struct ImVec2
{
    float x, y;
    constexpr ImVec2() : x(0.0f), y(0.0f) { }
    constexpr ImVec2(float _x, float _y) : x(_x), y(_y) { }
    float& operator[] (size_t idx) { 
# 298 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                             (void) ((!!(
# 298 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                             idx == 0 || idx == 1
# 298 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                             )) || (_assert(
# 298 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                             "idx == 0 || idx == 1"
# 298 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",298),0))
# 298 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                            ; return ((float*)(void*)(char*)this)[idx]; }
    float operator[] (size_t idx) const { 
# 299 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                             (void) ((!!(
# 299 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                             idx == 0 || idx == 1
# 299 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                             )) || (_assert(
# 299 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                             "idx == 0 || idx == 1"
# 299 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",299),0))
# 299 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                            ; return ((const float*)(const void*)(const char*)this)[idx]; }



};


struct ImVec4
{
    float x, y, z, w;
    constexpr ImVec4() : x(0.0f), y(0.0f), z(0.0f), w(0.0f) { }
    constexpr ImVec4(float _x, float _y, float _z, float _w) : x(_x), y(_y), z(_z), w(_w) { }



};







namespace ImGui
{




    ImGuiContext* CreateContext(ImFontAtlas* shared_font_atlas = 
# 328 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                          __null
# 328 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                              );
    void DestroyContext(ImGuiContext* ctx = 
# 329 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                              __null
# 329 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                  );
    ImGuiContext* GetCurrentContext();
    void SetCurrentContext(ImGuiContext* ctx);


    ImGuiIO& GetIO();
    ImGuiPlatformIO& GetPlatformIO();
    ImGuiStyle& GetStyle();
    void NewFrame();
    void EndFrame();
    void Render();
    ImDrawData* GetDrawData();


    void ShowDemoWindow(bool* p_open = 
# 343 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                         __null
# 343 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             );
    void ShowMetricsWindow(bool* p_open = 
# 344 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                            __null
# 344 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                );
    void ShowDebugLogWindow(bool* p_open = 
# 345 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                             __null
# 345 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                 );
    void ShowIDStackToolWindow(bool* p_open = 
# 346 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                __null
# 346 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                    );
    void ShowAboutWindow(bool* p_open = 
# 347 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                          __null
# 347 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                              );
    void ShowStyleEditor(ImGuiStyle* ref = 
# 348 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                             __null
# 348 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                 );
    bool ShowStyleSelector(const char* label);
    void ShowFontSelector(const char* label);
    void ShowUserGuide();
    const char* GetVersion();


    void StyleColorsDark(ImGuiStyle* dst = 
# 355 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                             __null
# 355 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                 );
    void StyleColorsLight(ImGuiStyle* dst = 
# 356 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                              __null
# 356 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                  );
    void StyleColorsClassic(ImGuiStyle* dst = 
# 357 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                __null
# 357 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                    );
# 371 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool Begin(const char* name, bool* p_open = 
# 371 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                  __null
# 371 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                      , ImGuiWindowFlags flags = 0);
    void End();
# 392 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool BeginChild(const char* str_id, const ImVec2& size = ImVec2(0, 0), ImGuiChildFlags child_flags = 0, ImGuiWindowFlags window_flags = 0);
    bool BeginChild(ImGuiID id, const ImVec2& size = ImVec2(0, 0), ImGuiChildFlags child_flags = 0, ImGuiWindowFlags window_flags = 0);
    void EndChild();



    bool IsWindowAppearing();
    bool IsWindowCollapsed();
    bool IsWindowFocused(ImGuiFocusedFlags flags=0);
    bool IsWindowHovered(ImGuiHoveredFlags flags=0);
    ImDrawList* GetWindowDrawList();
    float GetWindowDpiScale();
    ImVec2 GetWindowPos();
    ImVec2 GetWindowSize();
    float GetWindowWidth();
    float GetWindowHeight();
    ImGuiViewport*GetWindowViewport();



    void SetNextWindowPos(const ImVec2& pos, ImGuiCond cond = 0, const ImVec2& pivot = ImVec2(0, 0));
    void SetNextWindowSize(const ImVec2& size, ImGuiCond cond = 0);
    void SetNextWindowSizeConstraints(const ImVec2& size_min, const ImVec2& size_max, ImGuiSizeCallback custom_callback = 
# 414 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                            __null
# 414 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                , void* custom_callback_data = 
# 414 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                               __null
# 414 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                   );
    void SetNextWindowContentSize(const ImVec2& size);
    void SetNextWindowCollapsed(bool collapsed, ImGuiCond cond = 0);
    void SetNextWindowFocus();
    void SetNextWindowScroll(const ImVec2& scroll);
    void SetNextWindowBgAlpha(float alpha);
    void SetNextWindowViewport(ImGuiID viewport_id);
    void SetWindowPos(const ImVec2& pos, ImGuiCond cond = 0);
    void SetWindowSize(const ImVec2& size, ImGuiCond cond = 0);
    void SetWindowCollapsed(bool collapsed, ImGuiCond cond = 0);
    void SetWindowFocus();
    void SetWindowFontScale(float scale);
    void SetWindowPos(const char* name, const ImVec2& pos, ImGuiCond cond = 0);
    void SetWindowSize(const char* name, const ImVec2& size, ImGuiCond cond = 0);
    void SetWindowCollapsed(const char* name, bool collapsed, ImGuiCond cond = 0);
    void SetWindowFocus(const char* name);




    float GetScrollX();
    float GetScrollY();
    void SetScrollX(float scroll_x);
    void SetScrollY(float scroll_y);
    float GetScrollMaxX();
    float GetScrollMaxY();
    void SetScrollHereX(float center_x_ratio = 0.5f);
    void SetScrollHereY(float center_y_ratio = 0.5f);
    void SetScrollFromPosX(float local_x, float center_x_ratio = 0.5f);
    void SetScrollFromPosY(float local_y, float center_y_ratio = 0.5f);


    void PushFont(ImFont* font);
    void PopFont();
    void PushStyleColor(ImGuiCol idx, ImU32 col);
    void PushStyleColor(ImGuiCol idx, const ImVec4& col);
    void PopStyleColor(int count = 1);
    void PushStyleVar(ImGuiStyleVar idx, float val);
    void PushStyleVar(ImGuiStyleVar idx, const ImVec2& val);
    void PushStyleVarX(ImGuiStyleVar idx, float val_x);
    void PushStyleVarY(ImGuiStyleVar idx, float val_y);
    void PopStyleVar(int count = 1);
    void PushItemFlag(ImGuiItemFlags option, bool enabled);
    void PopItemFlag();


    void PushItemWidth(float item_width);
    void PopItemWidth();
    void SetNextItemWidth(float item_width);
    float CalcItemWidth();
    void PushTextWrapPos(float wrap_local_pos_x = 0.0f);
    void PopTextWrapPos();



    ImFont* GetFont();
    float GetFontSize();
    ImVec2 GetFontTexUvWhitePixel();
    ImU32 GetColorU32(ImGuiCol idx, float alpha_mul = 1.0f);
    ImU32 GetColorU32(const ImVec4& col);
    ImU32 GetColorU32(ImU32 col, float alpha_mul = 1.0f);
    const ImVec4& GetStyleColorVec4(ImGuiCol idx);
# 487 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    ImVec2 GetCursorScreenPos();
    void SetCursorScreenPos(const ImVec2& pos);
    ImVec2 GetContentRegionAvail();
    ImVec2 GetCursorPos();
    float GetCursorPosX();
    float GetCursorPosY();
    void SetCursorPos(const ImVec2& local_pos);
    void SetCursorPosX(float local_x);
    void SetCursorPosY(float local_y);
    ImVec2 GetCursorStartPos();


    void Separator();
    void SameLine(float offset_from_start_x=0.0f, float spacing=-1.0f);
    void NewLine();
    void Spacing();
    void Dummy(const ImVec2& size);
    void Indent(float indent_w = 0.0f);
    void Unindent(float indent_w = 0.0f);
    void BeginGroup();
    void EndGroup();
    void AlignTextToFramePadding();
    float GetTextLineHeight();
    float GetTextLineHeightWithSpacing();
    float GetFrameHeight();
    float GetFrameHeightWithSpacing();
# 525 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    void PushID(const char* str_id);
    void PushID(const char* str_id_begin, const char* str_id_end);
    void PushID(const void* ptr_id);
    void PushID(int int_id);
    void PopID();
    ImGuiID GetID(const char* str_id);
    ImGuiID GetID(const char* str_id_begin, const char* str_id_end);
    ImGuiID GetID(const void* ptr_id);
    ImGuiID GetID(int int_id);


    void TextUnformatted(const char* text, const char* text_end = 
# 536 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                    __null
# 536 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                        );
    void Text(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void TextV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));
    void TextColored(const ImVec4& col, const char* fmt, ...) __attribute__((format(gnu_printf, 2, 2 +1)));
    void TextColoredV(const ImVec4& col, const char* fmt, va_list args) __attribute__((format(gnu_printf, 2, 0)));
    void TextDisabled(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void TextDisabledV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));
    void TextWrapped(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void TextWrappedV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));
    void LabelText(const char* label, const char* fmt, ...) __attribute__((format(gnu_printf, 2, 2 +1)));
    void LabelTextV(const char* label, const char* fmt, va_list args) __attribute__((format(gnu_printf, 2, 0)));
    void BulletText(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void BulletTextV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));
    void SeparatorText(const char* label);




    bool Button(const char* label, const ImVec2& size = ImVec2(0, 0));
    bool SmallButton(const char* label);
    bool InvisibleButton(const char* str_id, const ImVec2& size, ImGuiButtonFlags flags = 0);
    bool ArrowButton(const char* str_id, ImGuiDir dir);
    bool Checkbox(const char* label, bool* v);
    bool CheckboxFlags(const char* label, int* flags, int flags_value);
    bool CheckboxFlags(const char* label, unsigned int* flags, unsigned int flags_value);
    bool RadioButton(const char* label, bool active);
    bool RadioButton(const char* label, int* v, int v_button);
    void ProgressBar(float fraction, const ImVec2& size_arg = ImVec2(-1.17549435082228750796873653722224568e-38F
# 563 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                               , 0), const char* overlay = 
# 563 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                           __null
# 563 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                               );
    void Bullet();
    bool TextLink(const char* label);
    void TextLinkOpenURL(const char* label, const char* url = 
# 566 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                __null
# 566 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                    );





    void Image(ImTextureID user_texture_id, const ImVec2& image_size, const ImVec2& uv0 = ImVec2(0, 0), const ImVec2& uv1 = ImVec2(1, 1), const ImVec4& tint_col = ImVec4(1, 1, 1, 1), const ImVec4& border_col = ImVec4(0, 0, 0, 0));
    bool ImageButton(const char* str_id, ImTextureID user_texture_id, const ImVec2& image_size, const ImVec2& uv0 = ImVec2(0, 0), const ImVec2& uv1 = ImVec2(1, 1), const ImVec4& bg_col = ImVec4(0, 0, 0, 0), const ImVec4& tint_col = ImVec4(1, 1, 1, 1));




    bool BeginCombo(const char* label, const char* preview_value, ImGuiComboFlags flags = 0);
    void EndCombo();
    bool Combo(const char* label, int* current_item, const char* const items[], int items_count, int popup_max_height_in_items = -1);
    bool Combo(const char* label, int* current_item, const char* items_separated_by_zeros, int popup_max_height_in_items = -1);
    bool Combo(const char* label, int* current_item, const char* (*getter)(void* user_data, int idx), void* user_data, int items_count, int popup_max_height_in_items = -1);
# 596 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool DragFloat(const char* label, float* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool DragFloat2(const char* label, float v[2], float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool DragFloat3(const char* label, float v[3], float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool DragFloat4(const char* label, float v[4], float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool DragFloatRange2(const char* label, float* v_current_min, float* v_current_max, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, const char* format = "%.3f", const char* format_max = 
# 600 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                                              __null
# 600 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                                  , ImGuiSliderFlags flags = 0);
    bool DragInt(const char* label, int* v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool DragInt2(const char* label, int v[2], float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool DragInt3(const char* label, int v[3], float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool DragInt4(const char* label, int v[4], float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool DragIntRange2(const char* label, int* v_current_min, int* v_current_max, float v_speed = 1.0f, int v_min = 0, int v_max = 0, const char* format = "%d", const char* format_max = 
# 605 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                            __null
# 605 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                , ImGuiSliderFlags flags = 0);
    bool DragScalar(const char* label, ImGuiDataType data_type, void* p_data, float v_speed = 1.0f, const void* p_min = 
# 606 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                          __null
# 606 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                              , const void* p_max = 
# 606 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                    __null
# 606 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                        , const char* format = 
# 606 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                               __null
# 606 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                   , ImGuiSliderFlags flags = 0);
    bool DragScalarN(const char* label, ImGuiDataType data_type, void* p_data, int components, float v_speed = 1.0f, const void* p_min = 
# 607 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                           __null
# 607 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                               , const void* p_max = 
# 607 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                     __null
# 607 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                         , const char* format = 
# 607 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                                __null
# 607 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                    , ImGuiSliderFlags flags = 0);







    bool SliderFloat(const char* label, float* v, float v_min, float v_max, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool SliderFloat2(const char* label, float v[2], float v_min, float v_max, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool SliderFloat3(const char* label, float v[3], float v_min, float v_max, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool SliderFloat4(const char* label, float v[4], float v_min, float v_max, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool SliderAngle(const char* label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f, const char* format = "%.0f deg", ImGuiSliderFlags flags = 0);
    bool SliderInt(const char* label, int* v, int v_min, int v_max, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool SliderInt2(const char* label, int v[2], int v_min, int v_max, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool SliderInt3(const char* label, int v[3], int v_min, int v_max, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool SliderInt4(const char* label, int v[4], int v_min, int v_max, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool SliderScalar(const char* label, ImGuiDataType data_type, void* p_data, const void* p_min, const void* p_max, const char* format = 
# 624 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                             __null
# 624 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                 , ImGuiSliderFlags flags = 0);
    bool SliderScalarN(const char* label, ImGuiDataType data_type, void* p_data, int components, const void* p_min, const void* p_max, const char* format = 
# 625 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                              __null
# 625 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                  , ImGuiSliderFlags flags = 0);
    bool VSliderFloat(const char* label, const ImVec2& size, float* v, float v_min, float v_max, const char* format = "%.3f", ImGuiSliderFlags flags = 0);
    bool VSliderInt(const char* label, const ImVec2& size, int* v, int v_min, int v_max, const char* format = "%d", ImGuiSliderFlags flags = 0);
    bool VSliderScalar(const char* label, const ImVec2& size, ImGuiDataType data_type, void* p_data, const void* p_min, const void* p_max, const char* format = 
# 628 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                  __null
# 628 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                      , ImGuiSliderFlags flags = 0);




    bool InputText(const char* label, char* buf, size_t buf_size, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = 
# 633 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                     __null
# 633 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                         , void* user_data = 
# 633 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                             __null
# 633 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                 );
    bool InputTextMultiline(const char* label, char* buf, size_t buf_size, const ImVec2& size = ImVec2(0, 0), ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = 
# 634 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                 __null
# 634 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                     , void* user_data = 
# 634 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                                         __null
# 634 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                             );
    bool InputTextWithHint(const char* label, const char* hint, char* buf, size_t buf_size, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = 
# 635 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                               __null
# 635 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                   , void* user_data = 
# 635 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                       __null
# 635 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                           );
    bool InputFloat(const char* label, float* v, float step = 0.0f, float step_fast = 0.0f, const char* format = "%.3f", ImGuiInputTextFlags flags = 0);
    bool InputFloat2(const char* label, float v[2], const char* format = "%.3f", ImGuiInputTextFlags flags = 0);
    bool InputFloat3(const char* label, float v[3], const char* format = "%.3f", ImGuiInputTextFlags flags = 0);
    bool InputFloat4(const char* label, float v[4], const char* format = "%.3f", ImGuiInputTextFlags flags = 0);
    bool InputInt(const char* label, int* v, int step = 1, int step_fast = 100, ImGuiInputTextFlags flags = 0);
    bool InputInt2(const char* label, int v[2], ImGuiInputTextFlags flags = 0);
    bool InputInt3(const char* label, int v[3], ImGuiInputTextFlags flags = 0);
    bool InputInt4(const char* label, int v[4], ImGuiInputTextFlags flags = 0);
    bool InputDouble(const char* label, double* v, double step = 0.0, double step_fast = 0.0, const char* format = "%.6f", ImGuiInputTextFlags flags = 0);
    bool InputScalar(const char* label, ImGuiDataType data_type, void* p_data, const void* p_step = 
# 645 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                      __null
# 645 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                          , const void* p_step_fast = 
# 645 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                      __null
# 645 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                          , const char* format = 
# 645 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                 __null
# 645 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                     , ImGuiInputTextFlags flags = 0);
    bool InputScalarN(const char* label, ImGuiDataType data_type, void* p_data, int components, const void* p_step = 
# 646 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                       __null
# 646 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                           , const void* p_step_fast = 
# 646 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                       __null
# 646 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                           , const char* format = 
# 646 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                  __null
# 646 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                      , ImGuiInputTextFlags flags = 0);




    bool ColorEdit3(const char* label, float col[3], ImGuiColorEditFlags flags = 0);
    bool ColorEdit4(const char* label, float col[4], ImGuiColorEditFlags flags = 0);
    bool ColorPicker3(const char* label, float col[3], ImGuiColorEditFlags flags = 0);
    bool ColorPicker4(const char* label, float col[4], ImGuiColorEditFlags flags = 0, const float* ref_col = 
# 654 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                               __null
# 654 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                   );
    bool ColorButton(const char* desc_id, const ImVec4& col, ImGuiColorEditFlags flags = 0, const ImVec2& size = ImVec2(0, 0));
    void SetColorEditOptions(ImGuiColorEditFlags flags);



    bool TreeNode(const char* label);
    bool TreeNode(const char* str_id, const char* fmt, ...) __attribute__((format(gnu_printf, 2, 2 +1)));
    bool TreeNode(const void* ptr_id, const char* fmt, ...) __attribute__((format(gnu_printf, 2, 2 +1)));
    bool TreeNodeV(const char* str_id, const char* fmt, va_list args) __attribute__((format(gnu_printf, 2, 0)));
    bool TreeNodeV(const void* ptr_id, const char* fmt, va_list args) __attribute__((format(gnu_printf, 2, 0)));
    bool TreeNodeEx(const char* label, ImGuiTreeNodeFlags flags = 0);
    bool TreeNodeEx(const char* str_id, ImGuiTreeNodeFlags flags, const char* fmt, ...) __attribute__((format(gnu_printf, 3, 3 +1)));
    bool TreeNodeEx(const void* ptr_id, ImGuiTreeNodeFlags flags, const char* fmt, ...) __attribute__((format(gnu_printf, 3, 3 +1)));
    bool TreeNodeExV(const char* str_id, ImGuiTreeNodeFlags flags, const char* fmt, va_list args) __attribute__((format(gnu_printf, 3, 0)));
    bool TreeNodeExV(const void* ptr_id, ImGuiTreeNodeFlags flags, const char* fmt, va_list args) __attribute__((format(gnu_printf, 3, 0)));
    void TreePush(const char* str_id);
    void TreePush(const void* ptr_id);
    void TreePop();
    float GetTreeNodeToLabelSpacing();
    bool CollapsingHeader(const char* label, ImGuiTreeNodeFlags flags = 0);
    bool CollapsingHeader(const char* label, bool* p_visible, ImGuiTreeNodeFlags flags = 0);
    void SetNextItemOpen(bool is_open, ImGuiCond cond = 0);
    void SetNextItemStorageID(ImGuiID storage_id);




    bool Selectable(const char* label, bool selected = false, ImGuiSelectableFlags flags = 0, const ImVec2& size = ImVec2(0, 0));
    bool Selectable(const char* label, bool* p_selected, ImGuiSelectableFlags flags = 0, const ImVec2& size = ImVec2(0, 0));
# 692 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    ImGuiMultiSelectIO* BeginMultiSelect(ImGuiMultiSelectFlags flags, int selection_size = -1, int items_count = -1);
    ImGuiMultiSelectIO* EndMultiSelect();
    void SetNextItemSelectionUserData(ImGuiSelectionUserData selection_user_data);
    bool IsItemToggledSelection();







    bool BeginListBox(const char* label, const ImVec2& size = ImVec2(0, 0));
    void EndListBox();
    bool ListBox(const char* label, int* current_item, const char* const items[], int items_count, int height_in_items = -1);
    bool ListBox(const char* label, int* current_item, const char* (*getter)(void* user_data, int idx), void* user_data, int items_count, int height_in_items = -1);



    void PlotLines(const char* label, const float* values, int values_count, int values_offset = 0, const char* overlay_text = 
# 710 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                 __null
# 710 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                     , float scale_min = 3.40282346638528859811704183484516925e+38F
# 710 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                , float scale_max = 3.40282346638528859811704183484516925e+38F
# 710 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                           , ImVec2 graph_size = ImVec2(0, 0), int stride = sizeof(float));
    void PlotLines(const char* label, float(*values_getter)(void* data, int idx), void* data, int values_count, int values_offset = 0, const char* overlay_text = 
# 711 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                    __null
# 711 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                        , float scale_min = 3.40282346638528859811704183484516925e+38F
# 711 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                   , float scale_max = 3.40282346638528859811704183484516925e+38F
# 711 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                                              , ImVec2 graph_size = ImVec2(0, 0));
    void PlotHistogram(const char* label, const float* values, int values_count, int values_offset = 0, const char* overlay_text = 
# 712 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                     __null
# 712 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                         , float scale_min = 3.40282346638528859811704183484516925e+38F
# 712 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                    , float scale_max = 3.40282346638528859811704183484516925e+38F
# 712 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                               , ImVec2 graph_size = ImVec2(0, 0), int stride = sizeof(float));
    void PlotHistogram(const char* label, float (*values_getter)(void* data, int idx), void* data, int values_count, int values_offset = 0, const char* overlay_text = 
# 713 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                         __null
# 713 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                             , float scale_min = 3.40282346638528859811704183484516925e+38F
# 713 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                        , float scale_max = 3.40282346638528859811704183484516925e+38F
# 713 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                                                   , ImVec2 graph_size = ImVec2(0, 0));



    void Value(const char* prefix, bool b);
    void Value(const char* prefix, int v);
    void Value(const char* prefix, unsigned int v);
    void Value(const char* prefix, float v, const char* float_format = 
# 720 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                         __null
# 720 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                             );






    bool BeginMenuBar();
    void EndMenuBar();
    bool BeginMainMenuBar();
    void EndMainMenuBar();
    bool BeginMenu(const char* label, bool enabled = true);
    void EndMenu();
    bool MenuItem(const char* label, const char* shortcut = 
# 733 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                              __null
# 733 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                  , bool selected = false, bool enabled = true);
    bool MenuItem(const char* label, const char* shortcut, bool* p_selected, bool enabled = true);





    bool BeginTooltip();
    void EndTooltip();
    void SetTooltip(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void SetTooltipV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));





    bool BeginItemTooltip();
    void SetItemTooltip(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void SetItemTooltipV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));
# 763 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool BeginPopup(const char* str_id, ImGuiWindowFlags flags = 0);
    bool BeginPopupModal(const char* name, bool* p_open = 
# 764 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                            __null
# 764 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                , ImGuiWindowFlags flags = 0);
    void EndPopup();
# 775 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    void OpenPopup(const char* str_id, ImGuiPopupFlags popup_flags = 0);
    void OpenPopup(ImGuiID id, ImGuiPopupFlags popup_flags = 0);
    void OpenPopupOnItemClick(const char* str_id = 
# 777 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                     __null
# 777 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                         , ImGuiPopupFlags popup_flags = 1);
    void CloseCurrentPopup();






    bool BeginPopupContextItem(const char* str_id = 
# 785 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                      __null
# 785 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                          , ImGuiPopupFlags popup_flags = 1);
    bool BeginPopupContextWindow(const char* str_id = 
# 786 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                        __null
# 786 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                            , ImGuiPopupFlags popup_flags = 1);
    bool BeginPopupContextVoid(const char* str_id = 
# 787 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                      __null
# 787 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                          , ImGuiPopupFlags popup_flags = 1);





    bool IsPopupOpen(const char* str_id, ImGuiPopupFlags flags = 0);
# 816 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool BeginTable(const char* str_id, int columns, ImGuiTableFlags flags = 0, const ImVec2& outer_size = ImVec2(0.0f, 0.0f), float inner_width = 0.0f);
    void EndTable();
    void TableNextRow(ImGuiTableRowFlags row_flags = 0, float min_row_height = 0.0f);
    bool TableNextColumn();
    bool TableSetColumnIndex(int column_n);
# 830 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    void TableSetupColumn(const char* label, ImGuiTableColumnFlags flags = 0, float init_width_or_weight = 0.0f, ImGuiID user_id = 0);
    void TableSetupScrollFreeze(int cols, int rows);
    void TableHeader(const char* label);
    void TableHeadersRow();
    void TableAngledHeadersRow();







    ImGuiTableSortSpecs* TableGetSortSpecs();
    int TableGetColumnCount();
    int TableGetColumnIndex();
    int TableGetRowIndex();
    const char* TableGetColumnName(int column_n = -1);
    ImGuiTableColumnFlags TableGetColumnFlags(int column_n = -1);
    void TableSetColumnEnabled(int column_n, bool v);
    int TableGetHoveredColumn();
    void TableSetBgColor(ImGuiTableBgTarget target, ImU32 color, int column_n = -1);



    void Columns(int count = 1, const char* id = 
# 854 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                   __null
# 854 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                       , bool borders = true);
    void NextColumn();
    int GetColumnIndex();
    float GetColumnWidth(int column_index = -1);
    void SetColumnWidth(int column_index, float width);
    float GetColumnOffset(int column_index = -1);
    void SetColumnOffset(int column_index, float offset_x);
    int GetColumnsCount();



    bool BeginTabBar(const char* str_id, ImGuiTabBarFlags flags = 0);
    void EndTabBar();
    bool BeginTabItem(const char* label, bool* p_open = 
# 867 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                          __null
# 867 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                              , ImGuiTabItemFlags flags = 0);
    void EndTabItem();
    bool TabItemButton(const char* label, ImGuiTabItemFlags flags = 0);
    void SetTabItemClosed(const char* tab_or_docked_window_label);
# 885 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    ImGuiID DockSpace(ImGuiID dockspace_id, const ImVec2& size = ImVec2(0, 0), ImGuiDockNodeFlags flags = 0, const ImGuiWindowClass* window_class = 
# 885 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                   __null
# 885 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                       );
    ImGuiID DockSpaceOverViewport(ImGuiID dockspace_id = 0, const ImGuiViewport* viewport = 
# 886 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                           __null
# 886 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                               , ImGuiDockNodeFlags flags = 0, const ImGuiWindowClass* window_class = 
# 886 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                      __null
# 886 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                          );
    void SetNextWindowDockID(ImGuiID dock_id, ImGuiCond cond = 0);
    void SetNextWindowClass(const ImGuiWindowClass* window_class);
    ImGuiID GetWindowDockID();
    bool IsWindowDocked();



    void LogToTTY(int auto_open_depth = -1);
    void LogToFile(int auto_open_depth = -1, const char* filename = 
# 895 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                      __null
# 895 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                          );
    void LogToClipboard(int auto_open_depth = -1);
    void LogFinish();
    void LogButtons();
    void LogText(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void LogTextV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));






    bool BeginDragDropSource(ImGuiDragDropFlags flags = 0);
    bool SetDragDropPayload(const char* type, const void* data, size_t sz, ImGuiCond cond = 0);
    void EndDragDropSource();
    bool BeginDragDropTarget();
    const ImGuiPayload* AcceptDragDropPayload(const char* type, ImGuiDragDropFlags flags = 0);
    void EndDragDropTarget();
    const ImGuiPayload* GetDragDropPayload();






    void BeginDisabled(bool disabled = true);
    void EndDisabled();



    void PushClipRect(const ImVec2& clip_rect_min, const ImVec2& clip_rect_max, bool intersect_with_current_clip_rect);
    void PopClipRect();



    void SetItemDefaultFocus();
    void SetKeyboardFocusHere(int offset = 0);


    void SetNextItemAllowOverlap();




    bool IsItemHovered(ImGuiHoveredFlags flags = 0);
    bool IsItemActive();
    bool IsItemFocused();
    bool IsItemClicked(ImGuiMouseButton mouse_button = 0);
    bool IsItemVisible();
    bool IsItemEdited();
    bool IsItemActivated();
    bool IsItemDeactivated();
    bool IsItemDeactivatedAfterEdit();
    bool IsItemToggledOpen();
    bool IsAnyItemHovered();
    bool IsAnyItemActive();
    bool IsAnyItemFocused();
    ImGuiID GetItemID();
    ImVec2 GetItemRectMin();
    ImVec2 GetItemRectMax();
    ImVec2 GetItemRectSize();





    ImGuiViewport* GetMainViewport();


    ImDrawList* GetBackgroundDrawList(ImGuiViewport* viewport = 
# 964 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                           __null
# 964 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                               );
    ImDrawList* GetForegroundDrawList(ImGuiViewport* viewport = 
# 965 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                           __null
# 965 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                               );


    bool IsRectVisible(const ImVec2& size);
    bool IsRectVisible(const ImVec2& rect_min, const ImVec2& rect_max);
    double GetTime();
    int GetFrameCount();
    ImDrawListSharedData* GetDrawListSharedData();
    const char* GetStyleColorName(ImGuiCol idx);
    void SetStateStorage(ImGuiStorage* storage);
    ImGuiStorage* GetStateStorage();


    ImVec2 CalcTextSize(const char* text, const char* text_end = 
# 978 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                 __null
# 978 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                     , bool hide_text_after_double_hash = false, float wrap_width = -1.0f);


    ImVec4 ColorConvertU32ToFloat4(ImU32 in);
    ImU32 ColorConvertFloat4ToU32(const ImVec4& in);
    void ColorConvertRGBtoHSV(float r, float g, float b, float& out_h, float& out_s, float& out_v);
    void ColorConvertHSVtoRGB(float h, float s, float v, float& out_r, float& out_g, float& out_b);






    bool IsKeyDown(ImGuiKey key);
    bool IsKeyPressed(ImGuiKey key, bool repeat = true);
    bool IsKeyReleased(ImGuiKey key);
    bool IsKeyChordPressed(ImGuiKeyChord key_chord);
    int GetKeyPressedAmount(ImGuiKey key, float repeat_delay, float rate);
    const char* GetKeyName(ImGuiKey key);
    void SetNextFrameWantCaptureKeyboard(bool want_capture_keyboard);
# 1014 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool Shortcut(ImGuiKeyChord key_chord, ImGuiInputFlags flags = 0);
    void SetNextItemShortcut(ImGuiKeyChord key_chord, ImGuiInputFlags flags = 0);







    void SetItemKeyOwner(ImGuiKey key);





    bool IsMouseDown(ImGuiMouseButton button);
    bool IsMouseClicked(ImGuiMouseButton button, bool repeat = false);
    bool IsMouseReleased(ImGuiMouseButton button);
    bool IsMouseDoubleClicked(ImGuiMouseButton button);
    int GetMouseClickedCount(ImGuiMouseButton button);
    bool IsMouseHoveringRect(const ImVec2& r_min, const ImVec2& r_max, bool clip = true);
    bool IsMousePosValid(const ImVec2* mouse_pos = 
# 1035 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                     __null
# 1035 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                         );
    bool IsAnyMouseDown();
    ImVec2 GetMousePos();
    ImVec2 GetMousePosOnOpeningCurrentPopup();
    bool IsMouseDragging(ImGuiMouseButton button, float lock_threshold = -1.0f);
    ImVec2 GetMouseDragDelta(ImGuiMouseButton button = 0, float lock_threshold = -1.0f);
    void ResetMouseDragDelta(ImGuiMouseButton button = 0);
    ImGuiMouseCursor GetMouseCursor();
    void SetMouseCursor(ImGuiMouseCursor cursor_type);
    void SetNextFrameWantCaptureMouse(bool want_capture_mouse);



    const char* GetClipboardText();
    void SetClipboardText(const char* text);





    void LoadIniSettingsFromDisk(const char* ini_filename);
    void LoadIniSettingsFromMemory(const char* ini_data, size_t ini_size=0);
    void SaveIniSettingsToDisk(const char* ini_filename);
    const char* SaveIniSettingsToMemory(size_t* out_ini_size = 
# 1058 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                          __null
# 1058 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                              );



    void DebugTextEncoding(const char* text);
    void DebugFlashStyleColor(ImGuiCol idx);
    void DebugStartItemPicker();
    bool DebugCheckVersionAndDataLayout(const char* version_str, size_t sz_io, size_t sz_style, size_t sz_vec2, size_t sz_vec4, size_t sz_drawvert, size_t sz_drawidx);

    void DebugLog(const char* fmt, ...) __attribute__((format(gnu_printf, 1, 1 +1)));
    void DebugLogV(const char* fmt, va_list args) __attribute__((format(gnu_printf, 1, 0)));






    void SetAllocatorFunctions(ImGuiMemAllocFunc alloc_func, ImGuiMemFreeFunc free_func, void* user_data = 
# 1075 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                             __null
# 1075 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                 );
    void GetAllocatorFunctions(ImGuiMemAllocFunc* p_alloc_func, ImGuiMemFreeFunc* p_free_func, void** p_user_data);
    void* MemAlloc(size_t size);
    void MemFree(void* ptr);




    void UpdatePlatformWindows();
    void RenderPlatformWindowsDefault(void* platform_render_arg = 
# 1084 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                        __null
# 1084 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                            , void* renderer_render_arg = 
# 1084 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                          __null
# 1084 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                              );
    void DestroyPlatformWindows();
    ImGuiViewport* FindViewportByID(ImGuiID id);
    ImGuiViewport* FindViewportByPlatformHandle(void* platform_handle);

}







enum ImGuiWindowFlags_
{
    ImGuiWindowFlags_None = 0,
    ImGuiWindowFlags_NoTitleBar = 1 << 0,
    ImGuiWindowFlags_NoResize = 1 << 1,
    ImGuiWindowFlags_NoMove = 1 << 2,
    ImGuiWindowFlags_NoScrollbar = 1 << 3,
    ImGuiWindowFlags_NoScrollWithMouse = 1 << 4,
    ImGuiWindowFlags_NoCollapse = 1 << 5,
    ImGuiWindowFlags_AlwaysAutoResize = 1 << 6,
    ImGuiWindowFlags_NoBackground = 1 << 7,
    ImGuiWindowFlags_NoSavedSettings = 1 << 8,
    ImGuiWindowFlags_NoMouseInputs = 1 << 9,
    ImGuiWindowFlags_MenuBar = 1 << 10,
    ImGuiWindowFlags_HorizontalScrollbar = 1 << 11,
    ImGuiWindowFlags_NoFocusOnAppearing = 1 << 12,
    ImGuiWindowFlags_NoBringToFrontOnFocus = 1 << 13,
    ImGuiWindowFlags_AlwaysVerticalScrollbar= 1 << 14,
    ImGuiWindowFlags_AlwaysHorizontalScrollbar=1<< 15,
    ImGuiWindowFlags_NoNavInputs = 1 << 16,
    ImGuiWindowFlags_NoNavFocus = 1 << 17,
    ImGuiWindowFlags_UnsavedDocument = 1 << 18,
    ImGuiWindowFlags_NoDocking = 1 << 19,
    ImGuiWindowFlags_NoNav = ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
    ImGuiWindowFlags_NoDecoration = ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse,
    ImGuiWindowFlags_NoInputs = ImGuiWindowFlags_NoMouseInputs | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,


    ImGuiWindowFlags_ChildWindow = 1 << 24,
    ImGuiWindowFlags_Tooltip = 1 << 25,
    ImGuiWindowFlags_Popup = 1 << 26,
    ImGuiWindowFlags_Modal = 1 << 27,
    ImGuiWindowFlags_ChildMenu = 1 << 28,
    ImGuiWindowFlags_DockNodeHost = 1 << 29,



    ImGuiWindowFlags_AlwaysUseWindowPadding = 1 << 30,
    ImGuiWindowFlags_NavFlattened = 1 << 31,

};
# 1148 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiChildFlags_
{
    ImGuiChildFlags_None = 0,
    ImGuiChildFlags_Borders = 1 << 0,
    ImGuiChildFlags_AlwaysUseWindowPadding = 1 << 1,
    ImGuiChildFlags_ResizeX = 1 << 2,
    ImGuiChildFlags_ResizeY = 1 << 3,
    ImGuiChildFlags_AutoResizeX = 1 << 4,
    ImGuiChildFlags_AutoResizeY = 1 << 5,
    ImGuiChildFlags_AlwaysAutoResize = 1 << 6,
    ImGuiChildFlags_FrameStyle = 1 << 7,
    ImGuiChildFlags_NavFlattened = 1 << 8,



    ImGuiChildFlags_Border = ImGuiChildFlags_Borders,

};



enum ImGuiItemFlags_
{
    ImGuiItemFlags_None = 0,
    ImGuiItemFlags_NoTabStop = 1 << 0,
    ImGuiItemFlags_NoNav = 1 << 1,
    ImGuiItemFlags_NoNavDefaultFocus = 1 << 2,
    ImGuiItemFlags_ButtonRepeat = 1 << 3,
    ImGuiItemFlags_AutoClosePopups = 1 << 4,
    ImGuiItemFlags_AllowDuplicateId = 1 << 5,
};



enum ImGuiInputTextFlags_
{

    ImGuiInputTextFlags_None = 0,
    ImGuiInputTextFlags_CharsDecimal = 1 << 0,
    ImGuiInputTextFlags_CharsHexadecimal = 1 << 1,
    ImGuiInputTextFlags_CharsScientific = 1 << 2,
    ImGuiInputTextFlags_CharsUppercase = 1 << 3,
    ImGuiInputTextFlags_CharsNoBlank = 1 << 4,


    ImGuiInputTextFlags_AllowTabInput = 1 << 5,
    ImGuiInputTextFlags_EnterReturnsTrue = 1 << 6,
    ImGuiInputTextFlags_EscapeClearsAll = 1 << 7,
    ImGuiInputTextFlags_CtrlEnterForNewLine = 1 << 8,


    ImGuiInputTextFlags_ReadOnly = 1 << 9,
    ImGuiInputTextFlags_Password = 1 << 10,
    ImGuiInputTextFlags_AlwaysOverwrite = 1 << 11,
    ImGuiInputTextFlags_AutoSelectAll = 1 << 12,
    ImGuiInputTextFlags_ParseEmptyRefVal = 1 << 13,
    ImGuiInputTextFlags_DisplayEmptyRefVal = 1 << 14,
    ImGuiInputTextFlags_NoHorizontalScroll = 1 << 15,
    ImGuiInputTextFlags_NoUndoRedo = 1 << 16,


    ImGuiInputTextFlags_CallbackCompletion = 1 << 17,
    ImGuiInputTextFlags_CallbackHistory = 1 << 18,
    ImGuiInputTextFlags_CallbackAlways = 1 << 19,
    ImGuiInputTextFlags_CallbackCharFilter = 1 << 20,
    ImGuiInputTextFlags_CallbackResize = 1 << 21,
    ImGuiInputTextFlags_CallbackEdit = 1 << 22,



};


enum ImGuiTreeNodeFlags_
{
    ImGuiTreeNodeFlags_None = 0,
    ImGuiTreeNodeFlags_Selected = 1 << 0,
    ImGuiTreeNodeFlags_Framed = 1 << 1,
    ImGuiTreeNodeFlags_AllowOverlap = 1 << 2,
    ImGuiTreeNodeFlags_NoTreePushOnOpen = 1 << 3,
    ImGuiTreeNodeFlags_NoAutoOpenOnLog = 1 << 4,
    ImGuiTreeNodeFlags_DefaultOpen = 1 << 5,
    ImGuiTreeNodeFlags_OpenOnDoubleClick = 1 << 6,
    ImGuiTreeNodeFlags_OpenOnArrow = 1 << 7,
    ImGuiTreeNodeFlags_Leaf = 1 << 8,
    ImGuiTreeNodeFlags_Bullet = 1 << 9,
    ImGuiTreeNodeFlags_FramePadding = 1 << 10,
    ImGuiTreeNodeFlags_SpanAvailWidth = 1 << 11,
    ImGuiTreeNodeFlags_SpanFullWidth = 1 << 12,
    ImGuiTreeNodeFlags_SpanTextWidth = 1 << 13,
    ImGuiTreeNodeFlags_SpanAllColumns = 1 << 14,
    ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 << 15,

    ImGuiTreeNodeFlags_CollapsingHeader = ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen | ImGuiTreeNodeFlags_NoAutoOpenOnLog,


    ImGuiTreeNodeFlags_AllowItemOverlap = ImGuiTreeNodeFlags_AllowOverlap,

};
# 1256 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiPopupFlags_
{
    ImGuiPopupFlags_None = 0,
    ImGuiPopupFlags_MouseButtonLeft = 0,
    ImGuiPopupFlags_MouseButtonRight = 1,
    ImGuiPopupFlags_MouseButtonMiddle = 2,
    ImGuiPopupFlags_MouseButtonMask_ = 0x1F,
    ImGuiPopupFlags_MouseButtonDefault_ = 1,
    ImGuiPopupFlags_NoReopen = 1 << 5,

    ImGuiPopupFlags_NoOpenOverExistingPopup = 1 << 7,
    ImGuiPopupFlags_NoOpenOverItems = 1 << 8,
    ImGuiPopupFlags_AnyPopupId = 1 << 10,
    ImGuiPopupFlags_AnyPopupLevel = 1 << 11,
    ImGuiPopupFlags_AnyPopup = ImGuiPopupFlags_AnyPopupId | ImGuiPopupFlags_AnyPopupLevel,
};


enum ImGuiSelectableFlags_
{
    ImGuiSelectableFlags_None = 0,
    ImGuiSelectableFlags_NoAutoClosePopups = 1 << 0,
    ImGuiSelectableFlags_SpanAllColumns = 1 << 1,
    ImGuiSelectableFlags_AllowDoubleClick = 1 << 2,
    ImGuiSelectableFlags_Disabled = 1 << 3,
    ImGuiSelectableFlags_AllowOverlap = 1 << 4,
    ImGuiSelectableFlags_Highlight = 1 << 5,


    ImGuiSelectableFlags_DontClosePopups = ImGuiSelectableFlags_NoAutoClosePopups,
    ImGuiSelectableFlags_AllowItemOverlap = ImGuiSelectableFlags_AllowOverlap,

};


enum ImGuiComboFlags_
{
    ImGuiComboFlags_None = 0,
    ImGuiComboFlags_PopupAlignLeft = 1 << 0,
    ImGuiComboFlags_HeightSmall = 1 << 1,
    ImGuiComboFlags_HeightRegular = 1 << 2,
    ImGuiComboFlags_HeightLarge = 1 << 3,
    ImGuiComboFlags_HeightLargest = 1 << 4,
    ImGuiComboFlags_NoArrowButton = 1 << 5,
    ImGuiComboFlags_NoPreview = 1 << 6,
    ImGuiComboFlags_WidthFitPreview = 1 << 7,
    ImGuiComboFlags_HeightMask_ = ImGuiComboFlags_HeightSmall | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge | ImGuiComboFlags_HeightLargest,
};


enum ImGuiTabBarFlags_
{
    ImGuiTabBarFlags_None = 0,
    ImGuiTabBarFlags_Reorderable = 1 << 0,
    ImGuiTabBarFlags_AutoSelectNewTabs = 1 << 1,
    ImGuiTabBarFlags_TabListPopupButton = 1 << 2,
    ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 1 << 3,
    ImGuiTabBarFlags_NoTabListScrollingButtons = 1 << 4,
    ImGuiTabBarFlags_NoTooltip = 1 << 5,
    ImGuiTabBarFlags_DrawSelectedOverline = 1 << 6,
    ImGuiTabBarFlags_FittingPolicyResizeDown = 1 << 7,
    ImGuiTabBarFlags_FittingPolicyScroll = 1 << 8,
    ImGuiTabBarFlags_FittingPolicyMask_ = ImGuiTabBarFlags_FittingPolicyResizeDown | ImGuiTabBarFlags_FittingPolicyScroll,
    ImGuiTabBarFlags_FittingPolicyDefault_ = ImGuiTabBarFlags_FittingPolicyResizeDown,
};


enum ImGuiTabItemFlags_
{
    ImGuiTabItemFlags_None = 0,
    ImGuiTabItemFlags_UnsavedDocument = 1 << 0,
    ImGuiTabItemFlags_SetSelected = 1 << 1,
    ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 1 << 2,
    ImGuiTabItemFlags_NoPushId = 1 << 3,
    ImGuiTabItemFlags_NoTooltip = 1 << 4,
    ImGuiTabItemFlags_NoReorder = 1 << 5,
    ImGuiTabItemFlags_Leading = 1 << 6,
    ImGuiTabItemFlags_Trailing = 1 << 7,
    ImGuiTabItemFlags_NoAssumedClosure = 1 << 8,
};


enum ImGuiFocusedFlags_
{
    ImGuiFocusedFlags_None = 0,
    ImGuiFocusedFlags_ChildWindows = 1 << 0,
    ImGuiFocusedFlags_RootWindow = 1 << 1,
    ImGuiFocusedFlags_AnyWindow = 1 << 2,
    ImGuiFocusedFlags_NoPopupHierarchy = 1 << 3,
    ImGuiFocusedFlags_DockHierarchy = 1 << 4,
    ImGuiFocusedFlags_RootAndChildWindows = ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows,
};




enum ImGuiHoveredFlags_
{
    ImGuiHoveredFlags_None = 0,
    ImGuiHoveredFlags_ChildWindows = 1 << 0,
    ImGuiHoveredFlags_RootWindow = 1 << 1,
    ImGuiHoveredFlags_AnyWindow = 1 << 2,
    ImGuiHoveredFlags_NoPopupHierarchy = 1 << 3,
    ImGuiHoveredFlags_DockHierarchy = 1 << 4,
    ImGuiHoveredFlags_AllowWhenBlockedByPopup = 1 << 5,

    ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 1 << 7,
    ImGuiHoveredFlags_AllowWhenOverlappedByItem = 1 << 8,
    ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 1 << 9,
    ImGuiHoveredFlags_AllowWhenDisabled = 1 << 10,
    ImGuiHoveredFlags_NoNavOverride = 1 << 11,
    ImGuiHoveredFlags_AllowWhenOverlapped = ImGuiHoveredFlags_AllowWhenOverlappedByItem | ImGuiHoveredFlags_AllowWhenOverlappedByWindow,
    ImGuiHoveredFlags_RectOnly = ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped,
    ImGuiHoveredFlags_RootAndChildWindows = ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows,







    ImGuiHoveredFlags_ForTooltip = 1 << 12,




    ImGuiHoveredFlags_Stationary = 1 << 13,
    ImGuiHoveredFlags_DelayNone = 1 << 14,
    ImGuiHoveredFlags_DelayShort = 1 << 15,
    ImGuiHoveredFlags_DelayNormal = 1 << 16,
    ImGuiHoveredFlags_NoSharedDelay = 1 << 17,
};




enum ImGuiDockNodeFlags_
{
    ImGuiDockNodeFlags_None = 0,
    ImGuiDockNodeFlags_KeepAliveOnly = 1 << 0,

    ImGuiDockNodeFlags_NoDockingOverCentralNode = 1 << 2,
    ImGuiDockNodeFlags_PassthruCentralNode = 1 << 3,
    ImGuiDockNodeFlags_NoDockingSplit = 1 << 4,
    ImGuiDockNodeFlags_NoResize = 1 << 5,
    ImGuiDockNodeFlags_AutoHideTabBar = 1 << 6,
    ImGuiDockNodeFlags_NoUndocking = 1 << 7,


    ImGuiDockNodeFlags_NoSplit = ImGuiDockNodeFlags_NoDockingSplit,
    ImGuiDockNodeFlags_NoDockingInCentralNode = ImGuiDockNodeFlags_NoDockingOverCentralNode,

};


enum ImGuiDragDropFlags_
{
    ImGuiDragDropFlags_None = 0,

    ImGuiDragDropFlags_SourceNoPreviewTooltip = 1 << 0,
    ImGuiDragDropFlags_SourceNoDisableHover = 1 << 1,
    ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 1 << 2,
    ImGuiDragDropFlags_SourceAllowNullID = 1 << 3,
    ImGuiDragDropFlags_SourceExtern = 1 << 4,
    ImGuiDragDropFlags_PayloadAutoExpire = 1 << 5,
    ImGuiDragDropFlags_PayloadNoCrossContext = 1 << 6,
    ImGuiDragDropFlags_PayloadNoCrossProcess = 1 << 7,

    ImGuiDragDropFlags_AcceptBeforeDelivery = 1 << 10,
    ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 1 << 11,
    ImGuiDragDropFlags_AcceptNoPreviewTooltip = 1 << 12,
    ImGuiDragDropFlags_AcceptPeekOnly = ImGuiDragDropFlags_AcceptBeforeDelivery | ImGuiDragDropFlags_AcceptNoDrawDefaultRect,


    ImGuiDragDropFlags_SourceAutoExpirePayload = ImGuiDragDropFlags_PayloadAutoExpire,

};






enum ImGuiDataType_
{
    ImGuiDataType_S8,
    ImGuiDataType_U8,
    ImGuiDataType_S16,
    ImGuiDataType_U16,
    ImGuiDataType_S32,
    ImGuiDataType_U32,
    ImGuiDataType_S64,
    ImGuiDataType_U64,
    ImGuiDataType_Float,
    ImGuiDataType_Double,
    ImGuiDataType_Bool,
    ImGuiDataType_COUNT
};


enum ImGuiDir : int
{
    ImGuiDir_None = -1,
    ImGuiDir_Left = 0,
    ImGuiDir_Right = 1,
    ImGuiDir_Up = 2,
    ImGuiDir_Down = 3,
    ImGuiDir_COUNT
};


enum ImGuiSortDirection : ImU8
{
    ImGuiSortDirection_None = 0,
    ImGuiSortDirection_Ascending = 1,
    ImGuiSortDirection_Descending = 2
};
# 1485 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiKey : int
{

    ImGuiKey_None = 0,
    ImGuiKey_Tab = 512,
    ImGuiKey_LeftArrow,
    ImGuiKey_RightArrow,
    ImGuiKey_UpArrow,
    ImGuiKey_DownArrow,
    ImGuiKey_PageUp,
    ImGuiKey_PageDown,
    ImGuiKey_Home,
    ImGuiKey_End,
    ImGuiKey_Insert,
    ImGuiKey_Delete,
    ImGuiKey_Backspace,
    ImGuiKey_Space,
    ImGuiKey_Enter,
    ImGuiKey_Escape,
    ImGuiKey_LeftCtrl, ImGuiKey_LeftShift, ImGuiKey_LeftAlt, ImGuiKey_LeftSuper,
    ImGuiKey_RightCtrl, ImGuiKey_RightShift, ImGuiKey_RightAlt, ImGuiKey_RightSuper,
    ImGuiKey_Menu,
    ImGuiKey_0, ImGuiKey_1, ImGuiKey_2, ImGuiKey_3, ImGuiKey_4, ImGuiKey_5, ImGuiKey_6, ImGuiKey_7, ImGuiKey_8, ImGuiKey_9,
    ImGuiKey_A, ImGuiKey_B, ImGuiKey_C, ImGuiKey_D, ImGuiKey_E, ImGuiKey_F, ImGuiKey_G, ImGuiKey_H, ImGuiKey_I, ImGuiKey_J,
    ImGuiKey_K, ImGuiKey_L, ImGuiKey_M, ImGuiKey_N, ImGuiKey_O, ImGuiKey_P, ImGuiKey_Q, ImGuiKey_R, ImGuiKey_S, ImGuiKey_T,
    ImGuiKey_U, ImGuiKey_V, ImGuiKey_W, ImGuiKey_X, ImGuiKey_Y, ImGuiKey_Z,
    ImGuiKey_F1, ImGuiKey_F2, ImGuiKey_F3, ImGuiKey_F4, ImGuiKey_F5, ImGuiKey_F6,
    ImGuiKey_F7, ImGuiKey_F8, ImGuiKey_F9, ImGuiKey_F10, ImGuiKey_F11, ImGuiKey_F12,
    ImGuiKey_F13, ImGuiKey_F14, ImGuiKey_F15, ImGuiKey_F16, ImGuiKey_F17, ImGuiKey_F18,
    ImGuiKey_F19, ImGuiKey_F20, ImGuiKey_F21, ImGuiKey_F22, ImGuiKey_F23, ImGuiKey_F24,
    ImGuiKey_Apostrophe,
    ImGuiKey_Comma,
    ImGuiKey_Minus,
    ImGuiKey_Period,
    ImGuiKey_Slash,
    ImGuiKey_Semicolon,
    ImGuiKey_Equal,
    ImGuiKey_LeftBracket,
    ImGuiKey_Backslash,
    ImGuiKey_RightBracket,
    ImGuiKey_GraveAccent,
    ImGuiKey_CapsLock,
    ImGuiKey_ScrollLock,
    ImGuiKey_NumLock,
    ImGuiKey_PrintScreen,
    ImGuiKey_Pause,
    ImGuiKey_Keypad0, ImGuiKey_Keypad1, ImGuiKey_Keypad2, ImGuiKey_Keypad3, ImGuiKey_Keypad4,
    ImGuiKey_Keypad5, ImGuiKey_Keypad6, ImGuiKey_Keypad7, ImGuiKey_Keypad8, ImGuiKey_Keypad9,
    ImGuiKey_KeypadDecimal,
    ImGuiKey_KeypadDivide,
    ImGuiKey_KeypadMultiply,
    ImGuiKey_KeypadSubtract,
    ImGuiKey_KeypadAdd,
    ImGuiKey_KeypadEnter,
    ImGuiKey_KeypadEqual,
    ImGuiKey_AppBack,
    ImGuiKey_AppForward,



    ImGuiKey_GamepadStart,
    ImGuiKey_GamepadBack,
    ImGuiKey_GamepadFaceLeft,
    ImGuiKey_GamepadFaceRight,
    ImGuiKey_GamepadFaceUp,
    ImGuiKey_GamepadFaceDown,
    ImGuiKey_GamepadDpadLeft,
    ImGuiKey_GamepadDpadRight,
    ImGuiKey_GamepadDpadUp,
    ImGuiKey_GamepadDpadDown,
    ImGuiKey_GamepadL1,
    ImGuiKey_GamepadR1,
    ImGuiKey_GamepadL2,
    ImGuiKey_GamepadR2,
    ImGuiKey_GamepadL3,
    ImGuiKey_GamepadR3,
    ImGuiKey_GamepadLStickLeft,
    ImGuiKey_GamepadLStickRight,
    ImGuiKey_GamepadLStickUp,
    ImGuiKey_GamepadLStickDown,
    ImGuiKey_GamepadRStickLeft,
    ImGuiKey_GamepadRStickRight,
    ImGuiKey_GamepadRStickUp,
    ImGuiKey_GamepadRStickDown,



    ImGuiKey_MouseLeft, ImGuiKey_MouseRight, ImGuiKey_MouseMiddle, ImGuiKey_MouseX1, ImGuiKey_MouseX2, ImGuiKey_MouseWheelX, ImGuiKey_MouseWheelY,


    ImGuiKey_ReservedForModCtrl, ImGuiKey_ReservedForModShift, ImGuiKey_ReservedForModAlt, ImGuiKey_ReservedForModSuper,
    ImGuiKey_COUNT,
# 1587 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    ImGuiMod_None = 0,
    ImGuiMod_Ctrl = 1 << 12,
    ImGuiMod_Shift = 1 << 13,
    ImGuiMod_Alt = 1 << 14,
    ImGuiMod_Super = 1 << 15,
    ImGuiMod_Mask_ = 0xF000,




    ImGuiKey_NamedKey_BEGIN = 512,
    ImGuiKey_NamedKey_END = ImGuiKey_COUNT,
    ImGuiKey_NamedKey_COUNT = ImGuiKey_NamedKey_END - ImGuiKey_NamedKey_BEGIN,




    ImGuiKey_KeysData_SIZE = ImGuiKey_COUNT,
    ImGuiKey_KeysData_OFFSET = 0,



    ImGuiMod_Shortcut = ImGuiMod_Ctrl,
    ImGuiKey_ModCtrl = ImGuiMod_Ctrl, ImGuiKey_ModShift = ImGuiMod_Shift, ImGuiKey_ModAlt = ImGuiMod_Alt, ImGuiKey_ModSuper = ImGuiMod_Super,


};




enum ImGuiInputFlags_
{
    ImGuiInputFlags_None = 0,
    ImGuiInputFlags_Repeat = 1 << 0,




    ImGuiInputFlags_RouteActive = 1 << 10,
    ImGuiInputFlags_RouteFocused = 1 << 11,
    ImGuiInputFlags_RouteGlobal = 1 << 12,
    ImGuiInputFlags_RouteAlways = 1 << 13,

    ImGuiInputFlags_RouteOverFocused = 1 << 14,
    ImGuiInputFlags_RouteOverActive = 1 << 15,
    ImGuiInputFlags_RouteUnlessBgFocused = 1 << 16,
    ImGuiInputFlags_RouteFromRootWindow = 1 << 17,


    ImGuiInputFlags_Tooltip = 1 << 18,
};





enum ImGuiNavInput
{
    ImGuiNavInput_Activate, ImGuiNavInput_Cancel, ImGuiNavInput_Input, ImGuiNavInput_Menu, ImGuiNavInput_DpadLeft, ImGuiNavInput_DpadRight, ImGuiNavInput_DpadUp, ImGuiNavInput_DpadDown,
    ImGuiNavInput_LStickLeft, ImGuiNavInput_LStickRight, ImGuiNavInput_LStickUp, ImGuiNavInput_LStickDown, ImGuiNavInput_FocusPrev, ImGuiNavInput_FocusNext, ImGuiNavInput_TweakSlow, ImGuiNavInput_TweakFast,
    ImGuiNavInput_COUNT,
};



enum ImGuiConfigFlags_
{
    ImGuiConfigFlags_None = 0,
    ImGuiConfigFlags_NavEnableKeyboard = 1 << 0,
    ImGuiConfigFlags_NavEnableGamepad = 1 << 1,
    ImGuiConfigFlags_NavEnableSetMousePos = 1 << 2,
    ImGuiConfigFlags_NavNoCaptureKeyboard = 1 << 3,
    ImGuiConfigFlags_NoMouse = 1 << 4,
    ImGuiConfigFlags_NoMouseCursorChange = 1 << 5,
    ImGuiConfigFlags_NoKeyboard = 1 << 6,


    ImGuiConfigFlags_DockingEnable = 1 << 7,



    ImGuiConfigFlags_ViewportsEnable = 1 << 10,
    ImGuiConfigFlags_DpiEnableScaleViewports= 1 << 14,
    ImGuiConfigFlags_DpiEnableScaleFonts = 1 << 15,


    ImGuiConfigFlags_IsSRGB = 1 << 20,
    ImGuiConfigFlags_IsTouchScreen = 1 << 21,
};


enum ImGuiBackendFlags_
{
    ImGuiBackendFlags_None = 0,
    ImGuiBackendFlags_HasGamepad = 1 << 0,
    ImGuiBackendFlags_HasMouseCursors = 1 << 1,
    ImGuiBackendFlags_HasSetMousePos = 1 << 2,
    ImGuiBackendFlags_RendererHasVtxOffset = 1 << 3,


    ImGuiBackendFlags_PlatformHasViewports = 1 << 10,
    ImGuiBackendFlags_HasMouseHoveredViewport=1 << 11,
    ImGuiBackendFlags_RendererHasViewports = 1 << 12,
};


enum ImGuiCol_
{
    ImGuiCol_Text,
    ImGuiCol_TextDisabled,
    ImGuiCol_WindowBg,
    ImGuiCol_ChildBg,
    ImGuiCol_PopupBg,
    ImGuiCol_Border,
    ImGuiCol_BorderShadow,
    ImGuiCol_FrameBg,
    ImGuiCol_FrameBgHovered,
    ImGuiCol_FrameBgActive,
    ImGuiCol_TitleBg,
    ImGuiCol_TitleBgActive,
    ImGuiCol_TitleBgCollapsed,
    ImGuiCol_MenuBarBg,
    ImGuiCol_ScrollbarBg,
    ImGuiCol_ScrollbarGrab,
    ImGuiCol_ScrollbarGrabHovered,
    ImGuiCol_ScrollbarGrabActive,
    ImGuiCol_CheckMark,
    ImGuiCol_SliderGrab,
    ImGuiCol_SliderGrabActive,
    ImGuiCol_Button,
    ImGuiCol_ButtonHovered,
    ImGuiCol_ButtonActive,
    ImGuiCol_Header,
    ImGuiCol_HeaderHovered,
    ImGuiCol_HeaderActive,
    ImGuiCol_Separator,
    ImGuiCol_SeparatorHovered,
    ImGuiCol_SeparatorActive,
    ImGuiCol_ResizeGrip,
    ImGuiCol_ResizeGripHovered,
    ImGuiCol_ResizeGripActive,
    ImGuiCol_TabHovered,
    ImGuiCol_Tab,
    ImGuiCol_TabSelected,
    ImGuiCol_TabSelectedOverline,
    ImGuiCol_TabDimmed,
    ImGuiCol_TabDimmedSelected,
    ImGuiCol_TabDimmedSelectedOverline,
    ImGuiCol_DockingPreview,
    ImGuiCol_DockingEmptyBg,
    ImGuiCol_PlotLines,
    ImGuiCol_PlotLinesHovered,
    ImGuiCol_PlotHistogram,
    ImGuiCol_PlotHistogramHovered,
    ImGuiCol_TableHeaderBg,
    ImGuiCol_TableBorderStrong,
    ImGuiCol_TableBorderLight,
    ImGuiCol_TableRowBg,
    ImGuiCol_TableRowBgAlt,
    ImGuiCol_TextLink,
    ImGuiCol_TextSelectedBg,
    ImGuiCol_DragDropTarget,
    ImGuiCol_NavHighlight,
    ImGuiCol_NavWindowingHighlight,
    ImGuiCol_NavWindowingDimBg,
    ImGuiCol_ModalWindowDimBg,
    ImGuiCol_COUNT,


    ImGuiCol_TabActive = ImGuiCol_TabSelected,
    ImGuiCol_TabUnfocused = ImGuiCol_TabDimmed,
    ImGuiCol_TabUnfocusedActive = ImGuiCol_TabDimmedSelected,

};
# 1771 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiStyleVar_
{

    ImGuiStyleVar_Alpha,
    ImGuiStyleVar_DisabledAlpha,
    ImGuiStyleVar_WindowPadding,
    ImGuiStyleVar_WindowRounding,
    ImGuiStyleVar_WindowBorderSize,
    ImGuiStyleVar_WindowMinSize,
    ImGuiStyleVar_WindowTitleAlign,
    ImGuiStyleVar_ChildRounding,
    ImGuiStyleVar_ChildBorderSize,
    ImGuiStyleVar_PopupRounding,
    ImGuiStyleVar_PopupBorderSize,
    ImGuiStyleVar_FramePadding,
    ImGuiStyleVar_FrameRounding,
    ImGuiStyleVar_FrameBorderSize,
    ImGuiStyleVar_ItemSpacing,
    ImGuiStyleVar_ItemInnerSpacing,
    ImGuiStyleVar_IndentSpacing,
    ImGuiStyleVar_CellPadding,
    ImGuiStyleVar_ScrollbarSize,
    ImGuiStyleVar_ScrollbarRounding,
    ImGuiStyleVar_GrabMinSize,
    ImGuiStyleVar_GrabRounding,
    ImGuiStyleVar_TabRounding,
    ImGuiStyleVar_TabBorderSize,
    ImGuiStyleVar_TabBarBorderSize,
    ImGuiStyleVar_TabBarOverlineSize,
    ImGuiStyleVar_TableAngledHeadersAngle,
    ImGuiStyleVar_TableAngledHeadersTextAlign,
    ImGuiStyleVar_ButtonTextAlign,
    ImGuiStyleVar_SelectableTextAlign,
    ImGuiStyleVar_SeparatorTextBorderSize,
    ImGuiStyleVar_SeparatorTextAlign,
    ImGuiStyleVar_SeparatorTextPadding,
    ImGuiStyleVar_DockingSeparatorSize,
    ImGuiStyleVar_COUNT
};


enum ImGuiButtonFlags_
{
    ImGuiButtonFlags_None = 0,
    ImGuiButtonFlags_MouseButtonLeft = 1 << 0,
    ImGuiButtonFlags_MouseButtonRight = 1 << 1,
    ImGuiButtonFlags_MouseButtonMiddle = 1 << 2,
    ImGuiButtonFlags_MouseButtonMask_ = ImGuiButtonFlags_MouseButtonLeft | ImGuiButtonFlags_MouseButtonRight | ImGuiButtonFlags_MouseButtonMiddle,

};


enum ImGuiColorEditFlags_
{
    ImGuiColorEditFlags_None = 0,
    ImGuiColorEditFlags_NoAlpha = 1 << 1,
    ImGuiColorEditFlags_NoPicker = 1 << 2,
    ImGuiColorEditFlags_NoOptions = 1 << 3,
    ImGuiColorEditFlags_NoSmallPreview = 1 << 4,
    ImGuiColorEditFlags_NoInputs = 1 << 5,
    ImGuiColorEditFlags_NoTooltip = 1 << 6,
    ImGuiColorEditFlags_NoLabel = 1 << 7,
    ImGuiColorEditFlags_NoSidePreview = 1 << 8,
    ImGuiColorEditFlags_NoDragDrop = 1 << 9,
    ImGuiColorEditFlags_NoBorder = 1 << 10,


    ImGuiColorEditFlags_AlphaBar = 1 << 16,
    ImGuiColorEditFlags_AlphaPreview = 1 << 17,
    ImGuiColorEditFlags_AlphaPreviewHalf= 1 << 18,
    ImGuiColorEditFlags_HDR = 1 << 19,
    ImGuiColorEditFlags_DisplayRGB = 1 << 20,
    ImGuiColorEditFlags_DisplayHSV = 1 << 21,
    ImGuiColorEditFlags_DisplayHex = 1 << 22,
    ImGuiColorEditFlags_Uint8 = 1 << 23,
    ImGuiColorEditFlags_Float = 1 << 24,
    ImGuiColorEditFlags_PickerHueBar = 1 << 25,
    ImGuiColorEditFlags_PickerHueWheel = 1 << 26,
    ImGuiColorEditFlags_InputRGB = 1 << 27,
    ImGuiColorEditFlags_InputHSV = 1 << 28,



    ImGuiColorEditFlags_DefaultOptions_ = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_PickerHueBar,


    ImGuiColorEditFlags_DisplayMask_ = ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_DisplayHSV | ImGuiColorEditFlags_DisplayHex,
    ImGuiColorEditFlags_DataTypeMask_ = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_Float,
    ImGuiColorEditFlags_PickerMask_ = ImGuiColorEditFlags_PickerHueWheel | ImGuiColorEditFlags_PickerHueBar,
    ImGuiColorEditFlags_InputMask_ = ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_InputHSV,



};




enum ImGuiSliderFlags_
{
    ImGuiSliderFlags_None = 0,
    ImGuiSliderFlags_AlwaysClamp = 1 << 4,
    ImGuiSliderFlags_Logarithmic = 1 << 5,
    ImGuiSliderFlags_NoRoundToFormat = 1 << 6,
    ImGuiSliderFlags_NoInput = 1 << 7,
    ImGuiSliderFlags_WrapAround = 1 << 8,
    ImGuiSliderFlags_InvalidMask_ = 0x7000000F,



};



enum ImGuiMouseButton_
{
    ImGuiMouseButton_Left = 0,
    ImGuiMouseButton_Right = 1,
    ImGuiMouseButton_Middle = 2,
    ImGuiMouseButton_COUNT = 5
};



enum ImGuiMouseCursor_
{
    ImGuiMouseCursor_None = -1,
    ImGuiMouseCursor_Arrow = 0,
    ImGuiMouseCursor_TextInput,
    ImGuiMouseCursor_ResizeAll,
    ImGuiMouseCursor_ResizeNS,
    ImGuiMouseCursor_ResizeEW,
    ImGuiMouseCursor_ResizeNESW,
    ImGuiMouseCursor_ResizeNWSE,
    ImGuiMouseCursor_Hand,
    ImGuiMouseCursor_NotAllowed,
    ImGuiMouseCursor_COUNT
};





enum ImGuiMouseSource : int
{
    ImGuiMouseSource_Mouse = 0,
    ImGuiMouseSource_TouchScreen,
    ImGuiMouseSource_Pen,
    ImGuiMouseSource_COUNT
};




enum ImGuiCond_
{
    ImGuiCond_None = 0,
    ImGuiCond_Always = 1 << 0,
    ImGuiCond_Once = 1 << 1,
    ImGuiCond_FirstUseEver = 1 << 2,
    ImGuiCond_Appearing = 1 << 3,
};
# 1960 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiTableFlags_
{

    ImGuiTableFlags_None = 0,
    ImGuiTableFlags_Resizable = 1 << 0,
    ImGuiTableFlags_Reorderable = 1 << 1,
    ImGuiTableFlags_Hideable = 1 << 2,
    ImGuiTableFlags_Sortable = 1 << 3,
    ImGuiTableFlags_NoSavedSettings = 1 << 4,
    ImGuiTableFlags_ContextMenuInBody = 1 << 5,

    ImGuiTableFlags_RowBg = 1 << 6,
    ImGuiTableFlags_BordersInnerH = 1 << 7,
    ImGuiTableFlags_BordersOuterH = 1 << 8,
    ImGuiTableFlags_BordersInnerV = 1 << 9,
    ImGuiTableFlags_BordersOuterV = 1 << 10,
    ImGuiTableFlags_BordersH = ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH,
    ImGuiTableFlags_BordersV = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersOuterV,
    ImGuiTableFlags_BordersInner = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH,
    ImGuiTableFlags_BordersOuter = ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH,
    ImGuiTableFlags_Borders = ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter,
    ImGuiTableFlags_NoBordersInBody = 1 << 11,
    ImGuiTableFlags_NoBordersInBodyUntilResize = 1 << 12,

    ImGuiTableFlags_SizingFixedFit = 1 << 13,
    ImGuiTableFlags_SizingFixedSame = 2 << 13,
    ImGuiTableFlags_SizingStretchProp = 3 << 13,
    ImGuiTableFlags_SizingStretchSame = 4 << 13,

    ImGuiTableFlags_NoHostExtendX = 1 << 16,
    ImGuiTableFlags_NoHostExtendY = 1 << 17,
    ImGuiTableFlags_NoKeepColumnsVisible = 1 << 18,
    ImGuiTableFlags_PreciseWidths = 1 << 19,

    ImGuiTableFlags_NoClip = 1 << 20,

    ImGuiTableFlags_PadOuterX = 1 << 21,
    ImGuiTableFlags_NoPadOuterX = 1 << 22,
    ImGuiTableFlags_NoPadInnerX = 1 << 23,

    ImGuiTableFlags_ScrollX = 1 << 24,
    ImGuiTableFlags_ScrollY = 1 << 25,

    ImGuiTableFlags_SortMulti = 1 << 26,
    ImGuiTableFlags_SortTristate = 1 << 27,

    ImGuiTableFlags_HighlightHoveredColumn = 1 << 28,


    ImGuiTableFlags_SizingMask_ = ImGuiTableFlags_SizingFixedFit | ImGuiTableFlags_SizingFixedSame | ImGuiTableFlags_SizingStretchProp | ImGuiTableFlags_SizingStretchSame,
};


enum ImGuiTableColumnFlags_
{

    ImGuiTableColumnFlags_None = 0,
    ImGuiTableColumnFlags_Disabled = 1 << 0,
    ImGuiTableColumnFlags_DefaultHide = 1 << 1,
    ImGuiTableColumnFlags_DefaultSort = 1 << 2,
    ImGuiTableColumnFlags_WidthStretch = 1 << 3,
    ImGuiTableColumnFlags_WidthFixed = 1 << 4,
    ImGuiTableColumnFlags_NoResize = 1 << 5,
    ImGuiTableColumnFlags_NoReorder = 1 << 6,
    ImGuiTableColumnFlags_NoHide = 1 << 7,
    ImGuiTableColumnFlags_NoClip = 1 << 8,
    ImGuiTableColumnFlags_NoSort = 1 << 9,
    ImGuiTableColumnFlags_NoSortAscending = 1 << 10,
    ImGuiTableColumnFlags_NoSortDescending = 1 << 11,
    ImGuiTableColumnFlags_NoHeaderLabel = 1 << 12,
    ImGuiTableColumnFlags_NoHeaderWidth = 1 << 13,
    ImGuiTableColumnFlags_PreferSortAscending = 1 << 14,
    ImGuiTableColumnFlags_PreferSortDescending = 1 << 15,
    ImGuiTableColumnFlags_IndentEnable = 1 << 16,
    ImGuiTableColumnFlags_IndentDisable = 1 << 17,
    ImGuiTableColumnFlags_AngledHeader = 1 << 18,


    ImGuiTableColumnFlags_IsEnabled = 1 << 24,
    ImGuiTableColumnFlags_IsVisible = 1 << 25,
    ImGuiTableColumnFlags_IsSorted = 1 << 26,
    ImGuiTableColumnFlags_IsHovered = 1 << 27,


    ImGuiTableColumnFlags_WidthMask_ = ImGuiTableColumnFlags_WidthStretch | ImGuiTableColumnFlags_WidthFixed,
    ImGuiTableColumnFlags_IndentMask_ = ImGuiTableColumnFlags_IndentEnable | ImGuiTableColumnFlags_IndentDisable,
    ImGuiTableColumnFlags_StatusMask_ = ImGuiTableColumnFlags_IsEnabled | ImGuiTableColumnFlags_IsVisible | ImGuiTableColumnFlags_IsSorted | ImGuiTableColumnFlags_IsHovered,
    ImGuiTableColumnFlags_NoDirectResize_ = 1 << 30,
};


enum ImGuiTableRowFlags_
{
    ImGuiTableRowFlags_None = 0,
    ImGuiTableRowFlags_Headers = 1 << 0,
};
# 2066 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiTableBgTarget_
{
    ImGuiTableBgTarget_None = 0,
    ImGuiTableBgTarget_RowBg0 = 1,
    ImGuiTableBgTarget_RowBg1 = 2,
    ImGuiTableBgTarget_CellBg = 3,
};





struct ImGuiTableSortSpecs
{
    const ImGuiTableColumnSortSpecs* Specs;
    int SpecsCount;
    bool SpecsDirty;

    ImGuiTableSortSpecs() { memset(this, 0, sizeof(*this)); }
};


struct ImGuiTableColumnSortSpecs
{
    ImGuiID ColumnUserID;
    ImS16 ColumnIndex;
    ImS16 SortOrder;
    ImGuiSortDirection SortDirection;

    ImGuiTableColumnSortSpecs() { memset(this, 0, sizeof(*this)); }
};
# 2118 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImNewWrapper {};
inline void* operator new(size_t, ImNewWrapper, void* ptr) { return ptr; }
inline void operator delete(void*, ImNewWrapper, void*) {}




template<typename T> void IM_DELETE(T* p) { if (p) { p->~T(); ImGui::MemFree(p); } }
# 2138 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"

template<typename T>
struct ImVector
{
    int Size;
    int Capacity;
    T* Data;


    typedef T value_type;
    typedef value_type* iterator;
    typedef const value_type* const_iterator;


    inline ImVector() { Size = Capacity = 0; Data = 
# 2152 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                         __null
# 2152 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                             ; }
    inline ImVector(const ImVector<T>& src) { Size = Capacity = 0; Data = 
# 2153 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                         __null
# 2153 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                             ; operator=(src); }
    inline ImVector<T>& operator=(const ImVector<T>& src) { clear(); resize(src.Size); if (src.Data) memcpy(Data, src.Data, (size_t)Size * sizeof(T)); return *this; }
    inline ~ImVector() { if (Data) ImGui::MemFree(Data); }

    inline void clear() { if (Data) { Size = Capacity = 0; ImGui::MemFree(Data); Data = 
# 2157 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                    __null
# 2157 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                        ; } }
    inline void clear_delete() { for (int n = 0; n < Size; n++) IM_DELETE(Data[n]); clear(); }
    inline void clear_destruct() { for (int n = 0; n < Size; n++) Data[n].~T(); clear(); }

    inline bool empty() const { return Size == 0; }
    inline int size() const { return Size; }
    inline int size_in_bytes() const { return Size * (int)sizeof(T); }
    inline int max_size() const { return 0x7FFFFFFF / (int)sizeof(T); }
    inline int capacity() const { return Capacity; }
    inline T& operator[](int i) { 
# 2166 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2166 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             i >= 0 && i < Size
# 2166 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2166 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "i >= 0 && i < Size"
# 2166 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2166),0))
# 2166 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                          ; return Data[i]; }
    inline const T& operator[](int i) const { 
# 2167 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2167 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             i >= 0 && i < Size
# 2167 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2167 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "i >= 0 && i < Size"
# 2167 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2167),0))
# 2167 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                          ; return Data[i]; }

    inline T* begin() { return Data; }
    inline const T* begin() const { return Data; }
    inline T* end() { return Data + Size; }
    inline const T* end() const { return Data + Size; }
    inline T& front() { 
# 2173 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2173 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             Size > 0
# 2173 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2173 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "Size > 0"
# 2173 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2173),0))
# 2173 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                ; return Data[0]; }
    inline const T& front() const { 
# 2174 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2174 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             Size > 0
# 2174 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2174 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "Size > 0"
# 2174 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2174),0))
# 2174 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                ; return Data[0]; }
    inline T& back() { 
# 2175 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2175 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             Size > 0
# 2175 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2175 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "Size > 0"
# 2175 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2175),0))
# 2175 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                ; return Data[Size - 1]; }
    inline const T& back() const { 
# 2176 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2176 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             Size > 0
# 2176 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2176 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "Size > 0"
# 2176 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2176),0))
# 2176 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                ; return Data[Size - 1]; }
    inline void swap(ImVector<T>& rhs) { int rhs_size = rhs.Size; rhs.Size = Size; Size = rhs_size; int rhs_cap = rhs.Capacity; rhs.Capacity = Capacity; Capacity = rhs_cap; T* rhs_data = rhs.Data; rhs.Data = Data; Data = rhs_data; }

    inline int _grow_capacity(int sz) const { int new_capacity = Capacity ? (Capacity + Capacity / 2) : 8; return new_capacity > sz ? new_capacity : sz; }
    inline void resize(int new_size) { if (new_size > Capacity) reserve(_grow_capacity(new_size)); Size = new_size; }
    inline void resize(int new_size, const T& v) { if (new_size > Capacity) reserve(_grow_capacity(new_size)); if (new_size > Size) for (int n = Size; n < new_size; n++) memcpy(&Data[n], &v, sizeof(v)); Size = new_size; }
    inline void shrink(int new_size) { 
# 2182 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2182 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             new_size <= Size
# 2182 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2182 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "new_size <= Size"
# 2182 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2182),0))
# 2182 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                        ; Size = new_size; }
    inline void reserve(int new_capacity) { if (new_capacity <= Capacity) return; T* new_data = (T*)ImGui::MemAlloc((size_t)new_capacity * sizeof(T)); if (Data) { memcpy(new_data, Data, (size_t)Size * sizeof(T)); ImGui::MemFree(Data); } Data = new_data; Capacity = new_capacity; }
    inline void reserve_discard(int new_capacity) { if (new_capacity <= Capacity) return; if (Data) ImGui::MemFree(Data); Data = (T*)ImGui::MemAlloc((size_t)new_capacity * sizeof(T)); Capacity = new_capacity; }


    inline void push_back(const T& v) { if (Size == Capacity) reserve(_grow_capacity(Size + 1)); memcpy(&Data[Size], &v, sizeof(v)); Size++; }
    inline void pop_back() { 
# 2188 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2188 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             Size > 0
# 2188 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2188 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "Size > 0"
# 2188 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2188),0))
# 2188 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                ; Size--; }
    inline void push_front(const T& v) { if (Size == 0) push_back(v); else insert(Data, v); }
    inline T* erase(const T* it) { 
# 2190 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2190 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             it >= Data && it < Data + Size
# 2190 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2190 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "it >= Data && it < Data + Size"
# 2190 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2190),0))
# 2190 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                      ; const ptrdiff_t off = it - Data; memmove(Data + off, Data + off + 1, ((size_t)Size - (size_t)off - 1) * sizeof(T)); Size--; return Data + off; }
    inline T* erase(const T* it, const T* it_last){ 
# 2191 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2191 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             it >= Data && it < Data + Size && it_last >= it && it_last <= Data + Size
# 2191 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2191 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "it >= Data && it < Data + Size && it_last >= it && it_last <= Data + Size"
# 2191 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2191),0))
# 2191 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                 ; const ptrdiff_t count = it_last - it; const ptrdiff_t off = it - Data; memmove(Data + off, Data + off + count, ((size_t)Size - (size_t)off - (size_t)count) * sizeof(T)); Size -= (int)count; return Data + off; }
    inline T* erase_unsorted(const T* it) { 
# 2192 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2192 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             it >= Data && it < Data + Size
# 2192 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2192 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "it >= Data && it < Data + Size"
# 2192 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2192),0))
# 2192 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                      ; const ptrdiff_t off = it - Data; if (it < Data + Size - 1) memcpy(Data + off, Data + Size - 1, sizeof(T)); Size--; return Data + off; }
    inline T* insert(const T* it, const T& v) { 
# 2193 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2193 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             it >= Data && it <= Data + Size
# 2193 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2193 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "it >= Data && it <= Data + Size"
# 2193 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2193),0))
# 2193 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                       ; const ptrdiff_t off = it - Data; if (Size == Capacity) reserve(_grow_capacity(Size + 1)); if (off < (int)Size) memmove(Data + off + 1, Data + off, ((size_t)Size - (size_t)off) * sizeof(T)); memcpy(&Data[off], &v, sizeof(v)); Size++; return Data + off; }
    inline bool contains(const T& v) const { const T* data = Data; const T* data_end = Data + Size; while (data < data_end) if (*data++ == v) return true; return false; }
    inline T* find(const T& v) { T* data = Data; const T* data_end = Data + Size; while (data < data_end) if (*data == v) break; else ++data; return data; }
    inline const T* find(const T& v) const { const T* data = Data; const T* data_end = Data + Size; while (data < data_end) if (*data == v) break; else ++data; return data; }
    inline int find_index(const T& v) const { const T* data_end = Data + Size; const T* it = find(v); if (it == data_end) return -1; const ptrdiff_t off = it - Data; return (int)off; }
    inline bool find_erase(const T& v) { const T* it = find(v); if (it < Data + Size) { erase(it); return true; } return false; }
    inline bool find_erase_unsorted(const T& v) { const T* it = find(v); if (it < Data + Size) { erase_unsorted(it); return true; } return false; }
    inline int index_from_ptr(const T* it) const { 
# 2200 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             (void) ((!!(
# 2200 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             it >= Data && it < Data + Size
# 2200 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             )) || (_assert(
# 2200 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                             "it >= Data && it < Data + Size"
# 2200 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                             ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2200),0))
# 2200 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                      ; const ptrdiff_t off = it - Data; return (int)off; }
};

# 2212 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiStyle
{
    float Alpha;
    float DisabledAlpha;
    ImVec2 WindowPadding;
    float WindowRounding;
    float WindowBorderSize;
    ImVec2 WindowMinSize;
    ImVec2 WindowTitleAlign;
    ImGuiDir WindowMenuButtonPosition;
    float ChildRounding;
    float ChildBorderSize;
    float PopupRounding;
    float PopupBorderSize;
    ImVec2 FramePadding;
    float FrameRounding;
    float FrameBorderSize;
    ImVec2 ItemSpacing;
    ImVec2 ItemInnerSpacing;
    ImVec2 CellPadding;
    ImVec2 TouchExtraPadding;
    float IndentSpacing;
    float ColumnsMinSpacing;
    float ScrollbarSize;
    float ScrollbarRounding;
    float GrabMinSize;
    float GrabRounding;
    float LogSliderDeadzone;
    float TabRounding;
    float TabBorderSize;
    float TabMinWidthForCloseButton;
    float TabBarBorderSize;
    float TabBarOverlineSize;
    float TableAngledHeadersAngle;
    ImVec2 TableAngledHeadersTextAlign;
    ImGuiDir ColorButtonPosition;
    ImVec2 ButtonTextAlign;
    ImVec2 SelectableTextAlign;
    float SeparatorTextBorderSize;
    ImVec2 SeparatorTextAlign;
    ImVec2 SeparatorTextPadding;
    ImVec2 DisplayWindowPadding;
    ImVec2 DisplaySafeAreaPadding;
    float DockingSeparatorSize;
    float MouseCursorScale;
    bool AntiAliasedLines;
    bool AntiAliasedLinesUseTex;
    bool AntiAliasedFill;
    float CurveTessellationTol;
    float CircleTessellationMaxError;
    ImVec4 Colors[ImGuiCol_COUNT];



    float HoverStationaryDelay;
    float HoverDelayShort;
    float HoverDelayNormal;
    ImGuiHoveredFlags HoverFlagsForTooltipMouse;
    ImGuiHoveredFlags HoverFlagsForTooltipNav;

    ImGuiStyle();
    void ScaleAllSizes(float scale_factor);
};
# 2290 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiKeyData
{
    bool Down;
    float DownDuration;
    float DownDurationPrev;
    float AnalogValue;
};

struct ImGuiIO
{




    ImGuiConfigFlags ConfigFlags;
    ImGuiBackendFlags BackendFlags;
    ImVec2 DisplaySize;
    float DeltaTime;
    float IniSavingRate;
    const char* IniFilename;
    const char* LogFilename;
    void* UserData;


    ImFontAtlas*Fonts;
    float FontGlobalScale;
    bool FontAllowUserScaling;
    ImFont* FontDefault;
    ImVec2 DisplayFramebufferScale;


    bool ConfigDockingNoSplit;
    bool ConfigDockingWithShift;
    bool ConfigDockingAlwaysTabBar;
    bool ConfigDockingTransparentPayload;


    bool ConfigViewportsNoAutoMerge;
    bool ConfigViewportsNoTaskBarIcon;
    bool ConfigViewportsNoDecoration;
    bool ConfigViewportsNoDefaultParent;



    bool MouseDrawCursor;
    bool ConfigMacOSXBehaviors;
    bool ConfigNavSwapGamepadButtons;
    bool ConfigInputTrickleEventQueue;
    bool ConfigInputTextCursorBlink;
    bool ConfigInputTextEnterKeepActive;
    bool ConfigDragClickToInputText;
    bool ConfigWindowsResizeFromEdges;
    bool ConfigWindowsMoveFromTitleBarOnly;
    bool ConfigScrollbarScrollByPage;
    float ConfigMemoryCompactTimer;



    float MouseDoubleClickTime;
    float MouseDoubleClickMaxDist;
    float MouseDragThreshold;
    float KeyRepeatDelay;
    float KeyRepeatRate;
# 2370 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool ConfigErrorRecovery;
    bool ConfigErrorRecoveryEnableAssert;
    bool ConfigErrorRecoveryEnableDebugLog;
    bool ConfigErrorRecoveryEnableTooltip;





    bool ConfigDebugIsDebuggerPresent;





    bool ConfigDebugHighlightIdConflicts;





    bool ConfigDebugBeginReturnValueOnce;
    bool ConfigDebugBeginReturnValueLoop;




    bool ConfigDebugIgnoreFocusLoss;


    bool ConfigDebugIniSettings;







    const char* BackendPlatformName;
    const char* BackendRendererName;
    void* BackendPlatformUserData;
    void* BackendRendererUserData;
    void* BackendLanguageUserData;






    void AddKeyEvent(ImGuiKey key, bool down);
    void AddKeyAnalogEvent(ImGuiKey key, bool down, float v);
    void AddMousePosEvent(float x, float y);
    void AddMouseButtonEvent(int button, bool down);
    void AddMouseWheelEvent(float wheel_x, float wheel_y);
    void AddMouseSourceEvent(ImGuiMouseSource source);
    void AddMouseViewportEvent(ImGuiID id);
    void AddFocusEvent(bool focused);
    void AddInputCharacter(unsigned int c);
    void AddInputCharacterUTF16(ImWchar16 c);
    void AddInputCharactersUTF8(const char* str);

    void SetKeyEventNativeData(ImGuiKey key, int native_keycode, int native_scancode, int native_legacy_index = -1);
    void SetAppAcceptingEvents(bool accepting_events);
    void ClearEventsQueue();
    void ClearInputKeys();
    void ClearInputMouse();

    void ClearInputCharacters();
# 2446 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    bool WantCaptureMouse;
    bool WantCaptureKeyboard;
    bool WantTextInput;
    bool WantSetMousePos;
    bool WantSaveIniSettings;
    bool NavActive;
    bool NavVisible;
    float Framerate;
    int MetricsRenderVertices;
    int MetricsRenderIndices;
    int MetricsRenderWindows;
    int MetricsActiveWindows;
    ImVec2 MouseDelta;





    ImGuiContext* Ctx;




    ImVec2 MousePos;
    bool MouseDown[5];
    float MouseWheel;
    float MouseWheelH;
    ImGuiMouseSource MouseSource;
    ImGuiID MouseHoveredViewport;
    bool KeyCtrl;
    bool KeyShift;
    bool KeyAlt;
    bool KeySuper;


    ImGuiKeyChord KeyMods;
    ImGuiKeyData KeysData[ImGuiKey_KeysData_SIZE];
    bool WantCaptureMouseUnlessPopupClose;
    ImVec2 MousePosPrev;
    ImVec2 MouseClickedPos[5];
    double MouseClickedTime[5];
    bool MouseClicked[5];
    bool MouseDoubleClicked[5];
    ImU16 MouseClickedCount[5];
    ImU16 MouseClickedLastCount[5];
    bool MouseReleased[5];
    bool MouseDownOwned[5];
    bool MouseDownOwnedUnlessPopupClose[5];
    bool MouseWheelRequestAxisSwap;
    bool MouseCtrlLeftAsRightClick;
    float MouseDownDuration[5];
    float MouseDownDurationPrev[5];
    ImVec2 MouseDragMaxDistanceAbs[5];
    float MouseDragMaxDistanceSqr[5];
    float PenPressure;
    bool AppFocusLost;
    bool AppAcceptingEvents;
    ImS8 BackendUsingLegacyKeyArrays;
    bool BackendUsingLegacyNavInputArray;
    ImWchar16 InputQueueSurrogate;
    ImVector<ImWchar> InputQueueCharacters;





    int KeyMap[ImGuiKey_COUNT];
    bool KeysDown[ImGuiKey_COUNT];
    float NavInputs[ImGuiNavInput_COUNT];






    const char* (*GetClipboardTextFn)(void* user_data);
    void (*SetClipboardTextFn)(void* user_data, const char* text);
    void* ClipboardUserData;


    ImGuiIO();
};
# 2542 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiInputTextCallbackData
{
    ImGuiContext* Ctx;
    ImGuiInputTextFlags EventFlag;
    ImGuiInputTextFlags Flags;
    void* UserData;






    ImWchar EventChar;
    ImGuiKey EventKey;
    char* Buf;
    int BufTextLen;
    int BufSize;
    bool BufDirty;
    int CursorPos;
    int SelectionStart;
    int SelectionEnd;



    ImGuiInputTextCallbackData();
    void DeleteChars(int pos, int bytes_count);
    void InsertChars(int pos, const char* text, const char* text_end = 
# 2568 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                     __null
# 2568 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                         );
    void SelectAll() { SelectionStart = 0; SelectionEnd = BufTextLen; }
    void ClearSelection() { SelectionStart = SelectionEnd = BufTextLen; }
    bool HasSelection() const { return SelectionStart != SelectionEnd; }
};



struct ImGuiSizeCallbackData
{
    void* UserData;
    ImVec2 Pos;
    ImVec2 CurrentSize;
    ImVec2 DesiredSize;
};
# 2591 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiWindowClass
{
    ImGuiID ClassId;
    ImGuiID ParentViewportId;
    ImGuiID FocusRouteParentWindowId;
    ImGuiViewportFlags ViewportFlagsOverrideSet;
    ImGuiViewportFlags ViewportFlagsOverrideClear;
    ImGuiTabItemFlags TabItemFlagsOverrideSet;
    ImGuiDockNodeFlags DockNodeFlagsOverrideSet;
    bool DockingAlwaysTabBar;
    bool DockingAllowUnclassed;

    ImGuiWindowClass() { memset(this, 0, sizeof(*this)); ParentViewportId = (ImGuiID)-1; DockingAllowUnclassed = true; }
};


struct ImGuiPayload
{

    void* Data;
    int DataSize;


    ImGuiID SourceId;
    ImGuiID SourceParentId;
    int DataFrameCount;
    char DataType[32 + 1];
    bool Preview;
    bool Delivery;

    ImGuiPayload() { Clear(); }
    void Clear() { SourceId = SourceParentId = 0; Data = 
# 2622 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                           __null
# 2622 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                               ; DataSize = 0; memset(DataType, 0, sizeof(DataType)); DataFrameCount = -1; Preview = Delivery = false; }
    bool IsDataType(const char* type) const { return DataFrameCount != -1 && strcmp(type, DataType) == 0; }
    bool IsPreview() const { return Preview; }
    bool IsDelivery() const { return Delivery; }
};
# 2642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiOnceUponAFrame
{
    ImGuiOnceUponAFrame() { RefFrame = -1; }
    mutable int RefFrame;
    operator bool() const { int current_frame = ImGui::GetFrameCount(); if (RefFrame == current_frame) return false; RefFrame = current_frame; return true; }
};


struct ImGuiTextFilter
{
    ImGuiTextFilter(const char* default_filter = "");
    bool Draw(const char* label = "Filter (inc,-exc)", float width = 0.0f);
    bool PassFilter(const char* text, const char* text_end = 
# 2654 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                           __null
# 2654 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                               ) const;
    void Build();
    void Clear() { InputBuf[0] = 0; Build(); }
    bool IsActive() const { return !Filters.empty(); }


    struct ImGuiTextRange
    {
        const char* b;
        const char* e;

        ImGuiTextRange() { b = e = 
# 2665 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                 __null
# 2665 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                     ; }
        ImGuiTextRange(const char* _b, const char* _e) { b = _b; e = _e; }
        bool empty() const { return b == e; }
        void split(char separator, ImVector<ImGuiTextRange>* out) const;
    };
    char InputBuf[256];
    ImVector<ImGuiTextRange>Filters;
    int CountGrep;
};



struct ImGuiTextBuffer
{
    ImVector<char> Buf;
    static char EmptyString[1];

    ImGuiTextBuffer() { }
    inline char operator[](int i) const { 
# 2683 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                 (void) ((!!(
# 2683 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                 Buf.Data != 
# 2683 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                 __null)) || (_assert(
# 2683 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                 "Buf.Data != __null"
# 2683 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                 ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",2683),0))
# 2683 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                            ; return Buf.Data[i]; }
    const char* begin() const { return Buf.Data ? &Buf.front() : EmptyString; }
    const char* end() const { return Buf.Data ? &Buf.back() : EmptyString; }
    int size() const { return Buf.Size ? Buf.Size - 1 : 0; }
    bool empty() const { return Buf.Size <= 1; }
    void clear() { Buf.clear(); }
    void reserve(int capacity) { Buf.reserve(capacity); }
    const char* c_str() const { return Buf.Data ? Buf.Data : EmptyString; }
    void append(const char* str, const char* str_end = 
# 2691 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                     __null
# 2691 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                         );
    void appendf(const char* fmt, ...) __attribute__((format(gnu_printf, 2, 2 +1)));
    void appendfv(const char* fmt, va_list args) __attribute__((format(gnu_printf, 2, 0)));
};


struct ImGuiStoragePair
{
    ImGuiID key;
    union { int val_i; float val_f; void* val_p; };
    ImGuiStoragePair(ImGuiID _key, int _val) { key = _key; val_i = _val; }
    ImGuiStoragePair(ImGuiID _key, float _val) { key = _key; val_f = _val; }
    ImGuiStoragePair(ImGuiID _key, void* _val) { key = _key; val_p = _val; }
};
# 2714 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiStorage
{

    ImVector<ImGuiStoragePair> Data;




    void Clear() { Data.clear(); }
    int GetInt(ImGuiID key, int default_val = 0) const;
    void SetInt(ImGuiID key, int val);
    bool GetBool(ImGuiID key, bool default_val = false) const;
    void SetBool(ImGuiID key, bool val);
    float GetFloat(ImGuiID key, float default_val = 0.0f) const;
    void SetFloat(ImGuiID key, float val);
    void* GetVoidPtr(ImGuiID key) const;
    void SetVoidPtr(ImGuiID key, void* val);





    int* GetIntRef(ImGuiID key, int default_val = 0);
    bool* GetBoolRef(ImGuiID key, bool default_val = false);
    float* GetFloatRef(ImGuiID key, float default_val = 0.0f);
    void** GetVoidPtrRef(ImGuiID key, void* default_val = 
# 2739 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                      __null
# 2739 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                          );


    void BuildSortByKey();

    void SetAllInt(int val);




};
# 2771 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiListClipper
{
    ImGuiContext* Ctx;
    int DisplayStart;
    int DisplayEnd;
    int ItemsCount;
    float ItemsHeight;
    float StartPosY;
    double StartSeekOffsetY;
    void* TempData;



    ImGuiListClipper();
    ~ImGuiListClipper();
    void Begin(int items_count, float items_height = -1.0f);
    void End();
    bool Step();



    inline void IncludeItemByIndex(int item_index) { IncludeItemsByIndex(item_index, item_index + 1); }
    void IncludeItemsByIndex(int item_begin, int item_end);




    void SeekCursorForItem(int item_index);


    inline void IncludeRangeByIndices(int item_begin, int item_end) { IncludeItemsByIndex(item_begin, item_end); }
    inline void ForceDisplayRangeByIndices(int item_begin, int item_end) { IncludeItemsByIndex(item_begin, item_end); }


};
# 2863 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImColor
{
    ImVec4 Value;

    constexpr ImColor() { }
    constexpr ImColor(float r, float g, float b, float a = 1.0f) : Value(r, g, b, a) { }
    constexpr ImColor(const ImVec4& col) : Value(col) {}
    constexpr ImColor(int r, int g, int b, int a = 255) : Value((float)r * (1.0f / 255.0f), (float)g * (1.0f / 255.0f), (float)b * (1.0f / 255.0f), (float)a* (1.0f / 255.0f)) {}
    constexpr ImColor(ImU32 rgba) : Value((float)((rgba >> 0) & 0xFF) * (1.0f / 255.0f), (float)((rgba >> 8) & 0xFF) * (1.0f / 255.0f), (float)((rgba >> 16) & 0xFF) * (1.0f / 255.0f), (float)((rgba >> 24) & 0xFF) * (1.0f / 255.0f)) {}
    inline operator ImU32() const { return ImGui::ColorConvertFloat4ToU32(Value); }
    inline operator ImVec4() const { return Value; }


    inline void SetHSV(float h, float s, float v, float a = 1.0f){ ImGui::ColorConvertHSVtoRGB(h, s, v, Value.x, Value.y, Value.z); Value.w = a; }
    static ImColor HSV(float h, float s, float v, float a = 1.0f) { float r, g, b; ImGui::ColorConvertHSVtoRGB(h, s, v, r, g, b); return ImColor(r, g, b, a); }
};
# 2921 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
enum ImGuiMultiSelectFlags_
{
    ImGuiMultiSelectFlags_None = 0,
    ImGuiMultiSelectFlags_SingleSelect = 1 << 0,
    ImGuiMultiSelectFlags_NoSelectAll = 1 << 1,
    ImGuiMultiSelectFlags_NoRangeSelect = 1 << 2,
    ImGuiMultiSelectFlags_NoAutoSelect = 1 << 3,
    ImGuiMultiSelectFlags_NoAutoClear = 1 << 4,
    ImGuiMultiSelectFlags_NoAutoClearOnReselect = 1 << 5,
    ImGuiMultiSelectFlags_BoxSelect1d = 1 << 6,
    ImGuiMultiSelectFlags_BoxSelect2d = 1 << 7,
    ImGuiMultiSelectFlags_BoxSelectNoScroll = 1 << 8,
    ImGuiMultiSelectFlags_ClearOnEscape = 1 << 9,
    ImGuiMultiSelectFlags_ClearOnClickVoid = 1 << 10,
    ImGuiMultiSelectFlags_ScopeWindow = 1 << 11,
    ImGuiMultiSelectFlags_ScopeRect = 1 << 12,
    ImGuiMultiSelectFlags_SelectOnClick = 1 << 13,
    ImGuiMultiSelectFlags_SelectOnClickRelease = 1 << 14,

    ImGuiMultiSelectFlags_NavWrapX = 1 << 16,
};






struct ImGuiMultiSelectIO
{

    ImVector<ImGuiSelectionRequest> Requests;
    ImGuiSelectionUserData RangeSrcItem;
    ImGuiSelectionUserData NavIdItem;
    bool NavIdSelected;
    bool RangeSrcReset;
    int ItemsCount;
};


enum ImGuiSelectionRequestType
{
    ImGuiSelectionRequestType_None = 0,
    ImGuiSelectionRequestType_SetAll,
    ImGuiSelectionRequestType_SetRange,
};


struct ImGuiSelectionRequest
{

    ImGuiSelectionRequestType Type;
    bool Selected;
    ImS8 RangeDirection;
    ImGuiSelectionUserData RangeFirstItem;
    ImGuiSelectionUserData RangeLastItem;
};
# 2994 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiSelectionBasicStorage
{

    int Size;
    bool PreserveOrder;
    void* UserData;
    ImGuiID (*AdapterIndexToStorageId)(ImGuiSelectionBasicStorage* self, int idx);
    int _SelectionOrder;
    ImGuiStorage _Storage;


    ImGuiSelectionBasicStorage();
    void ApplyRequests(ImGuiMultiSelectIO* ms_io);
    bool Contains(ImGuiID id) const;
    void Clear();
    void Swap(ImGuiSelectionBasicStorage& r);
    void SetItemSelected(ImGuiID id, bool selected);
    bool GetNextSelectedItem(void** opaque_it, ImGuiID* out_id);
    inline ImGuiID GetStorageIdFromIndex(int idx) { return AdapterIndexToStorageId(this, idx); }
};



struct ImGuiSelectionExternalStorage
{

    void* UserData;
    void (*AdapterSetItemSelected)(ImGuiSelectionExternalStorage* self, int idx, bool selected);


    ImGuiSelectionExternalStorage();
    void ApplyRequests(ImGuiMultiSelectIO* ms_io);
};
# 3046 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
typedef void (*ImDrawCallback)(const ImDrawList* parent_list, const ImDrawCmd* cmd);
# 3060 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImDrawCmd
{
    ImVec4 ClipRect;
    ImTextureID TextureId;
    unsigned int VtxOffset;
    unsigned int IdxOffset;
    unsigned int ElemCount;
    ImDrawCallback UserCallback;
    void* UserCallbackData;

    ImDrawCmd() { memset(this, 0, sizeof(*this)); }


    inline ImTextureID GetTexID() const { return TextureId; }
};



struct ImDrawVert
{
    ImVec2 pos;
    ImVec2 uv;
    ImU32 col;
};
# 3093 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImDrawCmdHeader
{
    ImVec4 ClipRect;
    ImTextureID TextureId;
    unsigned int VtxOffset;
};


struct ImDrawChannel
{
    ImVector<ImDrawCmd> _CmdBuffer;
    ImVector<ImDrawIdx> _IdxBuffer;
};




struct ImDrawListSplitter
{
    int _Current;
    int _Count;
    ImVector<ImDrawChannel> _Channels;

    inline ImDrawListSplitter() { memset(this, 0, sizeof(*this)); }
    inline ~ImDrawListSplitter() { ClearFreeMemory(); }
    inline void Clear() { _Current = 0; _Count = 1; }
    void ClearFreeMemory();
    void Split(ImDrawList* draw_list, int count);
    void Merge(ImDrawList* draw_list);
    void SetCurrentChannel(ImDrawList* draw_list, int channel_idx);
};



enum ImDrawFlags_
{
    ImDrawFlags_None = 0,
    ImDrawFlags_Closed = 1 << 0,
    ImDrawFlags_RoundCornersTopLeft = 1 << 4,
    ImDrawFlags_RoundCornersTopRight = 1 << 5,
    ImDrawFlags_RoundCornersBottomLeft = 1 << 6,
    ImDrawFlags_RoundCornersBottomRight = 1 << 7,
    ImDrawFlags_RoundCornersNone = 1 << 8,
    ImDrawFlags_RoundCornersTop = ImDrawFlags_RoundCornersTopLeft | ImDrawFlags_RoundCornersTopRight,
    ImDrawFlags_RoundCornersBottom = ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight,
    ImDrawFlags_RoundCornersLeft = ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersTopLeft,
    ImDrawFlags_RoundCornersRight = ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight,
    ImDrawFlags_RoundCornersAll = ImDrawFlags_RoundCornersTopLeft | ImDrawFlags_RoundCornersTopRight | ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight,
    ImDrawFlags_RoundCornersDefault_ = ImDrawFlags_RoundCornersAll,
    ImDrawFlags_RoundCornersMask_ = ImDrawFlags_RoundCornersAll | ImDrawFlags_RoundCornersNone,
};



enum ImDrawListFlags_
{
    ImDrawListFlags_None = 0,
    ImDrawListFlags_AntiAliasedLines = 1 << 0,
    ImDrawListFlags_AntiAliasedLinesUseTex = 1 << 1,
    ImDrawListFlags_AntiAliasedFill = 1 << 2,
    ImDrawListFlags_AllowVtxOffset = 1 << 3,
};
# 3165 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImDrawList
{

    ImVector<ImDrawCmd> CmdBuffer;
    ImVector<ImDrawIdx> IdxBuffer;
    ImVector<ImDrawVert> VtxBuffer;
    ImDrawListFlags Flags;


    unsigned int _VtxCurrentIdx;
    ImDrawListSharedData* _Data;
    ImDrawVert* _VtxWritePtr;
    ImDrawIdx* _IdxWritePtr;
    ImVector<ImVec2> _Path;
    ImDrawCmdHeader _CmdHeader;
    ImDrawListSplitter _Splitter;
    ImVector<ImVec4> _ClipRectStack;
    ImVector<ImTextureID> _TextureIdStack;
    float _FringeScale;
    const char* _OwnerName;


    ImDrawList(ImDrawListSharedData* shared_data) { memset(this, 0, sizeof(*this)); _Data = shared_data; }

    ~ImDrawList() { _ClearFreeMemory(); }
    void PushClipRect(const ImVec2& clip_rect_min, const ImVec2& clip_rect_max, bool intersect_with_current_clip_rect = false);
    void PushClipRectFullScreen();
    void PopClipRect();
    void PushTextureID(ImTextureID texture_id);
    void PopTextureID();
    inline ImVec2 GetClipRectMin() const { const ImVec4& cr = _ClipRectStack.back(); return ImVec2(cr.x, cr.y); }
    inline ImVec2 GetClipRectMax() const { const ImVec4& cr = _ClipRectStack.back(); return ImVec2(cr.z, cr.w); }
# 3205 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    void AddLine(const ImVec2& p1, const ImVec2& p2, ImU32 col, float thickness = 1.0f);
    void AddRect(const ImVec2& p_min, const ImVec2& p_max, ImU32 col, float rounding = 0.0f, ImDrawFlags flags = 0, float thickness = 1.0f);
    void AddRectFilled(const ImVec2& p_min, const ImVec2& p_max, ImU32 col, float rounding = 0.0f, ImDrawFlags flags = 0);
    void AddRectFilledMultiColor(const ImVec2& p_min, const ImVec2& p_max, ImU32 col_upr_left, ImU32 col_upr_right, ImU32 col_bot_right, ImU32 col_bot_left);
    void AddQuad(const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, const ImVec2& p4, ImU32 col, float thickness = 1.0f);
    void AddQuadFilled(const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, const ImVec2& p4, ImU32 col);
    void AddTriangle(const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, ImU32 col, float thickness = 1.0f);
    void AddTriangleFilled(const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, ImU32 col);
    void AddCircle(const ImVec2& center, float radius, ImU32 col, int num_segments = 0, float thickness = 1.0f);
    void AddCircleFilled(const ImVec2& center, float radius, ImU32 col, int num_segments = 0);
    void AddNgon(const ImVec2& center, float radius, ImU32 col, int num_segments, float thickness = 1.0f);
    void AddNgonFilled(const ImVec2& center, float radius, ImU32 col, int num_segments);
    void AddEllipse(const ImVec2& center, const ImVec2& radius, ImU32 col, float rot = 0.0f, int num_segments = 0, float thickness = 1.0f);
    void AddEllipseFilled(const ImVec2& center, const ImVec2& radius, ImU32 col, float rot = 0.0f, int num_segments = 0);
    void AddText(const ImVec2& pos, ImU32 col, const char* text_begin, const char* text_end = 
# 3219 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                        __null
# 3219 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                            );
    void AddText(const ImFont* font, float font_size, const ImVec2& pos, ImU32 col, const char* text_begin, const char* text_end = 
# 3220 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                             __null
# 3220 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                 , float wrap_width = 0.0f, const ImVec4* cpu_fine_clip_rect = 
# 3220 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                               __null
# 3220 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                   );
    void AddBezierCubic(const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, const ImVec2& p4, ImU32 col, float thickness, int num_segments = 0);
    void AddBezierQuadratic(const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, ImU32 col, float thickness, int num_segments = 0);




    void AddPolyline(const ImVec2* points, int num_points, ImU32 col, ImDrawFlags flags, float thickness);
    void AddConvexPolyFilled(const ImVec2* points, int num_points, ImU32 col);
    void AddConcavePolyFilled(const ImVec2* points, int num_points, ImU32 col);





    void AddImage(ImTextureID user_texture_id, const ImVec2& p_min, const ImVec2& p_max, const ImVec2& uv_min = ImVec2(0, 0), const ImVec2& uv_max = ImVec2(1, 1), ImU32 col = (((ImU32)(255)<<24) | ((ImU32)(255)<<16) | ((ImU32)(255)<<8) | ((ImU32)(255)<<0)));
    void AddImageQuad(ImTextureID user_texture_id, const ImVec2& p1, const ImVec2& p2, const ImVec2& p3, const ImVec2& p4, const ImVec2& uv1 = ImVec2(0, 0), const ImVec2& uv2 = ImVec2(1, 0), const ImVec2& uv3 = ImVec2(1, 1), const ImVec2& uv4 = ImVec2(0, 1), ImU32 col = (((ImU32)(255)<<24) | ((ImU32)(255)<<16) | ((ImU32)(255)<<8) | ((ImU32)(255)<<0)));
    void AddImageRounded(ImTextureID user_texture_id, const ImVec2& p_min, const ImVec2& p_max, const ImVec2& uv_min, const ImVec2& uv_max, ImU32 col, float rounding, ImDrawFlags flags = 0);




    inline void PathClear() { _Path.Size = 0; }
    inline void PathLineTo(const ImVec2& pos) { _Path.push_back(pos); }
    inline void PathLineToMergeDuplicate(const ImVec2& pos) { if (_Path.Size == 0 || memcmp(&_Path.Data[_Path.Size - 1], &pos, 8) != 0) _Path.push_back(pos); }
    inline void PathFillConvex(ImU32 col) { AddConvexPolyFilled(_Path.Data, _Path.Size, col); _Path.Size = 0; }
    inline void PathFillConcave(ImU32 col) { AddConcavePolyFilled(_Path.Data, _Path.Size, col); _Path.Size = 0; }
    inline void PathStroke(ImU32 col, ImDrawFlags flags = 0, float thickness = 1.0f) { AddPolyline(_Path.Data, _Path.Size, col, flags, thickness); _Path.Size = 0; }
    void PathArcTo(const ImVec2& center, float radius, float a_min, float a_max, int num_segments = 0);
    void PathArcToFast(const ImVec2& center, float radius, int a_min_of_12, int a_max_of_12);
    void PathEllipticalArcTo(const ImVec2& center, const ImVec2& radius, float rot, float a_min, float a_max, int num_segments = 0);
    void PathBezierCubicCurveTo(const ImVec2& p2, const ImVec2& p3, const ImVec2& p4, int num_segments = 0);
    void PathBezierQuadraticCurveTo(const ImVec2& p2, const ImVec2& p3, int num_segments = 0);
    void PathRect(const ImVec2& rect_min, const ImVec2& rect_max, float rounding = 0.0f, ImDrawFlags flags = 0);


    void AddCallback(ImDrawCallback callback, void* callback_data);
    void AddDrawCmd();
    ImDrawList* CloneOutput() const;







    inline void ChannelsSplit(int count) { _Splitter.Split(this, count); }
    inline void ChannelsMerge() { _Splitter.Merge(this); }
    inline void ChannelsSetCurrent(int n) { _Splitter.SetCurrentChannel(this, n); }




    void PrimReserve(int idx_count, int vtx_count);
    void PrimUnreserve(int idx_count, int vtx_count);
    void PrimRect(const ImVec2& a, const ImVec2& b, ImU32 col);
    void PrimRectUV(const ImVec2& a, const ImVec2& b, const ImVec2& uv_a, const ImVec2& uv_b, ImU32 col);
    void PrimQuadUV(const ImVec2& a, const ImVec2& b, const ImVec2& c, const ImVec2& d, const ImVec2& uv_a, const ImVec2& uv_b, const ImVec2& uv_c, const ImVec2& uv_d, ImU32 col);
    inline void PrimWriteVtx(const ImVec2& pos, const ImVec2& uv, ImU32 col) { _VtxWritePtr->pos = pos; _VtxWritePtr->uv = uv; _VtxWritePtr->col = col; _VtxWritePtr++; _VtxCurrentIdx++; }
    inline void PrimWriteIdx(ImDrawIdx idx) { *_IdxWritePtr = idx; _IdxWritePtr++; }
    inline void PrimVtx(const ImVec2& pos, const ImVec2& uv, ImU32 col) { PrimWriteIdx((ImDrawIdx)_VtxCurrentIdx); PrimWriteVtx(pos, uv, col); }
# 3290 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    void _ResetForNewFrame();
    void _ClearFreeMemory();
    void _PopUnusedDrawCmd();
    void _TryMergeDrawCmds();
    void _OnChangedClipRect();
    void _OnChangedTextureID();
    void _OnChangedVtxOffset();
    void _SetTextureID(ImTextureID texture_id);
    int _CalcCircleAutoSegmentCount(float radius) const;
    void _PathArcToFastEx(const ImVec2& center, float radius, int a_min_sample, int a_max_sample, int a_step);
    void _PathArcToN(const ImVec2& center, float radius, float a_min, float a_max, int num_segments);
};




struct ImDrawData
{
    bool Valid;
    int CmdListsCount;
    int TotalIdxCount;
    int TotalVtxCount;
    ImVector<ImDrawList*> CmdLists;
    ImVec2 DisplayPos;
    ImVec2 DisplaySize;
    ImVec2 FramebufferScale;
    ImGuiViewport* OwnerViewport;


    ImDrawData() { Clear(); }
    void Clear();
    void AddDrawList(ImDrawList* draw_list);
    void DeIndexAllBuffers();
    void ScaleClipRects(const ImVec2& fb_scale);
};





struct ImFontConfig
{
    void* FontData;
    int FontDataSize;
    bool FontDataOwnedByAtlas;
    int FontNo;
    float SizePixels;
    int OversampleH;
    int OversampleV;
    bool PixelSnapH;
    ImVec2 GlyphExtraSpacing;
    ImVec2 GlyphOffset;
    const ImWchar* GlyphRanges;
    float GlyphMinAdvanceX;
    float GlyphMaxAdvanceX;
    bool MergeMode;
    unsigned int FontBuilderFlags;
    float RasterizerMultiply;
    float RasterizerDensity;
    ImWchar EllipsisChar;


    char Name[40];
    ImFont* DstFont;

    ImFontConfig();
};



struct ImFontGlyph
{
    unsigned int Colored : 1;
    unsigned int Visible : 1;
    unsigned int Codepoint : 30;
    float AdvanceX;
    float X0, Y0, X1, Y1;
    float U0, V0, U1, V1;
};



struct ImFontGlyphRangesBuilder
{
    ImVector<ImU32> UsedChars;

    ImFontGlyphRangesBuilder() { Clear(); }
    inline void Clear() { int size_in_bytes = (0xFFFF + 1) / 8; UsedChars.resize(size_in_bytes / (int)sizeof(ImU32)); memset(UsedChars.Data, 0, (size_t)size_in_bytes); }
    inline bool GetBit(size_t n) const { int off = (int)(n >> 5); ImU32 mask = 1u << (n & 31); return (UsedChars[off] & mask) != 0; }
    inline void SetBit(size_t n) { int off = (int)(n >> 5); ImU32 mask = 1u << (n & 31); UsedChars[off] |= mask; }
    inline void AddChar(ImWchar c) { SetBit(c); }
    void AddText(const char* text, const char* text_end = 
# 3381 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                    __null
# 3381 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                        );
    void AddRanges(const ImWchar* ranges);
    void BuildRanges(ImVector<ImWchar>* out_ranges);
};


struct ImFontAtlasCustomRect
{
    unsigned short Width, Height;
    unsigned short X, Y;
    unsigned int GlyphID;
    float GlyphAdvanceX;
    ImVec2 GlyphOffset;
    ImFont* Font;
    ImFontAtlasCustomRect() { Width = Height = 0; X = Y = 0xFFFF; GlyphID = 0; GlyphAdvanceX = 0.0f; GlyphOffset = ImVec2(0, 0); Font = 
# 3395 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                               __null
# 3395 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                   ; }
    bool IsPacked() const { return X != 0xFFFF; }
};


enum ImFontAtlasFlags_
{
    ImFontAtlasFlags_None = 0,
    ImFontAtlasFlags_NoPowerOfTwoHeight = 1 << 0,
    ImFontAtlasFlags_NoMouseCursors = 1 << 1,
    ImFontAtlasFlags_NoBakedLines = 1 << 2,
};
# 3425 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImFontAtlas
{
    ImFontAtlas();
    ~ImFontAtlas();
    ImFont* AddFont(const ImFontConfig* font_cfg);
    ImFont* AddFontDefault(const ImFontConfig* font_cfg = 
# 3430 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                             __null
# 3430 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                 );
    ImFont* AddFontFromFileTTF(const char* filename, float size_pixels, const ImFontConfig* font_cfg = 
# 3431 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                          __null
# 3431 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                              , const ImWchar* glyph_ranges = 
# 3431 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                              __null
# 3431 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                  );
    ImFont* AddFontFromMemoryTTF(void* font_data, int font_data_size, float size_pixels, const ImFontConfig* font_cfg = 
# 3432 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                           __null
# 3432 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                               , const ImWchar* glyph_ranges = 
# 3432 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                               __null
# 3432 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                   );
    ImFont* AddFontFromMemoryCompressedTTF(const void* compressed_font_data, int compressed_font_data_size, float size_pixels, const ImFontConfig* font_cfg = 
# 3433 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                 __null
# 3433 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                     , const ImWchar* glyph_ranges = 
# 3433 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                                     __null
# 3433 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                                         );
    ImFont* AddFontFromMemoryCompressedBase85TTF(const char* compressed_font_data_base85, float size_pixels, const ImFontConfig* font_cfg = 
# 3434 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                               __null
# 3434 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                   , const ImWchar* glyph_ranges = 
# 3434 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                                                   __null
# 3434 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                                                       );
    void ClearInputData();
    void ClearTexData();
    void ClearFonts();
    void Clear();






    bool Build();
    void GetTexDataAsAlpha8(unsigned char** out_pixels, int* out_width, int* out_height, int* out_bytes_per_pixel = 
# 3446 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                          __null
# 3446 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                              );
    void GetTexDataAsRGBA32(unsigned char** out_pixels, int* out_width, int* out_height, int* out_bytes_per_pixel = 
# 3447 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                          __null
# 3447 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                              );
    bool IsBuilt() const { return Fonts.Size > 0 && TexReady; }
    void SetTexID(ImTextureID id) { TexID = id; }
# 3459 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    const ImWchar* GetGlyphRangesDefault();
    const ImWchar* GetGlyphRangesGreek();
    const ImWchar* GetGlyphRangesKorean();
    const ImWchar* GetGlyphRangesJapanese();
    const ImWchar* GetGlyphRangesChineseFull();
    const ImWchar* GetGlyphRangesChineseSimplifiedCommon();
    const ImWchar* GetGlyphRangesCyrillic();
    const ImWchar* GetGlyphRangesThai();
    const ImWchar* GetGlyphRangesVietnamese();
# 3480 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    int AddCustomRectRegular(int width, int height);
    int AddCustomRectFontGlyph(ImFont* font, ImWchar id, int width, int height, float advance_x, const ImVec2& offset = ImVec2(0, 0));
    ImFontAtlasCustomRect* GetCustomRectByIndex(int index) { 
# 3482 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                                 (void) ((!!(
# 3482 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                 index >= 0
# 3482 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                                 )) || (_assert(
# 3482 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                 "index >= 0"
# 3482 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                                                                 ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",3482),0))
# 3482 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                      ; return &CustomRects[index]; }


    void CalcCustomRectUV(const ImFontAtlasCustomRect* rect, ImVec2* out_uv_min, ImVec2* out_uv_max) const;
    bool GetMouseCursorTexData(ImGuiMouseCursor cursor, ImVec2* out_offset, ImVec2* out_size, ImVec2 out_uv_border[2], ImVec2 out_uv_fill[2]);





    ImFontAtlasFlags Flags;
    ImTextureID TexID;
    int TexDesiredWidth;
    int TexGlyphPadding;
    bool Locked;
    void* UserData;



    bool TexReady;
    bool TexPixelsUseColors;
    unsigned char* TexPixelsAlpha8;
    unsigned int* TexPixelsRGBA32;
    int TexWidth;
    int TexHeight;
    ImVec2 TexUvScale;
    ImVec2 TexUvWhitePixel;
    ImVector<ImFont*> Fonts;
    ImVector<ImFontAtlasCustomRect> CustomRects;
    ImVector<ImFontConfig> ConfigData;
    ImVec4 TexUvLines[(63) + 1];


    const ImFontBuilderIO* FontBuilderIO;
    unsigned int FontBuilderFlags;


    int PackIdMouseCursors;
    int PackIdLines;




};



struct ImFont
{

    ImVector<float> IndexAdvanceX;
    float FallbackAdvanceX;
    float FontSize;


    ImVector<ImWchar> IndexLookup;
    ImVector<ImFontGlyph> Glyphs;
    const ImFontGlyph* FallbackGlyph;


    ImFontAtlas* ContainerAtlas;
    const ImFontConfig* ConfigData;
    short ConfigDataCount;
    ImWchar FallbackChar;
    ImWchar EllipsisChar;
    short EllipsisCharCount;
    float EllipsisWidth;
    float EllipsisCharStep;
    bool DirtyLookupTables;
    float Scale;
    float Ascent, Descent;
    int MetricsTotalSurface;
    ImU8 Used4kPagesMap[(0xFFFF +1)/4096/8];


    ImFont();
    ~ImFont();
    const ImFontGlyph*FindGlyph(ImWchar c) const;
    const ImFontGlyph*FindGlyphNoFallback(ImWchar c) const;
    float GetCharAdvance(ImWchar c) const { return ((int)c < IndexAdvanceX.Size) ? IndexAdvanceX[(int)c] : FallbackAdvanceX; }
    bool IsLoaded() const { return ContainerAtlas != 
# 3562 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                              __null
# 3562 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                  ; }
    const char* GetDebugName() const { return ConfigData ? ConfigData->Name : "<unknown>"; }



    ImVec2 CalcTextSizeA(float size, float max_width, float wrap_width, const char* text_begin, const char* text_end = 
# 3567 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                           __null
# 3567 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                               , const char** remaining = 
# 3567 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                                                                          __null
# 3567 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                                                              ) const;
    const char* CalcWordWrapPositionA(float scale, const char* text, const char* text_end, float wrap_width) const;
    void RenderChar(ImDrawList* draw_list, float size, const ImVec2& pos, ImU32 col, ImWchar c) const;
    void RenderText(ImDrawList* draw_list, float size, const ImVec2& pos, ImU32 col, const ImVec4& clip_rect, const char* text_begin, const char* text_end, float wrap_width = 0.0f, bool cpu_fine_clip = false) const;


    void BuildLookupTable();
    void ClearOutputData();
    void GrowIndex(int new_size);
    void AddGlyph(const ImFontConfig* src_cfg, ImWchar c, float x0, float y0, float x1, float y1, float u0, float v0, float u1, float v1, float advance_x);
    void AddRemapChar(ImWchar dst, ImWchar src, bool overwrite_dst = true);
    void SetGlyphVisible(ImWchar c, bool visible);
    bool IsGlyphRangeUnused(unsigned int c_begin, unsigned int c_last);
};






enum ImGuiViewportFlags_
{
    ImGuiViewportFlags_None = 0,
    ImGuiViewportFlags_IsPlatformWindow = 1 << 0,
    ImGuiViewportFlags_IsPlatformMonitor = 1 << 1,
    ImGuiViewportFlags_OwnedByApp = 1 << 2,
    ImGuiViewportFlags_NoDecoration = 1 << 3,
    ImGuiViewportFlags_NoTaskBarIcon = 1 << 4,
    ImGuiViewportFlags_NoFocusOnAppearing = 1 << 5,
    ImGuiViewportFlags_NoFocusOnClick = 1 << 6,
    ImGuiViewportFlags_NoInputs = 1 << 7,
    ImGuiViewportFlags_NoRendererClear = 1 << 8,
    ImGuiViewportFlags_NoAutoMerge = 1 << 9,
    ImGuiViewportFlags_TopMost = 1 << 10,
    ImGuiViewportFlags_CanHostOtherWindows = 1 << 11,


    ImGuiViewportFlags_IsMinimized = 1 << 12,
    ImGuiViewportFlags_IsFocused = 1 << 13,
};
# 3615 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiViewport
{
    ImGuiID ID;
    ImGuiViewportFlags Flags;
    ImVec2 Pos;
    ImVec2 Size;
    ImVec2 WorkPos;
    ImVec2 WorkSize;
    float DpiScale;
    ImGuiID ParentViewportId;
    ImDrawData* DrawData;






    void* RendererUserData;
    void* PlatformUserData;
    void* PlatformHandle;
    void* PlatformHandleRaw;
    bool PlatformWindowCreated;
    bool PlatformRequestMove;
    bool PlatformRequestResize;
    bool PlatformRequestClose;

    ImGuiViewport() { memset(this, 0, sizeof(*this)); }
    ~ImGuiViewport() { 
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                         (void) ((!!(
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                         PlatformUserData == 
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                         __null 
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                         && RendererUserData == 
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                         __null)) || (_assert(
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                         "PlatformUserData == __null && RendererUserData == __null"
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3
                         ,"C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h",3642),0))
# 3642 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                        ; }


    ImVec2 GetCenter() const { return ImVec2(Pos.x + Size.x * 0.5f, Pos.y + Size.y * 0.5f); }
    ImVec2 GetWorkCenter() const { return ImVec2(WorkPos.x + WorkSize.x * 0.5f, WorkPos.y + WorkSize.y * 0.5f); }
};
# 3700 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
struct ImGuiPlatformIO
{
    ImGuiPlatformIO();







    const char* (*Platform_GetClipboardTextFn)(ImGuiContext* ctx);
    void (*Platform_SetClipboardTextFn)(ImGuiContext* ctx, const char* text);
    void* Platform_ClipboardUserData;



    bool (*Platform_OpenInShellFn)(ImGuiContext* ctx, const char* path);
    void* Platform_OpenInShellUserData;



    void (*Platform_SetImeDataFn)(ImGuiContext* ctx, ImGuiViewport* viewport, ImGuiPlatformImeData* data);
    void* Platform_ImeUserData;




    ImWchar Platform_LocaleDecimalPoint;
# 3746 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
    void (*Platform_CreateWindow)(ImGuiViewport* vp);
    void (*Platform_DestroyWindow)(ImGuiViewport* vp);
    void (*Platform_ShowWindow)(ImGuiViewport* vp);
    void (*Platform_SetWindowPos)(ImGuiViewport* vp, ImVec2 pos);
    ImVec2 (*Platform_GetWindowPos)(ImGuiViewport* vp);
    void (*Platform_SetWindowSize)(ImGuiViewport* vp, ImVec2 size);
    ImVec2 (*Platform_GetWindowSize)(ImGuiViewport* vp);
    void (*Platform_SetWindowFocus)(ImGuiViewport* vp);
    bool (*Platform_GetWindowFocus)(ImGuiViewport* vp);
    bool (*Platform_GetWindowMinimized)(ImGuiViewport* vp);
    void (*Platform_SetWindowTitle)(ImGuiViewport* vp, const char* str);
    void (*Platform_SetWindowAlpha)(ImGuiViewport* vp, float alpha);
    void (*Platform_UpdateWindow)(ImGuiViewport* vp);
    void (*Platform_RenderWindow)(ImGuiViewport* vp, void* render_arg);
    void (*Platform_SwapBuffers)(ImGuiViewport* vp, void* render_arg);
    float (*Platform_GetWindowDpiScale)(ImGuiViewport* vp);
    void (*Platform_OnChangedViewport)(ImGuiViewport* vp);
    ImVec4 (*Platform_GetWindowWorkAreaInsets)(ImGuiViewport* vp);
    int (*Platform_CreateVkSurface)(ImGuiViewport* vp, ImU64 vk_inst, const void* vk_allocators, ImU64* out_vk_surface);


    void (*Renderer_CreateWindow)(ImGuiViewport* vp);
    void (*Renderer_DestroyWindow)(ImGuiViewport* vp);
    void (*Renderer_SetWindowSize)(ImGuiViewport* vp, ImVec2 size);
    void (*Renderer_RenderWindow)(ImGuiViewport* vp, void* render_arg);
    void (*Renderer_SwapBuffers)(ImGuiViewport* vp, void* render_arg);




    ImVector<ImGuiPlatformMonitor> Monitors;







    ImVector<ImGuiViewport*> Viewports;
};



struct ImGuiPlatformMonitor
{
    ImVec2 MainPos, MainSize;
    ImVec2 WorkPos, WorkSize;
    float DpiScale;
    void* PlatformHandle;
    ImGuiPlatformMonitor() { MainPos = MainSize = WorkPos = WorkSize = ImVec2(0, 0); DpiScale = 1.0f; PlatformHandle = 
# 3795 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                                                                                               __null
# 3795 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                                                                                                   ; }
};


struct ImGuiPlatformImeData
{
    bool WantVisible;
    ImVec2 InputPos;
    float InputLineHeight;

    ImGuiPlatformImeData() { memset(this, 0, sizeof(*this)); }
};
# 3815 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
namespace ImGui
{

    static inline void PushButtonRepeat(bool repeat) { PushItemFlag(ImGuiItemFlags_ButtonRepeat, repeat); }
    static inline void PopButtonRepeat() { PopItemFlag(); }
    static inline void PushTabStop(bool tab_stop) { PushItemFlag(ImGuiItemFlags_NoTabStop, !tab_stop); }
    static inline void PopTabStop() { PopItemFlag(); }
    ImVec2 GetContentRegionMax();
    ImVec2 GetWindowContentRegionMin();
    ImVec2 GetWindowContentRegionMax();

    static inline bool BeginChildFrame(ImGuiID id, const ImVec2& size, ImGuiWindowFlags window_flags = 0) { return BeginChild(id, size, ImGuiChildFlags_FrameStyle, window_flags); }
    static inline void EndChildFrame() { EndChild(); }


    static inline void ShowStackToolWindow(bool* p_open = 
# 3830 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h" 3 4
                                                          __null
# 3830 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
                                                              ) { ShowIDStackToolWindow(p_open); }
    bool Combo(const char* label, int* current_item, bool (*old_callback)(void* user_data, int idx, const char** out_text), void* user_data, int items_count, int popup_max_height_in_items = -1);
    bool ListBox(const char* label, int* current_item, bool (*old_callback)(void* user_data, int idx, const char** out_text), void* user_data, int items_count, int height_in_items = -1);

    void SetItemAllowOverlap();

    static inline void PushAllowKeyboardFocus(bool tab_stop) { PushItemFlag(ImGuiItemFlags_NoTabStop, !tab_stop); }
    static inline void PopAllowKeyboardFocus() { PopItemFlag(); }

    ImGuiKey GetKeyIndex(ImGuiKey key);
# 3900 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
}
# 3942 "C:/Users/ajost1/CLionProjects/Kup/imgui/imgui.h"
#pragma GCC diagnostic pop
# 17 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp" 2
# 1 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h" 1
# 31 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
       
# 58 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
# 1 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/extras/IconsFontAwesome6.h" 1



       
# 59 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h" 2






extern "C" {
# 77 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 void rlImGuiSetup(bool darkTheme);





 void rlImGuiBegin(void);





 void rlImGuiEnd(void);





 void rlImGuiShutdown(void);
# 104 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 void rlImGuiBeginInitImGui(void);






 void rlImGuiEndInitImGui(void);




 void rlImGuiReloadFonts(void);







 void rlImGuiBeginDelta(float deltaTime);
# 135 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 void rlImGuiImage(const Texture *image);
# 145 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 void rlImGuiImageSize(const Texture *image, int width, int height);
# 154 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 void rlImGuiImageSizeV(const Texture* image, Vector2 size);
# 165 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 void rlImGuiImageRect(const Texture* image, int destWidth, int destHeight, Rectangle sourceRect);





 void rlImGuiImageRenderTexture(const RenderTexture* image);







 void rlImGuiImageRenderTextureFit(const RenderTexture* image, bool center);







bool rlImGuiImageButton(const char* name, const Texture* image);
# 196 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/rlImGui.h"
 bool rlImGuiImageButtonSize(const char* name, const Texture* image, struct ImVec2 size);


}
# 18 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp" 2


int main(int argc, char* argv[])
{


 int screenWidth = 1280;
 int screenHeight = 800;

 SetConfigFlags(FLAG_MSAA_4X_HINT | FLAG_VSYNC_HINT | FLAG_WINDOW_RESIZABLE | FLAG_WINDOW_HIGHDPI);
 InitWindow(screenWidth, screenHeight, "raylib-Extras [ImGui] example - Docking");
 SetTargetFPS(144);
 rlImGuiSetup(true);

 bool run = true;

 bool showDemoWindow = true;




 ImGui::GetIO().ConfigFlags |= ImGuiConfigFlags_DockingEnable;



 while (!WindowShouldClose() && run)
 {
  BeginDrawing();
  ClearBackground(Color{ 80, 80, 80, 255 });


  DrawCircle(GetScreenWidth() / 2, GetScreenHeight() / 2, GetScreenHeight() * 0.45f, Color{ 0, 117, 44, 255 });


  rlImGuiBegin();



  ImGui::DockSpaceOverViewport(0, 
# 56 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp" 3 4
                                  __null
# 56 "C:/Users/ajost1/CLionProjects/Kup/rlImGui/examples/docking_example.cpp"
                                      , ImGuiDockNodeFlags_PassthruCentralNode);



  if (ImGui::BeginMainMenuBar())
  {
   if (ImGui::BeginMenu("File"))
   {
    if (ImGui::MenuItem("Quit"))
     run = false;

    ImGui::EndMenu();
            }

   if (ImGui::BeginMenu("Window"))
            {
                if (ImGui::MenuItem("Demo Window", nullptr, showDemoWindow))
     showDemoWindow = !showDemoWindow;

                ImGui::EndMenu();
            }
   ImGui::EndMainMenuBar();
  }



  if (showDemoWindow)
   ImGui::ShowDemoWindow(&showDemoWindow);

  if (ImGui::Begin("Test Window"))
  {
   ImGui::TextUnformatted("Another window");
  }
  ImGui::End();


  rlImGuiEnd();

  EndDrawing();

 }
 rlImGuiShutdown();



 CloseWindow();


 return 0;
}
