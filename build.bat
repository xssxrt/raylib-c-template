@echo off
set CC=gcc
set EMCC=emcc
set CFLAGS=-Wall -std=c99
set LIBS=-lraylib -lm -lpthread -ldl -lrt -lX11
set SRC=src\main.c
set OUT_NATIVE=game.exe
set OUT_WASM=game.html

REM Function to build native version
:build_native
echo Building native...
%CC% %CFLAGS% %SRC% %LIBS% -o %OUT_NATIVE%
if %ERRORLEVEL% equ 0 (
    echo Native build successful: %OUT_NATIVE%
) else (
    echo Native build failed
    exit /b 1
)
goto :eof

REM Function to build WebAssembly version
:build_wasm
echo Building WebAssembly...
%EMCC% %SRC% -o %OUT_WASM% ^
    -s USE_GLFW=3 ^
    -s FULL_ES2=1 ^
    -s ASYNCIFY ^
    -s WASM=1 ^
    --preload-file .
if %ERRORLEVEL% equ 0 (
    echo WebAssembly build successful: %OUT_WASM%
) else (
    echo WebAssembly build failed
    exit /b 1
)
goto :eof

REM Function to clean the build files
:clean
echo Cleaning build files...
del /f /q %OUT_NATIVE% %OUT_WASM% *.wasm *.js *.data
echo Clean complete
goto :eof

REM Parse command-line arguments
if "%1"=="native" goto build_native
if "%1"=="wasm" goto build_wasm
if "%1"=="clean" goto clean

echo Usage: build.bat {native|wasm|clean}
exit /b 1

