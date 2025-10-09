{
  inputs,
  system,
  packages,
  ...
}:
let
  inherit (builtins) getFlake;

  versions =
    v0-13
    // v0-14
    // v0-16
    // v0-17
    // {
      fourmolu-default = versions.fourmolu-0-17-x;
    };

  v0-13 =
    let
      nixpkgs = # 2023-07-25
        (getFlake "github:nixos/nixpkgs/6dc93f0daec55ee2f441da385aaf143863e3d671").legacyPackages.${system};
      inherit (nixpkgs) haskell;
      inherit (haskell.lib) justStaticExecutables overrideCabal;
    in
    rec {
      fourmolu-0-13-x = fourmolu-0-13-1;

      fourmolu-0-13-0 =
        justStaticExecutables
          (haskell.packages.ghc96.override {
            overrides = self: super: {
              fourmolu =
                overrideCabal (super.callPackage ./haskell-packages/fourmolu-0.13.0.cabal.nix { })
                  (drv: {
                    doCheck = false;
                  });
            };
          }).fourmolu;

      fourmolu-0-13-1 =
        justStaticExecutables
          (haskell.packages.ghc96.override {
            overrides = self: super: {
              fourmolu =
                overrideCabal (super.callPackage ./haskell-packages/fourmolu-0.13.1.cabal.nix { })
                  (drv: {
                    doCheck = false;
                  });
            };
          }).fourmolu;
    };

  v0-14 =
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      inherit (nixpkgs) haskell;
      inherit (haskell.lib) justStaticExecutables overrideCabal;
    in
    rec {
      fourmolu-0-14-x = fourmolu-0-14-0;

      fourmolu-0-14-0 =
        justStaticExecutables
          (haskell.packages.ghc96.override {
            overrides = self: super: {
              fourmolu =
                overrideCabal (super.callPackage ./haskell-packages/fourmolu-0.14.0.cabal.nix { })
                  (drv: {
                    doCheck = false;
                  });
            };
          }).fourmolu;
    };

  v0-16 =
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      inherit (nixpkgs) haskell;
      inherit (haskell.lib) justStaticExecutables overrideCabal;
    in
    rec {
      fourmolu-0-16-x = fourmolu-0-16-2;

      fourmolu-0-16-2 =
        justStaticExecutables
          (haskell.packages.ghc910.override {
            overrides = self: super: {
              fourmolu =
                overrideCabal (super.callPackage ./haskell-packages/fourmolu-0.16.2.cabal.nix { })
                  (drv: {
                    doCheck = false;
                  });
            };
          }).fourmolu;
    };

  v0-17 =
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
      inherit (nixpkgs) haskell;
      inherit (haskell.lib) justStaticExecutables overrideCabal;
    in
    rec {
      fourmolu-0-17-x = fourmolu-0-17-0;

      fourmolu-0-17-0 =
        justStaticExecutables
          (haskell.packages.ghc910.override {
            overrides = self: super: {
              fourmolu =
                overrideCabal (super.callPackage ./haskell-packages/fourmolu-0.17.0.cabal.nix { })
                  (drv: {
                    doCheck = false;
                  });
            };
          }).fourmolu;
    };

in
versions
