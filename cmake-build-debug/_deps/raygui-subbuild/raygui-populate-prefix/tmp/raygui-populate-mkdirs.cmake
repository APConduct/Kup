# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/projects/CMake"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-build"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix/tmp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix/src/raygui-populate-stamp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix/src"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix/src/raygui-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix/src/raygui-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/_deps/raygui-subbuild/raygui-populate-prefix/src/raygui-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
