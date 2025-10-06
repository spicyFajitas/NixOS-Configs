{ config, pkgs, ... }:

{
  ##################################
  # Git Configuration (system-wide)
  ##################################
  environment.systemPackages = with pkgs; [ git ];

  environment.etc."gitconfig".text = ''
    [user]
      name = spicyFajitas
      email = afulton101222@gmail.com
    [core]
      editor = vim
    [init]
      defaultBranch = main
    [pull]
      rebase = true
    [color]
      ui = true
  '';
}

