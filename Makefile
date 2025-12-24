FC=gfortran
CC=gcc
FFLAGS=-O3 -Wall -Wextra -std=f2008
SRC = capdefs.f90 rc.f90
OBJ = $(SRC:.f90=.o)

OBJ_LINK = $(OBJ) getch.o

all: rc

rc: $(OBJ_LINK)
	$(FC) $(FFLAGS) -o $@ $^

%.o: %.f90
	$(FC) $(FFLAGS) -c -o $@ $<

clean:
	rm *.o
	rm *.mod
	rm rc
