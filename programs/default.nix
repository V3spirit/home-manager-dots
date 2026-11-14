{ pkgs, ... }:
{
    imports = [
        ./bash.nix
        ./clipboard.nix
        ./hypridle.nix
        ./hyprpaper.nix
        ./kitty.nix
        ./neovim.nix
        ./obs.nix
        ./music.nix
        ./ranger.nix
        ./rclone.nix
        ./starship.nix
        ./quickshell.nix
        ./tmux.nix
        ./gamemode.nix
        ./games
    ];
    home.packages = with pkgs; [

        duf
        libreoffice
        nvtopPackages.nvidia
        wootility
        wlsunset
    ];

    programs = {

        fzf = {

            enable = true;
            enableBashIntegration = true;
        };
        lazygit = {

            enable = true;
            enableBashIntegration = true;
        };
        fastfetch.enable = true;
        htop.enable = true;
        ripgrep.enable = true;
        vesktop.enable = true; # TODO: manage dotfiles
        firefox.enable = true; # TODO: manage dotfiles
        hyprshot = {
            enable = true;
            saveLocation = "$HOME/Pictures/hyprshot";
        };
        mpv.enable = true;
        gh = {
            enable = true;
            settings.git_protocol = "https";
            gitCredentialHelper = {
                enable = true;
                hosts = [ "github.com" ];
            };
        };
    };

    services = {
        hyprpolkitagent.enable = true;
        hyprlauncher.enable = true; #TODO: switch to wofi
    };
}
