{pkgs, ...}: {
  imports = [
    ./common.nix
    ./devel.nix
    ./fish.nix
    ./git.nix
    ./gpg.nix
    ./helix.nix
    ./hyprland.nix
    ./kitty.nix
    ./sway.nix
    ./scripts.nix
    ./utils.nix
  ];

  home.username = "bryce";
  home.homeDirectory = "/home/bryce";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    calibre
    citra-nightly
    libnotify
    waypipe
    yuzu
  ];
}
