#!perl -I../blib/lib -I../blib/arch -I../blib/arch/FLTK/FLTK
use strict;
use warnings;
use FLTK qw[:buttontypes];
my $window = new Fl::Window(320, 130);
new Fl::Button(10, 10, 130, 30, 'Fl_Button')->tooltip('This is a Tooltip.');
new Fl::Return::Button(150, 10, 160, 30, 'Fl_Return_Button');
new Fl::Repeat::Button(10, 50, 130, 30, 'Fl_Repeat_Button');
new Fl::Light::Button(10, 90, 130, 30, 'Fl_Light_Button');
new Fl::Round::Button(150, 50, 160, 30, 'Fl_Round_Button');
new Fl::Check::Button(150, 90, 160, 30, 'Fl_Check_Button');
$window->end();
$window->show();
Fl::run();
