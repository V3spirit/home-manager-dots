{ pkgs, ... }:
{
    home.packages = with pkgs; [
        libnotify
    ];
    programs.quickshell = {

        enable = true;
        systemd.enable = true;
    };
}
