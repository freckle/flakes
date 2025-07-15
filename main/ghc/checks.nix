{
  inputs,
  system,
  packages,
  lib,
  ...
}:
let
  nixpkgs = inputs.nixpkgs-24-05.legacyPackages.${system};
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;
  inherit (inputs.nixpkgs-stable.lib) optionalString concatLines;

  ghcCheck =
    {
      packageName,
      ghc,
      weeder ? null,
      hls ? null,
    }:
    testEqualContents {
      assertion = "versions for ${packageName}";
      expected = writeText "expected" (
        concatLines (
          [ "The Glorious Glasgow Haskell Compilation System, version ${ghc}" ]
          ++ (if (weeder != null) then [ "weeder version ${weeder}" ] else [ ])
          ++ (if (hls != null) then [ "haskell-language-server version: ${hls}" ] else [ ])
        )
      );
      actual =
        runCommand "actual"
          {
            nativeBuildInputs = [
              (lib.haskellBundle {
                ghcVersion = packageName;
                enableHLS = hls != null;
              })
            ];
          }
          ''
            touch $out
            ghc --version >> $out
            ${optionalString (weeder != null) ''
              weeder --version | head -n1 >> $out
            ''}
            ${optionalString (hls != null) ''
              haskell-language-server-wrapper --version | head -n1 \
                | sed -re 's#^(haskell-language-server version: [[:digit:]\.]+).*$#\1#' \
                >> $out
            ''}
          '';
    };

in
{
  ghc-9-2-7 = ghcCheck {
    packageName = "ghc-9-2-7";
    ghc = "9.2.7";
    weeder = "2.4.1";
    hls = "1.10.0.0";
  };
  ghc-9-2-8 = ghcCheck {
    packageName = "ghc-9-2-8";
    ghc = "9.2.8";
    weeder = "2.4.1";
    hls = "2.9.0.0";
  };
  ghc-9-4-5 = ghcCheck {
    packageName = "ghc-9-4-5";
    ghc = "9.4.5";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-4-6 = ghcCheck {
    packageName = "ghc-9-4-6";
    ghc = "9.4.6";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-4-7 = ghcCheck {
    packageName = "ghc-9-4-7";
    ghc = "9.4.7";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-4-8 = ghcCheck {
    packageName = "ghc-9-4-8";
    ghc = "9.4.8";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-6-3 = ghcCheck {
    packageName = "ghc-9-6-3";
    ghc = "9.6.3";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-6-4 = ghcCheck {
    packageName = "ghc-9-6-4";
    ghc = "9.6.4";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-6-5 = ghcCheck {
    packageName = "ghc-9-6-5";
    ghc = "9.6.5";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-6-6 = ghcCheck {
    packageName = "ghc-9-6-6";
    ghc = "9.6.6";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-8-1 = ghcCheck {
    packageName = "ghc-9-8-1";
    ghc = "9.8.1";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-8-2 = ghcCheck {
    packageName = "ghc-9-8-2";
    ghc = "9.8.2";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-8-3 = ghcCheck {
    packageName = "ghc-9-8-3";
    ghc = "9.8.3";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-8-4 = ghcCheck {
    packageName = "ghc-9-8-4";
    ghc = "9.8.4";
    weeder = "2.9.0";
    hls = "2.9.0.0";
  };
  ghc-9-10-1 = ghcCheck {
    packageName = "ghc-9-10-1";
    ghc = "9.10.1";
    hls = "2.10.0.0";
  };
  ghc-9-10-2 = ghcCheck {
    packageName = "ghc-9-10-2";
    ghc = "9.10.2";
    hls = "2.11.0.0";
  };
}
