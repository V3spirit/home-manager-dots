{ ... }:
{
    programs.rclone = {
        enable = true;
        remotes."googledrive" = {
            config = {};
            mounts."/" = {
                enable = true;
                autoMount = true;
                mountPoint = "/home/ves/gdrive/";
            };
        };
    };
}
