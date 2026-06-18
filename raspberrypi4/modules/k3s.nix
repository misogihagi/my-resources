{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.k3s = {
    enable = lib.mkDefault true;
    role = lib.mkDefault "server";
  };

  # Enable cgroups for K3s on Raspberry Pi 4
  boot.kernelParams = lib.mkIf config.services.k3s.enable [
    "cgroup_enable=cpuset"
    "cgroup_enable=memory"
    "cgroup_memory=1"
  ];

  # Load required kernel modules for K3s networking
  boot.kernelModules = lib.mkIf config.services.k3s.enable [
    "br_netfilter"
    "overlay"
    "ip_conntrack"
    "ip_vs"
    "ip_vs_rr"
    "ip_vs_wrr"
    "ip_vs_sh"
  ];

  # Set sysctl parameters for bridge networking
  boot.kernel.sysctl = lib.mkIf config.services.k3s.enable {
    "net.bridge.bridge-nf-call-iptables" = 1;
    "net.bridge.bridge-nf-call-ip6tables" = 1;
    "net.ipv4.ip_forward" = 1;
  };

  # Open standard firewall ports for K3s
  networking.firewall = lib.mkIf config.services.k3s.enable {
    allowedTCPPorts = [
      6443 # k3s API server
    ];
    allowedUDPPorts = [
      8472 # flannel VXLAN
    ];
  };

  # Install common Kubernetes tools along with K3s
  environment.systemPackages = lib.mkIf config.services.k3s.enable (
    with pkgs;
    [
      k3s
      kubectl
      kubernetes-helm
    ]
  );
}
