#!/usr/bin/perl -w
#-----------------------------------------------------------------------------#
# This script add the dimension of the image as prefix
#-----------------------------------------------------------------------------#

use File::Basename;
use IMage::Magick;

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

    while (<FILE>) {
	chomp($_);
	if (-e $_) {
	#print "Reading '$_'\n";
        $magick = Image::Magick->new;
	$magick->Read($_);
	$width = $magick->Get('width');
	$height = $magick->Get('height');
	$dirname = dirname($_);
	$filename = basename($_);
	$newfilename = "$dirname/[${width}x${height}]_$filename";
	
	#print "New file name '$newfilename'\n";
	print "mv \"$_\" \"$newfilename\"\n";
	}
    }
    close (FILE);
}
