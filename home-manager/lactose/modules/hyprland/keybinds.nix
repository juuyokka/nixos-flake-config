{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    binde = [
      "$mod CTRL, H, resizeactive, -$resize_speed 0"
      "$mod CTRL, L, resizeactive, $resize_speed 0"
      "$mod CTRL, K, resizeactive, 0 -$resize_speed"
      "$mod CTRL, J, resizeactive, 0 $resize_speed"
    ];

    bind = [
      "$mod, T, exec, alacritty"
      "$mod, Q, hy3:killactive"
      "$mod, M, exit"
      "$mod, D, exec, $menu"
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
  };
}
