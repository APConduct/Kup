/// @file buffer_traits.ixx
/// @brief Traits for buffer character types

module;
#include <string>

/// @brief Buffer character traits module
export module keditor.buffer.traits;

export import keditor.core.types;

export namespace keditor
{

    namespace utf8_helpers {
        /// @brief Check if a byte is a UTF-8 continuation byte
        /// @param c Character to check
        /// @return true if the byte is a continuation byte, false otherwise
        inline bool is_continuation(char8_t c) {
            return (c & 0xC0) == 0x80; // 10xxxxxx pattern
        }
    }

    namespace buffer
    {

        /// @brief Traits class for buffer character types
        /// @tparam CharT Character type
        template<typename CharT>
        struct Traits {
            /// @brief Type alias for character type
            using char_type = CharT;

            /// @brief Type alias for string type
            using string_type = std::basic_string<CharT>;

            /// @brief Check if character is a newline
            /// @param c Character to check
            /// @return true if character is a newline, false otherwise
            static bool is_newline(char_type c) {
                return c == '\n';
            }

            /// @brief Check if character is whitespace
            /// @param c Character to check
            /// @return true if character is whitespace, false otherwise
            static bool is_whitespace(char_type c) {
                return std::isspace(static_cast<unsigned char>(c));
            }

            /// @brief Check if character is a word character
            /// @param c Character to check
            /// @return true if character is a word character, false otherwise
            static bool is_word_char(char_type c) {
                return std::isalnum(static_cast<unsigned char>(c)) || c == '_';
            }

            /// @brief Get the width of a character
            /// @param c Character to check
            /// @return Width of the character
            /// @note Default implementation assumes single-byte characters
            static Index char_width(char_type c) {
                return 1;
            }

            /// @brief Convert a C-style string to the string type
            /// @param str C-style string
            /// @return Converted string
            static string_type to_string(const char* str) {
                return string_type(str);
            }
        };

        /// @brief Specialization for default character type (char)
        template<>
        struct Traits<char> {
            /// @brief Type alias for character type
            using char_type = char;

            /// @brief Type alias for string type
            using string_type = std::string;

            /// @brief Check if character is a newline
            /// @param c Character to check
            /// @return true if character is a newline, false otherwise
            static bool is_newline(char c) {
                return c == '\n';
            }

            /// @brief Check if character is whitespace
            /// @param c Character to check
            /// @return true if character is whitespace, false otherwise
            static bool is_whitespace(char c) {
                return std::isspace(static_cast<unsigned char>(c));
            }

            /// @brief Check if character is a word character (i.e., alphanumeric or underscore)
            /// @param c Character to check
            /// @return true if character is a word character, false otherwise
            static bool is_word_char(char c) {
                return std::isalnum(static_cast<unsigned char>(c)) || c == '_';
            }

            /// @brief Get the width of a character
            static Index char_width(char) {
                return 1;
            }

            /// @brief Convert a C-style string to the string type
            /// @param str C-style string
            /// @return Converted string
            static string_type to_string(const char* str) {
                return {str};
            }


        };

        /// @brief Specialization for UTF-8 character type (char8_t)
        template<>
        struct Traits<char8_t> {
            using char_type = char8_t;
            using string_type = std::u8string;

            /// @brief Check if character is a newline
            /// @param c Character to check
            /// @return true if character is a newline, false otherwise
            static bool is_newline(char8_t c) {
                return c == u8'\n';
            }

            /// @brief Check if character is whitespace
            /// @param c Character to check
            /// @return true if character is whitespace, false otherwise
            static bool is_whitespace(char8_t c) {
                return c <= 127 && std::isspace(static_cast<unsigned char>(c));
            }

            /// @brief Check if character is a word character
            /// @param c Character to check
            /// @return true if character is a word character, false otherwise
            static bool is_word_char(char8_t c) {
                return c <= 127 && (std::isalnum(static_cast<unsigned char>(c)) || c == u8'_');
            }

            /// @brief Get the width of a UTF-8 character
            /// @param c Character to check
            /// @return Width of the character
            static Index char_width(char8_t c) {
                // More accurate detection of UTF-8 sequence length
                if ((c & 0x80) == 0) return 1;     // 0xxxxxxx - 1 byte (ASCII)
                if ((c & 0xE0) == 0xC0) return 2;  // 110xxxxx - 2 bytes
                if ((c & 0xF0) == 0xE0) return 3;  // 1110xxxx - 3 bytes
                if ((c & 0xF8) == 0xF0) return 4;  // 11110xxx - 4 bytes
                return 0; // Invalid UTF-8 leading byte
            }

            /// @brief Convert a C-style string to the UTF-8 string type
            /// @param str C-style string
            /// @return Converted UTF-8 string
            static string_type to_string(const char* str) {
                if (!str) return {};

                // Handle conversion safely
                string_type result;
                result.reserve(strlen(str)); // Pre-allocate for efficiency

                while (*str) {
                    auto c = static_cast<unsigned char>(*str++);

                    if (c < 0x80) {
                        // ASCII character - direct conversion is safe
                        result.push_back(static_cast<char8_t>(c));
                    } else {
                        // Non-ASCII characters require proper UTF-8 encoding
                        // For simplicity, replace with Unicode replacement character (U+FFFD)
                        result.push_back(static_cast<char8_t>(0xEF));
                        result.push_back(static_cast<char8_t>(0xBF));
                        result.push_back(static_cast<char8_t>(0xBD));
                    }
                }
                return result;
            }        };
    }
}

