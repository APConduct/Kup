# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-src")
  file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-src")
endif()
file(MAKE_DIRECTORY
  "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-build"
  "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix"
  "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix/tmp"
  "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix/src/raylib-populate-stamp"
  "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix/src"
  "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix/src/raylib-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix/src/raylib-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/build/_deps/raylib-subbuild/raylib-populate-prefix/src/raylib-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
