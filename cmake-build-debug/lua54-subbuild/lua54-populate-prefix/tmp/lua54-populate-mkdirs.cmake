# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/ajost1/CLionProjects/Kup/lua54"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-build"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix/tmp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix/src/lua54-populate-stamp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix/src"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix/src/lua54-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix/src/lua54-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/lua54-subbuild/lua54-populate-prefix/src/lua54-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
