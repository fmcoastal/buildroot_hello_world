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


# need to remove .stamp_built and .stamp_target_installed to get folder ot re-build
clean:
	rm -rf *.o
	rm -rf hello_world
	rm -rf .stamp_built
	rm -rf .stamp_target_installed

clean_all:
	rm -rf *.0
	rm -rf hello_world
	rm -rf .stamp_built
	rm -rf .stamp_configured
	rm -rf .stamp_downloaded
	rm -rf .stamp_extracted
	rm -rf .stamp_patched
	rm -rf .stamp_target_installed





.phony: vars
vars:
	echo " CC:      $(CC)      "
	echo " CCFLAGS: $(CCFLAGS) "
	echo " LD:      $(LD)      "
	echo " LDFLAGS: $(LDFLAGS) "
