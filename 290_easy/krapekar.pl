use Modern::Perl '2015';
my $a = $ARGV[0];
my $b = $ARGV[1];

die $a . " > " . $b if $a > $b;

my @kaprekars;
for ( $a .. $b ) {
    my $sqr = $_ * $_;
    my $result = get_kaprekar( $_, $sqr ) if length $sqr >= 2;
    push @kaprekars, $result if $result;
}

say "Kaprekars numbers between ", $a, " and ", $b, " are: ", join ", ",
  @kaprekars;

sub get_kaprekar {
    my $num  = shift;
    my $sqr  = shift;
    my $acc  = "";
    my @nums = split( '', $sqr );
    for my $i ( 0 .. scalar @nums - 1 ) {
        my @temp = @nums;
        my ( $sum, $kaprekar, $left ) = 0;
        $acc      = $acc . "" . $nums[$i];
        $left     = join( "", splice( @temp, $i + 1 ) );
        $sum      = $acc + $left if ( $left and $left > 0 );
        $kaprekar = $sum if $sum == $num;
        return $kaprekar if $kaprekar;
    }
}
