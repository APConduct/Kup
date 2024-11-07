//
// Created by ajost1 on 10/24/2024.
//

#ifndef KUP_API_H
#define KUP_API_H

#include <map>
#include <raylib.h>
#include <string>



typedef std::tuple<std::string, KeyboardKey> key_name_code_map;

inline std::map<std::string, int> key_vals{
    {"a", KEY_A},
    {"b", KEY_B},
    {"c", KEY_C},
    {"d", KEY_D},
    {"e", KEY_E},
    {"f", KEY_F},
    {"g", KEY_G},
    {"h", KEY_H},
    {"i", KEY_I},
    {"j", KEY_J},
    {"k", KEY_K},
    {"l", KEY_L},
    {"m", KEY_M},
    {"n", KEY_N},
    {"o", KEY_O},
    {"p", KEY_P},
    {"q", KEY_Q},
    {"r", KEY_R},
    {"s", KEY_S},
    {"t", KEY_T},
    {"u", KEY_U},
    {"v", KEY_V},
    {"w", KEY_W},
    {"x", KEY_X},
    {"y", KEY_Y},
    {"z", KEY_Z},
    {"0", KEY_ZERO},
    {"1", KEY_ONE},
    {"2", KEY_TWO},
    {"3", KEY_THREE},
    {"4", KEY_FOUR},
    {"5", KEY_FIVE},
    {"6", KEY_SIX},
    {"7", KEY_SEVEN},
    {"8", KEY_EIGHT},
    {"9", KEY_NINE},

    {"l_bracket", KEY_LEFT_BRACKET},
    {"r_bracket", KEY_RIGHT_BRACKET},


    {"equal", KEY_EQUAL},
    {"minus", KEY_MINUS},

    {"l_ctrl", KEY_LEFT_CONTROL},
    {"r_ctrl", KEY_RIGHT_CONTROL},

    {"l_shift", KEY_LEFT_SHIFT},
    {"r_shift", KEY_RIGHT_SHIFT},

    {"l_alt", KEY_LEFT_ALT},
    {"r_shift", KEY_RIGHT_ALT},

    {"l_super", KEY_LEFT_SUPER},
    {"r_super", KEY_RIGHT_SUPER},


    {"backspace", KEY_BACKSPACE},

    {"tab", KEY_TAB},
    {"page_up", KEY_PAGE_UP},
    {"page_down", KEY_PAGE_DOWN},
    {"caps_lock",KEY_CAPS_LOCK},
    {"space", KEY_SPACE},
    {"esc", KEY_ESCAPE},
    {"tab", KEY_TAB},
    {"enter", KEY_ENTER},
    {"end", KEY_END},
    {"delete", KEY_DELETE},
    {"backslash", KEY_BACKSLASH},
    {"slash", KEY_SLASH},
    {".", KEY_PERIOD},
    {"num_lock", KEY_NUM_LOCK}


    };

typedef void key_function;
typedef std::string key_name;
typedef std::tuple<key_name, KeyboardKey, key_function> kup_key;



inline int key_val(const std::string& name)
{
    return key_vals.at(name);
};

inline void set_key_func(const key_name&, void *func){}



#endif //KUP_API_H
