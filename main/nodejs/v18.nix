{ inputs, system, ... }:
let
  inherit
    (import inputs.nixpkgs-stable {
      inherit system;
      config = { };
    })
    symlinkJoin
    runCommand
    ;
in
rec {
  nodejs-18-x = nodejs-18-20-x;

  nodejs-18-17-x = nodejs-18-17-1;
  nodejs-18-18-x = nodejs-18-18-0;
  nodejs-18-19-x = nodejs-18-19-1;
  nodejs-18-20-x = nodejs-18-20-2;

  nodejs-18-17-1 = (
    let
      nixpkgs = import inputs.nixpkgs-master-2023-09-15 {
        inherit system;
        config = { };
      };
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
      nixpkgs = import inputs.nixpkgs-unstable-2023-10-21 {
        inherit system;
        config = { };
      };
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
      nixpkgs = import inputs.nixpkgs-unstable-2024-04-03 {
        inherit system;
        config = { };
      };
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
      nixpkgs = import inputs.nixpkgs-unstable-2024-05-30 {
        inherit system;
        config = { };
      };
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
