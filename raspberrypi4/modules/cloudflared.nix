{ systemd ... }:

{
  systemd.services.cloudflared = {
    description = "cloudflared";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      TimeoutStartSec = 15;
      Type = "notify";
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared --no-autoupdate tunnel run --token eyJhIjo...";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
