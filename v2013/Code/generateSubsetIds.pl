#!/usr/bin/perl -w
# Usage: perl generateSubsetIds.pl protein Similarity.csv
use strict;
use List::Util qw/max min/;

my($name,@array);
my $folder=$ARGV[0];  # folder is protein or ligand.
my $cutoff=$ARGV[2];
my $file;

if($folder =~ /\//){
	$file = $folder;
	$file =~ s/\//_/;
}else{
	$file = $folder;
}

open Num,">>data/number_cutoff_$file.csv" || die"!$\n";
for(;$cutoff<=1;$cutoff=$cutoff+0.01){  #This cutoff range is 0.4 to 1.

	open IN1,"$ARGV[1]" || die"$!\n";  # IN1 is similarity form
	readline IN1;
	my $num=0;

	while(<IN1>){
		chomp;
		@array=split("\t",$_);
		$name = shift @array;
		my $max = max @array ;

		if($max>$cutoff){
			$cutoff=sprintf "%.2f",$cutoff;
                	open OUT,">>data/$folder/train_$cutoff.csv" || die"!$\n";
                	print OUT "$name\n";
			$num++;
        	}
	}
	close IN1;
	print Num "$num\t$cutoff\n";

}
