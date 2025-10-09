{
  inputs,
  system,
  packages,
  ...
}:
{
  "x86_64-linux" =
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      inherit (nixpkgs) writeText runCommand;
      inherit (nixpkgs.lib.attrsets) recursiveUpdate;
      inherit (nixpkgs.testers) testEqualContents;

      versionCheck =
        version: package:
        testEqualContents {
          assertion = "cypress is version ${version}";
          expected = writeText "expected" ("{\"version\":\"" + version + "\"}");
          actual = "${package}/bin/resources/app/package.json";
        };
    in
    {
      cypress-13-2-0 = versionCheck "13.2.0" packages.cypress-13-2-0;
      cypress-13-6-4 = versionCheck "13.6.4" packages.cypress-13-6-4;
      cypress-13-13-3 = versionCheck "13.13.3" packages.cypress-13-13-3;
    };
}
.${system} or { }
