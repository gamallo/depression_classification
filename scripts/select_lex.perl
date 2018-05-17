#!/usr/bin/perl -w

##Toma como entrada a saída do FreeLing e devolve um texto etiquetado com algumas modificaçoes: verbos compostos, elimina determinantes e pronomes, etc.

$file = shift(@ARGV);
open (FILE, $file) or die "O ficheiro nom pode ser aberto: $!\n";

##lendo o lexico
while (my $w = <FILE>) {
   chomp($w);
   $w =~ s/[\s]*$//;
   $w =~ s/ /_/g;
   $MW{$w}++;
   #print STDERR "#$w#\n";
}

$separador = "\n\.\n" ;
$/ = $separador;


while (my $sent = <STDIN>) {
  my $Found=0;
  my @sent = split ('\n', $sent);
 # print STDERR "#$sent#\n";
   for ($i=0;$i<=$#sent;$i++) {
     if (!$sent[$i]){next}
     #($pal, $lema, $tag) = split(" ", $sent[$i]);
     $sent[$i] =~ s/[\s]*$//;
     $Pal[$i] = $sent[$i];
    
   }
  

    foreach my $mw (keys %MW) {
     my @mw = split ("_", $mw);
     my $n = $#mw;
     #print STDERR "---#$mw# -- #$n#\n"; 
     for ($i=0;$i<=$#Pal;$i++) {
      # print STDERR "---#$Pal[$i]# #$mw#\n" ;
      $match=0;
      $k=$i;
      for ($j=0;$j<=$n;$j++) {
       #  print STDERR "---#$mw[$j]#  #$j#-- #$Pal[$k]# #$k#\n" ;
        if (!$mw[$j] || !$Pal[$k]){next}
        if ($mw[$j] ne $Pal[$k]) {
          last
	}
	elsif ($mw[$j] eq $Pal[$k]) {
	    $match++;
            # print STDERR "$j $k #$mw[$j]# :: #$Pal[$k]# = #$match# $n\n";
	}
        $k=$k+1;

       
     }
    ###hai que construir o vector inteiro e despois percorrer com os mw.
     #print STDERR "#$match# --> #$n#\n";
     if ($match == $n+1) {
        $Pal[$i] = "$mw\tDEPR";
    
        $k= $i+1;
        for ($j=$k;$j<$k+$n;$j++) {
            #print STDERR "##$Pal[$j]##\n";
	    #delete $Pal[$j];
  	    #delete $Lema[$j];
	    #delete $Tag[$j];
            $Pal[$j] = "<nao>";
  	    
	}
	$i = $i+$n;
       
       # $Found=1;
        #print STDERR "MW: #$mw# #$i#\n";
    }
   }
  
   
   } 
   #if ($Found && @Pal) {
    for ($i=0;$i<=$#Pal;$i++) {
	if (!$Pal[$i] || $Pal[$i] eq "<nao>") {next}
       print "$Pal[$i]\n";
    }
  #}
   undef @Pal;

}
