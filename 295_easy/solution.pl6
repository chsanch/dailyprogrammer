use v6;

sub MAIN(Str $input1, Str $input2 where *.chars == $input1.chars) {
	say $input1;
	my @a = $input1.comb;
	my @b = $input2.comb;
	for  @a.keys -> $i {
		@a[$i] = @b[$i] and say @a.join('') if @b[$i] ne @a[$i];
	}
}
