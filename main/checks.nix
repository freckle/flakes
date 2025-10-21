{
  inputs,
  packages,
  system,
  lib,
}:
let
  nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
  flattenAttrs = nixpkgs.lib.lists.foldl' (a: b: a // b) { };
  files = [
    ./aws-cli/checks.nix
    ./cypress/checks.nix
    ./fourmolu/checks.nix
    ./ghc/checks.nix
    ./haskell-openapi3-code-generator/checks.nix
    ./locize-cli/checks.nix
    ./nodejs/checks.nix
    ./prettier/checks.nix
    ./stack-lint-extra-deps/checks.nix
    ./stack2cabal/checks.nix
  ];
in
flattenAttrs (
  nixpkgs.lib.lists.map (
    file:
    import file {
      inherit
        inputs
        packages
        lib
        system
        ;
    }
  ) files
)
