#!/usr/bin/env bash
perl -CS -pe '
  binmode(STDIN); binmode(STDOUT);
  # DO NOT touch 0xFF IAC sequence: protection – replace only printable blocks
  s/forbidden/XXXX/g;
  $_ = "" if /totally_block_this/;
'

