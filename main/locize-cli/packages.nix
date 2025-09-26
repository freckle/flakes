{ inputs, system, ... }:
let
  locize-cli-packages =
    (import ./10.3.2 { inherit inputs system; })
    // (with locize-cli-packages; {
      locize-cli-default = locize-cli-10-x;
      locize-cli-10-x = locize-cli-10-3-x;
      locize-cli-10-3-x = locize-cli-10-3-2;
    });
in
locize-cli-packages
