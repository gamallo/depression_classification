#!/usr/bin/perl -w


my $N=0;
my $tokens=0;
my $tokens_pos=0;
my $pos=0;
while (my $line = <STDIN>) {
  chomp $line;
  my ($token, $tag) = split ('\t', $line);
  if ($tag && $tag eq "DEPR") {
      $Type_pos{$token}++;
      $tokens_pos++;
  } 
  $tokens++;
  $Type{$token}++;
}

foreach my $type (keys %Type) {
   $N++;
   if ($Type_pos{$type}) {
       $pos++;
   } 
}


$av_types = $pos / $N;
#$av_tokens = $tokens_pos / $tokens;

#$average = ($av_types + $av_tokens) / 2;

#printf "%s\t%.5f\n", $file, $average ;
printf "%.5f\n", $av_types ;
