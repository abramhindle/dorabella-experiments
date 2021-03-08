#!/usr/bin/perl -I/home/cechoi/Desktop/Dorabella Cipher/dorabella-experiments/TextDeciphermentPrograms/hhk-decipherment/LM/LMScripts
use warnings;
use strict;

use Utils;
use ReadLM;
use JMSmoothing;

# Get options.
my ($wordlm1_file, $wordlm2_file, $wordlm3_file) 
  = ('LM/unigramWord.txt','LM/bigramWord.txt','LM/trigramWord.txt');
my ($charlm1_file, $charlm2_file, $charlm3_file) 
  = ('LM/unigramWord.txt','LM/bigramWord.txt','LM/trigramWord.txt');
my ($wl1, $wl2, $wl3) 
  = (0.276814984563481, 0.289617747223018, 0.433567268213501);
my ($cl1, $cl2, $cl3) 
  = (0.0797257250619113, 0.205027510387632, 0.715246764550456);

my $x = 0.05;

# Read Language Models:
my $charlm1 = {};
ReadLM::ReadUnigramLM($charlm1_file, $charlm1);
my $charlm2 = {};
ReadLM::ReadBigramLM($charlm2_file, $charlm2);
my $charlm3 = {};
ReadLM::ReadTrigramLM($charlm3_file, $charlm3);
my $wordlm1 = {};
ReadLM::ReadUnigramLM($wordlm1_file, $wordlm1);
my $wordlm2 = {};
ReadLM::ReadBigramLM($wordlm2_file, $wordlm2);
my $wordlm3 = {};
ReadLM::ReadTrigramLM($wordlm3_file, $wordlm3);

# Declare pattern hashes.
my %patterns1 = ();
my %patterns2 = ();
my %patterns3 = ();
my %seen_ngram = ();
my %ngram_score = ();

# Process a list of sentences.
while (<>) {
  chomp;
  my $sen = $_;
  my @unigrams = ListUnigrams($sen);
  my @bigrams  = ListBigrams($sen);
  my @trigrams = ListTrigrams($sen);
  
  foreach my $g (@unigrams) {
    next if $seen_ngram{$g};
    $seen_ngram{$g} = 1;
    
    my $pattern = Utils::Pattern($g);
    $ngram_score{$g} = JMSmoothing::ProbCharWord($g, $charlm1, $charlm2, $charlm3, 
      $wordlm1, $wordlm2, $wordlm3, $cl1, $cl2, $cl3, $wl1, $wl2, $wl3, $x);
      
    if (!$patterns1{$pattern}) {
      $patterns1{$pattern} = [$g];
    }
    else {
      push @{$patterns1{$pattern}}, $g;
    }
  }
  
  foreach my $g (@bigrams) {
    next if $seen_ngram{$g};
    $seen_ngram{$g} = 1;
    
    my $pattern = Utils::Pattern($g);
    $ngram_score{$g} = JMSmoothing::ProbCharWord($g, $charlm1, $charlm2, $charlm3, 
      $wordlm1, $wordlm2, $wordlm3, $cl1, $cl2, $cl3, $wl1, $wl2, $wl3, $x);
      
    if (!$patterns2{$pattern}) {
      $patterns2{$pattern} = [$g];
    }
    else {
      push @{$patterns2{$pattern}}, $g;
    }
  }
  
  foreach my $g (@trigrams) {
    next if $seen_ngram{$g};
    $seen_ngram{$g} = 1;
    
    my $pattern = Utils::Pattern($g);
    $ngram_score{$g} = JMSmoothing::ProbCharWord($g, $charlm1, $charlm2, $charlm3, 
      $wordlm1, $wordlm2, $wordlm3, $cl1, $cl2, $cl3, $wl1, $wl2, $wl3, $x);
      
    if (!$patterns3{$pattern}) {
      $patterns3{$pattern} = [$g];
    }
    else {
      push @{$patterns3{$pattern}}, $g;
    }
  }
}

foreach my $g (sort keys %patterns1) {
  print "1\t$g\t";
  print join("\t", (sort {$ngram_score{$b} <=> $ngram_score{$a}} @{$patterns1{$g}})), "\n";
}

foreach my $g (sort keys %patterns2) {
  print "2\t$g\t";
  print join("\t", (sort {$ngram_score{$b} <=> $ngram_score{$a}} @{$patterns2{$g}})), "\n";
}

foreach my $g (sort keys %patterns3) {
  print "3\t$g\t";
  print join("\t", (sort {$ngram_score{$b} <=> $ngram_score{$a}} @{$patterns3{$g}})), "\n";
}


sub ListUnigrams {
  my $sen = shift;
  my @words = split /\s+/, $sen;
  return @words;
}

sub ListBigrams {
  my $sen = shift;
  my @words = split /\s+/, $sen;
  my @bigrams = ();
  for (my $i = 0; $i < @words-1; $i++) {
    push @bigrams, "$words[$i] $words[$i+1]";
  }
  return @bigrams;
}

sub ListTrigrams {
  my $sen = shift;
  my @words = split /\s+/, $sen;
  my @trigrams = ();
  for (my $i = 0; $i < @words-2; $i++) {
    push @trigrams, "$words[$i] $words[$i+1] $words[$i+2]";
  }
  return @trigrams;
}

