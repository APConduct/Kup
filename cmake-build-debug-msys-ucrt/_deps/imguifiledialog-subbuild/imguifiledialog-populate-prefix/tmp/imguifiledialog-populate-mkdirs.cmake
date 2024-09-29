# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-src"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-build"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix/tmp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix/src/imguifiledialog-populate-stamp"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix/src"
  "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix/src/imguifiledialog-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix/src/imguifiledialog-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/ajost1/CLionProjects/Kup/cmake-build-debug-msys-ucrt/_deps/imguifiledialog-subbuild/imguifiledialog-populate-prefix/src/imguifiledialog-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
