let
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/9e86f5f7a19db6da2445f07bafa6694b556f9c6d.tar.gz";
    sha256 = "sha256:0i2j7bf6jq3s13n12xahramami0n6zn1mksqgi01k7flpgyymcck";
  };
  pkgs = import nixpkgs {};
in

pkgs.appimageTools.wrapType2 {
  name = "proxsign";
  src = pkgs.fetchurl {
    url = "https://public.setcce.si/proxsign/update/linux/SETCCE_proXSign-x86_64.AppImage";
    hash = "sha256-Ixe0XjErci2ID4YUx/zr4pf1XTi3M2n9E/IIh2DPYB8=";
  };
  extraPkgs = pkgs: [ pkgs.gmp pkgs.curl ];
}
