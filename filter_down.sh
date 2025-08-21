#!/usr/bin/env bash

# General filter: discards DX spots where SPOTTER or DXCALL
# matches any regex from the blocked_prefixes.txt file.

perl -CS -ne '
  use strict;
  use warnings;
  binmode(STDIN); binmode(STDOUT);

  our @patterns;
  BEGIN {
    my $file = "blocked_prefixes.txt";
    open my $fh, "<", $file or die "Cannot open $file: $!";
    chomp(@patterns = <$fh>);
    close $fh;
  }

  sub is_blocked {
    my ($call) = @_;
    return 0 unless defined $call;
    $call = uc($call);
    my @seg = split m{/+}, $call;  # treatment UA9/OK1ABC etc.
    foreach my $c (@seg) {
      $c =~ s/[^A-Z0-9].*$//;      # cut off unusual suffixes
      next unless $c;
      foreach my $p (@patterns) {
        return 1 if $c =~ /$p/i;
      }
    }
    return 0;
  }

  if (/^DX\s+de\s+(\S+?):\s+([0-9.]+)\s+(\S+)/) {
    my ($spotter, $freq, $dxcall) = ($1, $2, $3);
    if (is_blocked($spotter) || is_blocked($dxcall)) {
      next; # drop a line
    }
  }

  print;
'

