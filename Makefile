#***********************************************
#   Makefile for use with Buildroot
#
# note:   $(CC) is passed in with the proper tool name.
#------------------------------------------------



CCFLAGS=-g -O0 -c


all: vars hello_world


hello_world: hello_world.o Makefile
	$(CC) $(LDFLAGS)  -o hello_world  hello_world.o

hello_world.o:  hello.c
	$(CC) $(CCFLAGS)  -o hello_world.o  hello.c


clean:
	rm -rf *.o
	rm -rf hello_world
	rm -rf .stamp_*


.phony: vars
vars:
	echo " CC:      $(CC)      "
	echo " CCFLAGS: $(CCFLAGS) "
	echo " LD:      $(LD)      "
	echo " LDFLAGS: $(LDFLAGS) "
