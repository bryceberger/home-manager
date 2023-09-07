{ config, pkgs, ... }:
{
  imports = [
    ./wayland_base.nix
    ./hyprland/waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      misc = {
        disable_hyprland_logo = true;
      };
    }
    // import ./hyprland/decoration.nix { }
    // import ./hyprland/input.nix { }
    // import ./hyprland/keybinds.nix { inherit pkgs; }
    // import ./hyprland/monitors.nix { }
    // import ./hyprland/themes/mocha.nix { }
    // import ./hyprland/window_rules.nix { }
    ;

    extraConfig = with pkgs; ''
      exec-once = ${writeShellScriptBin "hyprland-autostart" ''
        ${
          (import ./hyprland/waybar.nix { inherit config pkgs; })
            .programs.waybar.package
        }/bin/waybar &
        ${hyprpaper}/bin/hyprpaper &
        ${hyprland}/bin/hyprctl setcursor Catppuccin-Mocha-Light-Cursors 24
        ${swayidle}/bin/swayidle &
      ''}/bin/hyprland-autostart

      bind   = CTRLSHIFT, escape, submap, clean
      submap = clear
      bind   =          , escape, submap, reset
      submap = reset
    '';
  };

  xdg.configFile =
    let
      wallpaperFile = ./hyprland/wallpapers/blank.png;
    in
    {
      "hypr/hyprpaper.conf".text = ''
        preload   =   ${wallpaperFile}
        wallpaper = , ${wallpaperFile}
      '';
    };

  home.packages = with pkgs; [
    hyprpaper
    (writeShellScriptBin "screenshot" ''
      ${grim}/bin/grim -g "$(${slurp}/bin/slurp)" - | ${wl-clipboard}/bin/wl-copy
    '')
  ];
}
