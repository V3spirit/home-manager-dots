{ pkgs, ... }:
{
  home.packages = with pkgs; [
    
    pokeget-rs
    lsd
    bat
    tree
  ];

  programs.bash = {

    enable = true;
    enableCompletion = true;
    shellAliases = {

      "lc" = "wc -l";
      "tree" = "tree -C --dirsfirst";
      "ls" = "lsd -A";
      "ll" = "lsd -Agl";
      "grep" = "grep --color=auto";
      "cat" = "bat";
      "rm" = "rm -r";
      "cp" = "cp -r";
      "vi" = "$EDITOR";
    };

    initExtra = ''
      set -o vi
      shopt -qs autocd
      function startup {
          pokeget random --hide-name --female
      }
      alias -- clear='clear && startup'
      startup
    '';
  };
}
