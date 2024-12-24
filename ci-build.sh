#!/usr/bin/env bash

# Install necessary dependencies
sudo apt-get update
sudo apt-get install -y libx11-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev

mkdir -p "build"
cmake -B ./build/

if cmake --build ./build --target Kup -j 10; then
  if ./build/Kup; then
    echo "Execution successful."
  else
    echo "Execution failed. Check for OpenGL support and GLFW initialization issues."
    exit 1
  fi
else
  echo "Build failed. Exiting."
  exit 1
fi
