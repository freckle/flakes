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
      assertion = "aws-cli is version ${version}";
      expected = writeText "expected" ("aws-cli/" + version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } ''
        aws --version \
          | sed -re 's#^(aws-cli/[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+) .*$#\1#' \
          > $out
      '';
    };
in
{
  aws-cli-2-11-20 = versionCheck "2.11.20" packages.aws-cli-2-11-20;
  aws-cli-2-13-33 = versionCheck "2.13.33" packages.aws-cli-2-13-33;
  aws-cli-2-15-43 = versionCheck "2.15.43" packages.aws-cli-2-15-43;
}
