#!perl -I../blib/lib -I../blib/arch -I../blib/arch/FLTK/FLTK
package FLTK;
use strict;
use warnings;

#
my $VERSION = qw[0.001_001];

#
use parent 'DynaLoader';

#
use vars qw[@EXPORT_OK %EXPORT_TAGS];
use Exporter qw[];
*import = *import = *Exporter::import;
%EXPORT_TAGS = (
    boxtypes => [
        qw[ FL_NO_BOX               FL_FLAT_BOX             FL_UP_BOX
            FL_DOWN_BOX             FL_UP_FRAME             FL_DOWN_FRAME
            FL_THIN_UP_BOX          FL_THIN_DOWN_BOX        FL_THIN_UP_FRAME
            FL_THIN_DOWN_FRAME      FL_ENGRAVED_BOX         FL_EMBOSSED_BOX
            FL_ENGRAVED_FRAME       FL_EMBOSSED_FRAME       FL_BORDER_BOX
            FL_SHADOW_BOX           FL_BORDER_FRAME        FL_SHADOW_FRAME
            FL_ROUNDED_BOX         FL_RSHADOW_BOX         FL_ROUNDED_FRAME
            FL_RFLAT_BOX           FL_ROUND_UP_BOX        FL_ROUND_DOWN_BOX
            FL_DIAMOND_UP_BOX      FL_DIAMOND_DOWN_BOX    FL_OVAL_BOX
            FL_OSHADOW_BOX         FL_OVAL_FRAME          FL_OFLAT_BOX
            FL_PLASTIC_UP_BOX      FL_PLASTIC_DOWN_BOX
            FL_PLASTIC_UP_FRAME    FL_PLASTIC_DOWN_FRAME
            FL_PLASTIC_THIN_UP_BOX FL_PLASTIC_THIN_DOWN_BOX
            FL_PLASTIC_ROUND_UP_BOX
            FL_PLASTIC_ROUND_DOWN_BOX                      FL_GTK_UP_BOX
            FL_GTK_DOWN_BOX       FL_GTK_UP_FRAME         FL_GTK_DOWN_FRAME
            FL_GTK_THIN_UP_BOX    FL_GTK_THIN_DOWN_BOX
            FL_GTK_THIN_UP_FRAME  FL_GTK_THIN_DOWN_FRAME
            FL_GTK_ROUND_UP_BOX   FL_GTK_ROUND_DOWN_BOX    FL_FREE_BOXTYPE]
    ],
    buttontypes => [qw[YYY]],
    fonts       => [
        qw[ FL_HELVETICA    FL_HELVETICA_BOLD   FL_HELVETICA_ITALIC
            FL_HELVETICA_BOLD_ITALIC
            FL_COURIER      FL_COURIER_BOLD     FL_COURIER_ITALIC
            FL_COURIER_BOLD_ITALIC
            FL_TIMES        FL_TIMES_BOLD       FL_TIMES_ITALIC
            FL_TIMES_BOLD_ITALIC
            FL_SYMBOL
            FL_SCREEN       FL_SCREEN_BOLD      FL_ZAPF_DINGBATS
            FL_FREE_FONT    FL_BOLD             FL_ITALIC
            FL_BOLD_ITALIC]
    ],
    labeltypes => [
        qw[ FL_NORMAL_LABEL   FL_NO_LABEL    FL_SHADOW_LABEL FL_ENGRAVED_LABEL
            FL_EMBOSSED_LABEL FL_MULTI_LABEL FL_ICON_LABEL   FL_IMAGE_LABEL]
    ],
    align => [qw[AAA]]
);
@EXPORT_OK = sort map {@$_} values %EXPORT_TAGS;
$EXPORT_TAGS{'all'} = \@EXPORT_OK;
bootstrap FLTK $VERSION;
###################################################################### Fonts #
sub FL_HELVETICA ()            {0}
sub FL_HELVETICA_BOLD ()       {1}
sub FL_HELVETICA_ITALIC ()     {2}
sub FL_HELVETICA_BOLD_ITALIC() {3}
sub FL_COURIER ()              {4}
sub FL_COURIER_BOLD ()         {5}
sub FL_COURIER_ITALIC ()       {6}
sub FL_COURIER_BOLD_ITALIC ()  {7}
sub FL_TIMES ()                {8}
sub FL_TIMES_BOLD ()           {9}
sub FL_TIMES_ITALIC ()         {10}
sub FL_TIMES_BOLD_ITALIC ()    {11}
sub FL_SYMBOL ()               {12}
sub FL_SCREEN ()               {13}
sub FL_SCREEN_BOLD ()          {14}
sub FL_ZAPF_DINGBATS ()        {15}
sub FL_FREE_FONT ()            {16}
sub FL_BOLD ()                 {1}
sub FL_ITALIC ()               {2}
sub FL_BOLD_ITALIC ()          {3}
################################################################## Box types #
sub FL_NO_BOX ()                 {0}
sub FL_FLAT_BOX ()               {1}
sub FL_UP_BOX ()                 {2}
sub FL_DOWN_BOX ()               {3}
sub FL_UP_FRAME ()               {4}
sub FL_DOWN_FRAME ()             {5}
sub FL_THIN_UP_BOX ()            {6}
sub FL_THIN_DOWN_BOX ()          {7}
sub FL_THIN_UP_FRAME ()          {8}
sub FL_THIN_DOWN_FRAME ()        {9}
sub FL_ENGRAVED_BOX ()           {10}
sub FL_EMBOSSED_BOX ()           {11}
sub FL_ENGRAVED_FRAME ()         {12}
sub FL_EMBOSSED_FRAME ()         {13}
sub FL_BORDER_BOX ()             {14}
sub FL_SHADOW_BOX ()             {15}
sub FL_BORDER_FRAME ()           {16}
sub FL_SHADOW_FRAME ()           {17}
sub FL_ROUNDED_BOX ()            {18}
sub FL_RSHADOW_BOX ()            {19}
sub FL_ROUNDED_FRAME ()          {20}
sub FL_RFLAT_BOX ()              {21}
sub FL_ROUND_UP_BOX ()           {22}
sub FL_ROUND_DOWN_BOX ()         {23}
sub FL_DIAMOND_UP_BOX ()         {24}
sub FL_DIAMOND_DOWN_BOX ()       {25}
sub FL_OVAL_BOX ()               {26}
sub FL_OSHADOW_BOX ()            {27}
sub FL_OVAL_FRAME ()             {28}
sub FL_OFLAT_BOX ()              {29}
sub FL_PLASTIC_UP_BOX ()         {30}
sub FL_PLASTIC_DOWN_BOX ()       {31}
sub FL_PLASTIC_UP_FRAME ()       {32}
sub FL_PLASTIC_DOWN_FRAME ()     {33}
sub FL_PLASTIC_THIN_UP_BOX ()    {34}
sub FL_PLASTIC_THIN_DOWN_BOX()   {35}
sub FL_PLASTIC_ROUND_UP_BOX()    {36}
sub FL_PLASTIC_ROUND_DOWN_BOX () {37}
sub FL_GTK_UP_BOX ()             {38}
sub FL_GTK_DOWN_BOX ()           {39}
sub FL_GTK_UP_FRAME ()           {40}
sub FL_GTK_DOWN_FRAME()          {41}
sub FL_GTK_THIN_UP_BOX ()        {42}
sub FL_GTK_THIN_DOWN_BOX()       {43}
sub FL_GTK_THIN_UP_FRAME()       {44}
sub FL_GTK_THIN_DOWN_FRAME()     {45}
sub FL_GTK_ROUND_UP_BOX()        {46}
sub FL_GTK_ROUND_DOWN_BOX ()     {47}
sub FL_FREE_BOXTYPE ()           {48}
################################################################ Label types #
sub FL_NORMAL_LABEL ()   {0}
sub FL_NO_LABEL ()       {1}
sub FL_SHADOW_LABEL ()   {2}
sub FL_ENGRAVED_LABEL () {3}
sub FL_EMBOSSED_LABEL () {4}
sub FL_MULTI_LABEL ()    {5}
sub FL_ICON_LABEL ()     {6}
sub FL_IMAGE_LABEL ()    {7}
#################################################################### Classes #
@Fl::Box::ISA = @Fl::Window::ISA = qw[Fl::Group];
@Fl::Group::ISA = @Fl::Button::ISA = @Fl::Valuator::ISA = qw[Fl::Widget];
@Fl::Slider::ISA         = @Fl::Value::Slider::ISA  = qw[Fl::Valuator];
@Fl::Return::Button::ISA = @Fl::Repeat::Button::ISA = @Fl::Light::Button::ISA
    = @Fl::Round::Button::ISA = @Fl::Check::Button::ISA = qw[Fl::Button];
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

=for svn $Id: FLTK.pm 50cb1f3 2009-03-12 06:02:40Z sanko@cpan.org $

=cut

1;
__END__

