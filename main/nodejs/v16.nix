{ inputs, system, ... }:
let
  inherit (builtins) getFlake;
  inherit (inputs.nixpkgs-24-11.legacyPackages.${system}) symlinkJoin runCommand;
in
rec {
  nodejs-16-x = nodejs-16-20-x;
  nodejs-16-20-x = nodejs-16-20-2;

  nodejs-16-20-0 = (
    let
      nixpkgs = # 2023-05-06
        (getFlake "github:nixos/nixpkgs/16b3b0c53b1ee8936739f8c588544e7fcec3fc60").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_16;
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

  nodejs-16-20-1 = (
    let
      nixpkgs = # 2023-07-18
        (getFlake "github:nixos/nixpkgs/08700de174bc6235043cb4263b643b721d936bdb").legacyPackages.${system};
      nodejs = nixpkgs.nodejs_16;
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

  nodejs-16-20-2 = (
    let
      nixpkgs = inputs.nixpkgs-23-05.legacyPackages.${system};
      nodejs = nixpkgs.nodejs_16;
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
