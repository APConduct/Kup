#!/bin/bash

# Exit on error
set -e

# Build directory
BUILD_DIR="cmake-build-debug"

# Build type (Debug by default)
BUILD_TYPE="Debug"

# Create build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# Configure cmake
cmake -B "$BUILD_DIR" \
      -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -G "Ninja"

# Build using ninja
# shellcheck disable=SC2046
cmake --build "$BUILD_DIR" -j $(sysctl -n hw.ncpu)

# Create a symlink for compile_commands.json in project root
ln -sf "$BUILD_DIR/compile_commands.json" compile_commands.json

# Run the executable
"$BUILD_DIR/kup"