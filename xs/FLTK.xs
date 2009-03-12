#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#include "./ppport.pl"

#include <FL/Fl.H>

#include "./FLTK_Enumerations.H"

void cb (Fl_Widget * widget, void * sub) {
    AV *cbargs = (AV *)sub;
    I32 alen = av_len(cbargs);
    CV *thecb = (CV *)SvRV(*av_fetch(cbargs, 0, 0));

    dSP;
    ENTER;
    SAVETMPS;

    PUSHMARK(sp);
    for(int i = 1; i <= alen; i++) {
        XPUSHs(*av_fetch(cbargs, i, 0));
    }

    PUTBACK;
    call_sv((SV*)thecb, G_DISCARD);

    FREETMPS;
    LEAVE;
}

MODULE = FLTK               PACKAGE = Fl

int
run()
    CODE:
        RETVAL = Fl::run();
    OUTPUT:
        RETVAL


# Groups
INCLUDE: FLTK_Group.xsi

# Widgets
INCLUDE: FLTK_Widget.xsi

INCLUDE: FLTK_Box.xsi

INCLUDE: FLTK_Button.xsi
INCLUDE: FLTK_Round_Button.xsi
INCLUDE: FLTK_Check_Button.xsi
INCLUDE: FLTK_Light_Button.xsi
INCLUDE: FLTK_Repeat_Button.xsi
INCLUDE: FLTK_Return_Button.xsi

INCLUDE: FLTK_Input.xsi
INCLUDE: FLTK_Output.xsi
INCLUDE: FLTK_Multiline_Input.xsi
INCLUDE: FLTK_Multiline_Output.xsi
INCLUDE: FLTK_Text_Display.xsi
INCLUDE: FLTK_Text_Editor.xsi
INCLUDE: FLTK_Help_View.xsi

INCLUDE: FLTK_Valuator.xsi
INCLUDE: FLTK_Counter.xsi
INCLUDE: FLTK_Dial.xsi
INCLUDE: FLTK_Roller.xsi
INCLUDE: FLTK_Scrollbar.xsi
INCLUDE: FLTK_Slider.xsi
INCLUDE: FLTK_Value_Slider.xsi


INCLUDE: FLTK_Text_Buffer.xsi

INCLUDE: FLTK_Window.xsi
