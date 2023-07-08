{ pkgs, ... }:
{
  home.packages = with pkgs; [
    du-dust
    bat
    btop
    killall
    jq
  ];
}
