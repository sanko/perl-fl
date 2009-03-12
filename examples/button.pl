#!perl -I../blib/lib -I../blib/arch -I../blib/arch/FLTK/FLTK
use strict;
use warnings;
use FLTK;
sub beepcb { warn "\007"; }
sub exitcb { exit 0; }
my $window = new Fl::Window(320, 65);
my $b1 = new Fl::Button(20, 20, 80, 25, "&Beep");
$b1->callback(\&beepcb, 0);
new Fl::Button(120, 20, 80, 25, "&no op");
my $b3 = new Fl::Button(220, 20, 80, 25, "E&xit");
$b3->callback(\&exitcb, 0);
$window->end();
$window->show();
Fl::run();
