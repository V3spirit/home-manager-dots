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
        ./starship.nix
        ./quickshell.nix
        ./gamemode.nix
        ./games
    ];
    home.packages = with pkgs; [

        duf
        nvtopPackages.nvidia
        wootility
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
        hyprshot.enable = true;
        mpv.enable = true;
        gh.enable = true;
    };

    services = {
        hyprpolkitagent.enable = true;
        hyprlauncher.enable = true;
        hyprsunset.enable = true;
    };
}
