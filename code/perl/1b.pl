#!/usr/bin/perl -w

use strict;

#
# This is expecting the datafile to be in the current directory with a name of 'data.txt'
#
open( my $FH, '<', 'data.txt' ) or die( "Failed open: $!\n" );

my $total = 0;

#
# read each line of the file
#
while( my $line = <$FH> ){
  #
  # Search the line to find the LAST digit or word that represents a digit
  # Notice how the regex is anchored at the beginning of the line.
  #
  $line         =~ m/^.*?(\d|one|two|three|four|five|six|seven|eight|nine)/;
  my $first_dig = get_dig( $1 );   # Lookup in our table to find the value of the word

  #
  # Search the line to find the LAST digit or word that represents a digit
  # Notice how the regex is anchored at the end of the line.
  #
  $line         =~ m/.*(\d|one|two|three|four|five|six|seven|eight|nine).*?$/;
  my $last_dig  = get_dig( $1 );   # Lookup in our table to find the value of the word

  #
  # Concatenate the two digits together as a string
  #
  my $num_str   = $first_dig . $last_dig;   # ex: '2' . '9' = '29'

  #
  # Convert the string to an integer and add it to the accumulating total
  #
  $total += int( $num_str );
}

close( $FH );

print( "total: $total\n" );

#------------------------------------------------------------------------------------------

sub get_dig {
  my $str = shift;

  my $value = {
                '0'     => '0',
                '1'     => '1',
                '2'     => '2',
                '3'     => '3',
                '4'     => '4',
                '5'     => '5',
                '6'     => '6',
                '7'     => '7',
                '8'     => '8',
                '9'     => '9',
                'one'   => '1',
                'two'   => '2',
                'three' => '3',
                'four'  => '4',
                'five'  => '5',
                'six'   => '6',
                'seven' => '7',
                'eight' => '8',
                'nine'  => '9',
              }->{$str};

  return $value;
}
