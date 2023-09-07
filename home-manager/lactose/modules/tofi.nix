{ pkgs, ... }:
{
  home.packages = [ pkgs.tofi ];
  xdg.configFile."tofi/config" = {
    enable = true;
    text = let
      jb_mono = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    in ''
      font = "${jb_mono}/share/fonts/truetype/NerdFonts/JetBrainsMonoNLNerdFontMono-Regular.ttf"
      anchor = top
      width = 100%
      height = 30
      horizontal = true
      font-size = 14
      prompt-text = " run: "
      outline-width = 0
      border-width = 0
      background-color = #000000
      min-input-width = 120
      result-spacing = 15
      padding-top = 0
      padding-bottom = 0
      padding-left = 0
      padding-right = 0
    '';
  };
}

