#!/usr/bin/env bash

set -xe

sudo protonvpn connect $1

"${@:2}"

sudo protonvpn disconnect
