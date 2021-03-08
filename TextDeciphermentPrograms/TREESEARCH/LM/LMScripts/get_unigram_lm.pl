#!/usr/bin/perl -I/home/cechoi/Desktop/Dorabella Cipher/dorabella-experiments/TextDeciphermentPrograms/hhk-decipherment/LM/LMScripts
use warnings;
use strict;
use Utils;

my ($file) = @ARGV;

my $unigrams = 0;
my %unigram_counts = ();

while (<>) {
  chomp;
  my $s = $_;
  my @words = split /\s+/, $s;
  push @words, '<\s>';
  
  foreach my $w (@words) {
    $unigrams++;
    # Update unigram counts.
    if (!$unigram_counts{$w}) {
      $unigram_counts{$w} = 0;
    }
    $unigram_counts{$w}++;
  }
}

foreach my $w1 (sort keys %unigram_counts) {
    printf "%s\t%1.12f\n", $w1, $unigram_counts{$w1} / $unigrams;
}
