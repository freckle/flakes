{ inputs, system, packages, lib, ... }:
let
  nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
  inherit (nixpkgs) writeText runCommand;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
  inherit (nixpkgs.testers) testEqualContents;

  ghcCheck = { packageName, ghc, weeder, hls }: testEqualContents {
    assertion = "versions for ${packageName}";
    expected = writeText "expected" ''
      The Glorious Glasgow Haskell Compilation System, version ${ghc}
      weeder version ${weeder}
      haskell-language-server version: ${hls}
    '';
    actual = runCommand "actual"
      {
        nativeBuildInputs = [
          (lib.haskellBundle {
            ghcVersion = packageName;
            enableHLS = true;
          })
        ];
      } ''
      touch $out
      ghc --version >> $out
      weeder --version | head -n1 >> $out
      haskell-language-server-wrapper --version | head -n1 \
        | sed -re 's#^(haskell-language-server version: [[:digit:]\.]+).*$#\1#' \
        >> $out
    '';
  };

in
{
  ghc-9-2-7 = ghcCheck { packageName = "ghc-9-2-7"; ghc = "9.2.7"; weeder = "2.4.1"; hls = "1.10.0.0"; };
  ghc-9-2-8 = ghcCheck { packageName = "ghc-9-2-8"; ghc = "9.2.8"; weeder = "2.4.1"; hls = "2.4.0.0"; };
  ghc-9-4-5 = ghcCheck { packageName = "ghc-9-4-5"; ghc = "9.4.5"; weeder = "2.7.0"; hls = "2.4.0.0"; };
  ghc-9-4-6 = ghcCheck { packageName = "ghc-9-4-6"; ghc = "9.4.6"; weeder = "2.7.0"; hls = "2.4.0.0"; };
  ghc-9-4-7 = ghcCheck { packageName = "ghc-9-4-7"; ghc = "9.4.7"; weeder = "2.7.0"; hls = "2.4.0.0"; };
  ghc-9-4-8 = ghcCheck { packageName = "ghc-9-4-8"; ghc = "9.4.8"; weeder = "2.7.0"; hls = "2.4.0.0"; };
  ghc-9-6-3 = ghcCheck { packageName = "ghc-9-6-3"; ghc = "9.6.3"; weeder = "2.8.0"; hls = "2.8.0.0"; };
  ghc-9-6-4 = ghcCheck { packageName = "ghc-9-6-4"; ghc = "9.6.4"; weeder = "2.8.0"; hls = "2.8.0.0"; };
  ghc-9-6-5 = ghcCheck { packageName = "ghc-9-6-5"; ghc = "9.6.5"; weeder = "2.8.0"; hls = "2.8.0.0"; };
}
