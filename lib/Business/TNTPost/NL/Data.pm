package Business::TNTPost::NL::Data;
use strict;
use base 'Exporter';
use vars qw($VERSION @EXPORT @EXPORT_OK %EXPORT_TAGS);

use Carp;
use YAML;

$VERSION   = 0.01;
@EXPORT    = qw();
@EXPORT_OK = qw(zones table);
%EXPORT_TAGS = ("ALL" => [@EXPORT_OK]);

sub zones {
   my %zones = (
      0 => [ qw(NL) ],
      1 => [ qw(BE LU) ],
      2 => [ qw(DK DE FR IT AT ES GB SE) ],
      3 => [ qw(EE FI HU IE LV LT PL PT SI SK CZ) ],
      4 => [ qw(AL AD BA BG CY FO GI GR GL IS HR LI MK MT MD ME NO UA RO SM RS 
                TR VA RU CH) ],
   );
   my %z;
   foreach my $key (keys %zones) {
      foreach my $val (@{$zones{$key}}) {
         $z{$val} = $key;
      }
   }
   return \%z;
}

sub table {
my $table = Load(<<'...');
---
# Netherlands
netherlands:
  # Letters (brievenbuspost)
  small:
    stamp:
      '0,19': 0.44
      '20,49': 0.88
      '50,99': 1.32
      '100,249': 1.76
      '250,499': 2.20
      '500,1999': 2.64
      '2000,3000': 2.64
    machine:
      '0,19': 0.43
      '20,49': 0.78
      '50,99': 1.13
      '100,249': 1.48
      '250,499': 1.88
      '500,2000': 2.22
  # Parcels (paketten)
  large:
    stamp: 
      '0,10000': 6.20
    machine:
      '0,10000': 6.20
  # Register (aangetekend)
  register:
    stamp:
      '0,999': 6.45
      '1000,4999': 7.00
      '5000,10000': 8.70
    machine:
      '0,999': 6.25
      '1000,4999': 6.80
      '5000,10000': 8.50
# Outside of the Netherlands
world:
  basic:
    # Within Europe (zone 1..4)
    europe:
      # Letters (brievenbuspost)
      small:
        priority:
          '0,19': 0.72
          '20,49': 1.44
          '50,99': 2.16
          '100,249': 2.88
          '250,499': 5.48
          '500,999': 8.64
          '1000,2000': 10.80
        standard: 
          '0,19': 0.67
          '20,49': 1.21
          '50,99': 1.76
          '100,249': 2.45
          '250,499': 4.02
          '500,999': 6.47
          '1000,2000': 8.04
      # Internationaal Pakket Basis
      large:
        priority:
          '0,249': 4.10
          '250,499': 5.70
          '500,2000': 11.00
        standard: 
          '0,249': 3.25
          '250,499': 4.25
          '500,2000': 8.00
    # Outside Europe
    world: 
      # Letters (brievenbuspost)
      small:
        priority:
          '0,19': 0.89
          '20,49': 1.78
          '50,99': 2.67
          '100,249': 5.34
          '250,499': 10.68
          '500,999': 20.47
          '1000,2000': 21.36
      # Internationaal Pakket Basis
      large:
        priority:
          '0,249': 7.00
          '250,499': 11.00
          '500,2000': 21.50
        standard: 
          '0,249': 4.70
          '250,499': 8.00
          '500,2000': 13.50
  # Internationaal Pakket Plus (Track&Trace)
  plus: 
    zone:
      1: 
        '0,1999': 11.45
        '2000,4999': 16.45
        '5000,9999': 20.95
        '10000,19999': 27.95
        '20000,30000': 33.26
      2: 
        '0,1999': 12.45
        '2000,4999': 18.45
        '5000,9999': 23.95
        '10000,19999': 32.45
        '20000,30000': 38.62
      3: 
        '0,1999': 17.45
        '2000,4999': 22.45
        '5000,9999': 28.45
        '10000,19999': 36.95
        '20000,30000': 43.97
      4: 
        '0,1999': 17.45
        '2000,4999': 22.25
        '5000,9999': 28.95
        '10000,20000': 38.45
      # Outside of Europe, Priority/Economy allowed
      5: 
        priority: 
          '0,1999': 22.45
          '2000,4999': 31.45
          '5000,9999': 52.95
          '10000,20000': 98.45
        economy: 
          '0,1999': 17.95
          '2000,4999': 22.95
          '5000,9999': 34.95
          '10000,20000': 53.45
  # Register ("aangetekend")
  register:
    europe:
      '0,99': 7.10
      '100,249': 7.10
      '250,499': 8.30
      '500,999': 11.00
      '1000,2000': 11.75
    world:
      '0,99': 7.40
      '100,249': 8.95
      '250,499': 14.20
      '500,999': 22.05
      '1000,2000': 22.25
...
   return $table;
}

#################### main pod documentation begin ###################
=head1 NAME

Business::TNTPost::NL::Data - Shipping cost data for Business::TNTPost::NL

=head1 DESCRIPTION

Data module for Business::TNTPost::NL containing shipping cost
information, country zones etc.

Nothing to see here, the show is over, move along please

=head1 AUTHOR

M. Blom, 
E<lt>blom@cpan.orgE<gt>, 
L<http://menno.b10m.net/perl/>

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

L<Business::TNTPost::NL>, 
L<http://www.tntpost.nl/>

=cut

1;
