{ ... }:
let
  wallpaper = "~/Pictures/wallpapers/1396456.png";
in 
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "${wallpaper}"
	  ];
      wallpaper = [
        {
          monitor = "";
          path = "${wallpaper}";
        }
      ];
    };
  };
}
