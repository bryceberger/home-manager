{ pkgs }:
{
  bind = with pkgs; [
    "SUPER     , M     , exit, "
    "SUPER     , Escape, exec, lock"
    "SUPERSHIFT, S     , exec, screenshot"
  ]
  # movement
  ++ builtins.concatLists (
    map
      (x: [
        ("CTRL," + x + ",workspace," + x)
        ("CTRLSHIFT," + x + ",movetoworkspace," + x)
      ]) [ "1" "2" "3" "4" "5" "6" "7" "8" "9" ]
  )
  ++ [
    "CTRL     , Q     , killactive     , "
    "SUPER    , left  , movefocus      , l"
    "SUPER    , right , movefocus      , r"
    "SUPER    , up    , movefocus      , u"
    "SUPER    , down  , movefocus      , d"
    "SUPER    , h     , movefocus      , l"
    "SUPER    , l     , movefocus      , r"
    "SUPER    , k     , movefocus      , u"
    "SUPER    , j     , movefocus      , d"
    "CTRLSHIFT, H     , resizeactive   , -200"
    "CTRLSHIFT, L     , resizeactive   , 200"
    "CTRLSHIFT, K     , resizeactive   , 0-20"
    "CTRLSHIFT, J     , resizeactive   , 020"
    "         , F2    , movetoworkspace, special"
    "         , F2    , togglespecialworkspace"
    "ALT      , 3     , togglespecialworkspace"
    "         , F1    , togglespecialworkspace"
    "ALT      , 0x0060, togglegroup"
    "ALT      , 0xff09, changegroupactive"
    "CTRLSHIFT, space , togglefloating"
    "SUPER    , space , pin"
    "         , F11   , fullscreen"

    # common programs
    "CTRL     , Return, exec, ${kitty}/bin/kitty"
    "CTRLSHIFT, Return, exec, ${kitty}/bin/kitty --class floatingkitty"
    "SUPER    , W     , exec, ${firefox}/bin/firefox"
    "SUPER    , Z     , exec, ${zathura}/bin/zathura"
    "ALT      , space , exec, ${fuzzel}/bin/fuzzel"

    # brightness
    # TODO: add this on laptop
    # ",XF86MonBrightnessDown,exec,xbacklight -dec 10"
    # ",F7,exec,xbacklight -dec 10"
    # ",XF86MonBrightnessUp,exec,xbacklight -inc 10"
    # ",F8,exec,xbacklight -inc 10"
    # ",XF86KbdBrightnessDown,exec,xbacklight -ctrl asus::kbd_backlight -dec 30"
    # ",XF86KbdBrightnessUp,exec,xbacklight -ctrl asus::kbd_backlight -inc 30"
    # "SUPER,space,exec,kbdbacklighttoggle"

    # audio / media
    # TODO: what package is wpctl in?
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
    ", XF86AudioMute       , exec, wpctl set-sink-mute @DEFAULT_SINK@ toggle"
    ", XF86AudioPlay       , exec, ${playerctl}/bin/playerctl play-pause"
    ", XF86AudioPause      , exec, ${playerctl}/bin/playerctl play-pause"
    ", XF86AudioNext       , exec, ${playerctl}/bin/playerctl next"
    ", XF86AudioPrevious   , exec, ${playerctl}/bin/playerctl previous"
  ];
}
