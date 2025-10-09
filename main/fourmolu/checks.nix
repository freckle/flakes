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
    version: fourmolu:
    testEqualContents {
      assertion = "fourmolu is version ${version}";
      expected = writeText "expected" ("fourmolu " + version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ fourmolu ]; } ''
        fourmolu --version \
          | head -n1 \
          | sed -re 's/^(fourmolu [[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)\.?.*$/\1/' \
          > $out
      '';
    };
in
{
  fourmolu-0-13-0 = versionCheck "0.13.0" packages.fourmolu-0-13-0;
  fourmolu-0-13-1 = versionCheck "0.13.1" packages.fourmolu-0-13-1;
  fourmolu-0-14-0 = versionCheck "0.14.0" packages.fourmolu-0-14-0;
  fourmolu-0-16-2 = versionCheck "0.16.2" packages.fourmolu-0-16-2;
  fourmolu-0-17-0 = versionCheck "0.17.0" packages.fourmolu-0-17-0;
}
