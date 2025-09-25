{ inputs, system }:

let
  pkgs = inputs.nixpkgs-25-05.legacyPackages.${system};
in
{
  locize-cli-10-3-2 = pkgs.buildNpmPackage (finalAttrs: {
    pname = "locize-cli";
    version = "10.3.2";

    src = pkgs.fetchFromGitHub {
      owner = "locize";
      repo = "locize-cli";
      tag = "v${finalAttrs.version}";
      hash = "sha256-YqElvn/zjNpV/XWef4GE8fdVCGhLGgZa2AgG2HU9NKY=";
    };

    postPatch = ''
      cp ${./package-lock.json} package-lock.json
    '';

    dontNpmBuild = true;

    npmDepsHash = "sha256-zhU/OALGrN7juUBlvNYQfb8Otz7LzT0z55R/JUDFZdU=";
  });
}
