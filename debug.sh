#!/usr/bin/env bash

BUILD_MODE=cmake-build-debug


mkdir ${BUILD_MODE}
cmake -B ./${BUILD_MODE}/

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=On -G Ninja -S . -B ./${BUILD_MODE}

cmake --build ./${BUILD_MODE}/

./${BUILD_MODE}/Kup
