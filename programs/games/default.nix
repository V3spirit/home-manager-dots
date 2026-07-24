{ inputs, pkgs, ... }:
let
  gamePkgs = inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system};
in 
{
  imports = [
    ./retroarch.nix
  ];
  nix.settings = {
    extra-substituters = ["https://nix-gaming.cachix.org"];
    extra-trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
  home.packages = with pkgs; [
    steam
    #gamePkgs.osu-lazer-bin
    osu-lazer-bin
    gamePkgs.osu-stable
  ];

  # xdg.desktopEntries.osu-lazer = {

  #   name = "osu!";
  #   exec = ''env PIPEWIRE_ALSA="{ alsa.buffer-bytes=1024 alsa.period.bytes=64 alsa.periods=3 }" SDL_VIDEODRIVER=x11 osu! %u'';
  #   terminal = false;
  #   type = "Application";
  #   categories = [ "Game" ];
  #   mimeType = [ "application/x-osu-beatmap-archive" "application/x-osu-skin-archive" "application/x-osu-beatmap" "application/x-osu-storyboard" "application/x-osu-replay" "x-scheme-handler/osu" ];
  #   comment = "A free-to-win rhythm game. Rhythm is just a *click* away!";
  #   startupNotify = true;
  # };
}
