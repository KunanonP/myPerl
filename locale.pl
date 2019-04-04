#!/usr/bin/perl
# 32547 UNIX Systems Programming, Autumn 2018
# Kunanon Pititheerachot - 12634123

$myArg = scalar(@ARGV);
$count = 0;

if ($myArg == 0){
	die "\nplease enter arguments.\n\n";
}

if($ARGV[0] eq "-a"){
	open(FILE, $ARGV[1]) or die;
	while (<FILE>){
		chomp;
		split(/,/);
		if($_[0] eq "locale"){
			$count++;
		}
	}
	close(FILE);
	if($count > 0){
		print "\nAvailable locales:\n"; 
		open(FILE, $ARGV[1]) or die;
		while(<FILE>){
			split(/,/);
			if($_[0] eq "locale"){
				print $_[2]."\n";
			}
		}
		close(FILE);
		print "\n";
	}else{
		print "\nNo locales available\n\n";
	}
}elsif($ARGV[0] eq "-m"){
	open(FILE, $ARGV[1]) or die;
	while(<FILE>){
		chomp;
		split(/,/);
		if($_[0] eq "charmap"){
			$count++;
		}
	}
	close(FILE);
	if($count > 0){
		print "\nAvailable charmaps:\n";
		open(FILE, $ARGV[1]) or dir;
		while(<FILE>){
			chomp;
			split(/,/);
			if($_[0] eq "charmap"){
				print $_[2]."\n";
			}
		}
		close(FILE);
		print "\n";
	}else{
		print "\nNo charmaps available\n\n";
	}
}elsif($ARGV[0] eq "-s"){
	open(FILE, $ARGV[1]) or die;
	while(<FILE>){
		chomp;
		split(/,/);
		if($_[0] eq "locale"){
				$count += $_[3];
		}
	}
	close(FILE);
	if($count > 0){
		print "\nTotal size in bytes of all locales: ".$count."\n\n";
	}else{
		print "\nTotal size in bytes of all locales: 0\n\n";
	}
}elsif($ARGV[0] eq "-l"){
	open(FILE, $ARGV[2]) or die;
	while(<FILE>){
		chomp;
		split(/,/);
		if($_[1] eq $ARGV[1]){
			$count++; 
		}
	}
	close(FILE);
	if($count > 0){
		my $myLocale = 0;
		my $myCharmap = 0;	
		print "\nLanguage ".$ARGV[1];
		open(FILE, $ARGV[2]) or die;
		while(<FILE>){
			chomp;
			split(/,/);
			if($_[1] eq $ARGV[1] and $_[0] eq "locale" ){
				$myLocale++;
			}elsif($_[1] eq $ARGV[1] and $_[0] eq "charmap"){
				$myCharmap++;
			}
		}
		close(FILE);
		print "\nTotal number of locales: ".$myLocale."\n";
		print "Total number of charmaps: ".$myCharmap."\n\n";
	}else{
		print "\nNo locales or charmaps in this language\n\n";
	}
}elsif($ARGV[0] eq "-v"){
	print "\nStudent Name:    Kunanon\n";
	print "Student Surname: Pititheerachot\n";
	print "Student ID:      12634123\n\n";
}else{
	print "\nInvalid command syntax\n\n";
}
