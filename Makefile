#***********************************************
#   Makefile for use with Buildroot
#
# note:   $(CC) is passed in with the proper tool name.
#------------------------------------------------



CCFLAGS=-g

all: vars hello


_world: hello.o Makefile
	$(CC)   -o hello  hello.o


hello_world.o:  hello.c
	$(CC)   -o hello.o  hello.c



clean:
	rm -rf *.o
	rm -rf hello_world





.phony: vars
vars:
	echo " CC    $(CC)     "
	echo " CC    $(CCFLAGS) "
	echo " LD    $(LD)     "
