{pkgs, ...}: {
  imports = [
    ./fish/catppuccin.nix
    ./fish/tide.nix
  ];

  home.packages = with pkgs; [
    grc # colors
    lsd
    ripgrep

    # to not have to run fish again after nix-shell
    any-nix-shell
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.configFile = {
    "fish/conf.d/done.fish" = {
      enable = true;
      source = ./fish/done.fish;
    };
    "fish/conf.d/00-home-manager-vars.fish" = {
      enable = true;
      text = ''
        function s --wraps "rg --json"
          rg --json $argv | delta --tabs 1
        end

        function bind_bang
          switch (commandline --current-token)[-1]
            case "!"
              commandline --current-token -- $history[1]
            case "*"
              commandline --insert !
          end
        end
        bind ! bind_bang

        function bind_question
          switch (commandline --current-token)[-1]
            case "\$"
              commandline --current-token -- "\$status"
            case "*"
              commandline --insert \?
          end
        end
        bind \? bind_question
      '';
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable greeting
      export GPG_TTY=$(tty)
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
    '';

    plugins = with pkgs.fishPlugins; [
      {
        name = "grc";
        src = grc.src;
      }
      {
        name = "autopair";
        src = autopair.src;
      }
      {
        name = "tide";
        src = tide.src;
      }
      {
        name = "git";
        src = plugin-git.src;
      }
    ];

    shellAbbrs = {
      "la" = "ls -a";
      "ll" = "ls -l";
      "gh" = "git log --oneline --graph --all -n 20";
      "gd" = "git difftool --dir-diff";
      "c" = "cargo";
      "nd" = "nix develop -c fish";
      "pbuds" = "bluetoothctl connect 24:29:34:9C:5D:8D";
      "nr" = "nix_remote";
    };

    shellAliases = {
      "icat" = "kitty +kitten icat";
      "whl" = "Hyprland";
      "ls" = "lsd";
    };
  };
}
