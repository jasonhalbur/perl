#!/usr/bin/perl
use strict;
#use Data::Printer;

my $userInput;

print "Give me a Roman Numeral\n";
$userInput = <STDIN>;
chomp $userInput;
my $convertedNumber=0;
my %values = ( "I" => 1, "V" => 5,  "X" => 10,  "L" => 50, "C" => 100, "D" => 500, "M" => 1000 );

while (length($userInput) > 0){
	my $firstChar = substr($userInput, -1);
	chop $userInput;
	my $nextChar = substr($userInput, -1);
	if (exists($values{$nextChar}) && ( $values{$nextChar} < $values{$firstChar})){
		$convertedNumber = $convertedNumber + $values{$firstChar} - $values{$nextChar};
		chop $userInput;
	} else {
		$convertedNumber = $convertedNumber + $values{$firstChar};
	}
}
print "Your arabic number is $convertedNumber\n";
