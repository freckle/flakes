{ inputs, system, ... }:
let
  inherit (builtins) getFlake;
  inherit (inputs.nixpkgs-25-05.legacyPackages.${system}) symlinkJoin runCommand;
in
rec {
  nodejs-18-x = nodejs-18-20-x;

  nodejs-18-17-x = nodejs-18-17-1;
  nodejs-18-18-x = nodejs-18-18-0;
  nodejs-18-19-x = nodejs-18-19-1;
  nodejs-18-20-x = nodejs-18-20-2;

  nodejs-18-17-1 = (
    let
      nixpkgs = # 2023-09-15
        (getFlake "github:nixos/nixpkgs/46688f8eb5cd6f1298d873d4d2b9cf245e09e88e").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_18;
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

  nodejs-18-18-0 = (
    let
      nixpkgs = # 2023-10-21
        (getFlake "github:nixos/nixpkgs/038b2922be3fc096e1d456f93f7d0f4090628729").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_18;
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

  nodejs-18-19-1 = (
    let
      nixpkgs = # 2024-04-03
        (getFlake "github:nixos/nixpkgs/62e885a4013446453b10fd7780eba4337f6f42e0").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_18;
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

  nodejs-18-20-2 = (
    let
      nixpkgs = # 2024-05-30
        (getFlake "github:nixos/nixpkgs/aa61b27554a5fc282758bf0324781e3464ef2cde").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_18;
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
