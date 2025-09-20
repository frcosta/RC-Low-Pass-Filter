FC=gfortran
CC=gcc
FFLAGS=-O3 -Wall -Wextra -std=f2008
SRC = capdefs.f90 rc.f90
OBJ = $(SRC:.f90=.o)

OBJ_LINK = $(OBJ) getch.o

all: rc.exe

rc.exe: $(OBJ_LINK)
	$(FC) $(FFLAGS) -o $@ $^

%.o: %.f90
	$(FC) $(FFLAGS) -c -o $@ $<

clean:
	del *.o
	del *.mod
	del rc.exe