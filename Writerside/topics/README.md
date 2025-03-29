![alt text](https://github.com/APConduct/Kup/blob/master/.github/media/kup-2024-11-13.png?raw=true)


# Kup - A Modern Text Editor

A modular, extensible text editor built with modern C++20 and Lua.

## Features

- Modern C++20 codebase using modules
- Lua-based configuration and plugin system
- Modular architecture with distinct API layers
- Cross-platform support (macOS, Linux, Windows)

## Installation



```bash
# Clone the repository
git clone https://github.com/APConduct/kup.git
cd kup

# Build using CMake
./build.sh
```

### Prerequisites

- CMake 3.20+
- Ninja build system
- LLVM/Clang++ toolchain
- raylib 5.5+
- sol2

### Platform-specific Setup

#### macOS
1. Install required tools via Homebrew:
```bash
brew install llvm cmake ninja raylib
```

#### Windows

1. Install MSYS2 from https://www.msys2.org or with a package manager like Chocolatey. or winget 
2. install the required tools with the package manager


#### with Chocolatey
```bash
  choco install msys2
```

#### with winget (preferred)
```bash
  winget install --id=MSYS2.MSYS2  -e
```
then install the  dependencies with the package manager
```bash
pacman -S mingw-w64-x86_64-clang mingw-w64-x86_64-cmake mingw-w64-x86_64-ninja mingw-w64-x86_64-raylib
````

### Building
1. Clone the repository:
```bash
git clone https://github.com/APConduct/Kup.git --recursive-submodules
cd Kup
````

1. Create build directory and configure:
```bash
cmake -B build -G Ninja \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_BUILD_TYPE=Debug 
````

1. Build the project:
```bash
    cmake --build build
```

For convenience, you can use the provided build script:

```bash
./build.sh
````
#### Development Setup

The project uses C++20 modules and requires a modern IDE with proper support. CLion 2024.3.3 is the recommended IDE for development.

