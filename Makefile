#***********************************************
#   Makefile for use with Buildroot
#
# note:   $(CC) is passed in with the proper tool name.
#------------------------------------------------



CCFLAGS=-g

all: vars hello_world

hello_world:
	$(CC)   -o hello_world  hello.c



.phony: vars
	echo " CC    $(CC)
	echo " CC    $(CCFLAGS)

