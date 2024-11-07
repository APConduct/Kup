#!/usr/bin/env bash


mkdir "build"
cmake -B ./build/

cmake --build ./build --target Kup -j 10

./build/Kup

