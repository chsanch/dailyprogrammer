use v6;

multi MAIN (Str $tile where *.chars <= 20) {
	my $res = '';
	for 'enable1.txt'.IO.lines -> $word {
		next if $res.chars > $word.chars;
		last if $res.chars == $tile.chars; 
		$res = $word if word_exists($tile, $word); 
	}
	say "word found " ~ $res;
	
}

multi sub MAIN(Str $tile where $tile.chars == 7 , Str $word where $word.chars <= 7) {
	say $word, word_exists($tile, $word) ?? " found" !! " not found", " in '$tile'";

}

sub word_exists(Str $tile, Str $word) returns Bool {
	my @letters = $tile.comb;
	my Str $res = "";
	for $word.comb -> $w {
		my Int $i = @letters.first: $w, :k;
		$i = @letters.first: '?', :k unless defined $i;;
		next unless defined $i;
		$res = $res ~ @letters[$i];	
		@letters = map @letters.keys : { @letters[$_] if $_ != $i }
	}
	return  $res.chars == $word.chars;
}

