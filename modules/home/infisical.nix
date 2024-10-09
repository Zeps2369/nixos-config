{ pkgs, ... }:
{
  home.packages = with pkgs; [
    infisical
  ];
}
