{ ... }:
{
    programs.rclone = {
        enable = true;
        remotes.googledrive.mounts."/" = {
            enable = true;
            autoMount = true;
            mountPoint = "/home/ves/gdrive/";
        };
    };
}
