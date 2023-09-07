{ pkgs, nix-std, helix-typst, ... }:
let std = nix-std.lib; in
{
  home.packages = with pkgs; [
    # extra lanugage servers
    # typst typst-lsp # not updated in home manager
    zathura
    nil
  ];

  programs.helix = {
    enable = true;
    package = helix-typst.packages."x86_64-linux".helix;
  };

  xdg.configFile = {
    "helix/languages.toml".text = std.serde.toTOML {
      language = [{
        name = "cpp";
        indent = { tab-width = 4; unit = "\t"; };
      }];
      language-server.typst-lsp.config.exportPdf = "never";
    };
    "helix/config.toml".text = std.serde.toTOML {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        color-modes = true;
        gutters = [ "diagnostics" "diff" "line-numbers" "spacer" ];
        auto-format = false;
        soft-wrap.enable = true;
        file-picker.hidden = true;
        indent-guides.render = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };

      keys = {
        normal = {
          ";" = "command_mode";
          "0" = "goto_line_start";
          "$" = "goto_line_end";
          G = "goto_file_end";
          C-h = "jump_view_left";
          C-j = "jump_view_down";
          C-k = "jump_view_up";
          C-l = "jump_view_right";
          x = "extend_line_below";
          X = "extend_line_up";
          t = "extend_line_above";
          T = "extend_line_down";
          space = {
            o = ":format";
            "/" = "toggle_comments";
            m = {
              m = ":run-shell-command make";
              n = ":run-shell-command ninja -C build";
            };
            c = {
              r = ":run-shell-command cargo run";
              b = ":run-shell-command cargo build";
              t = ":run-shell-command cargo test";
            };
          };
        };
        select = {
          ";" = "command_mode";
          "0" = "goto_line_start";
          "$" = "goto_line_end";
          G = "goto_file_end";
          x = "extend_line_below";
          X = "extend_line_up";
          t = "extend_line_above";
          T = "extend_line_down";
        };
        insert.j.k = "normal_mode";
      };
    };
  };
}
