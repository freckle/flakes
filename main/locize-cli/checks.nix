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
      assertion = "locize-cli is version ${version}";
      expected = writeText "expected" (version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        locize --version > $out
      '';
    };
in
{
  locize-cli-10-3-2 = versionCheck "10.3.2" packages.locize-cli-10-3-2;
}
