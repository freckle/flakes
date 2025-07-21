{ inputs, system }:
let
  inherit (builtins) getFlake;

  inherit (inputs.nixpkgs-stable.legacyPackages.${system}) symlinkJoin;

  addPatches = patches: prev: { patches = (prev.patches or [ ]) ++ patches; };

  ghcOverlay =
    ghcVersion: override: final: prev:
    prev
    // {
      haskell = prev.haskell // {
        compiler = prev.haskell.compiler // {
          ${ghcVersion} = prev.haskell.compiler.${ghcVersion}.overrideAttrs override;
        };
      };
    };
in
{
  ghc-9-2-7 =
    { packageSelection, enableHLS }:
    let
      overlays = [
        (ghcOverlay "ghc927" (addPatches [ ./sanity-check-find-file-name.patch ]))
      ];
      nixpkgs = # 2023-07-25
        (getFlake "github:nixos/nixpkgs/6dc93f0daec55ee2f441da385aaf143863e3d671")
        .legacyPackages.${system}.appendOverlays
          overlays;
      name = "ghc927";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "927" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-2-8 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      name = "ghc928";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "928" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-5 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      name = "ghc945";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "945" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-6 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      name = "ghc946";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "946" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-7 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc947";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "947" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-4-8 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc948";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "948" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-3 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc963";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "963" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-4 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc964";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "964" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-5 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc965";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "965" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-6-6 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc966";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "966" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-8-1 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc981";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "981" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-8-2 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc982";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "982" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-8-3 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc983";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "983" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-8-4 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc984";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "984" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system}; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        weeder
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-10-1 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
      name = "ghc9101";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "9101" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };

  ghc-9-10-2 =
    { packageSelection, enableHLS }:
    let
      nixpkgs = inputs.nixpkgs-haskell-updates.legacyPackages.${system};
      name = "ghc9102";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      hls = nixpkgs.haskell-language-server.override { supportedGhcVersions = [ "9102" ]; };
      cabal = nixpkgs.cabal-install;
      stack = import ./stack.nix { inherit nixpkgs; };
    in
    symlinkJoin {
      inherit name;
      paths = [
        ghcWithPackages
        cabal
        stack
      ] ++ (if enableHLS then [ hls ] else [ ]);
    };
}
