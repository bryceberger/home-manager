{ pkgs, ... }:
{
  imports = [
    ./wayland_base/theme.nix
    ./desktop_base.nix
  ];

  home.packages = with pkgs; [
    fuzzel
    grim
    slurp
    swayidle
    wayland
    wl-clipboard
    swaynotificationcenter

    (writeShellScriptBin "lock" ''
      ${pkgs.swaylock-effects}/bin/swaylock --grace 1 --fade-in 1 -S --clock --font "Fira Code" --effect-blur 5x5 --effect-pixelate 10
    '')
  ];

  programs.swaylock = {
    settings = {
      color = "000000";
    };
  };
}
