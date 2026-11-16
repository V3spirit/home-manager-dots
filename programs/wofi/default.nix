{ ... }:
{
    programs.wofi = {
        enable = true;
        settings = {
            mode = "drun";
            allow_images = true;
            insensitive = true;
            key_expand = "Tab";
        };
        style = ./style.css;
    };
}
