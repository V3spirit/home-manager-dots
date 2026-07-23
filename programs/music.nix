{ pkgs, inputs, ... }:
let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in 
{
    imports = [
        inputs.spicetify-nix.homeManagerModules.spicetify
    ];
    programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.tokyoNight;
        #colorScheme = "mocha";
    };
    xdg.desktopEntries.spotify = {

        name = "Spotify";
        exec = ''env DISPLAY="" spotify'';
        type = "Application";
        terminal = false;
    };
    #programs.spotify-player = {
    #    enable = true;
    #    settings = {
    #        #enable_audio_visualization = true;
    #        #enable_media_control = true;
    #    };
    #};
    services.playerctld.enable = true;
}
