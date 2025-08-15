# Makefile for pi_fftcs5, Takuyo Ooura's
# Pi calculation for *nix or DOS
# Warning: this file has tabs in it.  It is required for GNU Make.
#
# This version may not produce optimal runs.  You'll need to experiment
# with the compiler options.

#Set this to your remove command.
RM= rm -f

#Set this to your copy command.
CP= cp

#Set this to you directory creation command
MKDIR= mkdir -p

#Set this to your strip command.
STRIP= strip

#Set this to the proper math libraries to link against
MATH_LIBS= -lm

#Set this to the proper install directory
PREFIX= /usr/local

CC = gcc

#Set this to best optimization flags for your system. Defaults are for gcc.
CFLAGS = -Wall -pedantic -O -fomit-frame-pointer -funroll-loops

#Set this to the cpu to target
CFLAGS += -malign-double

#If you would like to minimize program output uncomment this line
#CFLAGS += -DQUIET_OUT

#Set this to important linker flags
LDFLAGS = -static

# Leave items below this point unchanged!

all: superpi


superpi : pi_fftcs.o fftsg_h.o i18n/i18n.o
	$(CC) $(CFLAGS) pi_fftcs.o fftsg_h.o i18n/i18n.o ${MATH_LIBS} ${LDFLAGS} -o superpi

pi_fftcs.o : pi_fftcs.c
	$(CC) $(CFLAGS) -c pi_fftcs.c -o pi_fftcs.o

fftsg_h.o : fftsg_h.c
	$(CC) $(CFLAGS) -c fftsg_h.c -o fftsg_h.o

i18n/i18n.o : i18n/i18n.c
	$(CC) $(CFLAGS) -c i18n/i18n.c -o i18n/i18n.o


install: all
	${MKDIR} ${PREFIX}/bin
	${CP} superpi ${PREFIX}/bin

install-strip: strip install

strip: all
	${STRIP} superpi

clean:
	${RM} pi_fftcs.o fftsg_h.o superpi

