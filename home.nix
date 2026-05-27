{
  config,
  pkgs,
  username,
  homeDirectory,
  ...
}:

{
  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "23.11";
  home.packages =
    with pkgs;
    [
      git
      python3
      neovim
      zed-editor
      nixd
      nil
      nerd-fonts.jetbrains-mono
    ]
    ++ (
      if pkgs.stdenv.isDarwin then
        [
          ghostty-bin
          fastlane
          cocoapods
          ruby
        ]
      else
        [
          ghostty
        ]
    );

  home.file = {
    ".config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
    ".config/starship.toml".source = ./config/starship.toml;

    ".config/zed/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/zed/settings.json";
    ".config/zed/themes".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/zed/themes";
    # ".config/zed/keymap.json".source = ./config/zed/keymap.json;

    ".config/ghostty".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/ghostty";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
      ];
    };

    initContent = builtins.readFile ./home/.zshrc;
  };
  programs.starship = {
    enable = true;
  };
}
