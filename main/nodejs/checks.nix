{
  inputs,
  packages,
  system,
  ...
}:
let
  nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  nodeCheck =
    {
      packageName,
      node,
      yarn,
      pnpm,
    }:
    testEqualContents {
      assertion = "versions for ${packageName}";
      expected = writeText "expected" ''
        node v${node}
        yarn ${yarn}
        pnpm ${pnpm}
      '';
      actual = runCommand "actual" { nativeBuildInputs = [ packages.${packageName} ]; } ''
        touch $out

        echo -n "node " >> $out
        node --version >> $out

        echo -n "yarn " >> $out
        yarn --version >> $out

        echo -n "pnpm " >> $out
        pnpm --version >> $out
      '';
    };

  checkYarnVersion =
    version: package:
    testEqualContents {
      assertion = "yarn is version ${version}";
      expected = writeText "expected" (version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } "yarn --version > $out";
    };

  checkPnpmVersion =
    version: package:
    testEqualContents {
      assertion = "pnpm is version ${version}";
      expected = writeText "expected" (version + "\n");
      actual = runCommand "actual" { nativeBuildInputs = [ package ]; } "";
    };

in
{
  nodejs-16-20-0 = nodeCheck {
    packageName = "nodejs-16-20-0";
    node = "16.20.0";
    yarn = "1.22.19";
    pnpm = "8.4.0";
  };
  nodejs-16-20-1 = nodeCheck {
    packageName = "nodejs-16-20-1";
    node = "16.20.1";
    yarn = "1.22.19";
    pnpm = "8.5.1";
  };
  nodejs-16-20-2 = nodeCheck {
    packageName = "nodejs-16-20-2";
    node = "16.20.2";
    yarn = "1.22.19";
    pnpm = "8.5.1";
  };
  nodejs-18-17-1 = nodeCheck {
    packageName = "nodejs-18-17-1";
    node = "18.17.1";
    yarn = "1.22.19";
    pnpm = "8.6.12";
  };
  nodejs-18-18-0 = nodeCheck {
    packageName = "nodejs-18-18-0";
    node = "18.18.0";
    yarn = "1.22.19";
    pnpm = "8.8.0";
  };
  nodejs-18-19-1 = nodeCheck {
    packageName = "nodejs-18-19-1";
    node = "18.19.1";
    yarn = "1.22.22";
    pnpm = "8.15.5";
  };
  nodejs-18-20-2 = nodeCheck {
    packageName = "nodejs-18-20-2";
    node = "18.20.2";
    yarn = "1.22.22";
    pnpm = "8.15.5";
  };
  nodejs-20-11-0 = nodeCheck {
    packageName = "nodejs-20-11-0";
    node = "20.11.0";
    yarn = "1.22.19";
    pnpm = "8.14.0";
  };
  nodejs-20-11-1 = nodeCheck {
    packageName = "nodejs-20-11-1";
    node = "20.11.1";
    yarn = "1.22.19";
    pnpm = "8.15.1";
  };
  nodejs-20-19-4 = nodeCheck {
    packageName = "nodejs-20-19-4";
    node = "20.19.4";
    yarn = "1.22.22";
    pnpm = "10.14.0";
  };
}
