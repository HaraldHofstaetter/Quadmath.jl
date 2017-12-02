all: shared_lib

CC = gcc

#path to shared mpfr library used by Julia:
LIBMPFR =  /usr/lib/x86_64-linux-gnu/libmpfr.so.4

OBJS =  mpfr_get_float128.o  mpfr_set_float128.o
LIBS = $(LIBMPFR) 
INC = ../include

# Figure out OS and architecture
OS = $(shell uname)
ifeq ($(OS), MINGW32_NT-6.1)
  OS=WINNT
endif

# file extensions
ifeq ($(OS), WINNT)
  SHLIB_EXT = dll 
else ifeq ($(OS), Darwin)
  SHLIB_EXT = dylib
else
  SHLIB_EXT = so
endif


shared_lib: mpfr_float128.$(SHLIB_EXT)

mpfr_set_float128.o: mpfr_set_float128.c
	$(CC) -O2 -fpic -c -o mpfr_set_float128.o  \
            -I$(INC) mpfr_set_float128.c         

mpfr_get_float128.o: mpfr_get_float128.c
	$(CC) -O2 -fpic -c -o mpfr_get_float128.o  \
            -I$(INC) mpfr_get_float128.c         

        

mpfr_float128.$(SHLIB_EXT): $(OBJS)
	$(CC) $(OBJS) -rdynamic -shared -o $@ $(LDFLAGS) $(LIBS)

clean:
	rm -f *.o *.$(SHLIB_EXT)
