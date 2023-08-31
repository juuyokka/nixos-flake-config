{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        configurationLimit = 20;
        theme = import ./grub-theme.nix { inherit pkgs; };
      };
    };
  };
}
