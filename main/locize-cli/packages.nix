{ inputs, system, ... }:
let
  locize-cli-packages =
    (import ./8.0.1 { inherit inputs system; })
    // (import ./10.3.2 { inherit inputs system; })
    // (with locize-cli-packages; {
      locize-cli-default = locize-cli-10-x;
      locize-cli-8-x = locize-cli-8-0-x;
      locize-cli-8-0-x = locize-cli-8-0-1;
      locize-cli-10-x = locize-cli-10-3-x;
      locize-cli-10-3-x = locize-cli-10-3-2;
    });
in
locize-cli-packages
