#pragma once

#if defined(__APPLE__)
#define FS_FILE_PATH_DELIMITER '/'
#define FS_HOME_PREFIX "/Users/"
#define FS_ROOT_PATH "/"
#define FS_OS_IS_UNIX 1
#elif defined(__linux__)
#define FS_FILE_PATH_DELIMITER '/'
#define FS_HOME_PREFIX "/home/"
#define FS_ROOT_PATH "/"
#define FS_OS_IS_UNIX 1
#elif defined(_WIN32) || defined(_WIN64)
#define FS_FILE_PATH_DELIMITER '\\'
#define FS_HOME_PREFIX "C:\\Users\\"
#define FS_ROOT_PATH "C:\\"
#define FS_OS_IS_WINDOWS 1
#else
#define FS_FILE_PATH_DELIMITER '/'
#define FS_HOME_PREFIX "/home/"
#define FS_ROOT_PATH "/"
#define FS_OS_IS_UNKNOWN 1
#endif