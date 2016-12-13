use v6;

my @letters = 'a' .. 'z';
my @values = [1,3,3,2,1,4,2,4,1,8,5,1,3,1,1,3,10,1,1,1,1,4,4,8,4,10];

my %point_values = zip( @letters, @values ).flat;
%point_values.{'?'} = 0;

multi sub MAIN(Str $tile where *.chars == 10) {
	my $word = $tile;
	say get_total($word);
}

multi sub MAIN(Str $tile where $tile.chars == 7 , Str $word where $word.chars <= 7) {
	say $word, word_exists($tile, $word) ?? " found" !! " not found", " in '$tile'";

}


sub get_total(Str $word) {
	my  $i = 1;
	return ($word.comb.map: { %point_values.{$_} * $i++   }).sum
}

sub get_words(Str $tile) {
	my @letters = $tile.comb;
	my @words;
	for 'enable.txt'.IO.lines -> $word {
		next unless any($word.comb) 	
	}
	return @words;
}

sub word_exists(Str $tile, Str $word) returns Bool {
	my @word = $word.comb;
	my @res := gather for $tile.comb {
		take .item if any(@word) eq .item;
		take .item if .item eq '?';
	}
	return  @res.elems == @word.elems;
}

