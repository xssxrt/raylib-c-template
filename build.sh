#!/usr/bin/env bash

# Compiler and build flags
CC=gcc
EMCC=emcc
CFLAGS="-Wall -std=c99"
LIBS="-lraylib -lm -lpthread -ldl -lrt -lX11"

# Source files
SRC="src/main.c"
SHELL_FILE="index.html"

# Output
OUT_NATIVE="game"
OUT_WASM="game.html"

# Function to build native version
build_native() {
    echo "Building native..."
    $CC $CFLAGS $SRC $LIBS -o $OUT_NATIVE
    if [ $? -eq 0 ]; then
        echo "Native build successful: ./$OUT_NATIVE"
    else
        echo "Native build failed"
        exit 1
    fi
}

# Function to build WebAssembly version
build_wasm() {
    echo "Building WebAssembly..."
    $EMCC -O3 $SRC -o $OUT_WASM -lglfw3 -lembind \
        -s FULL_ES2=1 \
        -s WASM=1 \
        -s USE_GLFW=3 \
        -s ASYNCIFY \
        -L. \
        -lraylib \
        -sGL_ENABLE_GET_PROC_ADDRESS \
        -sASSERTIONS=0 \
        -sMINIFY_HTML=0 \
        -sENVIRONMENT=web \
        -sNO_EXIT_RUNTIME=1 \
        --shell-file $SHELL_FILE \
        --preload-file .
    if [ $? -eq 0 ]; then
        echo "WebAssembly build successful: ./$OUT_WASM"
    else
        echo "WebAssembly build failed"
        exit 1
    fi
}

# Function to clean the build files
clean() {
    echo "Cleaning build files..."
    rm -f $OUT_NATIVE $OUT_WASM *.wasm *.js *.data
    echo "Clean complete"
}

# Parse command-line arguments
case "$1" in
    native)
        build_native
        ;;
    wasm)
        build_wasm
        ;;
    clean)
        clean
        ;;
    *)
        echo "Usage: $0 {native|wasm|clean}"
        exit 1
        ;;
esac

