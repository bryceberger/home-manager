{ nix-std, ... }:
let std = nix-std.lib; in
{
  home.file = {
    ".cargo/config.toml".text = std.serde.toTOML {
      registries.crates-io = { protocol = "sparse"; };
    };

    ".clang-format".text = ''
      BasedOnStyle: Google
      IndentWidth: 4
      AllowShortBlocksOnASingleLine: Empty
      AllowShortIfStatementsOnASingleLine: Never
      AlignAfterOpenBracket: BlockIndent
      BreakConstructorInitializers: BeforeComma
      BinPackArguments: false
      BinPackParameters: false
    '';
  };
}
