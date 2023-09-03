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
    sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };
  };
  
  xdg.enable = true;
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        AddKeysToAgent yes
	IdentityFile ~/.ssh/id_ed25519
    '';
  };

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
