{
  description = "Nix development environment of SoC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
  {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
  flake-utils.lib.eachDefaultSystem (
    system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          circt
          nextpnr
          openfpgaloader
          sbt
          scalafmt
          sdl3
          trellis
          verilator
          yosys
        ];
        shellHook = ''
          export CHISEL_FIRTOOL_PATH=${pkgs.circt.outPath}/bin
        '';
      };
    }
  );
}
