# 0 "C:/Users/ajost1/CLionProjects/Kup/src/Button.cpp"
# 1 "C:\\Users\\ajost1\\CLionProjects\\Kup\\cmake-build-debug-msys-ucrt//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "C:/Users/ajost1/CLionProjects/Kup/src/Button.cpp"




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
# 6 "C:/Users/ajost1/CLionProjects/Kup/src/Button.cpp" 2
