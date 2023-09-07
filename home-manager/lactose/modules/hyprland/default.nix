{ pkgs, inputs, ... }:
let
  inherit (inputs) hyprland hy3;

  format_multiline = s: with builtins;
    concatStringsSep " " (concatLists(
      filter isList (map
        (match "[[:s:]]*(.+)") (pkgs.lib.strings.splitString "\n" s)
      )
    ));
in {
  imports = [ 
    ./waybar.nix
    ./tofi.nix
    ./keybinds.nix
  ];
  home.packages = [ pkgs.swww ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ hy3.packages.${pkgs.system}.hy3 ];

    settings = {
      monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
      "$mod" = "SUPER";
      "$resize_speed" = 20;
      "$menu" = format_multiline ''
        tofi-run --ascii-input true --num-results 5 --hint-font false
	| xargs hyprctl dispatch exec
      '';

      exec-once = [
        "swww init"
	"waybar"
      ];

      input = {
        touchpad = {
          tap-to-click = true;
          natural_scroll = true;
        };
      };

      general = {
        layout = "hy3";
	gaps_in = 5;
	gaps_out = 8;
      };

      decoration = {
        rounding = 8;
      };

      animations = {
	bezier = [ "easeInOutExpo,0.87,0,0.13,1" ];
	animation = [
	  "fade,0,1,default"
	  "workspaces,1,2,easeInOutExpo"
	];
      };

      windowrulev2 = [
        "opacity 0.8,class:(Alacritty)"
      ];

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };
  };
}

