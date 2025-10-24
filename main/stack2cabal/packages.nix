{ inputs, system, ... }:
let
  inherit (builtins) getFlake;
in
rec {
  stack2cabal-default = stack2cabal-1-0-14;
  stack2cabal-1-0-14 =
    # When https://github.com/hasufell/stack2cabal/issues/50 is fixed, switch this input to github:hasufell/stack2cabal
    (getFlake "github:chris-martin/stack2cabal/8a62f9b28e39acaaf0f0653696789f6d57042fa8")
    .defaultPackage.${system};
}
