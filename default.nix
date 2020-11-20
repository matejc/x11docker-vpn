{ pkgs ? import <nixpkgs> { }
, args ? "--hostdisplay --alsa=2 --gpu --clipboard --share $HOME/.pvpn-cli"
, build ? "./vpn-docker"
, sudoCmd ? "sudo -E"
, postCmd ? "exit 0"
, startCmd ? "chromium --no-sandbox"
, extraDeps ? "chromium pulseaudio"
}:
pkgs.mkShell {
  name = "x11docker-vpn";
  buildInputs = with pkgs; [ docker x11docker ];
  shellHook = ''
    ${sudoCmd} docker build -t x11docker-vpn --build-arg EXTRA_DEPS="${extraDeps}" ${build}

    x11docker ${args} --share /dev/net/tun --sudouser --user=RETAIN -- --cap-add=NET_ADMIN -- x11docker-vpn:latest ${startCmd}

    ${postCmd}
  '';
}
