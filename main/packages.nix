{ inputs, system }:
let
  nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
  flattenAttrs = nixpkgs.lib.lists.foldl' (a: b: a // b) { };
  files = [
    ./aws-cli/packages.nix
    ./cypress/packages.nix
    ./fourmolu/packages.nix
    ./ghc/packages.nix
    ./haskell-openapi3-code-generator/packages.nix
    ./locize-cli/packages.nix
    ./nodejs/packages.nix
    ./prettier/packages.nix
    ./stack-lint-extra-deps/packages.nix
  ];
  packages = flattenAttrs (
    nixpkgs.lib.lists.map (file: import file { inherit inputs packages system; }) files
  );
in
packages
