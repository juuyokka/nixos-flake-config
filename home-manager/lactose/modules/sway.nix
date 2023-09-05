{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.swww ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;

    config = rec {
      terminal = "alacritty";
      modifier = "Mod4";

      startup = map (cmd: { command = cmd; }) [
        "${pkgs.swww}/bin/swww init"
	"exec dbus-update-activation-environment DISPLAY I3SOCK SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway"
      ];

      window = {
        titlebar = false;
	commands = [
	  {
	    criteria = { app_id = "Alacritty"; };
	    command = "opacity 0.8; blur enable; blur_radius 6";
	  }
	];
      };

      keybindings =
      let mod = modifier;
      in lib.mkOptionDefault {
        "${mod}+q" = "kill";
      };

      gaps = {
        outer = 0;
	inner = 8;
      };
    };

    # Extra configs for SwayFX
    extraConfig = ''
      corner_radius 8
    '';
  };
}

