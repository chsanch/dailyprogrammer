use v6;

my @days = < first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth>;
my @numbers = < a two three four five six seven eight nine ten eleven twelve>;
my @gifts = 'input.txt'.IO.lines;

for [0 .. @days.end] -> $i {
	say "On the " ~ @days[$i] ~ " day of Christmas";
    say "my true love sent to me: ";
	if $i == 0 {
		say @numbers[0] ~ @gifts[0] 
	}
	else {
		for [0..$i].reverse -> $j {
			say "and " ~ @numbers[$j] ~ " " ~ @gifts[$j] and next if $j == 0;
			say @numbers[$j]~ " " ~ @gifts[$j]; 
		}
	}
	say "\n";		
}
