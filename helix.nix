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
        indent = { tab-width = 4; unit = "    "; };
      }];
      language-server.typst-lsp.config.exportPdf = "never";
    };
    "helix/config.toml".text = std.serde.toTOML {
      theme = "catppuccin_mocha";

      editor = {
        auto-format = false;
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        file-picker.hidden = true;
        gutters = [ "diagnostics" "diff" "line-numbers" "spacer" ];
        indent-guides.render = true;
        line-number = "relative";
        soft-wrap.enable = true;
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          right = [
            "diagnostics"
            "version-control"
            "position"
            "position-percentage"
            "file-encoding"
          ];
        };
      };

      keys = {
        normal = {
          "$" = "goto_line_end";
          "0" = "goto_line_start";
          ";" = "command_mode";
          C-h = "jump_view_left";
          C-j = "jump_view_down";
          C-k = "jump_view_up";
          C-l = "jump_view_right";
          G = "goto_file_end";
          T = "extend_line_down";
          X = "extend_line_up";
          t = "extend_line_above";
          x = "extend_line_below";
          space = {
            i = ":toggle lsp.display-inlay-hints";
            o = ":format";
            m = {
              m = ":run-shell-command make";
              n = ":run-shell-command ninja -C build";
            };
            c = {
              r = ":run-shell-command cargo run";
              b = ":run-shell-command cargo build";
              t = ":run-shell-command cargo test";
            };
            R = ":reflow";
          };
        };
        select = {
          "$" = "goto_line_end";
          "0" = "goto_line_start";
          ";" = "command_mode";
          G = "goto_file_end";
          T = "extend_line_down";
          X = "extend_line_up";
          t = "extend_line_above";
          x = "extend_line_below";
          space.R = ":reflow";
        };
        insert.j.k = "normal_mode";
      };
    };
  };
}
