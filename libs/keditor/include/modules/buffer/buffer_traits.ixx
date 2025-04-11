//
// Created by Aidan Jost on 4/10/25.
//

module;
#include <string>
export module keditor.buffer.traits;

export import keditor.core.types;

export
    namespace keditor::buffer
    {
        template<typename CharT>
        struct Traits {
            using char_type = CharT;
            using string_type = std::basic_string<CharT>;

            static bool is_newline(char_type c) {
                return c == '\n';
            }
            static bool is_whitespace(char_type c) {
                return std::isspace(static_cast<unsigned char>(c));
            }
            static bool is_word_char(char_type c) {
                return std::isalnum(static_cast<unsigned char>(c)) || c == '_';
            }
            static Index char_width(char_type c) {
                return 1;
            }
            static string_type to_string(const char* str) {
                return string_type(str);
            }
        };
        template<>
        struct Traits<char> {
            using char_type = char;
            using string_type = std::string;

            static bool is_newline(char c) {
                return c == '\n';
            }

            static bool is_whitespace(char c) {
                return std::isspace(static_cast<unsigned char>(c));
            }
            static bool is_word_char(char c) {
                return std::isalnum(static_cast<unsigned char>(c)) || c == '_';
            }
            static Index char_width(char) {
                return 1;
            }
            static string_type to_string(const char* str) {
                return {str};
            }


        };
        template<>
        struct Traits<char8_t> {
            using char_type = char8_t;
            using string_type = std::u8string;

            static bool is_newline(char8_t c) {
                return c == u8'\n';
            }
            static bool is_whitespace(char8_t c) {
                return c <= 127 && std::isspace(static_cast<unsigned char>(c));
            }
            static bool is_word_char(char8_t c) {
                return c <= 127 && (std::isalnum(static_cast<unsigned char>(c)) || c == u8'_');
            }
            static Index char_width(char8_t c) {
                // UTF-8 first byte determines the width
                if (c<0x80) return 1;
                if (c<0xE0) return 2;
                if (c<0xF0) return 3;
                return 4;
            }
            static string_type to_string(const char* str) {
                // Convert ascii string to UTF-8 string
                string_type result;
                while (*str) {
                    result.push_back(static_cast<char8_t>(*str++));
                }
                return result;
            }
        };
    }

