{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "/dev/disk/by-id/nvme-WDC_PC_SN520_SDAPMUW-512G-1101_184214802514";
        configurationLimit = 20;
        theme = import ./grub-theme.nix { inherit pkgs; };
      };
    };
  };
}
