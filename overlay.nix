final: prev: {
  talos = final.stdenv.mkDerivation {
    pname = "talosctl";
    version = "v1.10.0-alpha.2";
    src = final.fetchurl {
      url = "https://github.com/siderolabs/talos/releases/download/v1.10.0-alpha.2/talosctl-linux-amd64";
      sha256 = "6c8b946490cc77c431cb1aa35787995c18354458a70656f06fdfc6c64253468a";
    };
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      install -m755 $src $out/bin/talosctl
    '';
    meta = with final.lib; {
      description = "Client CLI tool for managing Talos clusters";
      homepage = "https://github.com/siderolabs/talos";
      license = licenses.mit;
      maintainers = [ maintainers.yourname ];
    };

  };
}
