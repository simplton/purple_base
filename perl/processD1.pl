#!/usr/bin/perl

use strict;
use warnings;

open FILE, "input_1";
my @shifts;
my $SUM = 0;
my %frequencys;
$SUM = 0;

while  (my  $line  =  <FILE>)  {
  push @shifts, $line;
}

$frequencys{$SUM} = 11;
while (1) {
  for (@shifts) {
    $SUM += $_;
    if (exists($frequencys{$SUM})) {
      print "$SUM\n";
      exit 0;
    } else {
      $frequencys{$SUM} = 11;
    }
  }
}
