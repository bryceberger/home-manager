{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "mount_kindle" ''
      mount $1 $2 -o umask=0022,gid=100,uid=1000
    '')
    (writeShellScriptBin "nix-check-cache" ''
      set -e
      paths=$(nix path-info --recursive $1)
      xargs nix path-info --store https://cache.nixos.org/ >/dev/null <<<$paths
    '')
  ];
}
