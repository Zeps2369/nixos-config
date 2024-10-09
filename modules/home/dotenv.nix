{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodePackages.dotenv-cli
  ];
}
