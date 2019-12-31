#!/usr/bin/perl -w
#-----------------------------------------------------------------------------#
# This script search all files listed in a plain text file in a directory 
#-----------------------------------------------------------------------------#

use File::Basename;

my $filename = $ARGV[0];
my $dirname = $ARGV[1];

if ($filename eq "--help") {

    my $basename = basename($0);
    print "Usage: $basename FILENAME DIRNAME\n";

} else {

    print "#-----------------------------------------------------------------------------#\n";
    print "#-----------------------------------------------------------------------------#\n";
    print "Opening file $filename\n";
    print "#-----------------------------------------------------------------------------#\n";
    print "#-----------------------------------------------------------------------------#\n";

    open (FILE, "<$filename") or die "Couldn't open $filename, $!\n";

    while (<FILE>) {
        $file = basename($_);
        system("find $dirname -name $file"); 
    }
    close (FILE);
}
