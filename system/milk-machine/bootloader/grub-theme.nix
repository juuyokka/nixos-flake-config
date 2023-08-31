{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "distro-grub-themes";
  version = "v3.2";
  sourceRoot = ".";
  
  srcs = [
    ./res
    (pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = pname;
      rev = version;
      hash = "sha256-U5QfwXn4WyCXvv6A/CYv9IkR/uDx4xfdSgbXDl5bp9M=";
    })
  ];
  
  postUnpack = "tar -xf source/themes/nixos.tar --one-top-level=nixos";
  patchPhase = "cp res/* nixos";
  installPhase = "mkdir -p $out && cp -r nixos/. $out";
}
