#include "raylib.h"

int main(void) {
    // Initialize the window
    const int screenWidth = 800;
    const int screenHeight = 600;
    InitWindow(screenWidth, screenHeight, "GAME");

    // Main game loop
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("LET YOU CUT ME OPEN JUST TO WATCH ME BLEED", 120, 290, 20, RED);
        EndDrawing();
    }

    // Cleanup
    CloseWindow();

    return 0;
}

