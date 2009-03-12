#include <FL/Enumerations.H>

Fl_Labeltype
lookup_label( int i ) {
    switch ( i ) {
    case 0: { // draws the text (0)
        return FL_NORMAL_LABEL;
        break;
    }
    case 1: { // does nothing
        return FL_NO_LABEL;
        break;
    }
    case 2: { // draws a drop shadow under the text
        return FL_SHADOW_LABEL;
        break;
    }
    case 3: { // draws edges as though the text is engraved
        return FL_ENGRAVED_LABEL;
        break;
    }
    case 4: { // draws edges as thought the text is raised
        return FL_EMBOSSED_LABEL;
        break;
    }
    case 5: { // ?
        return _FL_MULTI_LABEL;
        break;
    }
    case 6: { // draws the icon associated with the text
        return _FL_ICON_LABEL;
        break;
    }
    case 7: { // ?
        return _FL_IMAGE_LABEL;
        break;
    }
    case 8: { // first free labeltype to use for creating own labeltypes
        return FL_FREE_LABELTYPE;
        break;
    }
    }
}

Fl_Boxtype
lookup_box( int t ) {
    switch ( t ) {
    case 0: { // nothing is drawn; this box is invisible
        return FL_NO_BOX;
        break;
    }
    case 1: { // a flat box
        return FL_FLAT_BOX;
        break;
    }
    case 2: { // see figure 1
        return FL_UP_BOX;
        break;
    }
    case 3: { // see figure 1
        return FL_DOWN_BOX;
        break;
    }
    case 4: { // see figure 1
        return FL_UP_FRAME;
        break;
    }
    case 5: { // see figure 1
        return FL_DOWN_FRAME;
        break;
    }
    case 6: { // see figure 1
        return FL_THIN_UP_BOX;
        break;
    }
    case 7: { // see figure 1
        return FL_THIN_DOWN_BOX;
        break;
    }
    case 8: { // see figure 1
        return FL_THIN_UP_FRAME;
        break;
    }
    case 9: { // see figure 1
        return FL_THIN_DOWN_FRAME;
        break;
    }
    case 10: { // see figure 1
        return FL_ENGRAVED_BOX;
        break;
    }
    case 11: { // see figure 1
        return FL_EMBOSSED_BOX;
        break;
    }
    case 12: { // see figure 1
        return FL_ENGRAVED_FRAME;
        break;
    }
    case 13: { // see figure 1
        return FL_EMBOSSED_FRAME;
        break;
    }
    case 14: { // see figure 1
        return FL_BORDER_BOX;
        break;
    }
    case 15: { // see figure 1
        return _FL_SHADOW_BOX;
        break;
    }
    case 16: { // see figure 1
        return FL_BORDER_FRAME;
        break;
    }
    case 17: { // see figure 1
        return _FL_SHADOW_FRAME;
        break;
    }
    case 18: { // see figure 1
        return _FL_ROUNDED_BOX;
        break;
    }
    case 19: { // see figure 1
        return _FL_RSHADOW_BOX;
        break;
    }
    case 20: { // see figure 1
        return _FL_ROUNDED_FRAME;
        break;
    }
    case 21: { // see figure 1
        return _FL_RFLAT_BOX;
        break;
    }
    case 22: { // see figure 1
        return _FL_ROUND_UP_BOX;
        break;
    }
    case 23: { // see figure 1
        return _FL_ROUND_DOWN_BOX;
        break;
    }
    case 24: { // see figure 1
        return _FL_DIAMOND_UP_BOX;
        break;
    }
    case 25: { // see figure 1
        return _FL_DIAMOND_DOWN_BOX;
        break;
    }
    case 26: { // see figure 1
        return _FL_OVAL_BOX;
        break;
    }
    case 27: { // see figure 1
        return _FL_OSHADOW_BOX;
        break;
    }
    case 28: { // see figure 1
        return _FL_OVAL_FRAME;
        break;
    }
    case 29: { // see figure 1
        return _FL_OFLAT_BOX;
        break;
    }
    case 30: { // plastic version of FL_UP_BOX
        return _FL_PLASTIC_UP_BOX;
        break;
    }
    case 31: { // plastic version of FL_DOWN_BOX
        return _FL_PLASTIC_DOWN_BOX;
        break;
    }
    case 32: { // plastic version of FL_UP_FRAME
        return _FL_PLASTIC_UP_FRAME;
        break;
    }
    case 33: { // plastic version of FL_DOWN_FRAME
        return _FL_PLASTIC_DOWN_FRAME;
        break;
    }
    case 34: { // plastic version of FL_THIN_UP_BOX
        return _FL_PLASTIC_THIN_UP_BOX;
        break;
    }
    case 35: { // plastic version of FL_THIN_DOWN_BOX
        return _FL_PLASTIC_THIN_DOWN_BOX;
        break;
    }
    case 36: { // plastic version of FL_ROUND_UP_BOX
        return _FL_PLASTIC_ROUND_UP_BOX;
        break;
    }
    case 37: { // plastic version of FL_ROUND_DOWN_BOX
        return _FL_PLASTIC_ROUND_DOWN_BOX;
        break;
    }
    case 38: { // gtk+ version of FL_UP_BOX
        return _FL_GTK_UP_BOX;
        break;
    }
    case 39: { // gtk+ version of FL_DOWN_BOX
        return _FL_GTK_DOWN_BOX;
        break;
    }
    case 40: { // gtk+ version of FL_UP_FRAME
        return _FL_GTK_UP_FRAME;
        break;
    }
    case 41: { // gtk+ version of FL_DOWN_RAME
        return _FL_GTK_DOWN_FRAME;
        break;
    }
    case 42: { // gtk+ version of FL_THIN_UP_BOX
        return _FL_GTK_THIN_UP_BOX;
        break;
    }
    case 43: { // gtk+ version of FL_THIN_DOWN_BOX
        return _FL_GTK_THIN_DOWN_BOX;
        break;
    }
    case 44: { // gtk+ version of FL_UP_FRAME
        return _FL_GTK_THIN_UP_FRAME;
        break;
    }
    case 45: { // gtk+ version of FL_THIN_DOWN_FRAME
        return _FL_GTK_THIN_DOWN_FRAME;
        break;
    }
    case 46: { // gtk+ version of FL_ROUND_UP_BOX
        return _FL_GTK_ROUND_UP_BOX;
        break;
    }
    case 47: { // gtk+ version of FL_ROUND_DOWN_BOX
        return _FL_GTK_ROUND_DOWN_BOX;
        break;
    }
    case 48: { // the first free box type for creation of new box types
        return FL_FREE_BOXTYPE;
    }
    }
}

Fl_Align
lookup_align( int i ) {
    switch ( i ) {
    case 0: {
        return FL_ALIGN_CENTER;
        break;
    }
    case 1: {
        return FL_ALIGN_TOP;
        break;
    }
    case 2: {
        return FL_ALIGN_BOTTOM;
        break;
    }
    case 4: {
        return FL_ALIGN_LEFT;
        break;
    }
    case 5: {
        return FL_ALIGN_TOP_LEFT;
        break;
    }


    case 6: {
        return FL_ALIGN_BOTTOM_LEFT;
        break;
    }




    case 8: {
        return FL_ALIGN_RIGHT;
        break;
    }
    case 9: {
        return FL_ALIGN_TOP_RIGHT;
        break;
    }
    case 10: {
        return FL_ALIGN_BOTTOM_RIGHT;
        break;
    }


    case 16: {
        return FL_ALIGN_INSIDE;
        break;
    }
    case 32: {
        return FL_ALIGN_TEXT_OVER_IMAGE;
        break;
    }
    case 64: {
        return FL_ALIGN_CLIP;
        break;
    }
    case 128: {
        return FL_ALIGN_WRAP;
        break;
    }


    }
}

