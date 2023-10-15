{ nix-std, pkgs, ... }:
let
  std = nix-std.lib;
  clang-format-text = args:
    pkgs.lib.foldlAttrs
      (acc: name: value: acc + "${name}: ${toString value}\n")
      ""
      args;
in
{
  home.file = {
    ".cargo/config.toml".text = std.serde.toTOML {
      registries.crates-io = { protocol = "sparse"; };
    };

    ".clang-format".text = clang-format-text {
      BasedOnStyle = "Google";
      IndentWidth = 4;
      PointerAlignment = "Left";
      BreakBeforeBraces = "Attach";
      AllowShortBlocksOnASingleLine = "Empty";
      AllowShortCaseLabelsOnASingleLine = "true";
      AllowShortIfStatementsOnASingleLine = "Never";
      AlignAfterOpenBracket = "BlockIndent";
      DerivePointerAlignment = "false";
      BinPackParameters = "false";
      BreakConstructorInitializers = "BeforeComma";
      AlignOperands = "DontAlign";
      # BinPackArguments = "false";
    };
  };
}
