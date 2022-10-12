#!/usr/bin/perl

use strict;
use warnings;

sub RunOne {
  my @tempArr = split //, $_[0];
  my $buli = 1;
  while ($buli > 0) {
    @tempArr = remover (@tempArr);
    $buli = stillDups (@tempArr);
  }
  return @tempArr;
}

sub remover {
  my @arr = @_;
  my $stepper = 0;
  my $size = @arr;
  my @retArr;
  while ($stepper < $size - 1) {
    my $First = ord("$arr[$stepper]");
    my $Second = ord("$arr[$stepper + 1]");
    if ($First - $Second == 32 || $Second - $First == 32) {
      $stepper++;
    } elsif ($stepper == $size - 2) {
      push @retArr, $arr[$stepper];
      push @retArr, $arr[$stepper + 1];
    } else {
      push @retArr, $arr[$stepper];
    }
    $stepper++;
  }
  # print @retArr;
  # print "\n ^^ retArray ^^\n";
  return @retArr;
}

sub stillDups {
  my @arr = @_;
  my $size = @arr;
  my $indx = 0;
  my $hasEQ = 0;
  while ($indx < $size - 1) {
    my $First = ord("$arr[$indx]");
    my $Second = ord("$arr[$indx + 1]");
    if ($First - $Second == 32 || $Second - $First == 32) {
      $hasEQ++;
      last;
    }
    $indx++;
  }
  return $hasEQ;
}

my @arrayOfLines = `cat Day5Input`;
my $actualLine = pop @arrayOfLines;

my $maxL = 50000;
my $charCode = 97;
my $firstLEN;

while ($charCode < 123) {
  my $CharToRemoved = chr("$charCode");
  my $temPer = $actualLine;
  $temPer =~ s/$CharToRemoved//gi;
  
  $firstLEN = RunOne ($temPer);
  if ($firstLEN < $maxL) {
    $maxL = $firstLEN;
  }

  $charCode++;
}
print $maxL;
