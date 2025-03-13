
file(READ ${FONT_FILE} CONTENT HEX)
string(REGEX REPLACE "([0-9a-f][0-9a-f])" "0x\\1, " CONTENT "${CONTENT}")
string(REGEX REPLACE ", $" "" CONTENT "${CONTENT}")

file(SIZE ${FONT_FILE} FILE_SIZE)

# Format similar to xxd output with proper variable naming
string(TOUPPER ${VARIABLE_NAME} VARIABLE_NAME_UPPER)
set(FORMATTED_CONTENT "")
set(LINE_LENGTH 0)
set(INDEX 0)
foreach(HEX_BYTE ${CONTENT})
    if(${LINE_LENGTH} EQUAL 0)
        string(APPEND FORMATTED_CONTENT "\n  ")
    endif()
    string(APPEND FORMATTED_CONTENT "${HEX_BYTE}")
    math(EXPR LINE_LENGTH "(${LINE_LENGTH} + 1) % 12")
    math(EXPR INDEX "${INDEX} + 1")
endforeach()

file(WRITE ${OUTPUT_FILE} "#pragma once\ninline unsigned char ${VARIABLE_NAME}_ttf[] = {${FORMATTED_CONTENT}\n};\ninline unsigned int ${VARIABLE_NAME}_ttf_len = ${FILE_SIZE};\n")
