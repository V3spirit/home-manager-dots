{ pkgs, ... }:
{
    home.pointerCursor = {

        gtk.enable = true;
        x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
    };

    gtk = rec {
        enable = true;
        colorScheme = "dark";
        theme = {
            package = pkgs.catppuccin-gtk;
            name = "catppuccin-frappe-blue-standard";
        };

        gtk4 = {
            enable = true;
            theme = theme; 
        };
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
    };
}
