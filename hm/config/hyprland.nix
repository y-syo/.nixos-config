{ config, pkgs, ... }:

{
	home.file = {
		".config/hypr/hyprland.conf".text = ''
#
# Please note not all available settings / options are set here.
# For a full list, see the wiki
#

# power optimiser
misc:vfr = true 

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=eDP-1,1920x1080@144,0x0,1
workspace=eDP-1,1
monitor=HDMI-A-1,1920x1080@75,1920x0,1
workspace=HDMI-A-1,11

# workspaces binding for hyprsome, see https://github.com/sopa0/hyprsome

workspace = 1, monitor:eDP-1
workspace = 2, monitor:eDP-1
workspace = 3, monitor:eDP-1
workspace = 4, monitor:eDP-1
workspace = 5, monitor:eDP-1
workspace = 6, monitor:eDP-1

workspace = 11, monitor:HDMI-A-1
workspace = 12, monitor:HDMI-A-1
workspace = 13, monitor:HDMI-A-1
workspace = 14, monitor:HDMI-A-1
workspace = 15, monitor:HDMI-A-1
workspace = 16, monitor:HDMI-A-1

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = swww init & waybar & eww daemon & eww open-many bar-m1 bar-m2
# exec-once = /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=easyeffects-wrapper com.github.wwmm.easyeffects
exec-once = swww img -o HDMI-A-1 ${config.stylix.image} & swww img -o eDP-1 ${config.stylix.image}

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24

# For all catego intl
input {
    kb_layout = us
    kb_variant = intl
    kb_model =
    kb_options = 
    kb_rules =

    follow_mouse = 1
    accel_profile = flat

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(f38ba8ff)
    col.inactive_border = rgba(6c7086ff)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 1
    blur = yes
    blur_size = 3
    blur_passes = 3
    blur_new_optimizations = on

    drop_shadow = no
    shadow_range = 12
    shadow_render_power = 2
    shadow_scale = 1
    col.shadow = rgba(1a1a1a99)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    bezier = overshot, .29,.09,0,1

    animation = windows, 1, 5, myBezier
    animation = windowsOut, 1, 5, default, popin 80%
    animation = border, 1, 5, default
    animation = borderangle, 1, 5, default
    animation = fade, 1, 7, default
    animation = workspaces,1,6,overshot,slidevert
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic mouse V1 {
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty
bind = $mainMod, w, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, nemo
bind = $mainMod, V, togglefloating, 
bind = $mainMod, Space, exec, wofi --show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
#bind = $mainMod, 1, workspace, 1
#bind = $mainMod, 2, workspace, 2
#bind = $mainMod, 3, workspace, 3
#bind = $mainMod, 4, workspace, 4
#bind = $mainMod, 5, workspace, 5
#bind = $mainMod, 6, workspace, 6
#bind = $mainMod, 7, workspace, 7
#bind = $mainMod, 8, workspace, 8
#bind = $mainMod, 9, workspace, 9
#bind = $mainMod, 0, workspace, 10

bind = $mainMod, 1, exec, hyprsome workspace 1
bind = $mainMod, 2, exec, hyprsome workspace 2
bind = $mainMod, 3, exec, hyprsome workspace 3
bind = $mainMod, 4, exec, hyprsome workspace 4
bind = $mainMod, 5, exec, hyprsome workspace 5
bind = $mainMod, 6, exec, hyprsome workspace 6 # & mpv --volume=25 --fs /home/yosyo/Vidéos/saulgoodman.mp4

# Move active window to a workspace with mainMod + SHIFT + [0-9]
#bind = $mainMod SHIFT, 1, movetoworkspace, 1
#bind = $mainMod SHIFT, 2, movetoworkspace, 2
#bind = $mainMod SHIFT, 3, movetoworkspace, 3
#bind = $mainMod SHIFT, 4, movetoworkspace, 4
#bind = $mainMod SHIFT, 5, movetoworkspace, 5
#bind = $mainMod SHIFT, 6, movetoworkspace, 6
#bind = $mainMod SHIFT, 7, movetoworkspace, 7
#bind = $mainMod SHIFT, 8, movetoworkspace, 8
#bind = $mainMod SHIFT, 9, movetoworkspace, 9
#bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod SHIFT, 1, exec, hyprsome move 1
bind = $mainMod SHIFT, 2, exec, hyprsome move 2
bind = $mainMod SHIFT, 3, exec, hyprsome move 3
bind = $mainMod SHIFT, 4, exec, hyprsome move 4
bind = $mainMod SHIFT, 5, exec, hyprsome move 5
bind - $mainMod SHIFT, 6, exec, hyprsome move 6

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bind = CTRL, escape, exec, ~/.config/hypr/eww-manager.sh


# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Clipboard bindings
bind = SUPER, V, exec, wl-paste
bind = SUPER, S, exec, slurp | grim -g - - | wl-copy

exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

		'';
    };
}
