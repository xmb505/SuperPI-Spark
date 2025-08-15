bin_PROGRAMS = superpi
superpi_SOURCES = pi_fftcs.c fftsg_h.c i18n_gettext.c
superpi_LDADD = -lm

# Internationalization
SUBDIRS = po

# Install translation files
localedir = $(datadir)/locale
EXTRA_DIST = po/zh_CN.po po/zh_TW.po po/en.po