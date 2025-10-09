{
  inputs,
  packages,
  system,
}:
let
  nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
  flattenAttrs = nixpkgs.lib.lists.foldl' (a: b: a // b) { };
  files = [ ./ghc/lib.nix ];
in
flattenAttrs (nixpkgs.lib.lists.map (file: import file { inherit inputs packages system; }) files)
