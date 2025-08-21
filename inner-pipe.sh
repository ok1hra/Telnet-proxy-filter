#!/bin/sh
set -eu
stdbuf -i0 -o0 -e0 ./filter_up.sh \
| socat -dd - TCP:127.0.0.1:7301,keepalive \
| stdbuf -i0 -o0 -e0 ./filter_down.sh

