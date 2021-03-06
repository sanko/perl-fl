use strict;
use warnings;
use Module::Build;
use Config qw[%Config];
use File::Find qw[find];
my $automated_testing = $ENV{AUTOMATED_TESTING} || $ENV{PERL_MM_USE_DEFAULT};
my $is_developer = ((-d q[.git]) ? 1 : 0) or ($ENV{RELEASE_TESTING} ? 1 : 0);
my @tests;
find \&find_cb, qw[t/000_basic/];
@tests = reverse sort @tests;
my $class
    = Module::Build->subclass(class => 'FLTK::Build', code => <<'#SUBCLASS');
#line 14 Build.PL
use strict;
use warnings;
my $VERBOSE = 0;
$|++;

#
use Config qw[%Config];
use Cwd qw[];
use ExtUtils::ParseXS qw[];
use ExtUtils::CBuilder qw[];
use File::Spec qw[];
use File::Find qw[find];
use File::Path 2.07 qw[make_path];
use Module::Build qw[];
use Devel::PPPort;

my @fltk_location = qw[src FLTK-1.3.x];

my $c = ExtUtils::CBuilder->new(
    config => {
        ld      => 'g++',
        ccflags => sub {
            my $ccflags = $Config{'ccflags'};
            $ccflags =~ s[-DPERL_IMPLICIT_\w+][]g;
            return $ccflags;
            }
            ->()
    },
    quiet => !$VERBOSE
);

my $Orig_CWD = Cwd::cwd();

my %LIBS = (
    jpeg => {
        libfltk_jpeg => [
            qw[ jmemnobs.c jcapimin.c jcapistd.c jccoefct.c jccolor.c
                jcdctmgr.c jchuff.c   jcinit.c   jcmainct.c jcmarker.c
                jcmaster.c jcomapi.c  jcparam.c  jcphuff.c  jcprepct.c
                jcsample.c jctrans.c  jdapimin.c jdapistd.c jdatadst.c
                jdatasrc.c jdcoefct.c jdcolor.c  jddctmgr.c jdhuff.c
                jdinput.c  jdmainct.c jdmarker.c jdmaster.c jdmerge.c
                jdphuff.c  jdpostct.c jdsample.c jdtrans.c  jerror.c
                jfdctflt.c jfdctfst.c jfdctint.c jidctflt.c jidctfst.c
                jidctint.c jidctred.c jquant1.c  jquant2.c  jutils.c
                jmemmgr.c]
        ]
    },
    png => {
        libfltk_png => [
            qw[ png.c     pngset.c pngget.c pngrutil.c pngtrans.c pngwutil.c
                pngread.c pngrio.c pngwio.c pngwrite.c pngrtran.c pngwtran.c
                pngmem.c  pngerror.c        pngpread.c]
        ]
    },
    src => {
        libfltk => [
            qw[ Fl.cxx  Fl_Adjuster.cxx Fl_Bitmap.cxx   Fl_Browser.cxx
                Fl_Browser_.cxx         Fl_Browser_load.cxx
                Fl_Box.cxx              Fl_Button.cxx   Fl_Chart.cxx
                Fl_Check_Browser.cxx    Fl_Check_Button.cxx
                Fl_Choice.cxx           Fl_Clock.cxx    Fl_Color_Chooser.cxx
                Fl_Counter.cxx          Fl_Dial.cxx     Fl_Double_Window.cxx
                Fl_File_Browser.cxx     Fl_File_Chooser.cxx
                Fl_File_Chooser2.cxx    Fl_File_Icon.cxx
                Fl_File_Input.cxx       Fl_Group.cxx    Fl_Help_View.cxx
                Fl_Image.cxx            Fl_Input.cxx    Fl_Input_.cxx
                Fl_Light_Button.cxx     Fl_Menu.cxx     Fl_Menu_.cxx
                Fl_Menu_Bar.cxx         Fl_Sys_Menu_Bar.cxx
                Fl_Menu_Button.cxx      Fl_Menu_Window.cxx
                Fl_Menu_add.cxx         Fl_Menu_global.cxx
                Fl_Multi_Label.cxx      Fl_Overlay_Window.cxx
                Fl_Pack.cxx             Fl_Pixmap.cxx
                Fl_Positioner.cxx       Fl_Preferences.cxx
                Fl_Progress.cxx         Fl_Repeat_Button.cxx
                Fl_Return_Button.cxx    Fl_Roller.cxx   Fl_Round_Button.cxx
                Fl_Scroll.cxx           Fl_Scrollbar.cxx
                Fl_Shared_Image.cxx     Fl_Single_Window.cxx
                Fl_Slider.cxx           Fl_Tabs.cxx     Fl_Text_Buffer.cxx
                Fl_Text_Display.cxx     Fl_Text_Editor.cxx
                Fl_Tile.cxx             Fl_Tiled_Image.cxx
                Fl_Tooltip.cxx          Fl_Valuator.cxx Fl_Value_Input.cxx
                Fl_Value_Output.cxx     Fl_Value_Slider.cxx
                Fl_Widget.cxx           Fl_Window.cxx
                Fl_Window_fullscreen.cxx                Fl_Window_hotspot.cxx
                Fl_Window_iconize.cxx   Fl_Wizard.cxx   Fl_XBM_Image.cxx
                Fl_XPM_Image.cxx        Fl_abort.cxx    Fl_add_idle.cxx
                Fl_arg.cxx              Fl_compose.cxx  Fl_display.cxx
                Fl_get_key.cxx          Fl_get_system_colors.cxx
                Fl_grab.cxx             Fl_lock.cxx     Fl_own_colormap.cxx
                Fl_visual.cxx           Fl_x.cxx        filename_absolute.cxx
                filename_expand.cxx     filename_ext.cxx
                filename_isdir.cxx      filename_list.cxx
                filename_match.cxx      filename_setext.cxx
                fl_arc.cxx              fl_arci.cxx     fl_ask.cxx
                fl_boxtype.cxx          fl_color.cxx    fl_cursor.cxx
                fl_curve.cxx            fl_diamond_box.cxx
                fl_dnd.cxx              fl_draw.cxx     fl_draw_image.cxx
                fl_draw_pixmap.cxx      fl_encoding_latin1.cxx
                fl_encoding_mac_roman.cxx               fl_engraved_label.cxx
                fl_file_dir.cxx         fl_font.cxx     fl_gtk.cxx
                fl_labeltype.cxx        fl_line_style.cxx
                fl_open_uri.cxx         fl_oval_box.cxx fl_overlay.cxx
                fl_overlay_visual.cxx   fl_plastic.cxx  fl_read_image.cxx
                fl_rect.cxx             fl_round_box.cxx
                fl_rounded_box.cxx      fl_set_font.cxx fl_set_fonts.cxx
                fl_scroll_area.cxx      fl_shadow_box.cxx
                fl_shortcut.cxx         fl_show_colormap.cxx
                fl_symbols.cxx          fl_vertex.cxx   screen_xywh.cxx
                fl_utf8.cxx             fl_call_main.c  flstring.c
                scandir.c               numericsort.c   vsnprintf.c
                fl_utf.c                xutf8/case.c    xutf8/is_right2left.c
                xutf8/is_spacing.c      xutf8/keysym2Ucs.c
                xutf8/utf8Input.c       xutf8/utf8Utils.c
                xutf8/utf8Wrap.c]
        ],
        libfltk_forms => [
            qw[ forms_compatability.cxx forms_bitmap.cxx    forms_free.cxx
                forms_fselect.cxx       forms_pixmap.cxx    forms_timer.cxx]
        ],
        libfltk_gl => [
            qw[ Fl_Gl_Choice.cxx        Fl_Gl_Overlay.cxx   Fl_Gl_Window.cxx
                freeglut_geometry.cxx   freeglut_stroke_mono_roman.cxx
                freeglut_stroke_roman.cxx
                freeglut_teapot.cxx     gl_draw.cxx         gl_start.cxx
                glut_compatability.cxx  glut_font.cxx]
        ],
        libfltk_images => [
            qw[ fl_images_core.cxx  Fl_BMP_Image.cxx    Fl_File_Icon2.cxx
                Fl_GIF_Image.cxx    Fl_Help_Dialog.cxx  Fl_JPEG_Image.cxx
                Fl_PNG_Image.cxx    Fl_PNM_Image.cxx]
        ],
    },
    zlib => {
        libfltk_z => [
            qw[ adler32.c   compress.c  crc32.c gzio.c  uncompr.c   deflate.c
                trees.c     zutil.c     inflate.c       inftrees.c  inffast.c]
        ]
    }
);
############################################### FLTK building begins... here #
sub ACTION_dist {
    my ($self, $args) = @_;
    if ('XXX - DEVELOPER USE ONLY') {
        my $ppp = _abs(_dir(qw[xs ppport.pl]));
        Devel::PPPort::WriteFile($ppp) if !-e $ppp;
    }
    $self->SUPER::ACTION_dist(@_);
}

sub ACTION_code {
    my ($self, $args) = @_;

    my @libs = _build_fltk($self) or do { print 'Cannot build FLTK'; exit 0 };

    #
    my @xs;
    find(sub { push @xs, $File::Find::name if m[.+\.xs$]; }, 'xs');
    my $libcomctl32;
    find(
        sub {
            $libcomctl32 = $File::Find::name
                if $_ =~ qr[libcomctl32$Config{'_a'}];
        },
        split ' ',
        $Config{'libpth'}
    );

    #
    my @obj;
    XS: for my $XS (@xs) {
        my $cpp = _xs_to_cpp($self, $XS)
            or do { printf 'Cannot Parse %s', $XS; exit 0 };

        if ($self->up_to_date($cpp,$c->object_file($cpp))) {
            push @obj, $c->object_file($cpp);
            next XS;
        }

        push @obj, $c->compile(
            source => $cpp,
            include_dirs =>
                [_dir($Config{'archlibexp'}, 'CORE'), _dir(@fltk_location)],
            extra_compiler_flags => [
                qw[ -fno-exceptions -fno-strict-aliasing
                    -Wunused -Wno-format-y2k
                    -c -O3
                    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE]
            ]
        );
    }
    make_path(_dir(qw[blib arch auto FLTK]), {verbose => 1, mode => 0711});

    if (!
            $self->up_to_date(
                [@obj, @libs],
                _dir(
                    qw[blib arch auto FLTK], 'FLTK.' . $Config{'so'}
                )
            )
    ) {
    my ($dll, @cleanup) = $c->link(
        objects => [@obj, @libs, $libcomctl32],
        lib_file    => _dir(qw[blib arch auto FLTK], 'FLTK.' . $Config{'so'}),
        module_name => 'FLTK',
        extra_linker_flags => [
            $Config{ldflags},
            $Config{'libs'},
            qw[-Wunused -Wno-format-y2k  -fno-exceptions -fno-strict-aliasing],
            ($^O eq 'MSWin32' ? qw[-mwindows -mno-cygwin] : [])
        ]
    );

      @cleanup = map {s["][]g; _abs($_); } @cleanup;
      $self->add_to_cleanup(@cleanup);
      $self->add_to_cleanup(@obj);
      $self->add_to_cleanup(@libs);
    }
    $self->SUPER::ACTION_code;
}

sub _xs_to_cpp {
    my ($self, $xs) = @_;
    my ($cpp, $typemap) = ($xs, $xs);
    $cpp     =~ s[\.xs$][\.cxx];
    $typemap =~ s[\.xs$][\.tm];
    $typemap = '~typemap' if !-e $typemap;

    my @xsi;
    find sub{ push @xsi, $File::Find::name if m[\.xsi$]} , _dir('xs');

    $self->add_to_cleanup($cpp);

    return $cpp if $self->up_to_date([@xsi, $xs, _dir('xs', $typemap)], $cpp);

    printf "%s -> %s (%s)\n", $xs, $cpp, $typemap;
    ExtUtils::ParseXS->process_file(
        filename     => $xs,
        output       => $cpp,
        'C++'        => 1,
        typemap      => $typemap,  # Future objects (may) have custom typemaps
        versioncheck => 1,
        linenumbers  => 1,
        prototypes   => 1
    ) or return;
    return $cpp;
}

sub _build_fltk {
    my ($self)=@_;
    _config_h($self);
    my @libs;

 DIR: for my $dir (qw[jpeg zlib png src]) {
         my @INC_DIRS = map { _abs(_dir(@fltk_location, $_)) } '',
            qw[png jpeg zlib];
        _chdir_to_fltk($dir)
            or do {
            print 'Failed to change directory to [...]' . $dir;
            exit 0;
            };
    LIB: for my $_lib (keys %{$LIBS{$dir}}) {
            my @objects;
            my $lib = _dir(qw[.. lib], $_lib . $Config{'_a'});
            $self->add_to_cleanup(_abs($lib));
            push @libs, _abs($lib);
            next LIB if -e $lib;
            printf "# Gathering objects for %s...\n", _rel($lib);
        FILE: for my $file (@{$LIBS{$dir}{$_lib}}) {
            my $obj = $c->object_file($file);
            $self->add_to_cleanup(_abs($obj));
            push @objects, $obj;
                if(!$self->up_to_date($file, $obj)) {
                $c->compile(
                    source               => $file,
                    include_dirs         => \@INC_DIRS,
                    extra_compiler_flags => [
                        qw[ -O3 -Wunused -Wno-format-y2k -c
                            -fno-exceptions -fno-strict-aliasing
                            -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE],
                        ($^O eq 'MSWin32' ? qw[-mwindows -mno-cygwin] : [])
                    ]
                ) or do{
                    printf 'Failed to compile %s.\n', $file;
                    return 0;
                };}
            }

            next LIB if $self->up_to_date(\@objects, [$lib]);

            printf "# Archiving %s...\n", $lib;
            unlink $lib;
            $self->add_to_cleanup(_abs($lib));
            _run($Config{'ar'}, 'cr', $lib, @objects) or do {
                printf 'Building %s failed.', $lib;
                return 0;
            };
            _run('ranlib', $lib) or do {
                printf 'ranlib %s failed.', $lib;
                return 0;
            };
        }
        _chdir_back()
            or
            do { print 'Failed to change directory to ' . $Orig_CWD; exit 0 };
    }
    return @libs;
}

sub _chdir_to_fltk {
    return chdir _dir(@fltk_location, ($_[0] ? $_[0] : q[]));
}
sub _chdir_back { return chdir $Orig_CWD; }
sub _dir        { File::Spec->catdir(@_) }
sub _abs        { File::Spec->rel2abs(@_) }
sub _rel        { File::Spec->abs2rel(@_) }

sub _find_h {
    my $file = _abs(File::Spec->catfile($Config{'incpath'}, shift));
    my $found = 0;
    find(
        sub {
            $found = 1 if File::Spec->canonpath($File::Find::name) eq $file;
        },
        $Config{'incpath'}
    );
    return $found;
}

sub _run {
    my ($prog, @args) = @_;
    my $cl = join ' ', $prog, @args;
    print $cl . "\n" if $VERBOSE;
    return !system($cl);
}

sub _config_h {
    my $self = shift;
    if (!-e _dir(@fltk_location,  'config.status')
        and not $self->up_to_date(_dir(@fltk_location, 'config.status'),
                                _dir('~blib', @fltk_location, 'config.status')
        )
        )
    {   _chdir_to_fltk();
        if (!_run(qw[sh ./configure])) {
            print <<'#END'; exit 0; }

* ** *** **** ***** ****** ******* ******** ******* ****** ***** **** *** ** *

   ERROR! Failed to execute sh ./configure.  This is a problem on your end.

* ** *** **** ***** ****** ******* ******** ******* ****** ***** **** *** ** *
#END
        _chdir_back();
    }
}

############################################################ Developer Stuff #

# TODO: add pod
sub ACTION_profile {
    my ($self) = @_;
    unless (Module::Build::ModuleInfo->find_module_by_name('Devel::NYTProf'))
    {   warn(
            "Cannot run testcover action unless Devel::NYTProf is installed.\n"
        );
        return;
    }
    $self->add_to_cleanup('nytprof.out', 'nytprof');
    $self->depends_on('code');

    # See whether any of the *.pm files have changed since last time
    # profile was run.  If so, start over.
    if (-e 'nytprof.out') {
        my $pm_files =
            $self->rscan_dir(File::Spec->catdir($self->blib, 'lib'),
                             qr[\.pm$]);
        my $cover_files
            = $self->rscan_dir('cover_db', sub { -f $_ and not /\.html$/ });
        $self->do_system(qw(cover -delete))
            unless $self->up_to_date($pm_files, $cover_files)
                && $self->up_to_date($self->test_files, $cover_files);
    }
    local $Test::Harness::switches = local $Test::Harness::Switches
        = local $ENV{HARNESS_PERL_SWITCHES} = '-d:NYTProf';
    $self->notes(profile => 1);
    $self->depends_on('test');
    $self->do_system('nytprofhtml --open');
    $self->notes(profile => 0);    # clean up
}

sub ACTION_tidy {
    my ($self) = @_;
    unless (Module::Build::ModuleInfo->find_module_by_name('Perl::Tidy')) {
        warn("Cannot run tidy action unless Perl::Tidy is installed.\n");
        return;
    }
    require Perl::Tidy;
    my $demo_files
        = $self->rscan_dir(File::Spec->catdir('tatoeba'), qr[\.pl$]);
    for my $files ([keys(%{$self->script_files})],       # scripts first
                   [values(%{$self->find_pm_files})],    # modules
                   [@{$self->find_test_files}],          # test suite next
                   [@{$demo_files}]                      # demos last
        )
    {   $files = [sort map { File::Spec->rel2abs('./' . $_) } @{$files}];

        # One at a time...
        for my $file (@$files) {
            printf "Running perltidy on '%s' ...\n",
                File::Spec->abs2rel($file);
            $self->add_to_cleanup($file . '.tidy');
            Perl::Tidy::perltidy(argv => <<'END' . $file); } }
--brace-tightness=2
--block-brace-tightness=1
--block-brace-vertical-tightness=2
--paren-tightness=2
--paren-vertical-tightness=2
--square-bracket-tightness=2
--square-bracket-vertical-tightness=2
--brace-tightness=2
--brace-vertical-tightness=2

--delete-old-whitespace
--no-indent-closing-brace
--line-up-parentheses
--no-outdent-keywords
--no-outdent-long-quotes
--no-space-for-semicolon
--swallow-optional-blank-lines

--continuation-indentation=4
--maximum-line-length=78

--want-break-before='% + - * / x != == >= <= =~ !~ < > | & >= < = **= += *= &= <<= &&= -= /= |= \ >>= ||= .= %= ^= x= ? :'

--standard-error-output
--warning-output

--backup-and-modify-in-place
--backup-file-extension=tidy

END
    $self->depends_on('code');
    return 1;
}

sub ACTION_wastetime {
    my ($self) = @_;
    unless (Module::Build::ModuleInfo->find_module_by_name('File::Copy')) {
        warn("Cannot run mindist action unless File::Copy is installed.\n");
        return;
    }
    require File::Copy;
    my $_quiet = $self->quiet(1);
    mkdir './archive' if !-d './archive';
    my $dist_dir = q[];
    for my $i (1 .. 999) {
        $self->SUPER::ACTION_distdir();
        $dist_dir = $self->dist_dir;
        $self->make_tarball($dist_dir, $dist_dir, 1);

        #File::Copy::copy($dist_dir . '.tar.gz',
        #     'X:/archive/' . $dist_dir . '.tar.gz' . sprintf('.%03d', $i));
        rename $dist_dir . '.tar.gz', './archive/' . $dist_dir . '.tar.gz'
            if !-f './archive/' . $dist_dir . '.tar.gz'
                or -s $dist_dir . '.tar.gz'
                < -s './archive/' . $dist_dir . '.tar.gz';
        printf "dist #%03d ... %d bytes\n", $i, -s $dist_dir . '.tar.gz';
        unlink $dist_dir . '.tar.gz';
        $self->delete_filetree($dist_dir);
    }
    File::Copy::copy('./archive/' . $dist_dir . '.tar.gz',
                     $dist_dir . '.tar.gz');
    return $self->quiet($_quiet);
}

sub ACTION_spellcheck {
    my ($self) = @_;
    my $demo_files
        = $self->rscan_dir(File::Spec->catdir('tatoeba'), qr[\.pl$]);
    for my $files (
        [keys(%{$self->script_files})],       # scripts first
        [values(%{$self->find_pm_files})],    # modules
        [@{$self->find_test_files}],          # test suite
        [values(%{shift->_find_file_by_type('pod', '.')})],    # docs
        [@{$demo_files}]                                       # demos
        )
    {   $files = [sort map { File::Spec->rel2abs('./' . $_) } @{$files}];
        for my $file (@$files) {
            $file = File::Spec->abs2rel($file);
            system(
                  sprintf('title aspell - "%s"', File::Spec->abs2rel($file)));
            $self->do_system(sprintf 'perldoc %s > %s.spell', $file, $file);
            $self->add_to_cleanup($file . '.spell');
            system('aspell check ' . $file . '.spell');
            $self->add_to_cleanup($file . '.bak');
        }
    }
    $self->depends_on('code');
}

sub ACTION_changes {
    my ($self) = @_;
    require Fcntl;
    require POSIX;
    require File::Spec::Functions;
    {
        print 'Update Changes file... ';

        # open and lock the file
        sysopen(my ($CHANGES_R), 'Changes', Fcntl::O_RDONLY())
            || die 'Failed to open Changes for reading';
        flock $CHANGES_R, Fcntl::LOCK_EX();

        # Read the file's content and scroll back to the top
        sysread($CHANGES_R, my ($CHANGES_D), -s $CHANGES_R)
            || die 'Failed to read Changes';

        # Okay, we're done with this file for now
        flock $CHANGES_R, Fcntl::LOCK_UN();
        close $CHANGES_R;

        # gather various info
        my (@bits) = split q[,], qx[git log --pretty=format:"%at,%H,%h" -n 1];

        #my $Mod = qx[git log -n 1 --pretty=format:"%cr"];
        my $Date = POSIX::strftime('%Y-%m-%d %H:%M:%SZ (%a, %d %b %Y)',
                                   gmtime($bits[0]));
        my $Commit = $bits[1];
        my $dist = sprintf("Version %s | %s | %s",
                           ($self->dist_version()->is_alpha()
                            ? (q[0.0XX], q[Distant future])
                            : ($self->dist_version()->numify, $Date)
                           ),
                           $bits[2]
        );

        # start changing the data around
        $CHANGES_D =~ s[.+(\r?\n)][$dist$1];
        $CHANGES_D
            =~ s[(_ -.-. .... .- -. --. . ... _+).*][$1 . sprintf <<'END',
        $self->{'properties'}{'meta_merge'}{'resources'}{'ChangeLog'},
        $self->dist_version
    ]se;

For more information, see the commit log:
    %s

$Ver: %s $ from git
$Date$
$Rev$
$URL$
END

     # Keep a backup (just in case) and move the file so we can create it next
        rename('Changes', 'Changes.bak')
            || die sprintf 'Failed to rename Changes (%s)', $^E;

        # open and lock the file
        sysopen(my ($CHANGES_W), 'Changes', Fcntl::O_WRONLY() | Fcntl::O_CREAT())
            || die 'Failed to open Changes for reading';
        sysseek($CHANGES_W, 0, Fcntl::SEEK_SET())
            || die 'Failed to seek in Changes';

        # hope all went well and save the new log to disk
        syswrite($CHANGES_W, $CHANGES_D) || die 'Failed to update Changes';

        # unlock the file and close it
        flock $CHANGES_W, Fcntl::LOCK_UN();
        close($CHANGES_W) || die 'Failed to close Changes';
        printf "Done.\n    (%s)\n", $dist;
    }
    {
        print 'Fake SVN...';
        my @manifest_files = sort grep {
                   $_ !~ m[\.torrent]
                && $_ !~ m[\.jpg$]
                && $_ !~ m[\.yml$]i
                && $_ !~ m[^src/fltk-1.3.x/.+$]i
                #&& $_ !~ m[^Changes$]
                && $_ !~ m[^Build.PL$]
        } keys %{$self->_read_manifest('MANIFEST')};
    FILE: for my $file (@manifest_files) {
            print q[.];

            #warn sprintf q[%s | %s | %s], $date, $commit, $file;
            my $mode = (stat $file)[2];
            chmod($mode | oct(222), $file)
                or die "Can't make $file writable: $!";

            # open and lock the file
            sysopen(my ($CHANGES_R), $file, Fcntl::O_RDONLY())
                || die sprintf 'Failed to open "%s" for reading', $file;
            flock $CHANGES_R, Fcntl::LOCK_EX();

            # Read the file's content and scroll back to the top
            sysread($CHANGES_R, my ($CHANGES_D), -s $CHANGES_R)
                || die "Failed to read $file";

            # Okay, we're done with this file for now
            flock $CHANGES_R, Fcntl::LOCK_UN();
            close $CHANGES_R;

            # gather various info
            # gather various info
            my (@bits) = split q[,],
                qx[git log --pretty=format:"%at,%H,%x25%x73 %h %x25%x2E%x32%x30%x73 %ce" -n 1 $file];
            next FILE if !@bits;

            #my $Mod = qx[git log -n 1 --pretty=format:"%cr"];
            my $Date = POSIX::strftime('%Y-%m-%d %H:%M:%SZ (%a, %d %b %Y)',
                                       gmtime($bits[0]));
            my $Commit = $bits[1];
            #die $bits[2];
            my $Id = sprintf $bits[2], (File::Spec->splitpath($file))[2],
                $Date;

            # start changing the data around
            my $CHANGES_O = $CHANGES_D;
            $CHANGES_D =~ s[\$Date(:[^\$]*)?\$][\$Date: $Date \$]ig;
            $CHANGES_D =~ s[\$Id(:[^\$]*)?\$][\$Id: $Id \$]ig;
            $CHANGES_D
                =~ s[\$Url(:[^\$]*)?\$][\$Url: http://github.com/sanko/net-bittorrent/raw/$Commit/$file \$]ig;
            $CHANGES_D =~ s[\$(Rev(:?ision)?)(:[^\$]*)?\$][\$$1: $Commit \$]ig;

            #$CHANGES_D =~ s[\$Mod:.+\$][\$Mod: $Mod \$]ig;
            # Skip to the next file if this one wasn't updated
            next FILE if $CHANGES_D eq $CHANGES_O;

     #warn qq[Updated $file];
     #die $CHANGES_D;
     # Keep a backup (just in case) and move the file so we can create it next
            rename($file, $file . '.bak')
                || die sprintf 'Failed to rename %s (%s)', $file, $^E;

            # open and lock the file
            sysopen(my ($CHANGES_W), $file, Fcntl::O_WRONLY() | Fcntl::O_CREAT())
                || warn(sprintf q[Failed to open %s for reading: %s], $file,
                        $^E)
                && next FILE;
            sysseek($CHANGES_W, 0, Fcntl::SEEK_SET())
                || warn 'Failed to seek in ' . $file && next FILE;

            # hope all went well and save the new log to disk
            syswrite($CHANGES_W, $CHANGES_D)
                || warn 'Failed to update ' . $file && next FILE;

            # unlock the file and close it
            flock $CHANGES_W, Fcntl::LOCK_UN();
            close($CHANGES_W) || die 'Failed to close Changes';
            chmod($mode, $file);
        }
        print "Done.\n";
    }
    return 1;
}

sub ACTION_testkwalitee {
    my ($self) = @_;
    use Test::More;
    eval { require Test::Kwalitee; Test::Kwalitee->import() };
    plan( skip_all => 'Test::Kwalitee not installed; skipping' ) if $@;
}


sub ACTION_testpod {
    my ($self) = @_;
    use Test::More;
    eval "use Test::Pod 1.00";
    plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
    all_pod_files_ok(all_pod_files(qw[lib scripts tatoeba t]));
}

sub ACTION_distmeta {
    my ($self) = @_;
    $self->do_create_makefile_pl if $self->create_makefile_pl;
    $self->do_create_readme      if $self->create_readme;
    $self->do_create_metafile;
    $self->SUPER::depends_on('changes');
}

sub make_tarball {
    my ($self, $dir, $file, $quiet) = @_;
    $file ||= $dir;
    $self->do_system(
            'tar --mode=0755 -c' . ($quiet ? q[] : 'v') . "f $file.tar $dir");
    $self->do_system("gzip -9 -f -n $file.tar");
    return 1;
}
1;
#SUBCLASS
my $mb = $class->new(
    module_name       => 'FLTK',
    license           => 'artistic_2',
    dist_author       => 'Sanko Robinson <sanko@cpan.org>',
    dist_version_from => 'lib/FLTK.pm',
    dist_abstract =>
        q[Perl interface to the (current, stable) 1.3.x branch of the FLTK GUI toolkit],
    requires => {perl                 => '5.8.0',    # 5.8.0 is too old IMO...
                 parent               => 0,
                 'Test::More'         => 0,
                 Config               => 0,
                 Cwd                  => 0,
                 'ExtUtils::ParseXS'  => 0,
                 'ExtUtils::CBuilder' => 0,
                 'File::Spec'         => 0,
                 'File::Find'         => 0,
                 'File::Path'         => 2.07,
                 'Module::Build'      => 0,
                 'Devel::PPPort'      => 0
    },
    build_requires => {perl                 => '5.8.0',
                       'Test::More'         => 0,
                       Config               => 0,
                       Cwd                  => 0,
                       'ExtUtils::ParseXS'  => 0,
                       'ExtUtils::CBuilder' => 0,
                       'File::Spec'         => 0,
                       'File::Find'         => 0,
                       'File::Path'         => 2.07,
                       'Module::Build'      => 0,
                       'Devel::PPPort'      => 0
    },
    add_to_cleanup => [qw[FLTK-*], map {qq[*$_]} '.' . $Config{'so'},
                       $Config{'_o'}, $Config{'_a'}
    ],
    create_makefile_pl => 'passthrough',
    no_index           => {

        #directory => [qw[tatoeba]],
        #file => [qw[scripts/net-bittorrent.pl]]
    },
    #script_files => qw[scripts/net-bittorrent.pl],
    test_files   => \@tests,
    meta_merge   => {
        generated_by => 'Conversion, software version 7.0',
        keywords =>
            [qw[FLTK Feather Light Toolkit widget FL GUI UI window 1.3.x]],
        resources => {
            bugtracker => 'http://code.google.com/p/sanko/issues/list',
            ChangeLog  => 'http://code.google.com/p/sanko/source/list',

            #homepage  => 'http://sankorobinson.com/FLTK/',
            license => 'http://www.perlfoundation.org/artistic_license_2_0',

            #MailingList => XXX,
            repository => 'http://github.com/sanko/perl-FLTK-1.3.x'
        }
    }
);
print <<'#END';
 --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    Buliding FLTK requires a functioning C++ compiler.  Hold on a sec
    while I locate one...
#END
if (!$mb->cbuilder || !$mb->cbuilder->have_compiler) {
    print <<'#END'; exit 0; }
    Hey!  ExtUtils::CBuilder failed to find working compier so I this is
    where you and I part ways.  It's been real.
 --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
#END
print <<'#END';
    Everything looks okay.  Moving on...
 --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
#END
$mb->notes(automated_testing => $automated_testing ? 1 : 0);
$mb->notes(release_testing   => $is_developer);
$mb->notes(test_suite        => \@tests);
$mb->notes(gmtime            => gmtime);
$mb->notes(verbose => scalar grep {m[^v$]} keys %{$mb->args()});
$mb->notes(threads => $Config::Config{q[useithreads]} ? 1 : 0);
$mb->create_build_script;
exit 0;

#use Data::Dump qw[pp];
#warn pp $mb;
sub find_cb {
    return if -d $_ or -l $_;
    return unless -T $_;
    return unless $_ =~ m[.+\.t$];
    return push @tests, $File::Find::name;
}

BEGIN {    # Tired of getting FAIL-mail from outdated build environments
    if ($] < 5.008008) {    # already 3+ years old...
        warn sprintf
            q[Perl v5.8.8 required--this is only v%vd, stopped],
            $^V;
        exit 0;
    }
    if ($Module::Build::VERSION < 0.3) {
        warn sprintf
            q[Module::Build version 0.3 required--this is only version %s],
            $Module::Build::VERSION;
        exit 0;
    }
}
__END__
Copyright (C) 2009 by Sanko Robinson <sanko@cpan.org>

This program is free software; you can redistribute it and/or modify it
under the terms of The Artistic License 2.0.  See the LICENSE file
included with this distribution or
http://www.perlfoundation.org/artistic_license_2_0.  For
clarification, see http://www.perlfoundation.org/artistic_2_0_notes.

When separated from the distribution, all POD documentation is covered by
the Creative Commons Attribution-Share Alike 3.0 License.  See
http://creativecommons.org/licenses/by-sa/3.0/us/legalcode.  For
clarification, see http://creativecommons.org/licenses/by-sa/3.0/us/.

$Id$
