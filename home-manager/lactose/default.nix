{ pkgs, ... }:
{
  # https://mipmip.github.io/home-manager-option-search
  imports = [
    ./modules/fonts.nix
    ./modules/sway.nix
    ./modules/alacritty.nix
  ];
  
  home = rec {
    username = "lactose";
    homeDirectory = "/home/${username}";
  };
  
  xdg.enable = true;

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
