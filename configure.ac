AC_INIT([superpi], [1.0], [your-email@example.com])
AM_INIT_AUTOMAKE([foreign])

# Checks for programs
AC_PROG_CC
AC_PROG_RANLIB

# Checks for libraries
AC_CHECK_LIB([m], [sqrt])

# Internationalization
AM_GNU_GETTEXT_VERSION([0.19])
AM_GNU_GETTEXT([external])

# Output files
AC_CONFIG_FILES([
    Makefile
    po/Makefile.in
])

AC_OUTPUT