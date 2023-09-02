{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;

    config = {
      terminal = "alacritty";
      gaps = {
        outer = 10;
      };
    };

    # Extra configs for SwayFX
    extraConfig = ''
      corner_radius 8
    '';
  };
}
