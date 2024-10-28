#!/usr/bin/env bash


mkdir "build"
cmake -B ./build/

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=ninja -G Ninja -S . -B ./build

cmake --build build/

./build/Kup
