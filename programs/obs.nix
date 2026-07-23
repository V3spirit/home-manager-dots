{ pkgs, ... }:
{
    programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
            obs-pipewire-audio-capture
        ];
#        package = (
#            pkgs.obs-studio.override {
#                cudaSupport = true;
#            }
#        );
    };
}
