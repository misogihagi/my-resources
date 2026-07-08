{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.cloudflared
  ];

  services.cloudflared = {
    enable = true;
    
    tunnels = {
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "/var/lib/cloudflare/tunnel-token"; 
        default = "http_status:404";
      };
    };
  };
}