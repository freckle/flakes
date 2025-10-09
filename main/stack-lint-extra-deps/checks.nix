{
  inputs,
  system,
  packages,
  ...
}:
let
  nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  versionCheck =
    version: package:
    testEqualContents {
      assertion = "stack-lint-extra-deps is version ${version}";
      expected = writeText "expected" ("stack-lint-extra-deps-" + version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        stack-lint-extra-deps --version > $out
      '';
    };
in
{
  stack-lint-extra-deps-1-2-2 = versionCheck "1.2.2.1" packages.stack-lint-extra-deps-1-2-2;
  stack-lint-extra-deps-1-2-5 = versionCheck "1.2.5.0" packages.stack-lint-extra-deps-1-2-5;

  # Version number gets weird at this point because it isn't in the source repo anymore
  stack-lint-extra-deps-1-3-0 = versionCheck "1.0.0.0" packages.stack-lint-extra-deps-1-3-0;
}
