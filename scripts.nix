{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "ns" ''
      nix shell nixpkgs#1 -c $@
    '')
  ];
}
