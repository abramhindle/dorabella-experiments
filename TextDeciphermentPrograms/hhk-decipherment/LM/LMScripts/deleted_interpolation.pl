#!/usr/bin/perl -I/home/cechoi/Desktop/Dorabella Cipher/dorabella-experiments/TextDeciphermentPrograms/hhk-decipherment/LM/LMScripts
use warnings;
use strict;
use Utils;

my @sentences = ();
while (<>) {
  chomp;
  push @sentences, $_;
}

my $unigrams = 0;
my %unigram_counts = ();
my %bigram_counts = ();
my %trigram_counts = ();

foreach my $s (@sentences) {
  my @words = split /\s+/, $s;
  unshift @words, '<s>';
  unshift @words, '<s>';
  push @words, '<\s>';
  push @words, '<\s>';
  
  my $lw;
  my $llw;
  foreach my $w (@words) {
    $unigrams++;
  
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

my $l1 = 0;
my $l2 = 0;
my $l3 = 0;

foreach my $w1 (sort keys %trigram_counts) {
  foreach my $w2 (sort keys %{$trigram_counts{$w1}}) {
    foreach my $w3 (sort keys %{$trigram_counts{$w1}->{$w2}}) {

      if ($bigram_counts{$w1}->{$w2} == 1) {
        next;
      }
      if ($unigram_counts{$w2} == 1) {
        next;
      }
      
      my $c3 = ($trigram_counts{$w1}->{$w2}->{$w3} - 1) / ($bigram_counts{$w1}->{$w2} - 1);
      my $c2 = ($bigram_counts{$w2}->{$w3} - 1) / ($unigram_counts{$w2} - 1);
      my $c1 = ($unigram_counts{$w3} - 1) / ($unigrams - 1);
            
      if ($c3 >= $c2 && $c3 >= $c1) {
        $l3 += $trigram_counts{$w1}->{$w2}->{$w3};
      }
      elsif ($c2 >= $c3 && $c2 >= $c1) {
        $l2 += $trigram_counts{$w1}->{$w2}->{$w3};
      }
      elsif ($c1 >= $c2 && $c1 >= $c3) {
        $l1 += $trigram_counts{$w1}->{$w2}->{$w3};
      }
      else {
        die "Error 1.\n";
      }
      
    }  
  }
}

my $l1n = $l1 / ($l1 + $l2 + $l3);
my $l2n = $l2 / ($l1 + $l2 + $l3);
my $l3n = $l3 / ($l1 + $l2 + $l3);

print "lambda 3: $l3\t$l3n\n";
print "lambda 2: $l2\t$l2n\n";
print "lambda 1: $l1\t$l1n\n";
