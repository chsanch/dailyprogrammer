use Modern::Perl '2015';

open( my $fh, '<', 'goldilocks.txt' ) or die "Could not open file $!";

my $goldi_info = <$fh>;
chomp $goldi_info;
my @result;
my ( $weight, $max_temp ) = split " ", $goldi_info;
say "Goldilock's weight: ", $weight, ", maximum temperature of porridge: ",
  $max_temp;
while ( my $line = <$fh> ) {
    chomp $line;
    my ( $capacity, $temp ) = split " ", $line;
    push @result, $. - 1 if ( $capacity >= $weight and $max_temp >= $temp );
}

say "Result: ", join ", ", @result;
