{ inputs }:
{
  docker-for-local-dev =
    { config, ... }:
    let
      pkgs = import inputs.nixpkgs-24-05 { inherit (config.nixpkgs) system; };
    in
    {
      # Enable Docker
      virtualisation.docker.enable = true;

      # Allow Docker to see the host
      networking.firewall.allowedTCPPorts = [ 3000 ];

      # Pretend that localhost.com is a domain that points to our own machine
      networking.extraHosts = ''
        127.0.0.1 localhost.com
        127.0.0.1 api.localhost.com
        127.0.0.1 assets.localhost.com
        127.0.0.1 classroom.localhost.com
        127.0.0.1 school.localhost.com
        127.0.0.1 student.localhost.com
        127.0.0.1 console.localhost.com
        127.0.0.1 faktory.localhost.com
        127.0.0.1 tts.localhost.com
        127.0.0.1 sso.localhost.com
      '';

      virtualisation.docker.package = pkgs.docker;
    };

  renaissance-vpn =
    { pkgs, ... }:
    {
      services.globalprotect.enable = true;
      environment.systemPackages = [ pkgs.globalprotect-openconnect ];
    };
}
