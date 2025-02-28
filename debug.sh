#!/bin/bash

# Debug script for quick development and debugging

# Default values
BUILD_TYPE="Debug"
BUILD_DIR="cmake-build-debug"
TARGET="kup"  # Change this to your main executable target

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print usage
print_usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -b, --build       Build only"
    echo "  -r, --run         Build and run"
    echo "  -d, --debug       Build and debug with lldb"
    echo "  -c, --clean       Clean build directory"
    echo "  -t, --test        Run tests"
    echo "  -h, --help        Show this help message"
}

# Function to check if command exists
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}Error: $1 is required but not installed.${NC}"
        exit 1
    fi
}

# Function to build the project
build_project() {
    echo -e "${YELLOW}Building project in $BUILD_TYPE mode...${NC}"

    # Create build directory if it doesn't exist
    mkdir -p $BUILD_DIR

    # Configure and build
    cmake -B $BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
          -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
          -DCMAKE_CXX_FLAGS="-Wall -Wextra -g"

    if [ $? -ne 0 ]; then
        echo -e "${RED}CMake configuration failed${NC}"
        exit 1
    fi

    cmake --build $BUILD_DIR -j $(sysctl -n hw.ncpu)

    if [ $? -ne 0 ]; then
        echo -e "${RED}Build failed${NC}"
        exit 1
    fi

    echo -e "${GREEN}Build successful${NC}"
}

# Function to run the project
run_project() {
    build_project
    echo -e "${YELLOW}Running $TARGET...${NC}"
    #$BUILD_DIR/bin/$TARGET
    $BUILD_DIR/$TARGET

}

# Function to debug the project
debug_project() {
    build_project
    echo -e "${YELLOW}Starting debugger...${NC}"
    lldb $BUILD_DIR/bin/$TARGET
}

# Function to clean build directory
clean_build() {
    echo -e "${YELLOW}Cleaning build directory...${NC}"
    rm -rf $BUILD_DIR
    echo -e "${GREEN}Clean complete${NC}"
}

# Function to run tests
run_tests() {
    build_project
    echo -e "${YELLOW}Running tests...${NC}"
    cd $BUILD_DIR && ctest --output-on-failure
}

# Check for required tools
check_command cmake
check_command lldb

# Parse command line arguments
case "$1" in
    -b|--build)
        build_project
        ;;
    -r|--run)
        run_project
        ;;
    -d|--debug)
        debug_project
        ;;
    -c|--clean)
        clean_build
        ;;
    -t|--test)
        run_tests
        ;;
    -h|--help)
        print_usage
        exit 0
        ;;
    *)
        print_usage
        exit 1
        ;;
esac

exit 0