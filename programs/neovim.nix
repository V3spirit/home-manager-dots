{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    lua-language-server
    neovim
    stylua
    clang-tools
    typescript-language-server
  ];
}
