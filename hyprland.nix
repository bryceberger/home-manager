{ pkgs, hyprland, ... }:
{
  imports = [
    ./wayland_base.nix
    ./hyprland/waybar.nix
  ];

  nixpkgs.overlays = [ hyprland.overlays.default ];

  home.packages = with pkgs; [
    hyprpaper
    (writeShellScriptBin "screenshot.sh" ''
      ${grim}/bin/grim -g "$(${slurp}/bin/slurp)" - | ${wl-clipboard}/bin/wl-copy
    '')
  ];

  # TODO: migrate hyprland config
}
