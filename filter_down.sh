#!/bin/sh

grep -Ev -f blocked_prefixes.txt
