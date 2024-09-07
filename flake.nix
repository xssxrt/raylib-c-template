{
    description = "C Raylib template";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    };

    outputs = { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            devShells.${system}.default = pkgs.mkShell {
                buildInputs = with pkgs; [ emscripten gcc raylib python3 ];
            };
        };
}
