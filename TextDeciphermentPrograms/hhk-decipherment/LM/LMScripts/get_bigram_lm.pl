#!/usr/bin/perl -I/home/cechoi/Desktop/Dorabella Cipher/dorabella-experiments/TextDeciphermentPrograms/hhk-decipherment/LM/LMScripts
use warnings;
use strict;
use Utils;

my ($file) = @ARGV;

my %unigram_counts = ();
my %bigram_counts = ();
my %bigram_lm = ();

while (<>) {
  chomp;
  my $s = $_;
  my @words = split /\s+/, $s;
  unshift @words, '<s>';
  push @words, '<\s>';
  
  my $lw;
  foreach my $w (@words) {
    # Update unigram counts.
    if (!$unigram_counts{$w}) {
      $unigram_counts{$w} = 0;
    }
    $unigram_counts{$w}++;
    
    # Update bigram counts.
    if ($lw) {
      if (!$bigram_counts{$lw}) {
        $bigram_counts{$lw} = {};
      }
      
      if (!($bigram_counts{$lw}->{$w})) {
        $bigram_counts{$lw}->{$w} = 0;
      }
      
      $bigram_counts{$lw}->{$w}++;
    }
    
    # Record last word.
    $lw = $w;
  }
}

foreach my $w1 (sort keys %bigram_counts) {
  foreach my $w2 (sort keys %{$bigram_counts{$w1}}) {
    printf "%s\t%s\t%1.12f\n", $w1, $w2,
      $bigram_counts{$w1}->{$w2} / $unigram_counts{$w1};
  }
}
