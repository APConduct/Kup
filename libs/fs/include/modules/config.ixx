//
// Created by Aidan Jost on 2/25/25.
//

module;
#include "fs/fs_config.hpp"

export module fs.config;


export decltype(FS_FILE_PATH_DELIMITER) fs_file_path_delimiter = FS_FILE_PATH_DELIMITER;
export decltype(FS_HOME_PREFIX) fs_home_prefix = FS_HOME_PREFIX;
export decltype(FS_ROOT_PATH) fs_root_path = FS_ROOT_PATH;

#if defined(FS_OS_IS_UNIX)
export decltype(FS_OS_IS_UNIX) fs_os_is_unix = FS_OS_IS_UNIX;
#elif defined(FS_OS_IS_WINDOWS)
export decltype(FS_OS_IS_WINDOWS) fs_os_is_windows = FS_OS_IS_WINDOWS;
#elif defined(FS_OS_IS_UNKNOWN)
export decltype(FS_OS_IS_UNKNOWN) fs_os_is_unknown = FS_OS_IS_UNKNOWN;
#endif

