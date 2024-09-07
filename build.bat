@echo off
set RAYLIB_INCLUDE_DIR=C:\raylib\src
set RAYLIB_LIB_DIR=C:\raylib\lib
set COMPILER_FLAGS=-std=c99 -Wall -Wextra -Werror -O2
set LINKER_FLAGS=-lraylib -lopengl32 -lgdi32 -lwinmm
set OUTPUT_NAME=game
set SRC=src\main.c
 
 
if "%1"=="clean" (
  if exist %OUTPUT_NAME%.exe del %OUTPUT_NAME%.exe
) else (
  gcc %COMPILER_FLAGS% -I%RAYLIB_INCLUDE_DIR% -L%RAYLIB_LIB_DIR% %SRC% -o %OUTPUT_NAME% %LINKER_FLAGS%
)

