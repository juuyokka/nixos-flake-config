{ pkgs, ... }:
{
  # https://mipmip.github.io/home-manager-option-search
  imports = [
    ./modules/fonts.nix
    ./modules/sway.nix
    ./modules/alacritty
  ];
  
  home = rec {
    username = "lactose";
    homeDirectory = "/home/${username}";
  };
  
  xdg.enable = true;

  programs.git = {
    enable = true;
    userName = "juuyokka";
    userEmail = "15185244+juuyokka@users.noreply.github.com";
  };

  programs.zsh = {
    enable = true;
    # sessionVariables = {
    #   EDITOR = "nvim";
    # };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  
  home.packages = with pkgs; [
    dunst
    fastfetch
    firefox
    btop
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
