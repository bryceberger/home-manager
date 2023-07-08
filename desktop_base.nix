{ pkgs, ... }:
{
  imports = [
    ./kitty.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

    # standalone
    firefox

    # sound
    pavucontrol
    playerctl
  ];
}
