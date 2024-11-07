#ifndef KUP_LUA_API_H
#define KUP_LUA_API_H
#include <raylib.h>
#include <lua.hpp>

// Example binding
inline int l_create_window(lua_State* L) {
    const char* title = luaL_checkstring(L, 1);
    const int width = static_cast<int>(luaL_checkinteger(L, 2));
    const int height = static_cast<int>(luaL_checkinteger(L, 3));

    InitWindow(width, height, title);
    return 0;
}

class LuaAPI {
    static void RegisterRaylibAPI(lua_State* L) {
        // Window management
        lua_register(L, "create_window", l_create_window);
        //lua_register(L, "draw_rectangle", l_draw_rectangle);
        // ... only what you need
    }

    //void RegisterEditorAPI(lua_State* L) {
        // Editor-specific functionality
        //lua_register(L, "create_buffer", l_create_buffer);
        // ...
        //}
};



#endif // kup_lua_api_h
