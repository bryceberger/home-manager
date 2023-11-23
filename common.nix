{...}: {
  home.sessionVariables = {
    EDITOR = "hx";
  };
  xdg.configFile = {
    "user-dirs.dirs" = {
      enable = true;
      text = ''
        XDG_DOWNLOAD_DIR="$HOME/downloads"
        XDG_DOCUMENTS_DIR="$HOME/documents"
      '';
    };
  };
}
