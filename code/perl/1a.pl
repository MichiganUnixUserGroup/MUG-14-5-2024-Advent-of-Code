#!/usr/bin/perl -w

use strict;

#
# This is expecting the datafile to be in the current directory with a name of 'data.txt'
#
open( my $FH, '<', 'data.txt' ) or die( "Failed open: $!\n" );

my $total = 0;

#
# Read each line of the file
#
while( my $line = <$FH> ){          # Loop through each line of the file

  #
  # For each line, initialize the first and last digit variables
  #
  my $first_dig = '';
  my $last_dig  = '';

  #
  # Split the line into a list of characters, then loop through them
  #
  foreach my $ch ( split //, $line ){
    #
    # See if the character is a digit
    #
    if( $ch =~ m/\d/ ){
      #
      # If we don't yet have a first char, then set it
      #
      $first_dig = $ch if( $first_dig eq '' );

      #
      # As we progress through the line, set last_dig = current digit
      #
      $last_dig  = $ch;
    }
  }
  my $num_str = $first_dig . $last_dig;   # Concatenate the digits into a string
  $total += int( $num_str );              # Convert string to integer and add it to the total
}

close( $FH );

print( "total: $total\n" );
