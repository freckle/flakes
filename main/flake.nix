{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    haskell-openapi-code-generator.url = "github:Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator";
    nix-github-actions.inputs.nixpkgs.follows = "nixpkgs-stable";
    nix-github-actions.url = "github:nix-community/nix-github-actions";
    nixpkgs-22-11.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-23-05.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-23-11.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-24-05.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-haskell-updates.url = "github:nixos/nixpkgs/haskell-updates";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
  };
  outputs =
    inputs:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    (inputs.flake-utils.lib.eachSystem systems (system: rec {
      packages = import ./packages.nix { inherit inputs system; };
      lib = import ./lib.nix { inherit inputs system packages; };
      checks = import ./checks.nix {
        inherit
          inputs
          system
          packages
          lib
          ;
      };
    }))
    // {
      nixosModules = import ./nixos-modules.nix { inherit inputs; };
      githubActions = inputs.nix-github-actions.lib.mkGithubMatrix {
        checks = inputs.nixpkgs-stable.lib.getAttrs systems inputs.self.checks;
        platforms = {
          "x86_64-linux" = "ubuntu-22.04";
          "x86_64-darwin" = "macos-13";
          "aarch64-darwin" = "macos-14";
        };
      };
    };
  nixConfig = {
    extra-substituters = [ "https://freckle.cachix.org" ];
    extra-trusted-public-keys = [ "freckle.cachix.org-1:WnI1pZdwLf2vnP9Fx7OGbVSREqqi4HM2OhNjYmZ7odo=" ];
  };
}
