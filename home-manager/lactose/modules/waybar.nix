{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    
    settings = [{
      layer = "top";
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "hyprland/window"
      ];
      modules-right = [
	"battery#internal"
	"battery#external"
        "clock"
      ];

      clock = {
        format = "{:%a %d/%m/%y %T}";
	interval = 1;
      };

      "battery#internal" = {
        bat = "BAT0";
	interval = 3;
      };

      "battery#external" = {
        bat = "BAT1";
	interval = 3;
      };
    }];
  };
}

