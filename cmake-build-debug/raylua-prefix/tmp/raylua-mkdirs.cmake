# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src/raylua"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src/raylua-build"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/tmp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src/raylua-stamp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src/raylua-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src/raylua-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug/raylua-prefix/src/raylua-stamp${cfgdir}") # cfgdir has leading slash
endif()