{ inputs, system, ... }:
let
  inherit (builtins) getFlake;
in
rec {
  stack2cabal-default = stack2cabal-1-0-14;
  stack2cabal-1-0-14 =
    (getFlake "github:hasufell/stack2cabal/724dc9f478dac1208a607b9e4d2bc37b7a38e126")
    .defaultPackage.${system};
}
