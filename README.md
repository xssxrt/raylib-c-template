# Setup
You will need emcc, gcc, and raylib installed.
Download `libraylib.a` and drop it in the root

## Linux
`chmod +x build.sh`
`./build.sh native`

### on NixOS without flakes(wtf?)
you may run into issues when running the game
run the game with:
`LD_LIBRARY_PATH="$(nix-build '<nixpkgs>' -A wayland)/lib" ./game`

## Windows
`build.bat native`

## Nix
`nix develop`


## WASM
run the build for wasm i.e `./build.sh wasm`
serve locally with `python3 -m http.server`
navigate to `localhost:8000/game.html`

