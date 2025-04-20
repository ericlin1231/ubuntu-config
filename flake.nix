{
    description = "Home Manager configuration of eric";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        flake-utils.url = "github:numtide/flake-utils";
        nixvim.url = "github:nix-community/nixvim";
    };

    outputs = {
        nixpkgs,
        home-manager,
        flake-utils,
        nixvim,
        ...
    }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        homeConfigurations.eric = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
                ./home.nix
                nixvim.homeManagerModules.nixvim
            ];
        };
    };
}
