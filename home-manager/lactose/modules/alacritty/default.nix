{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    # config = {
    #   font = {
    #     normal = {
    #       family = "JetBrainsMonoNL Nerd Font";
    #       style = "Regular";
    #     };
    #   };
    # };
  };

  xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
}
