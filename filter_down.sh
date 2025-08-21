#!/usr/bin/env bash

# It discards DX lines containing occupant stations (spotter or spotted station).

perl -CS -ne '
  binmode(STDIN); binmode(STDOUT);

  sub is_ru_by {
    my ($call) = @_;
    $call = uc($call // "");
    # Divide into segments by slashes
    my @seg = split m{/+}, $call;

    foreach my $c (@seg) {
      $c =~ s/[^A-Z0-9].*$//;      # cut off anything from the first unusual part onwards
      next unless $c;              # empty skip
      # Prefixes are checked at the beginning + digits after the prefix (typical form)
      return 1 if $c =~ m/^(?:R[A-Z]?|U[AI])\d/;
      return 1 if $c =~ m/^E[UVW]\d/;
    }
    return 0;
  }

  # Typical DX spot: "DX de SPOTTER: 14025.0 DXCALL 25-Feb-2025 1432Z ..."
  if (/^DX\s+de\s+(\S+?):\s+([0-9.]+)\s+(\S+)/) {
    my ($spotter, $freq, $dxcall) = ($1, $2, $3);
    if (is_ru_by($spotter) || is_ru_by($dxcall)) {
      # Discard line (do not print)
      next;
    }
  }

  # Non-DX lines, or DX lines without occupants → release
  print;
'

