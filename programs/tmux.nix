{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        plugins = with pkgs.tmuxPlugins; [
            {
                plugin = catppuccin;
                extraConfig = ''
                    set -g @catppuccin_flavor 'mocha'
                    set -g @catppuccin_window_tabs_enabled 'on'
                    set -g @catppuccin_window_status_style "rounded"
                    set -g status-left ""
                    set -g status-right "#{E:@catppuccin_status_application}"
                '';
            }
            {
                plugin = continuum;
                extraConfig = ''
                    set -g @continuum-restore 'on'
                '';
            }
            resurrect
        ];
        extraConfig = ''
            set -g mouse on
            set -g status-bg default
        '';
    };
}
