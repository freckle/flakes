{ inputs, system, ... }:
let
  inherit (builtins) getFlake;
  inherit (inputs.nixpkgs-stable.legacyPackages.${system}) symlinkJoin runCommand;
in
rec {
  nodejs-20-x = nodejs-20-19-x;

  nodejs-20-11-x = nodejs-20-11-1;
  nodejs-20-19-x = nodejs-20-19-4;

  nodejs-20-11-0 = (
    let
      nixpkgs = # 2024-01-27
        (getFlake "github:nixos/nixpkgs/160b762eda6d139ac10ae081f8f78d640dd523eb").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_20;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
      pnpm = nixpkgs.nodePackages.pnpm.override { inherit nodejs; };
      pnpm-bin = runCommand "pnpm" { } ''
        mkdir -p "$out/bin"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpm" "$out/bin/pnpm"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpx" "$out/bin/pnpx"
      '';
    in
    symlinkJoin {
      name = "nodejs";
      paths = [
        nodejs
        pnpm
        pnpm-bin
        yarn
      ];
    }
  );

  nodejs-20-11-1 = (
    let
      nixpkgs = # 2024-02-20
        (getFlake "github:nixos/nixpkgs/b98a4e1746acceb92c509bc496ef3d0e5ad8d4aa").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_20;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
      pnpm = nixpkgs.nodePackages.pnpm.override { inherit nodejs; };
      pnpm-bin = runCommand "pnpm" { } ''
        mkdir -p "$out/bin"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpm" "$out/bin/pnpm"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpx" "$out/bin/pnpx"
      '';
    in
    symlinkJoin {
      name = "nodejs";
      paths = [
        nodejs
        pnpm
        pnpm-bin
        yarn
      ];
    }
  );

  nodejs-20-19-4 = (
    let
      nixpkgs = # 2025-08-20
        (getFlake "github:nixos/nixpkgs/a58390ab6f1aa810eb8e0f0fc74230e7cc06de03").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_20;
      yarn = nixpkgs.yarn.override { inherit nodejs; };
      pnpm = nixpkgs.nodePackages.pnpm.override { inherit nodejs; };
      pnpm-bin = runCommand "pnpm" { } ''
        mkdir -p "$out/bin"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpm" "$out/bin/pnpm"
        ln -s "${pnpm}/lib/node_modules/.bin/pnpx" "$out/bin/pnpx"
      '';
    in
    symlinkJoin {
      name = "nodejs";
      paths = [
        nodejs
        pnpm
        pnpm-bin
        yarn
      ];
    }
  );
}
