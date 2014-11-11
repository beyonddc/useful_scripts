#!/usr/bin/perl -w

#-----------------------------------------------------------------------------#
# This script will loop thru all jar files in a directory and grep for the input you provided
#-----------------------------------------------------------------------------#

use File::Find;
use Socket;
use Sys::Hostname;

my $dir = $ARGV[0];
my $search_string = $ARGV[1];

if ($dir eq "--help") {

    my $basename = basename($0);
    print "Usage: $basename DIR SEARCH_STRING\n";

} else {

    print "Search JAR will perform in $dir\n";

    opendir(DIR, "$dir");

    @files = grep(/\.jar$/,readdir(DIR));
    closedir(DIR);

    foreach $file(@files) {
        print ("Searching $dir/$file ...\n");
        system("jar tvf $dir/$file | grep $search_string;"); 
    }
}
