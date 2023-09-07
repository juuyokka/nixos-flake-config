{ config, pkgs, ... }:
rec {
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = { x=4; y=2; };
      font.normal = {
        family = "JetBrainsMonoNL Nerd Font";
        style = "Regular";
      };
      import = [ "${config.xdg.configHome}/${xdg.configFile."alacritty/catppuccin".target}/catppuccin-mocha.yml" ];
    };
  };

  # xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
  xdg.configFile."alacritty/catppuccin" = {
    enable = true;
    recursive = true;
    source = ./catppuccin;
    target = "alacritty/catppucin";
  };
}
