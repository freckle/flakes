{ inputs, system, ... }:
let
  makeCypress =
    { version, sha256 }:
    let
      nixpkgs = inputs.nixpkgs-24-11.legacyPackages.${system};
    in
    nixpkgs.cypress.overrideAttrs (oldAttrs: rec {
      pname = "cypress";
      inherit version;

      src = nixpkgs.fetchzip {
        url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
        inherit sha256;
      };
    });
in
rec {
  cypress-default = cypress-13-x;

  cypress-13-x = cypress-13-13-x;

  cypress-13-2-x = cypress-13-2-0;
  cypress-13-2-0 = makeCypress {
    version = "13.2.0";
    sha256 = "147wgfdfflxsrl30ckwrwsd93q67yj8afv1p5n8dbgi8arj3d3d5";
  };

  cypress-13-6-x = cypress-13-6-4;
  cypress-13-6-4 = makeCypress {
    version = "13.6.4";
    sha256 = "0hafpd98y9ji9kw6rsbb7ss482c306y2mfb9x4yvf7nhlk4blnw0";
  };

  cypress-13-13-x = cypress-13-13-3;
  cypress-13-13-3 = makeCypress {
    version = "13.13.3";
    sha256 = "sha256-3Imr4KA4n47Ja9W4Wwl9UfSler3O2W5eJ6nxrHItuxE=";
  };
}
