{ ... }:
{
    programs.tmux = {
        enable = true;
        extraConfig = ''
            set -g status-style bg=default
        '';
    };
}
