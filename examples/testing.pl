#!perl -I../blib/lib -I../blib/arch -I../blib/arch/FLTK/FLTK
use strict;
use warnings;
#use FLTK qw[:boxtypes :align];

use FLTK;

#
$|++;
my $window = new Fl::Window(300, 600);
#$window->box(FL_FLAT_BOX);
$window->color(0);
my @input;
push @input, new Fl::Slider(45, 0, 20, 512);
push @input, new Fl::Value::Slider(65, 0, 35, 512);
for (@input) {

    #$_->maximum();
    $_->value(0);
    $_->range(0, 255);
    $_->callback(
        sub {
            my $value = $_[0]->value;
            for (@input) {
                $_->value($_[0]->value) if $_ ne $_[0];
                $_->color(255 - $value);
            }
            $window->color($value);
            $window->redraw;
        },
        0
    );
}
$window->resizable($window);
$window->end();
$window->show();
Fl::run();
__END__
# Callbacks
sub beepcb { print "\007";
warn $_[0]->x;
warn $_[0]->y;
    shift->position(5, 5);

    }
sub exitcb { exit 0; }

#
my $window = new Fl::Window(320, 65);
my $b1 = new Fl::Button(20, 20, 80, 25, "&Beep");
$b1->callback(\&beepcb, 0);
new Fl::Button(120, 20, 80, 25, "&no op");
my $b3 = new Fl::Button(220, 20, 80, 25, "E&xit");
$b3->callback(\&exitcb, 0);





$window->end();
$window->show();
Fl::run();
__END__

my $window = new Fl::Window(500, 850);




my @input;

# I/O
push @input, new Fl::Input(30, 20, 180, 25, "&no op");
push @input, new Fl::Output(30, 50, 180, 25, "&no op");
push @input, new Fl::Multiline::Input(30, 80, 180, 225, "&no op");
push @input, new Fl::Multiline::Input(30, 80, 180, 225, "&no op");
push @input, new Fl::Multiline::Output(30, 310, 180, 225, "&no op");
push @input, new Fl::Text::Display(220, 20, 180, 225, "&no op");
push @input, new Fl::Text::Editor(220, 260, 180, 225, "&no op");
push @input, new Fl::Help::View(220, 500, 180, 225, "&no op");

for (0 .. 7) {
    $input[$_]->value($_ . " | " . time);
}

# Valuators
push @input, new Fl::Counter(220, 730, 180, 20);
push @input, new Fl::Dial(220, 755, 30, 30);
push @input, new Fl::Roller(255, 755, 30, 30);
push @input, new Fl::Scrollbar(20, 600, 20, 180);
push @input, new Fl::Slider(45, 600, 20, 180);
push @input, new Fl::Value::Slider(65, 600, 35, 180);
for (8 .. $#input) {
    warn $input[$_]->maximum();
    $input[$_]->value(50);
    $input[$_]->range(1, 100);
}

#
$window->show();
Fl::run();



