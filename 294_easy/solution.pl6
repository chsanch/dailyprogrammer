use v6;

my $letter = "ladilmy";
my $word   = "daily";

for $word.comb -> $w {
    say $w ~" exists";
}
