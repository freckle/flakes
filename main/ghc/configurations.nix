{ inputs, system }:
let
  inherit (import inputs.nixpkgs-stable { inherit system; config = { }; }) symlinkJoin;
in
{
  ghc-9-2-7 = { packageSelection }:
    let
      nixpkgs = import inputs.nixpkgs-stable-2023-07-25 { inherit system; config = { }; };
      name = "ghc927";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghcWithPackages weeder ]; };

  ghc-9-2-8 = { packageSelection }:
    let
      nixpkgs = import inputs.nixpkgs-unstable-2023-10-21 { inherit system; config = { }; };
      name = "ghc928";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghcWithPackages weeder ]; };

  ghc-9-4-6 = { packageSelection }:
    let
      nixpkgs = import inputs.nixpkgs-23-05 { inherit system; config = { }; };
      name = "ghc946";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghcWithPackages weeder ]; };

  ghc-9-4-7 = { packageSelection }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc947";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghcWithPackages weeder ]; };

  ghc-9-4-8 = { packageSelection }:
    let
      nixpkgs = import inputs.nixpkgs-stable { inherit system; config = { }; };
      name = "ghc948";
      inherit (nixpkgs) haskell;
      haskellPackages = haskell.packages.${name};
      ghcWithPackages = haskellPackages.ghcWithPackages packageSelection;
      inherit (haskell.lib) justStaticExecutables;
      weeder = justStaticExecutables haskellPackages.weeder;
    in
    symlinkJoin { inherit name; paths = [ ghcWithPackages weeder ]; };
}
