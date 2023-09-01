{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "distro-grub-theme-nilou";
  version = "v3.2";
  
  srcs = [
    ./res
    (pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = "distro-grub-theme";
      rev = version;
      hash = "sha256-U5QfwXn4WyCXvv6A/CYv9IkR/uDx4xfdSgbXDl5bp9M=";
    })
  ];
  sourceRoot = ".";
  
  patches = [ ./theme.txt.patch ];
  
  postUnpack = "tar -xf source/themes/nixos.tar --one-top-level=nixos";
  postPatch = "cp res/* nixos";
  installPhase = "mkdir -p $out && cp -r nixos/. $out";
}
