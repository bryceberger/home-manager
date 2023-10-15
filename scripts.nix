{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "ns" ''
      nix shell nixpkgs#1 -c $@
    '')
    (writeShellScriptBin "mount_kindle" ''
      mount $1 $2 -o umask=0022,gid=100,uid=1000
    '')
  ];
}
