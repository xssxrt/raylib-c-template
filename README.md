# Raylib + C template
## Usage
Click the button that says `Use this template`
Select `Create a new repository`

# Setup
You will need emcc (linux), gcc, and raylib installed.
Download `libraylib.a` and drop it in the root

## Linux
`chmod +x build.sh`
`./build.sh native`

### on NixOS without flakes(wtf?)
run the game with:
`LD_LIBRARY_PATH="$(nix-build '<nixpkgs>' -A wayland)/lib" ./game`

## Windows
If the raylib installer doesn't work you will need to install the OpenCL, OpenGL, Vulkan compatibility pack from the Microsoft store
`build.bat`

## Nix
`nix develop`


## WASM
run the build for wasm i.e `./build.sh wasm`
serve locally with `./serve.sh`
navigate to `localhost:8000/game.html`

