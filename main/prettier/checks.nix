{
  inputs,
  system,
  packages,
  ...
}:
let
  nixpkgs = inputs.nixpkgs-24-05.legacyPackages.${system};
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  versionCheck =
    version: package:
    testEqualContents {
      assertion = "prettier is version ${version}";
      expected = writeText "expected" (version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        prettier --version > $out
      '';
    };
in
{
  prettier-2-8-8 = versionCheck "2.8.8" packages.prettier-2-8-8;
  prettier-3-0-3 = versionCheck "3.0.3" packages.prettier-3-0-3;
  prettier-3-2-5 = versionCheck "3.2.5" packages.prettier-3-2-5;
}
