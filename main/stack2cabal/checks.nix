{
  inputs,
  system,
  packages,
  ...
}:
let
  nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  versionCheck =
    version: package:
    testEqualContents {
      assertion = "stack2cabal is version ${version}";
      expected = writeText "expected" (version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        stack2cabal --version > $out
      '';
    };
in
if system == "aarch64-darwin" then
  # https://github.com/hasufell/stack2cabal/issues/50
  { }
else
  {
    stack2cabal-1-0-14 = versionCheck "1.0.14" packages.stack2cabal-1-0-14;
  }
