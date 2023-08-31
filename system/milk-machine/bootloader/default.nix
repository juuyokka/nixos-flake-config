{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = 20;
        theme = import ./grub-theme.nix { inherit pkgs; };
      };
    };
  };
}
