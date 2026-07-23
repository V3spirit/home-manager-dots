{ config, pkgs, ... }:
let
    gamemodeScript = "${config.xdg.configHome}/hypr/scripts/gamemode.sh";
    notifyScript = "${pkgs.libnotify}/bin/notify-send";
    hyprctl = "${pkgs.hyprland}/bin/hyprctl";
in 
{   
    # sort of dependency list for this module
    home.packages = with pkgs; [
        hyprland
        libnotify
        gamemode
    ];
    # TODO: use makeShellScript or whatever
    home.file.${gamemodeScript} = {
        text = ''
            #!/run/current-system/sw/bin/bash
             
            ${hyprctl} eval "hl.config({
                animations={
                    enabled=false,
                },
                decoration={
                    rounding=0,
                    blur={
                        enabled=false,
                    },
                    shadow={
                        enabled=false,
                    },
                },
            })"
        '';
        executable = true;
    };
    home.file."${config.xdg.configHome}/gamemode.ini".text = ''
        [custom]
        start=${notifyScript} "Gamemode started"
            ${gamemodeScript}
        end=${notifyScript} "Gamemode ended"
            ${hyprctl} reload
    '';
}
