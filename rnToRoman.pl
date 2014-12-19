#!/usr/bin/perl
use strict;
#use Data::Printer;

my $userInput;

print "Give me an Arabic number:\n";
$userInput = <STDIN>;
chomp $userInput;
my $convertedNumber = "";

my %ones = ( 1 => "I",  4 => "IV",  5 => "V",  9=> "IX");
my %tens = ( 1 => "X", 4 => "XL", 5 => "L", 9=> "XC");
my %hundreds = ( 1 => "C", 4 => "CD", 5 => "D", 9 => "CM");
my %thousands = ( 1 => "M");

my $baseOne = substr($userInput, -1);
my $romanOnes = romanToArabic($baseOne, %ones);
$convertedNumber =  $romanOnes; 
$userInput = areWeDone($userInput, $convertedNumber);

my $baseTen = substr($userInput, -1);
my $romanTens = romanToArabic($baseTen, %tens);
$convertedNumber = $romanTens . $convertedNumber; 
$userInput = areWeDone($userInput, $convertedNumber);

my $baseHundreds = substr($userInput, -1);
my $romanHundreds = romanToArabic($baseHundreds, %hundreds);
$convertedNumber = $romanHundreds . $convertedNumber; 
$userInput = areWeDone($userInput, $convertedNumber);

my $baseThousands = substr($userInput, -1);
my $romanThousands = romanToArabic($baseThousands, %thousands);
$convertedNumber = $romanThousands . $convertedNumber; 
$userInput = areWeDone($userInput, $convertedNumber);

sub areWeDone{
	my $areWeDone = shift(@_);
	my $completedValue = shift(@_);

	chop $areWeDone;
	if(length($areWeDone) < 1){
		print "Done here you go: $completedValue\n";
		exit;
	}
	return $areWeDone;
}

sub romanToArabic{
	my $numToConvert = shift(@_);
	my (%values) = @_;
	my $convertedValue = "";
	my $counter=0;
	foreach my $key (sort {$b <=> $a} keys %values){
		my $testRemainder = $numToConvert - $key;
		while ($testRemainder >= 0){
			$convertedValue .= $values{$key};
			$numToConvert = $numToConvert - $key;
			$testRemainder = $numToConvert - $key;
		}			
	}
	return $convertedValue;
}

