#!/bin/sh
set -eu
socat -dd TCP-LISTEN:7300,reuseaddr,fork SYSTEM:'./inner-pipe.sh'

