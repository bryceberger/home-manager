{ pkgs, hyprland, ... }:
{
  imports = [
    ./wayland_base.nix
    ./hyprland/waybar.nix
  ];

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   extraConfig = ''
  #     source = ~/.config/hypr/default.conf

  #     general {
  #       border_size = 2
  #       gaps_in = 0
  #       gaps_out = 0
  #       col.inactive_border = $mantle
  #     }

  #     dwindle {
  #       no_gaps_when_only = true
  #     }
  #   '';
  # };
  nixpkgs.overlays = [ hyprland.overlays.default ];

  home.packages = with pkgs; [
    hyprpaper
  ];

  # TODO: migrate hyprland config
}
