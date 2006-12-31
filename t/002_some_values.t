# -*- perl -*-

use Test::More tests => 5;

use Business::TNTPost::NL;

my $tpg  = Business::TNTPost::NL->new ();
my $cost = $tpg->calculate(
               country => 'DE',
               weight  => '1234',
               priority=> 1
           );
is($cost, '10.80');

$tpg  = Business::TNTPost::NL->new ();
$cost = $tpg->calculate(
               country => 'NL',
               weight  => '234',
               priority=> 0,
               register=> 1,
               machine => 1 
           );
is($cost, '6.25');

$tpg  = Business::TNTPost::NL->new ();
$cost = $tpg->calculate(
               country => 'MX',
               weight  => '666',
               priority=> 1,
               register=> 0,
               machine => 0 
           );
is($cost, '20.47');

$tpg  = Business::TNTPost::NL->new ();
$cost = $tpg->calculate(
               country => 'CH',
               weight  => '6666',
               priority=> 1,
               register=> 1,
               machine => 0 
           );
is($cost, undef);
is($Business::TNTPost::NL::ERROR, '4666 grams too heavy (max: 2000 gr.)');
