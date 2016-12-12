use v6;

sub MAIN(Str $letters, Str $word) {
	say $word, word_exists($letters, $word) ?? " found" !! " not found", " in '$letters'";

	sub word_exists(Str $letters, Str $word) returns Bool {
		my @letters = $letters.comb;
		my Str $res = "";
		for $word.comb -> $w {
			my Int $i = @letters.first: $w, :k, :end;
			$i = @letters.first: '?', :k unless defined $i;
			if (defined $i) {
				$res = $res ~ @letters[$i];	
				@letters = map @letters.keys : { @letters[$_] if $_ != $i }
			}
		}
		
		return  $res.chars == $word.chars
	}
}
