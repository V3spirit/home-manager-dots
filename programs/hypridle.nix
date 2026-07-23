{ pkgs, ... }:
let
    screenOff = "${pkgs.hyprland}/bin/hyprctl dispatch \"hl.dsp.dpms({action=\"disable\"})\"";
    screenOn = "${pkgs.hyprland}/bin/hyprctl dispatch \"hl.dsp.dpms({action=\"enable\"})\"";
in 
{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                after_sleep_cmd = "${screenOn}";
                ignore_dbus_inhibit = false;
            };
            listener = [
                {
                    on-resume = "${screenOn}";
                    on-timeout = "${screenOff}";
                    timeout = 300;
                }
                {
                    on-timeout = "systemctl suspend";
                    #on-resume = "${screenOn}";
                    timeout = 1200;
                }
            ];
        };
    };
}
