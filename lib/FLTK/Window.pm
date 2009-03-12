
package FLTK::Window;
use strict;
use warnings;

use version; our $VERSION = qw[0.001_001];

require DynaLoader;

our @ISA = qw[DynaLoader];


bootstrap FLTK::Window  ;

#sub AUTOLOAD {
#    warn join q[, ], @_;
#    #warn FLTK::hello();
#}

#bootstrap FLTK $VERSION;

1;

=head1 NAME

FLTK - A wrapper for installing the FLTK Perl bindings

=head1 DESCRIPTION

FLTK is a wrapper to install the FLTK bindings for Perl.

It comes with a copy of FLTK 1.3.X which it will be compiled.

=head1 BUGS and FEEDBACK

Please send bug reports, problems and feedback to...

=head1 Author

Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

CPAN ID: SANKO

=head1 License and Legal

Copyright (C) 2009 by Sanko Robinson E<lt>sanko@cpan.orgE<gt>

This program is free software; you can redistribute it and/or modify
it under the terms of The Artistic License 2.0.  See the F<LICENSE>
file included with this distribution or
http://www.perlfoundation.org/artistic_license_2_0.  For
clarification, see http://www.perlfoundation.org/artistic_2_0_notes.

When separated from the distribution, all POD documentation is covered
by the Creative Commons Attribution-Share Alike 3.0 License.  See
http://creativecommons.org/licenses/by-sa/3.0/us/legalcode.  For
clarification, see http://creativecommons.org/licenses/by-sa/3.0/us/.

=for svn $Id: Window.pm 50cb1f3 2009-03-12 06:02:40Z sanko@cpan.org $

=cut

1;
__END__

