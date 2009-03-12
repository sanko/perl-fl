#!perl -I../blib/lib -I../blib/arch -I../blib/arch/FLTK/FLTK
use strict;
use warnings;

#
use FLTK qw[:boxtypes :fonts :labeltypes];

#
my $window = new Fl::Window(300, 180);
my $box = new Fl::Box(FL_UP_BOX, 20, 40, 260, 100, "Hello, World!");
$box->labelfont(FL_BOLD + FL_ITALIC);
$box->labelsize(36);
$box->labeltype(FL_SHADOW_LABEL);
$window->end();
$window->show();
exit Fl::run();

=pod

=head1 NAME

hello.pl - Run of the mill "Hello, World!" example script

=head1 Description



See also basics.pod

=cut
