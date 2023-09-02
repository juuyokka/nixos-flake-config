{ pkgs, ... }:
{
  fonts.fontconfig.enable = false;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
