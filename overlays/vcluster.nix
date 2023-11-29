self: super:
let
  stdenv = super.stdenv;
  version = "0.17.1";
in {
  vcluster = stdenv.mkDerivation {
    name = "vcluster-${version}";

    src = super.fetchurl {
      url = "https://github.com/loft-sh/vcluster/releases/download/v${version}/vcluster-linux-amd64";
      sha256 = "sha256-paEXvnjHDHvlqUzcQOpqDPSc+PLvC8BgpMeNzjq/YO8=";
    };

    buildCommand = ''
      . $stdenv/setup

      mkdir -p $out/bin
      cp $src $out/bin/vcluster
      chmod 755 $out/bin/vcluster
    '';

    meta = with super.lib; {
      description = "Kubernetes vcluster cli";
      homepage = https://www.vcluster.com/;
      license = licenses.free;
      platforms = [ "x86_64-linux" ];
    };
  };
}
