#!/usr/bin/env bash

set -xe

sudo protonvpn connect --fastest

"$@"

sudo protonvpn disconnect
