# x11docker+ProtonVPN+chromium

Run ProtonVPN and chromium from inside docker with x11docker.
Only that browser's data will be routed through VPN, useful when you do not want to run system wide VPN.


## Usage

### Build

    $ sudo -E docker build -t vpn ./vpn-docker


### Run

    $ x11docker --hostdisplay --gpu --share $HOME/.pvpn-cli --share /dev/net/tun --clipboard --alsa=2 --sudouser --user=RETAIN -- --cap-add=NET_ADMIN -- vpn:latest


## Usage for Nix users

    $ nix-shell
