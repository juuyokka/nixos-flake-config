{ pkgs, inputs, ... }:
let
  inherit (inputs) hyprland hy3;
in {
  imports = [ ./waybar.nix ];
  home.packages = [ pkgs.swww ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ hy3.packages.${pkgs.system}.hy3 ];

    settings = {
      monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
      "$mod" = "SUPER";

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

      windowrulev2 = [
        "opacity 0.8,class:(Alacritty)"
      ];

      bind = [
        "$mod, T, exec, alacritty"
        # "$mod, L, exec, swaylock"
        # "$mod, S, exec, grimshot copy area"
        "$mod, Q, hy3:killactive,"
        "$mod, M, exit,"
        # "$mod, E, exec, thunar"
        "$mod, F, fullscreen"
        "$mod, V, hy3:makegroup, v, ephemeral"
        "$mod, B, hy3:makegroup, h, ephemeral"
        "$mod, H, hy3:movefocus, l"
        "$mod, L, hy3:movefocus, r"
        "$mod, K, hy3:movefocus, u"
        "$mod, J, hy3:movefocus, d"
        "$mod SHIFT, H, hy3:movewindow, l"
        "$mod SHIFT, L, hy3:movewindow, r"
        "$mod SHIFT, K, hy3:movewindow, u"
        "$mod SHIFT, J, hy3:movewindow, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod ALT, left, workspace, e-1"
        "$mod ALT, right, workspace, e+1"
      ];

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };
  };
}

