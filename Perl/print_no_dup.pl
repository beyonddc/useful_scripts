#!/usr/bin/perl -w
#-----------------------------------------------------------------------------#
# This script read, remove all duplication, sort each line then print it
#-----------------------------------------------------------------------------#

use File::Basename;

my $filename = $ARGV[0];

if ($filename eq "--help") {

    my $basename = basename($0);
    print "Usage: $basename FILENAME\n";

} else {

    print "#-----------------------------------------------------------------------------#\n";
    print "#-----------------------------------------------------------------------------#\n";
    print "Opening file $filename\n";
    print "#-----------------------------------------------------------------------------#\n";
    print "#-----------------------------------------------------------------------------#\n";

    open (FILE, "<$filename") or die "Couldn't open $filename, $!\n";

    my %hash = ();
    while (<FILE>) {
        $hash{$_} = $_;
    }
    close (FILE);

    for my $key (sort keys %hash) {
        print "$hash{$key}";
    }
}
