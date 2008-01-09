package Business::TNTPost::NL::Data;
use strict;
use base 'Exporter';
use vars qw($VERSION @EXPORT @EXPORT_OK %EXPORT_TAGS);

use Carp;
use YAML;

$VERSION   = 0.03;
@EXPORT    = qw();
@EXPORT_OK = qw(zones table);
%EXPORT_TAGS = ("ALL" => [@EXPORT_OK]);

sub zones {
   my %zones = (
      0 => [ qw(NL) ],
      1 => [ qw(BE LU) ],
      2 => [ qw(DK DE FR IT AT ES GB SE) ],
      3 => [ qw(BG EE FI HU IE LV LT PL PT RO SI SK CZ) ],
      4 => [ qw(AL AD BA CY FO GI GL GR IS HR LI MK MD ME MT NO UA SM RS 
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
      '0,19': 0.42
      '20,49': 0.75
      '50,99': 1.08
      '100,249': 1.41
      '250,499': 1.81
      '500,2000': 2.15
  # Parcels (paketten)
  large:
    stamp: 
      '0,10000': 6.20
    machine:
      '0,10000': 6.20
  # Register (aangetekend)
  register:
    stamp:
      '0,4999': 6.65
      '5000,10000': 8.95
    machine:
      '0,4999': 6.45
      '5000,10000': 8.75
# Outside of the Netherlands
world:
  basic:
    # Within Europe (zone 1..4)
    europe:
      # Letters (brievenbuspost)
      small:
        priority:
          '0,19': 0.75
          '20,49': 1.50
          '50,99': 2.25
          '100,249': 3.00
          '250,499': 6.00
          '500,2000': 9.00
        standard: 
          '0,19': 0.70
          '20,49': 1.40
          '50,99': 2.10
          '100,249': 2.80
          '250,499': 4.20
          '500,2000': 7.00
      # Internationaal Pakket Basis
      large:
        priority:
          '0,499': 5.25
          '500,2000': 11.25
        standard: 
          '0,449': 4.20
          '500,2000': 9.10
    # Outside Europe
    world: 
      # Letters (brievenbuspost)
      small:
        priority:
          '0,19': 0.92
          '20,49': 1.84
          '50,99': 2.76
          '100,249': 5.52
          '250,499': 10.12
          '500,2000': 19.32
      # Internationaal Pakket Basis
      large:
        priority:
          '0,499': 9.00
          '500,2000': 19.50
        standard: 
          '0,499': 7.00
          '500,2000': 17.50
  # Internationaal Pakket Plus (Track&Trace)
  plus: 
    zone:
      1: 
        '0,1999': 11.75
        '2000,4999': 16.95
        '5000,9999': 21.45
        '10000,19999': 28.75
        '20000,30000': 34.21
      2: 
        '0,1999': 12.75
        '2000,4999': 18.95
        '5000,9999': 24.75
        '10000,19999': 33.25
        '20000,30000': 39.57
      3: 
        '0,1999': 17.95
        '2000,4999': 23.25
        '5000,9999': 29.25
        '10000,19999': 37.95
        '20000,30000': 45.16
      4: 
        '0,1999': 17.95
        '2000,4999': 23.75
        '5000,9999': 29.75
        '10000,20000': 39.25
      # Outside of Europe, Priority/Economy allowed
      5: 
        priority: 
          '0,1999': 22.95
          '2000,4999': 32.45
          '5000,9999': 54.45
          '10000,20000': 99.95
        economy: 
          '0,1999': 18.45
          '2000,4999': 24.45
          '5000,9999': 36.95
          '10000,20000': 54.95
  # Register ("aangetekend")
  register:
    europe:
      '0,499': 7.50
      '500,2000': 12.00
    world:
      '0,99': 9.00
      '100,499': 10.50
      '500,2000': 21.00
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
