#!/usr/bin/perl -I/home/cechoi/Desktop/Dorabella Cipher/dorabella-experiments/TextDeciphermentPrograms/hhk-decipherment/LM/LMScripts
use warnings;
use strict;
use Utils;

my ($file) = @ARGV;

my %unigram_counts = ();
my %bigram_counts = ();
my %trigram_counts = ();
my %bigram_lm = ();

while (<>) {
  chomp;
  my $s = $_;
  my @words = split /\s+/, $s;
  unshift @words, '<s>';
  unshift @words, '<s>';
  push @words, '<\s>';
  push @words, '<\s>';
  
  my $lw;
  my $llw;
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
    
    
    # Update trigram counts.
    if ($llw && $lw) {
      if (!$trigram_counts{$llw}) {
        $trigram_counts{$llw} = {};
      }
      
      if (!($trigram_counts{$llw}->{$lw})) {
        $trigram_counts{$llw}->{$lw} = {};
      }
      
      if (!($trigram_counts{$llw}->{$lw})) {
        $trigram_counts{$llw}->{$lw}->{$w} = 0;
      }
      
      $trigram_counts{$llw}->{$lw}->{$w}++;
    }
    
    
    # Record last word.
    $llw = $lw;
    $lw = $w;
  }
}

foreach my $w1 (sort keys %trigram_counts) {
  foreach my $w2 (sort keys %{$trigram_counts{$w1}}) {
    foreach my $w3 (sort keys %{$trigram_counts{$w1}->{$w2}}) {

      printf "%s\t%s\t%s\t%1.12f\n", $w1, $w2, $w3,
	$trigram_counts{$w1}->{$w2}->{$w3} / $bigram_counts{$w1}->{$w2};
      
    }  
  }
}
