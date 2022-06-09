#!/usr/bin/env bash

set -xe

su -c "openvpn /home/user/vpn/"

"$@"

su -c "pkill openvpn"
